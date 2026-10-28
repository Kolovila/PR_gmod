"""Отбор паков ArcCW (arccw_ids.txt): какой файл из какого пака, какие стволы — дубли.
Формат итога — как у cw_select.py (его читает cw_extract.py).

usage: python -I arccw_select.py <index.json> <base_files.txt> <det.json> <out.json>

- Конфликт файлов: папка оружия / сущности (lua/weapons/<класс>/) — целиком из одного пака, по
  приоритету пака (ниже), при равном — свежий; остальные файлы так же.
- Дубли стволов: группа = настоящее имя (TrueName, иначе PrintName, без «(UC)», «[BO]» и т. п.) +
  тип (пистолет, длинный, гранатомёт, граната, нож). В группе остаётся ствол лучшего пака.
- «Чудо-оружие» Black Ops (лучемёты, Wunderwaffe и т. п.) и стволы без модели — выкидываются.
"""
import json
import re
import sys
from collections import defaultdict

idx = json.load(open(sys.argv[1], encoding="utf-8"))
base_files = set(open(sys.argv[2], encoding="utf-8").read().split("\n"))
det = {d["publishedfileid"]: d for d in json.load(open(sys.argv[3], encoding="utf-8"))["response"]["publishedfiledetails"]}
out_path = sys.argv[4]

# Чей ствол лучше при дубле (по отчёту разбора паков 2026-10-28): военная ветка UC от Vergi,
# потом остальной UC, MW3, BO; CS+ — только как зависимость (автор просит брать GSO)
PRIORITY = {
    # Vergi: стволы
    "3696080536": 100, "3778882189": 100, "3825596491": 100, "3677527605": 100, "3778866713": 100,
    "3825562345": 100, "3825519552": 100, "3778873661": 100, "3792000311": 100, "3631384590": 100,
    "3778860907": 100,
    "3557466101": 90,   # Vergi's Extras
    # Urban Coalition
    "2641653126": 80, "2906702282": 80, "2967401723": 80, "2971239734": 80, "3253847737": 80,
    "2986410709": 80, "2972699494": 80, "2956349430": 80, "2753797476": 80, "2640556672": 80,
    "2658879364": 60,   # Modern Warfare 3
    "2317482090": 50,   # Black Ops
    "2131058270": 10,   # Counter-Strike+
    "2131057232": 200,  # сама база ArcCW — её файлы никто не перекрывает
}
EXCLUDE = {}

WONDER = re.compile(r"ray ?gun|thunder ?gun|wunderwaffe|winter'?s howl|scavenger|v-?r11|baby ?gun|"
                    r"porter|wave ?gun|zap ?gun|hell'?s retriever|"
                    r"blundergat|sliquifier|acid ?gat|jet ?gun|monkey|gersh|matryoshka|q\.?e\.?d|"
                    r"wunder|tesla|mustang|sally|raygun|staff of", re.I)

addons = {k: v for k, v in idx.items() if "title" in v}
title = lambda w: (det.get(w, {}).get("title") or addons[w]["title"]).strip()
updated = lambda w: int(det.get(w, {}).get("time_updated") or 0)
included = [w for w in addons if w not in EXCLUDE]


def rank(w):
    return (PRIORITY.get(w, 0), updated(w))


def unit(path):
    m = re.match(r"(lua/(?:weapons|entities|effects)/[^/]+)/", path)
    return m.group(1) if m else path


unit_prov = defaultdict(set)
for w in included:
    for p in addons[w]["files"]:
        unit_prov[unit(p)].add(w)
unit_winner = {u: max(ws, key=rank) for u, ws in unit_prov.items()}
all_files = base_files | set(unit_prov) | {p for w in included for p in addons[w]["files"]}

# Стволы: класс -> (сведения, пак). Сведения о классе — из пака-победителя его папки/файла
weapons = {}
for w in included:
    for cls, info in addons[w]["weapons"].items():
        for u in ("lua/weapons/" + cls, "lua/weapons/" + cls + ".lua"):
            if unit_winner.get(u) == w:
                weapons[cls] = (info, w)


NAME_FIELDS = {"TrueName", "PrintName"}


def resolve(cls, field, seen=None):
    seen = seen or set()
    if cls not in weapons or cls in seen:
        return None
    # Имя — только своё или промежуточной базы пака, не «ArcCW Base» самой базы
    if field in NAME_FIELDS and seen and cls.startswith("arccw_base"):
        return None
    seen.add(cls)
    info = weapons[cls][0]
    if field in info:
        return info[field]
    base = info.get("Base")
    return resolve(base, field, seen) if base else None


