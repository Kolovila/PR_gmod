# Infantry fight summary from a gameplay CSV (data/pr_gamemode/gameplay/*.csv):
# player HP drops with who was firing, per-bot visibility episodes and reaction, state shares.
#   python -I infantry_fight.py <csv>
import csv, math, sys
from collections import defaultdict

f = sys.argv[1]
rows = list(csv.DictReader(open(f, encoding="utf-8")))
for r in rows:
    r["t"] = float(r["time"])
    for k in ("x", "y", "z", "speed", "heading"):
        r[k] = int(r[k])
    r["hp"] = int(r["hp"]) if r["hp"] not in ("", "nil") else None
    r["fire1"] = int(r["fire1"])
    r["fire2"] = int(r["fire2"])

players = [r for r in rows if r["who"].startswith("player")]
pl = {r["t"]: r for r in players}
bots = defaultdict(list)
for r in rows:
    if r["who"].startswith("inf:"):
        bots[r["class"] + " (" + r["who"][4:] + ")"].append(r)

t0, t1 = rows[0]["t"], rows[-1]["t"]
print(f"span {t0}..{t1} = {t1 - t0:.0f} s, players rows {len(players)}")

# Player HP timeline
print("\n== player hp drops")
prev = None
for r in players:
    if prev and r["hp"] is not None and prev["hp"] is not None and r["hp"] < prev["hp"]:
        # who fired in this half-second and their distance
        firing = []
        for name, rs in bots.items():
            for b in rs:
                if abs(b["t"] - r["t"]) < 0.01 and b["fire1"]:
                    d = math.dist((b["x"], b["y"]), (r["x"], r["y"]))
                    firing.append(f"{name.split('@')[0]}:{d:.0f}/{b['speed']}")
        print(f"{r['t']:.1f} hp {prev['hp']}->{r['hp']} (-{prev['hp'] - r['hp']}) pspeed {r['speed']} firing: {', '.join(firing)}")
    prev = r
print("player last hp", players[-1]["hp"], "state", players[-1]["state"], "weapon", players[-1]["weapon"])

def nearest_player(t):
    best = None
    for tt in (t, round(t - 0.5, 1), round(t + 0.5, 1)):
        if tt in pl:
            return pl[tt]
    return None

print("\n== bots")
for name, rs in bots.items():
    n = len(rs)
    fire = sum(r["fire1"] for r in rs)
    seen = sum(r["fire2"] for r in rs)
    seen_fire = sum(1 for r in rs if r["fire2"] and r["fire1"])
    seen_nofire = sum(1 for r in rs if r["fire2"] and not r["fire1"])
    moving = sum(1 for r in rs if r["speed"] > 40)
    seen_moving = sum(1 for r in rs if r["fire2"] and r["speed"] > 40)
    hp0, hp1 = rs[0]["hp"], rs[-1]["hp"]
    weps = set(r["weapon"] for r in rs)
    print(f"\n-- {name}: rows {n} ({rs[0]['t']}..{rs[-1]['t']}), hp {hp0}->{hp1}, weapons {weps}")
    print(f"   sees {seen} rows, fires {fire}, sees&fires {seen_fire}, sees&silent {seen_nofire}, moving {moving}, sees&moving {seen_moving}")
    # reaction: first time sees -> first fire
    first_seen = next((r["t"] for r in rs if r["fire2"]), None)
    first_fire = next((r["t"] for r in rs if r["fire1"]), None)
    print(f"   first seen {first_seen}, first fire {first_fire}")
    # visibility episodes: start of each seen streak, delay to first fire inside
    eps = []
    cur = None
    for r in rs:
        if r["fire2"]:
            if cur is None:
                cur = {"start": r["t"], "fire": None, "end": r["t"]}
            cur["end"] = r["t"]
            if r["fire1"] and cur["fire"] is None:
                cur["fire"] = r["t"]
        else:
            if cur:
                eps.append(cur)
                cur = None
    if cur:
        eps.append(cur)
    for e in eps[:25]:
        p = nearest_player(e["start"])
        b = next(r for r in rs if r["t"] == e["start"])
        d = math.dist((b["x"], b["y"]), (p["x"], p["y"])) if p else -1
        delay = (e["fire"] - e["start"]) if e["fire"] is not None else None
        print(f"   seen {e['start']:.1f}-{e['end']:.1f} ({e['end'] - e['start'] + 0.5:.1f}s) d={d:.0f} "
              f"first fire after {delay if delay is None else round(delay, 1)}  state {b['state']}")
    # shots / hits (recorder columns since 2026-10-28): overall, standing, moving
    if rs and rs[0].get("shots") not in (None, ""):
        def tot(sel):
            sh = sum(int(r["shots"] or 0) for r in rs if sel(r))
            hi = sum(int(r["hits"] or 0) for r in rs if sel(r))
            return sh, hi, (100 * hi / sh if sh else 0)
        a, s_, m = tot(lambda r: True), tot(lambda r: r["speed"] <= 40), tot(lambda r: r["speed"] > 40)
        dmg = sum(int(r["dmg"] or 0) for r in rs)
        print(f"   shots {a[0]} hits {a[1]} ({a[2]:.0f}%), dmg {dmg}; standing {s_[0]}/{s_[1]} ({s_[2]:.0f}%), moving {m[0]}/{m[1]} ({m[2]:.0f}%)")
    # state histogram
    st = defaultdict(int)
    for r in rs:
        s = r["state"].split("/")
        st["/".join(s[:3])] += 1
    print("   states:", dict(sorted(st.items(), key=lambda kv: -kv[1])[:8]))
