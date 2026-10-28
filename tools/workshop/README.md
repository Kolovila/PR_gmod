# Аддоны из Workshop (`addons/ws_arccw`, `addons/ws_npcs`)

## Оружие ArcCW (`addons/ws_arccw`)

С 2026-10-28 оружие режима — ArcCW (раньше CW 2.0 — его убрали целиком: игрок выбрал ArcCW).
Список — `arccw_ids.txt` (27 предметов, ~6,5 ГБ): база ArcCW, Urban Coalition (Commons, Urban Decay,
Urban Renewal), Black Ops, Modern Warfare 3, военная ветка UC от Vergi (РПГ-7, AT4, РПГ-26, M249, M60,
ПК, СВД, ПМ/АПС, СКС, M14, M82) и их обязательные зависимости (Vergi's Extras, UC Extras, USP, SCAR,
FAL, GM6, Neostead, USAS-12, Counter-Strike+, Third-Person IK). Отдельных ArcCW-паков Insurgency и Day
of Infamy в Workshop нет. Всё — в **одной** папке `addons/ws_arccw` (одна папка — один путь поиска:
с сотней папок карта грузилась минутами). Из какого пака что пришло — `manifest_arccw.json`.
В git лежит только Lua (~1500 файлов), модели, звуки и текстуры — локально (`.gitignore`),
пересобираются `rebuild.ps1`.

Отбор (`arccw_select.py`):
- файл, который есть в нескольких паках, — из одного: папка `lua/weapons|entities|effects/<класс>/`
  целиком; выбор по приоритету пака (ветка Vergi > остальной UC > MW3 > BO > CS+), при равном — свежий;
- дубли стволов: группа = настоящее имя (`TrueName`, иначе `PrintName`, без марки производителя и
  пометок пака) + вид (пистолет, длинный, гранатомёт, граната, нож) — остаётся ствол лучшего пака;
- «чудо-оружие» Black Ops (лучемёты, Blundergat) и стволы без модели от первого лица — выкидываются.

Итог отбора 2026-10-28: 226 стволов (пистолеты 47, длинные 150, гранатомёты и гранаты 24, ножи 5),
47 дублей и 3 «чудо-оружия» выкинуто. Сопоставление старых стволов CW новым (магазин, патрули) —
`gamemodes/testgm/gamemode/config/arccw_migration.lua`.


## Паки NPC и плеермоделей (`addons/ws_npcs`)

Вторая папка — 11 паков из `npc_ids.txt` (5,8 ГБ): Sentry's Military / Russian Military / Insurgent /
Middle East, EFT+ (PMC Bear&Usec, Raiders, RUAF), плеермодели EFT PMC Redux (Mal0) и INS2 Security,
Insurgent, VIPs (последний — обязательный для двух других). Отбор — `npc_select.py`: свои
`weapon_vj_*` паков не трогаем (без них NPC без оружия), но файл, который уже есть в другой папке
`addons` (VJ-Base 3.2, ws_arccw), не дублируем. Итог — `manifest_npcs.json`.
Проверка: `run_selftest.ps1 -Suite npcs -Instance 1`.

### Боссы EFT — только модели (`npc_models_only_ids.txt`)

23 аддона: заброшенный VJ-пак 3053125420 (SCAV, Raiders, боссы), (VJ) The Goon Squad, (VJ) Killa
и плеермодели боссов со снаряжением. Из них берём **только** модели, текстуры и звуки (голоса) —
ни строчки их Lua (`npc_select.py --models-only`); NPC из этих моделей делаем своим классом.
Зависимость «EFT – Shared Stuff» (2886973051) из Workshop удалена; проверка `mdl_textures.py`:
у 412 моделей боссов нет текстур только у 4 моделей рук от первого лица — NPC их не используют.

Тела (плеермодели, анимации игрока — VJ 3.2 их поддерживает):

| босс | модель |
|---|---|
| Решала | `models/player/eft/bosses/reshala.mdl` |
| Килла | `models/player/eft/bosses/killa.mdl` |
| Глухарь | `models/player/eft/bosses/glukhar.mdl` |
| охрана Глухаря | `models/player/eft/followers/glukhar/glukhar_{assault_ar,assault_cr,scout,security}.mdl` |
| Санитар | `models/player/eft/bosses/sanitar.mdl` |
| Штурман | `models/eft/bosses/shturman.mdl` |
| Тагилла | `models/eft/bosses/tagilla.mdl` |
| Кабан | `models/eft/bosses/kaban.mdl` |
| Коллонтай | `models/player/eft/bosses/kollontai.mdl` |
| Партизан | `models/eft/bosses/partisan.mdl` |
| Зрячий | `models/eft/bosses/zryachii_pm.mdl` |
| Knight / Big Pipe / Birdeye | `models/eft/bosses/{knight,big_pipe,birdeye}_pm.mdl`, NPC-модели `models/{knight,big_pipe,birdeye}_npc.mdl` |
| Дикие | `models/eft/scavs/scav_extended_pm.mdl` и EFT SCAV PMs (3018571046) |

## Файлы

| файл | что делает |
|---|---|
| `rebuild.ps1` | всё целиком: скачать недостающее, отобрать, распаковать в `addons/` |
| `fetch.ps1` | качает id из списка через steamcmd (анонимно), пачками с повторами |
| `arccw_ids.txt` | паки ArcCW (оружие режима) |
| `cw_index.py` | читает `.gma` / старые `.bin`: файлы, стволы (класс, имя, база, модели, статы; поля ArcCW тоже) |
| `arccw_select.py` | отбор ArcCW: победитель каждого файла, дубли стволов, «чудо-оружие», битые |
| `cw_extract.py` | пишет файлы-победители в одну папку `addons/<--folder>/`, убирает лишние, обновляет манифест |
| `npc_select.py` | отбор файлов паков NPC для `addons/ws_npcs` |
| `mdl_textures.py` | у каких моделей не нашлись материалы / текстуры |
| `vpk_list.py` | список файлов самой игры из `*_dir.vpk` (что есть без аддонов) |

Игра получает копию через `tools/deploy.ps1`, тестовые копии — ссылку на папку репозитория
(`run_selftest.ps1`). Проверка: `run_selftest.ps1 -Suite weapons -Instance 1` (и `-Suite npcw`).
