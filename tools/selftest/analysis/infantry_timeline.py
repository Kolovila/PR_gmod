# Infantry fight timeline from a gameplay CSV: player and every bot side by side every 0.5 s;
# off = angle between the bot heading and the bearing to the player, s = sees, f = fired.
#   python -I infantry_timeline.py <csv> <from_s> <to_s>
import csv, math, sys
from collections import defaultdict

f, a, b = sys.argv[1], float(sys.argv[2]), float(sys.argv[3])
rows = list(csv.DictReader(open(f, encoding="utf-8")))
by_t = defaultdict(list)
for r in rows:
    by_t[float(r["time"])].append(r)

def ang_diff(a, b):
    d = (a - b + 180) % 360 - 180
    return abs(d)

for t in sorted(by_t):
    if t < a or t > b:
        continue
    rs = by_t[t]
    p = next((r for r in rs if r["who"].startswith("player")), None)
    if not p:
        continue
    px, py = int(p["x"]), int(p["y"])
    parts = [f"{t:6.1f} P hp{p['hp']:>3} v{p['speed']:>3} f{p['fire1']} {p['weapon'][-12:]:>12} |"]
    for r in rs:
        if not r["who"].startswith("inf:"):
            continue
        x, y = int(r["x"]), int(r["y"])
        d = math.dist((x, y), (px, py))
        bearing = math.degrees(math.atan2(py - y, px - x))
        off = ang_diff(int(r["heading"]), bearing)
        name = r["class"].split("@")[0][:6]
        st = r["state"].replace("fight/", "").replace("/sq:combat", "").replace("/sq:retreat", "R")
        parts.append(f"{name} hp{r['hp']:>3} d{d:5.0f} v{r['speed']:>3} off{off:4.0f} s{r['fire2']}f{r['fire1']} {st:<18} {r['target'][:14]:<14} {r['weapon'][-10:]}")
    print(" ".join(parts))
