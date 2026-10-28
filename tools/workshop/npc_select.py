"""Отбор файлов паков NPC и плеермоделей для addons/ws_npcs (формат как у cw_select.py).

Дубли стволов тут не чистим — у паков свои weapon_vj_*, без них NPC без оружия. Правила:
- файл, который уже есть в других папках addons режима (VJ-Base, ws_arccw, eft_weapons …), не берём:
  у нас своя, проверенная версия (VJ 3.2), а пак может нести старую копию;
- если такой файл — Lua и отличается по размеру, печатаем: это возможный конфликт, смотреть руками;
- между самими паками: папка lua/entities|weapons|effects/<класс> целиком из одного (самого свежего).

- аддоны из --models-only=<файл со списком id>: только ресурсы (модели, текстуры, звуки) без Lua —
  так берём боссов EFT из заброшенных VJ-паков и плеермоделей: NPC из них делаем своим классом.

usage: python -I npc_select.py <index.json> <det.json> <addons_dir> <out.json> [--models-only=<ids.txt>]
"""
import json
import os
import re
import sys
from collections import defaultdict

idx = json.load(open(sys.argv[1], encoding="utf-8"))
det = {d["publishedfileid"]: d for d in json.load(open(sys.argv[2], encoding="utf-8"))["response"]["publishedfiledetails"]}
root = sys.argv[3]
out_path = sys.argv[4]
OWN = "ws_npcs"
models_only = set()
for a in sys.argv[5:]:
    if a.startswith("--models-only="):
        models_only |= {l.strip() for l in open(a.split("=", 1)[1]) if l.strip().isdigit()}

existing = {}
for d in os.listdir(root):
    if d == OWN or not os.path.isdir(os.path.join(root, d)):
        continue
    base = os.path.join(root, d)
    for r, _, files in os.walk(base):
        for f in files:
            rel = os.path.relpath(os.path.join(r, f), base).replace("\\", "/").lower()
            existing[rel] = (d, os.path.getsize(os.path.join(r, f)))

addons = {k: v for k, v in idx.items() if "title" in v}
title = lambda w: (det.get(w, {}).get("title") or addons[w]["title"]).strip()
updated = lambda w: int(det.get(w, {}).get("time_updated") or 0)


def unit(path):
    m = re.match(r"(lua/(?:weapons|entities|effects)/[^/]+)/", path)
    return m.group(1) if m else path


prov = defaultdict(set)
for w, a in addons.items():
    for p in a["files"]:
        if w in models_only and p.startswith("lua/"):
            continue
        prov[unit(p)].add(w)
winner = {u: max(ws, key=lambda w: (updated(w), addons[w]["size"])) for u, ws in prov.items()}

lua_conflicts, skipped = [], 0
final = {}
for w, a in addons.items():
    files = {}
    for p, size in a["files"].items():
        if w in models_only and p.startswith("lua/"):
            continue
        if winner.get(unit(p)) != w:
            continue
        if p in existing:
            skipped += 1
            if p.startswith("lua/") and existing[p][1] != size:
                lua_conflicts.append((p, w, existing[p][0]))
            continue
        files[p] = size
    if files:
        final[w] = {"title": title(w), "files": files, "bytes": sum(files.values()),
                    "weapons": [] if w in models_only else sorted(a["weapons"]), "modelsOnly": w in models_only}

json.dump({"addons": final, "lua_conflicts": lua_conflicts}, open(out_path, "w", encoding="utf-8"), ensure_ascii=False)
print(f"addons {len(final)}, files {sum(len(a['files']) for a in final.values())}, "
      f"{sum(a['bytes'] for a in final.values()) / 1e9:.2f} GB; skipped (already in addons) {skipped}")
for p, w, d in lua_conflicts:
    print(f"LUA CONFLICT {p}: pack {w} vs addons/{d}")
