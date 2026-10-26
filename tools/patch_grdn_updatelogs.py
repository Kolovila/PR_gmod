"""Убрать окно «Gordon's shit major updates!!!» из аддона Beeman Shared (Workshop 2608784717).

Окно открывает lua/ggs/cl_updatelogs.lua при входе в игру (MakePopup забирает мышь и клавиатуру,
мешает автотестам). Правка на месте и той же длины: в начале GRDN.ShowUpdated строка
«if not showMenu then return end» меняется на «do return end» с пробелами; контрольная сумма
файла в заголовке .gma пересчитывается. Остальной аддон (ракеты и общий код вертолётов) не трогаем.

Обновление аддона в Workshop вернёт окно — тогда запустить снова. Игра должна быть закрыта.
usage: python -I patch_grdn_updatelogs.py [--check] [--revert] [path_to_gma]
"""
import os
import struct
import sys
import zlib

GMA = r"D:\SteamLibrary\steamapps\workshop\content\4000\2608784717\gmpublisher.gma"
TARGET = "lua/ggs/cl_updatelogs.lua"
ORIGINAL = b"if not showMenu then return end"
PATCHED = b"do return end".ljust(len(ORIGINAL), b" ")


def read_cstr(f):
    out = bytearray()
    while True:
        c = f.read(1)
        if not c or c == b"\x00":
            return bytes(out)
        out += c


def find_entry(f):
    """-> (data_offset, size, crc_field_offset) нужного файла"""
    if f.read(4) != b"GMAD":
        raise SystemExit("не .gma")
    version = f.read(1)[0]
    f.read(16)  # steamid, timestamp
    if version > 1:
        while read_cstr(f):
            pass
    for _ in range(3):  # title, description, author
        read_cstr(f)
    f.read(4)  # addon version
    entries = []
    while True:
        (index,) = struct.unpack("<I", f.read(4))
        if index == 0:
            break
        name = read_cstr(f).decode("utf-8", "replace")
        (size,) = struct.unpack("<q", f.read(8))
        crc_at = f.tell()
        f.read(4)
        entries.append((name, size, crc_at))
    offset = f.tell()
    for name, size, crc_at in entries:
        if name.lower() == TARGET:
            return offset, size, crc_at
        offset += size
    raise SystemExit("в аддоне нет " + TARGET)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    check, revert = "--check" in sys.argv, "--revert" in sys.argv
    path = args[0] if args else GMA
    old, new = (PATCHED, ORIGINAL) if revert else (ORIGINAL, PATCHED)
    with open(path, "rb" if check else "r+b") as f:
        offset, size, crc_at = find_entry(f)
        f.seek(offset)
        data = f.read(size)
        if new in data and old not in data:
            print("уже сделано:", "окно вернётся" if revert else "окна нет")
            return
        if data.count(old) != 1:
            raise SystemExit("строка не найдена — аддон обновился? Посмотри " + TARGET)
        fixed = data.replace(old, new)
        assert len(fixed) == len(data)
        print("файл", TARGET, "смещение", offset, "размер", size)
        if check:
            print("проверка: можно править")
            return
        f.seek(offset)
        f.write(fixed)
        f.seek(crc_at)
        f.write(struct.pack("<I", zlib.crc32(fixed) & 0xFFFFFFFF))
        print("готово:", "окно возвращено" if revert else "окно убрано")


if __name__ == "__main__":
    main()
