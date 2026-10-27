"""Отбор оружейных аддонов: что ставим, какой файл из какого аддона, какие стволы — дубли.

usage: python -I cw_select.py <index.json> <base_files.txt> <det.json> <shop_classes.txt> <out.json>
"""
import json
import math
import re
import sys
from collections import defaultdict

idx = json.load(open(sys.argv[1], encoding="utf-8"))
base_files = set(open(sys.argv[2], encoding="utf-8").read().split("\n"))
det = {d["publishedfileid"]: d for d in json.load(open(sys.argv[3], encoding="utf-8"))["response"]["publishedfiledetails"]}
shop = set(open(sys.argv[4], encoding="utf-8").read().split())
out_path = sys.argv[5]

EXCLUDE = {
    "2433472578": "база CWC (Cturiselection) — несовместима с обычным CW 2.0, автор просит не ставить вместе",
    "2433482067": "ствол под базу CWC",
    "1373891184": "CWC MEGAPACK — контент под базу CWC",
    "1241946456": "вторая, урезанная копия базы CW 2.0 (полная 349050451 уже есть)",
    "2155958523": "перепаковка KK INS2 — те же 198 классов, что в 657241323 (она уже в магазине)",
    "2420493567": "KK INS2 «Flame unlocked» — копия 657241323 с открытыми огнемётами",
    "757604550": "wOS Animation Extension — не оружие, глобально меняет анимации игроков",
    "775573383": "Prone Mod (лечь) — не оружие, требует wOS Animation Extension",
    "918084741": "анимации Prone Mod — не оружие, требует wOS Animation Extension",
    "604564750": "CW 2.0 Precacher — на старте грузит и печатает каждый файл (~18 тыс.), загрузка карты 40 с -> 7 мин",
    "1241939454": "INS2 Contents Precacher — 1000+ моделей в прекэш на старте (лимит Source 4096)",
}

addons = {k: v for k, v in idx.items() if "title" in v}
title = lambda w: (det.get(w, {}).get("title") or addons[w]["title"]).strip()
updated = lambda w: int(det.get(w, {}).get("time_updated") or 0)
subs = lambda w: int(det.get(w, {}).get("lifetime_subscriptions") or 0)

for w, a in addons.items():
    if w in EXCLUDE:
        continue
    if re.search(r"\bCWC\b", title(w)):
        EXCLUDE[w] = "под базу CWC"
    elif a["weapons"] and all("cwc_" in c or (inf.get("Base") or "").startswith("cwc") for c, inf in a["weapons"].items()):
        EXCLUDE[w] = "стволы под базу CWC"

included = [w for w in addons if w not in EXCLUDE]

# ---------- кто даёт какой файл: папка оружия/сущности — целиком из одного аддона ----------
def unit(path):
    m = re.match(r"(lua/(?:weapons|entities|effects)/[^/]+)/", path)
    return m.group(1) if m else path

unit_prov = defaultdict(set)
for w in included:
    for p in addons[w]["files"]:
        unit_prov[unit(p)].add(w)

def rank(w):
    return (updated(w), addons[w]["size"])

unit_winner = {u: max(ws, key=rank) for u, ws in unit_prov.items()}

# ---------- стволы ----------
weapons = defaultdict(dict)  # class -> {addon: info}
for w in included:
    for cls, info in addons[w]["weapons"].items():
        weapons[cls][w] = info

def info_of(cls):
    u = "lua/weapons/" + cls
    w = unit_winner.get(u)
    if w is None:  # однофайловое оружие lua/weapons/<cls>.lua
        w = unit_winner.get(u + ".lua")
    return weapons[cls].get(w) or next(iter(weapons[cls].values())), w

def resolve(cls, field, seen=None):
    seen = seen or set()
    if cls in seen or cls not in weapons:
        return None
    seen.add(cls)
    info, _ = info_of(cls)
    if field in info:
        return info[field]
    return resolve(info.get("Base"), field, seen) if info.get("Base") else None

def family(cls):
    chain, cur, seen = [], cls, set()
    while cur and cur not in seen:
        seen.add(cur)
        chain.append(cur)
        cur = info_of(cur)[0].get("Base") if cur in weapons else None
    j = " ".join(chain)
    for key, fam in (("cw_kk_ins2_base", "kk"), ("khr_", "khris"), ("mw3_wpn_base", "mw3"), ("cw_base", "cw"), ("cw_grenade_base", "cw")):
        if key in j:
            return fam
    return "other"

