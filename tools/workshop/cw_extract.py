"""Распаковать отобранные файлы аддонов в одну папку addons/ws_weapons режима.

Одна папка, а не по папке на аддон: каждая папка в addons — отдельный путь поиска, и с сотней
путей GMod грузил карту 6 минут вместо 45 секунд. Каждый файл в отборе и так ровно из одного
аддона (cw_select.py), откуда он — видно в tools/workshop/manifest.json.
Файлы, которых нет в отборе, удаляются; чужой Lua с нашей правкой («-- PR:») не перезаписывается.

usage: python -I cw_extract.py <selection.json> <index.json> <addons_dir> [--dry] [--folder=ws_weapons] [--manifest=<path>]
"""
import json
import lzma
import mmap
import os
import re
import struct
import sys

sel = json.load(open(sys.argv[1], encoding="utf-8"))
idx = json.load(open(sys.argv[2], encoding="utf-8"))
root = sys.argv[3]
dry = "--dry" in sys.argv
opts = dict(a[2:].split("=", 1) for a in sys.argv[4:] if a.startswith("--") and "=" in a)
FOLDER = opts.get("folder", "ws_weapons")
MANIFEST = opts.get("manifest", os.path.join(root, "..", "tools", "workshop", "manifest.json"))


def slug(text):
    text = re.sub(r"\[.*?\]|\(.*?\)|\{.*?\}", " ", text)
    text = re.sub(r"[^A-Za-z0-9]+", "_", text).strip("_").lower()
    return text[:40] or "addon"


def cstr(buf, pos):
    end = buf.find(b"\x00", pos)
    return bytes(buf[pos:end]).decode("utf-8", "replace"), end + 1


def entries(buf):
    pos = 5 + 8 + 8
    if buf[4] > 1:
        while True:
            s, pos = cstr(buf, pos)
            if not s:
                break
    for _ in range(3):
        _, pos = cstr(buf, pos)
    pos += 4
    lst = []
    while True:
        num = struct.unpack_from("<I", buf, pos)[0]
        pos += 4
        if num == 0:
            break
        name, pos = cstr(buf, pos)
        size = struct.unpack_from("<q", buf, pos)[0]
        pos += 12
        lst.append((name, size))
    for name, size in lst:
        yield name, pos, size
        pos += size


manifest = []
total = 0
keep = set()
for wid, info in sorted(sel["addons"].items()):
    folder = FOLDER
    manifest.append({"id": wid, "title": info["title"], "slug": slug(info["title"]), "bytes": info["bytes"],
                     "weapons": info["weapons"]})
    want = info["files"]
    total += info["bytes"]
    if dry:
        continue
    pack = idx[wid]["pack"]
    with open(pack, "rb") as fh:
        if pack.lower().endswith(".bin"):
            buf = lzma.LZMADecompressor(format=lzma.FORMAT_ALONE).decompress(fh.read())
        else:
            buf = mmap.mmap(fh.fileno(), 0, access=mmap.ACCESS_READ)
        written = 0
        for name, pos, size in entries(buf):
            if name.lower() not in want:
                continue
            dest = os.path.join(root, folder, *name.replace("..", "_").split("/"))
            keep.add(os.path.normcase(dest))
            if os.path.exists(dest) and os.path.getsize(dest) == size:
                written += 1
                continue
            if dest.endswith(".lua") and os.path.exists(dest) and b"-- PR:" in open(dest, "rb").read():
                print("  patched by us, kept:", name)
                written += 1
                continue
            os.makedirs(os.path.dirname(dest), exist_ok=True)
            with open(dest, "wb") as out:
                out.write(buf[pos:pos + size])
            written += 1
        if isinstance(buf, mmap.mmap):
            buf.close()
    print(f"{wid} {slug(info['title'])}: {written}/{len(want)} files", flush=True)

removed = 0
if not dry:
    for r, _, files in os.walk(os.path.join(root, FOLDER)):
        for f in files:
            p = os.path.join(r, f)
            if os.path.normcase(p) not in keep:
                os.remove(p)
                removed += 1
print("removed (not in selection):", removed)
json.dump(manifest, open(MANIFEST, "w", encoding="utf-8"),
          ensure_ascii=False, indent=1)
print(f"addons {len(manifest)}, {total / 1e9:.2f} GB")
