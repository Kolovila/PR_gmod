"""A-10 trace from a selftest console log (RR rows ~1/s) + mode transitions.
usage: python a10_trace.py <console.log> <out.txt>"""
import re, sys
src, out = sys.argv[1], sys.argv[2]
rr = re.compile(r"RR gred_lfs_a10 x=(\S+) y=(\S+) tx=\S+ ty=\S+ mode=(.+?) dist=(\S+) agl=(\S+) speed=(\S+) pitch=(\S+) roll=(\S+) .*?yawErr=(\S+)")
rows, t = [], 0
for ln in open(src, encoding="utf-8", errors="replace"):
    m = rr.search(ln)
    if m:
        x, y = float(m.group(1)), float(m.group(2))
        edge = min(15360 - abs(x), 15360 - abs(y))
        rows.append(f"t~{t:3d} x={x:7.0f} y={y:7.0f} edge={edge:6.0f} dist={m.group(4):>6} agl={m.group(5):>5} v={m.group(6):>5} pitch={m.group(7):>4} roll={m.group(8):>4} yawErr={m.group(9):>5} {m.group(3)}")
        t += 1
    elif "gred_lfs_a10) патруля" in ln or "SCAN gred_lfs_a10" in ln:
        rows.append("   >> " + ln.split("[PR] ")[-1].strip()[:300])
open(out, "w", encoding="utf-8").write("\n".join(rows))
print(out, len(rows))