def kind(cls):
    h = (resolve(cls, "HoldtypeActive") or resolve(cls, "HoldType") or "").lower()
    if resolve(cls, "ShootEntity") or h == "rpg":
        return "launcher"
    if h in ("pistol", "revolver", "duel"):
        return "pistol"
    if h in ("grenade", "slam"):
        return "nade"
    if h in ("melee", "melee2", "knife", "fist"):
        return "melee"
    return "long"


def norm(name):
    n = name.lower()
    n = re.sub(r"\(.*?\)|\[.*?\]|\{.*?\}", " ", n)
    # Без марки производителя: «FN P90» и «P90», «HK UMP-45» и «UMP-45» — один ствол
    n = re.sub(r"\b(arccw|uc|bo1?|mw3|cs\+?|the|rifle|pistol|new|hk|fn|colt|imi|iwi|steyr|ingram|barrett|kriss)\b", " ", n)
    n = re.sub(r"[^a-z0-9а-я]", "", n)
    return ALIASES.get(n, n)


# Один и тот же ствол под разными именами в разных паках (после снятия марки)
ALIASES = {
    "pm": "makarov", "makarovpm": "makarov", "g18": "glock18", "saiga12k": "saiga12",
    "m249para": "m249", "m249saw": "m249", "minimipara": "m249", "m134minigun": "m134",
    "dragunovsvd63": "svd", "svddragunov": "svd", "famasf1": "famas", "deserteagle50": "deserteagle",
    "mp5a3": "mp5", "mp5a2": "mp5",
}


rows, broken, wonder = [], [], []
for cls, (info, w) in weapons.items():
    if cls.endswith("_base") or "_base_" in cls or re.search(r"(^|_)base$", cls):
        continue
    if resolve(cls, "Spawnable") in ("false", None) and resolve(cls, "AdminSpawnable") in ("false", None):
        continue
    name = resolve(cls, "TrueName") or resolve(cls, "PrintName") or cls
    # По настоящему имени: у BO настоящие M202 и M134 подписаны «Grim Reaper», «Death Machine»
    if WONDER.search(name):
        wonder.append({"class": cls, "addon": w, "name": name})
        continue
    # Битый — нет модели от первого лица; мировой у UC часто нет вовсе: её заменяет копия
    # модели от первого лица (MirrorVMWM)
    wm = (resolve(cls, "WorldModel") or "").lower().replace("\\", "/")
    vm = (resolve(cls, "ViewModel") or "").lower().replace("\\", "/")
    if not vm or vm not in all_files:
        broken.append({"class": cls, "addon": w, "vm": vm, "wm": wm})
        continue
    key = norm(name)
    rows.append({"class": cls, "addon": w, "name": name, "print": resolve(cls, "PrintName"), "kind": kind(cls),
                 "group": (key + "|" + kind(cls)) if key else cls, "score": rank(w)})

groups = defaultdict(list)
for r in rows:
    groups[r["group"]].append(r)
kept, dropped = [], []
for g, lst in groups.items():
    lst.sort(key=lambda r: r["score"], reverse=True)
    for r in lst:
        if r is lst[0]:
            kept.append(r)
        else:
            r["dupeOf"] = lst[0]["class"]
            dropped.append(r)
for r in kept + dropped:
    r.pop("score", None)

drop_units = {"lua/weapons/" + r["class"] for r in dropped + broken + wonder}
drop_units |= {u + ".lua" for u in list(drop_units)}

files_by_addon = defaultdict(dict)
for w in included:
    for p, s in addons[w]["files"].items():
        u = unit(p)
        if unit_winner.get(u) != w or u in drop_units:
            continue
        files_by_addon[w][p] = s

final = {w: f for w, f in files_by_addon.items() if f}
summary = {
    "excluded": {w: {"title": title(w), "why": why, "size": addons[w]["size"]} for w, why in EXCLUDE.items() if w in addons},
    "emptied": [w for w in included if w not in final],
    "addons": {w: {"title": title(w), "files": f, "bytes": sum(f.values()),
                   "weapons": sorted(r["class"] for r in kept if r["addon"] == w)} for w, f in final.items()},
    "kept": kept, "dropped": dropped, "broken": broken, "wonder": wonder,
}
json.dump(summary, open(out_path, "w", encoding="utf-8"), ensure_ascii=False, indent=0)
tot = sum(a["bytes"] for a in summary["addons"].values())
lua = sum(1 for a in summary["addons"].values() for p in a["files"] if p.endswith(".lua"))
print(f"addons in: {len(final)}, emptied by dedupe: {len(summary['emptied'])}")
print(f"weapons kept: {len(kept)}, dropped dupes: {len(dropped)}, broken: {len(broken)}, wonder weapons: {len(wonder)}")
print(f"total {tot / 1e9:.2f} GB, lua files {lua}")
kinds = defaultdict(int)
for r in kept:
    kinds[r["kind"]] += 1
print("kinds:", dict(kinds))
