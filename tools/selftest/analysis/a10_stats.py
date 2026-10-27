"""Stats for A-10 trace files from a10_trace.py: modes, dives, vulnerable seconds, edge, speed.
usage: python a10_stats.py trace1.txt [trace2.txt ...]"""
import re, sys
from collections import Counter

for fn in sys.argv[1:]:
    lines = open(fn, encoding="utf-8").read().splitlines()
    rows = [l for l in lines if l.startswith("t~")]
    txt = "\n".join(lines)
    modes = Counter()
    vuln = 0
    v_all, edges = [], []
    for l in rows:
        m = re.search(r"edge=\s*(-?\d+) dist=\s*(\d+) agl=\s*(-?\d+) v=\s*(\d+) .*yawErr=\s*\S+ (.*)$", l)
        if not m:
            continue
        edge, dist, agl, v, mode = int(m.group(1)), int(m.group(2)), int(m.group(3)), int(m.group(4)), m.group(5).strip()
        modes[mode.replace("plane ", "")] += 1
        v_all.append(v)
        edges.append(edge)
        if dist < 4500 and agl > 1500 and mode not in ("plane dive", "plane pull up") and v < 1800:
            vuln += 1
    n = max(len(rows), 1)
    dives = len(re.findall(r"→ dive", txt))
    fired = len(re.findall(r"dive → pull up \([^)]*стрелял", txt))
    alive = re.search(r"alive=(\w+)", txt)
    evades = len(re.findall(r"пуск по нему", txt))
    rpg = re.findall(r"RPG #\d+ result: (\w+ \w+ \w+|\w+)", txt)
    print(f"{fn.split('/')[-1][:44]:44} n={n} dives={dives} fired={fired} dive%={100 * modes['dive'] // n} "
          f"vuln={vuln}s minV={min(v_all[5:] or [0])} minEdge={min(edges or [0])} evades={evades} rpg={rpg} alive={alive and alive.group(1)}")
    print("   modes:", ", ".join(f"{k} {100 * c // n}%" for k, c in modes.most_common()))
