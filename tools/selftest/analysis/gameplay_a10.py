"""Merge a gameplay recording: player vs the patrol A-10, one row per 0.5 s.
usage: python gameplay_a10.py <gameplay.csv> <out.txt>"""
import csv, math, sys
from collections import defaultdict

src, out = sys.argv[1], sys.argv[2]
frames = defaultdict(dict)
with open(src, encoding="utf-8", errors="replace") as f:
    for r in csv.DictReader(f):
        t = float(r["time"])
        if r["who"].startswith("player"):
            frames[t]["p"] = r
        elif r["class"] == "gred_lfs_a10" and r["who"].startswith("ai"):
            frames[t]["a"] = r

rows = []
t0 = None
for t in sorted(frames):
    fr = frames[t]
    if "a" not in fr or "p" not in fr:
        continue
    a, p = fr["a"], fr["p"]
    t0 = t0 if t0 is not None else t
    ax, ay, az = float(a["x"]), float(a["y"]), float(a["z"])
    px, py, pz = float(p["x"]), float(p["y"]), float(p["z"])
    dx, dy = px - ax, py - ay
    d2 = math.hypot(dx, dy)
    bearing = math.degrees(math.atan2(dy, dx))
    off = (bearing - float(a["heading"]) + 180) % 360 - 180
    below = math.degrees(math.atan2(az - pz, max(d2, 1)))
    edge = min(15360 - abs(ax), 15360 - abs(ay))
    rows.append(f"t={t - t0:6.1f} a10=({ax:6.0f},{ay:6.0f},{az:5.0f}) v={a['speed']:>4} hdg={float(a['heading']):4.0f} pitch={a['pitch']:>4} "
                f"| ply=({px:6.0f},{py:6.0f}) {p['class'][:10]:10} hp={p['hp']:>3} wpn={p['weapon'][:18]:18} f={p['fire1']} "
                f"| d2={d2:5.0f} dz={az - pz:5.0f} below={below:4.0f} noseOff={off:5.0f} edge={edge:5.0f} fire={a['fire1']} {a['state']} tgt={a['target']}")
open(out, "w", encoding="utf-8").write("\n".join(rows))
print(out, len(rows))
