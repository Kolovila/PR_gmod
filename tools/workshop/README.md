# Оружейные аддоны из Workshop (`addons/ws_weapons`)

Источник — коллекция Workshop 2903171028 «Someting from CW 2.0» (232 аддона, ~26 ГБ в архивах),
id в `collection_ids.txt`. В режим попадает отобранное: без несовместимых баз, без дублей стволов,
каждый файл ровно из одного аддона — и всё в **одной** папке `addons/ws_weapons`.

Почему одна папка: каждая папка в `addons/` — отдельный путь поиска файлов, и с 195 папками карта
грузилась 6 минут вместо 45 секунд (замер на тестовой копии). Из какого аддона что пришло — в
`manifest.json` (id, название, стволы). В git лежит только Lua этих папок (~11 МБ), модели, звуки и
текстуры (~25 ГБ) — локально (`.gitignore`), пересобираются `rebuild.ps1`.

## Паки NPC и плеермоделей (`addons/ws_npcs`)

Вторая папка — 11 паков из `npc_ids.txt` (5,8 ГБ): Sentry's Military / Russian Military / Insurgent /
Middle East, EFT+ (PMC Bear&Usec, Raiders, RUAF), плеермодели EFT PMC Redux (Mal0) и INS2 Security,
Insurgent, VIPs (последний — обязательный для двух других). Отбор — `npc_select.py`: свои
`weapon_vj_*` паков не трогаем (без них NPC без оружия), но файл, который уже есть в другой папке
`addons` (VJ-Base 3.2, ws_weapons), не дублируем. Итог — `manifest_npcs.json`.
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

## Что выкинуто целиком

- база CWC (Cturiselection) и всё под неё — автор прямо пишет «не ставить вместе с обычным CW 2.0»;
- урезанная копия базы CW 2.0 (1241946456) — полная 349050451 уже есть;
- перепаковки KK INS2 (2155958523 REPACKED, 2420493567 Flame unlocked) — те же 198 классов, что
  в 657241323, а её стволы уже в магазине;
- wOS Animation Extension (757604550) и Prone Mod (775573383, 918084741) — не оружие, меняют
  анимации и движение игроков;
- оба «прекэшера» (604564750 CW 2.0, 1241939454 INS2) — на старте грузили и печатали ~18 тыс.
  файлов и 1000+ моделей (у Source лимит 4096 моделей в прекэше); нужны только против подлагивания
  при первом взятии ствола.

## Наши правки чужого Lua

Помечены `-- PR:`; `cw_extract.py` такие файлы не перезаписывает. Сейчас:

- `lua/weapons/zz_shg31/shared.lua` (M1897 Trench Gun) — функция без имени → `CalculateEffectiveRange`;
- `lua/cw/shared/attachments/stoner_lmg_grip.lua` (Japan Pack) — описание без `att.description`;
- `lua/entities/44_mag_ammo/shared.lua`, `454_casull_ammo/shared.lua` (Shifty) — `registerAmmo` без подписи.

## Как отбирается (`cw_select.py`)

- Конфликт файлов: папка оружия / сущности (`lua/weapons/<класс>/`) берётся целиком из одного
  аддона — самого свежего; остальные файлы — тоже по свежести.
- Дубли стволов: группа = одно название (без «(EFT)», «[MW2]», «CW», «KK», …) + тип (пистолет,
  длинный, гранатомёт, граната, нож). Из группы остаётся один: стволы магазина — всегда, дальше
  по «качеству» — мегабайт контента на ствол (паки «на один ствол» детальнее массовых), свежести,
  небольшой бонус KK INS2 / Khris; эпоховые копии (`nam_`, `doi_`) — с небольшим штрафом.
- Битые (модели нет ни в одном аддоне и ни в самой игре) — выкидываются.

Итог последнего отбора — `manifest.json` (папка, название, стволы).

## Файлы

| файл | что делает |
|---|---|
| `rebuild.ps1` | всё целиком: скачать недостающее, отобрать, распаковать в `addons/` |
| `fetch.ps1` | качает id из списка через steamcmd (анонимно), пачками с повторами |
| `cw_index.py` | читает `.gma` / старые `.bin`: файлы, стволы (класс, имя, база, модели, статы) |
| `cw_select.py` | отбор: исключения, победитель каждого файла, дубли, битые |
| `cw_extract.py` | пишет файлы-победители в `addons/ws_weapons/`, убирает лишние, обновляет `manifest.json` |
| `npc_select.py` | отбор файлов паков NPC для `addons/ws_npcs` |
| `mdl_textures.py` | у каких моделей не нашлись материалы / текстуры |
| `vpk_list.py` | список файлов самой игры из `*_dir.vpk` (что есть без аддонов) |

Игра получает копию через `tools/deploy.ps1`, тестовые копии — ссылку на папку репозитория
(`run_selftest.ps1`). Проверка: `run_selftest.ps1 -Suite weapons -Instance 1`.