all_files = base_files | set(unit_prov) | {p for w in included for p in addons[w]["files"]}

def hold_class(h, ammo=""):
    h = (h or "").lower()
    if re.search(r"rocket|rpg|40mm|law|at4|bazooka|panzer|piat|m72|grenade", (ammo or "").lower()):
        return "launcher"
    if h in ("pistol", "revolver", "duel"):
        return "pistol"
    if h in ("rpg",):
        return "launcher"
    if h in ("grenade", "slam"):
        return "nade"
    if h in ("melee", "melee2", "knife", "fist"):
        return "melee"
    return "long"

def norm(name):
    n = name.lower()
    n = re.sub(r"\(.*?\)|\[.*?\]", " ", n)
    n = re.sub(r"\b(cw2?|kk|ins2|doi|eft|the|rifle|smg|pistol|new|official)\b", " ", n)
    return re.sub(r"[^a-z0-9]", "", n)

GENERIC = {"", "riniccustom", "custom", "weapon"}
FAM_SCORE = {"kk": 0.5, "khris": 0.3, "mw3": 0.2, "cw": 0, "other": -1}
wcount = {w: max(1, len(addons[w]["weapons"])) for w in addons}

def quality(w):
    # мегабайт контента на ствол: паки «на один ствол» детальнее массовых; плюс свежесть
    mb = addons[w]["size"] / 1e6 / wcount[w]
    years = max(0, (updated(w) - 1420070400) / 31557600)
    return math.log10(mb + 0.1) * 2 + years * 0.1

rows, broken = [], []
for cls in weapons:
    if cls.endswith("_base") or "_base_" in cls or re.search(r"(^|_)base$", cls):
        continue
    sp, asp = resolve(cls, "Spawnable"), resolve(cls, "AdminSpawnable")
    if sp in ("false", None) and asp in ("false", None):
        continue
    info, w = info_of(cls)
    vm = (resolve(cls, "ViewModel") or "").lower().replace("\\", "/")
    if not vm or vm not in all_files:
        broken.append({"class": cls, "addon": w, "vm": vm})
        continue
    name = resolve(cls, "PrintName") or cls
    key = norm(name)
    hc = hold_class(resolve(cls, "HoldType"), resolve(cls, "Caliber"))
    era = bool(re.search(r"(^|_)(nam|doi|atow|ww2)(_|$)", cls))
    fam = family(cls)
    score = (1000 if cls in shop else 0) + FAM_SCORE.get(fam, 0) - (0.5 if era else 0) + quality(w) + math.log10(subs(w) + 1) * 0.05
    rows.append({"class": cls, "addon": w, "name": name, "group": (key + "|" + hc) if key not in GENERIC else cls,
                 "family": fam, "score": score, "shop": cls in shop, "hold": hc})

groups = defaultdict(list)
for r in rows:
    groups[r["group"]].append(r)

kept, dropped = [], []
for g, lst in groups.items():
    lst.sort(key=lambda r: -r["score"])
    best = lst[0]
    for r in lst:
        if r is best or r["shop"]:
            kept.append(r)
        else:
            r["dupeOf"] = best["class"]
            dropped.append(r)

drop_units = {"lua/weapons/" + r["class"] for r in dropped} | {"lua/weapons/" + b["class"] for b in broken}
drop_units |= {u + ".lua" for u in list(drop_units)}

# ---------- итог по файлам ----------
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
    "kept": kept, "dropped": dropped, "broken": broken,
}
json.dump(summary, open(out_path, "w", encoding="utf-8"), ensure_ascii=False, indent=0)
tot = sum(a["bytes"] for a in summary["addons"].values())
print(f"addons in: {len(final)}, excluded: {len(summary['excluded'])}, emptied by dedupe: {len(summary['emptied'])}")
print(f"weapons kept: {len(kept)} (shop {sum(1 for r in kept if r['shop'])}), dropped dupes: {len(dropped)}, broken: {len(broken)}")
print(f"total bytes: {tot / 1e9:.2f} GB")
fam = defaultdict(int)
for r in kept:
    fam[r["family"]] += 1
print("kept by family", dict(fam))
