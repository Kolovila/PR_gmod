"""Проверить текстуры моделей: каждая .mdl в папке -> её материалы (.vmt) -> $basetexture (.vtf).
Ищет по всем папкам addons режима и по файлам самой игры (список из vpk_list.py).

usage: python -I mdl_textures.py <addons_dir> <folder> <base_files.txt> [<out.txt>]
Печатает модели, у которых не найден материал или текстура (фиолетово-чёрная «шашечка» в игре).
"""
import os
import re
import struct
import sys

root, folder, base_list = sys.argv[1], sys.argv[2], sys.argv[3]
out = sys.argv[4] if len(sys.argv) > 4 else None

files = {l for l in open(base_list, encoding="utf-8").read().split("\n") if l}
where = {}
for d in os.listdir(root):
    base = os.path.join(root, d)
    if not os.path.isdir(base):
        continue
    for r, _, fs in os.walk(base):
        for f in fs:
            rel = os.path.relpath(os.path.join(r, f), base).replace("\\", "/").lower()
            files.add(rel)
            where.setdefault(rel, os.path.join(r, f))


def cstr(buf, pos):
    end = buf.find(b"\x00", pos)
    return buf[pos:end].decode("latin-1")


def textures(path):
    buf = open(path, "rb").read()
    if buf[:4] != b"IDST":
        return None
    numtex, texidx, numcd, cdidx = struct.unpack_from("<4i", buf, 204)
    names = []
    for i in range(numtex):
        off = texidx + i * 64
        names.append(cstr(buf, off + struct.unpack_from("<i", buf, off)[0]).replace("\\", "/").lower())
    cds = []
    for i in range(numcd):
        cds.append(cstr(buf, struct.unpack_from("<i", buf, cdidx + i * 4)[0]).replace("\\", "/").lower())
    return names, cds or [""]


rx_base = re.compile(r'"?\$basetexture"?\s+"?([^"\r\n]+)"?', re.I)
bad, checked = [], 0
mdl_root = os.path.join(root, folder, "models")
for r, _, fs in os.walk(mdl_root):
    for f in fs:
        if not f.lower().endswith(".mdl"):
            continue
        p = os.path.join(r, f)
        res = textures(p)
        if not res:
            continue
        checked += 1
        names, cds = res
        missing = []
        for n in names:
            vmt = None
            for cd in cds:
                cand = ("materials/" + cd.strip("/") + "/" + n).replace("//", "/") + ".vmt"
                if n.startswith("/") or cd == "":
                    cand = ("materials/" + n.strip("/")) + ".vmt"
                if cand in files:
                    vmt = cand
                    break
            if not vmt:
                missing.append(n + " (vmt)")
                continue
            src = where.get(vmt)
            if src:
                m = rx_base.search(open(src, encoding="latin-1").read())
                if m:
                    vtf = "materials/" + m.group(1).strip().replace("\\", "/").lower().removesuffix(".vtf") + ".vtf"
                    if vtf not in files:
                        missing.append(n + " -> " + vtf)
        if missing:
            rel = os.path.relpath(p, os.path.join(root, folder)).replace("\\", "/")
            bad.append(rel + ": " + "; ".join(missing[:6]) + (" …" if len(missing) > 6 else ""))

text = "\n".join(bad)
if out:
    open(out, "w", encoding="utf-8").write(text)
print(f"models checked {checked}, with missing textures {len(bad)}")
if not out:
    print(text)
