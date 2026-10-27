"""Список файлов из *_dir.vpk (Source VPK v1/v2) -> текстовый файл, по пути в строке.

usage: python -I vpk_list.py <out.txt> <a_dir.vpk> [<b_dir.vpk> ...]
"""
import struct
import sys


def cstr(buf, pos):
    end = buf.index(b"\x00", pos)
    return buf[pos:end].decode("utf-8", "replace"), end + 1


def listing(path):
    buf = open(path, "rb").read()
    sig, ver, tree = struct.unpack_from("<III", buf, 0)
    if sig != 0x55AA1234:
        raise ValueError("not a vpk: " + path)
    pos = 12 if ver == 1 else 28
    out = []
    while True:
        ext, pos = cstr(buf, pos)
        if not ext:
            break
        while True:
            folder, pos = cstr(buf, pos)
            if not folder:
                break
            while True:
                name, pos = cstr(buf, pos)
                if not name:
                    break
                preload = struct.unpack_from("<H", buf, pos + 4)[0]
                pos += 18 + preload
                full = (name + "." + ext) if folder == " " else (folder + "/" + name + "." + ext)
                out.append(full.lower())
    return out


def main():
    files = set()
    for vpk in sys.argv[2:]:
        files.update(listing(vpk))
    with open(sys.argv[1], "w", encoding="utf-8") as fh:
        fh.write("\n".join(sorted(files)))
    print(len(files))


if __name__ == "__main__":
    main()
