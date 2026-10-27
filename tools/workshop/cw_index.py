"""Индекс оружейных аддонов: файлы, оружие (класс, имя, база, модели), конфликты.

usage: python -I cw_index.py <ids.txt> <out.json> <workshop_dir> [<workshop_dir> ...]
"""
import json
import lzma
import os
import re
import struct
import sys


def read_cstr(buf, pos):
    end = buf.index(b"\x00", pos)
    return buf[pos:end].decode("utf-8", "replace"), end + 1


def parse_gma(buf):
    if buf[:4] != b"GMAD":
        raise ValueError("not a gma")
    version = buf[4]
    pos = 5 + 8 + 8
    if version > 1:
        while True:
            s, pos = read_cstr(buf, pos)
            if not s:
                break
    title, pos = read_cstr(buf, pos)
    _, pos = read_cstr(buf, pos)
    _, pos = read_cstr(buf, pos)
    pos += 4
    entries = []
    while True:
        num = struct.unpack_from("<I", buf, pos)[0]
        pos += 4
        if num == 0:
            break
        name, pos = read_cstr(buf, pos)
        size = struct.unpack_from("<q", buf, pos)[0]
        pos += 12
        entries.append((name.lower(), size))
    files = {}
    for name, size in entries:
        files[name] = (pos, size)
        pos += size
    return title, files


def load(path):
    data = open(path, "rb").read()
    if path.lower().endswith(".bin"):
        data = lzma.LZMADecompressor(format=lzma.FORMAT_ALONE).decompress(data)
    return data


STR = r'["\']([^"\']*)["\']'
FIELDS = {
    "PrintName": re.compile(r"SWEP\.PrintName\s*=\s*" + STR),
    "Base": re.compile(r"SWEP\.Base\s*=\s*" + STR),
    "Category": re.compile(r"SWEP\.Category\s*=\s*" + STR),
    "ViewModel": re.compile(r"SWEP\.ViewModel\s*=\s*" + STR),
    "WorldModel": re.compile(r"SWEP\.WorldModel\s*=\s*" + STR),
    "Spawnable": re.compile(r"SWEP\.Spawnable\s*=\s*(\w+)"),
    "AdminSpawnable": re.compile(r"SWEP\.AdminSpawnable\s*=\s*(\w+)"),
    "HoldType": re.compile(r"SWEP\.NormalHoldType\s*=\s*" + STR),
    "Damage": re.compile(r"SWEP\.Damage\s*=\s*([\d.]+)"),
    "FireDelay": re.compile(r"SWEP\.FireDelay\s*=\s*([\d./ ]+)"),
    "ClipSize": re.compile(r"SWEP\.Primary\.ClipSize\s*=\s*(\d+)"),
    "Shots": re.compile(r"SWEP\.Shots\s*=\s*(\d+)"),
    "Caliber": re.compile(r"SWEP\.(?:Primary\.Ammo|Ammo)\s*=\s*" + STR),
}


def weapon_info(text):
    out = {}
    for key, rx in FIELDS.items():
        m = rx.search(text)
        if m:
            out[key] = m.group(1).strip()
    return out


def find_pack(wid, roots):
    for root in roots:
        folder = os.path.join(root, wid)
        if os.path.isdir(folder):
            packs = [f for f in os.listdir(folder) if f.lower().endswith((".gma", ".bin"))]
            if packs:
                return os.path.join(folder, packs[0])


def main():
    ids = [l.strip() for l in open(sys.argv[1]) if l.strip().isdigit()]
    out_path = sys.argv[2]
    roots = sys.argv[3:]
    result = {}
    for wid in ids:
        pack = find_pack(wid, roots)
        if not pack:
            result[wid] = {"missing": True}
            continue
        try:
            data = load(pack)
            title, files = parse_gma(data)
        except Exception as err:
            result[wid] = {"error": str(err), "pack": pack}
            continue

        weapons = {}
        for name, (pos, size) in files.items():
            m = re.match(r"lua/weapons/([^/]+?)(?:\.lua|/(shared|init|cl_init)\.lua)$", name)
            if not m:
                continue
            cls = m.group(1)
            text = data[pos:pos + size].decode("utf-8", "replace")
            info = weapon_info(text)
            cur = weapons.setdefault(cls, {})
            for k, v in info.items():
                cur.setdefault(k, v)
        sizes = {}
        for name, (_, size) in files.items():
            top = name.split("/")[0]
            sizes[top] = sizes.get(top, 0) + size
        result[wid] = {
            "title": title, "pack": pack, "size": sum(s for _, s in files.values()),
            "files": {n: s for n, (_, s) in files.items()}, "weapons": weapons, "sizes": sizes,
        }
        del data
        print(wid, len(files), len(weapons), title[:60], flush=True)

    with open(out_path, "w", encoding="utf-8") as fh:
        json.dump(result, fh, ensure_ascii=False)


if __name__ == "__main__":
    main()
