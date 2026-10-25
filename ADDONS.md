# Аддоны для PR

Список собран по коду режима, сохранённым данным (`garrysmod/data/pr_gamemode`) и коллекции
[ИХХИХИХХ… (14.01.2023)](https://steamcommunity.com/sharedfiles/filedetails/?id=2917798429), которая совпадает с режимом.
Статус проверен 24.10.2026 по установленным аддонам на этом ПК.

Обозначения: ✅ установлен, ❌ нет, ⚠️ есть оговорка.

## 1. Лежат в репозитории (ставятся копированием в `garrysmod/`)

| Что | Где | Зачем |
|---|---|---|
| VJ Base 2.15.3b **с правками под режим** | `addons/VJ-Base` | «Свой/чужой» для защитников точки, сигнал о нападении, счётчик защитников; танковый снаряд 110→250, РПГ только для NPC |
| OLD [VJ] Escape From Tarkov SNPC's Content ([2846867031](https://steamcommunity.com/sharedfiles/filedetails/?id=2846867031)) | `addons/eft_weapons` | Оружие защитников `weapon_vj_meft_*`. Размер совпадает с Workshop-версией |
| GUI-MAP Minimap (с правкой: видно только свою фракцию) | `addons/GUI-MAP-Minimap-for-GMOD` | Миникарта |
| Иконки, флаги, кнопки | `materials/test_gm_mat` | UI режима |
| Шрифт Bender | `resource/fonts/bender.ttf` | UI режима |

⚠️ **Не подписываться на VJ Base из Workshop** ([131759821](https://steamcommunity.com/sharedfiles/filedetails/?id=131759821)), хотя он есть в коллекции.
Там новая версия, она перекроет правки режима, и старые EFT-NPC под неё не рассчитаны.

## 2. Обязательные

| Аддон | ID | Зачем | Статус |
|---|---|---|---|
| rp_Desert_Conflict | [1957556944](https://steamcommunity.com/sharedfiles/filedetails/?id=1957556944) | Карта. Зона покупки и точки спавна техники захардкожены под неё | ✅ |
| World Flags | [1429207604](https://steamcommunity.com/sharedfiles/filedetails/?id=1429207604) | Флаги | ✅ |
| World Flags -Add Pole | [1429227701](https://steamcommunity.com/sharedfiles/filedetails/?id=1429227701) | Флагшток на точке захвата (`flagpole05.mdl`) | ✅ |
| OLD [VJ] Escape From Tarkov SCAV SNPC's | [2870524642](https://steamcommunity.com/sharedfiles/filedetails/?id=2870524642) | Защитники точки (`npc_vj_mishawild_*`) ⚠️ | ❌ |
| OLD [VJ] Escape From Tarkov SCAV SNPC's (Content 1) | [2858144529](https://steamcommunity.com/sharedfiles/filedetails/?id=2858144529) | Контент к ним | ❌ |
| OLD [VJ] Escape From Tarkov NPC Armor Content | [2846870501](https://steamcommunity.com/sharedfiles/filedetails/?id=2846870501) | Снаряжение NPC | ❌ |
| CW 2.0 Base w/o SWEPs | [1241946456](https://steamcommunity.com/sharedfiles/filedetails/?id=1241946456) | База CW 2.0 | ✅ |
| [CW 2.0] Missed World Models | [1625818723](https://steamcommunity.com/sharedfiles/filedetails/?id=1625818723) | Тут лежит `cw_ar15` (AR-15 у USA в магазине) | ✅ |
| [simfphys] LUA Vehicles - Base | [771487490](https://steamcommunity.com/sharedfiles/filedetails/?id=771487490) | Магазин техники вызывает simfphys, без него ошибка | ❌ |
| Контент Counter-Strike: Source | — | Клавиатура на точке захвата и пачка денег (`pr_money`). Без него ERROR-модели | ❌ |

⚠️ Защитники: классы `npc_vj_mishawild_sniper1` и `npc_vj_mishawild_sanitar_security1`. Скорее всего они из старого пака SCAV:
он есть в коллекции и рассчитан на тот же старый контент, что лежит в репо.
Если после установки классов не окажется, то они в новом паке
[[VJ] Escape From Tarkov SCAV, Raiders SNPC's](https://steamcommunity.com/sharedfiles/filedetails/?id=3053125420).
Ему нужен другой контент ([2926938502](https://steamcommunity.com/sharedfiles/filedetails/?id=2926938502)).

## 3. Для содержимого магазинов

Магазины экипировки, техники и одежды пустые: их списки не сохранились. Ниже то, что нужно для уже записанного в данных и для коллекции.

**Оружие**

| Аддон | ID | Зачем | Статус |
|---|---|---|---|
| ARC9 Weapon Base | [2910505837](https://steamcommunity.com/sharedfiles/filedetails/?id=2910505837) | База для `arc9_eft_aks74u` (АКС-74У у SSNK в магазине) | ❌ |
| [ARC9] Escape from Tarkov SHARED | [2917343547](https://steamcommunity.com/sharedfiles/filedetails/?id=2917343547) | Общий контент EFT-оружия | ❌ |
| [ARC9] EFT Assault Rifles | [2962829818](https://steamcommunity.com/sharedfiles/filedetails/?id=2962829818) | Сам АКС-74У (2,8 ГБ) | ❌ |
| Chuck's Weaponry 2.0 / Extra Chuck's Weaponry 2.0 | [349050451](https://steamcommunity.com/sharedfiles/filedetails/?id=349050451) / [358608166](https://steamcommunity.com/sharedfiles/filedetails/?id=358608166) | Стандартные стволы CW 2.0 | ❌ |
| CW 2.0 - Melee | [707343339](https://steamcommunity.com/sharedfiles/filedetails/?id=707343339) | Холодное оружие | ❌ |
| [CW 2.0] RPG-7 | [1085054315](https://steamcommunity.com/sharedfiles/filedetails/?id=1085054315) | Гранатомёт | ❌ |
| [CW 2.0] MKEK JNG-90 | [452211954](https://steamcommunity.com/sharedfiles/filedetails/?id=452211954) | Снайперка | ❌ |
| SGM Shared Textures | [218869210](https://steamcommunity.com/sharedfiles/filedetails/?id=218869210) | Текстуры | ❌ |
| INS2 SWEPs Contents 1–5, Khris's EXT INS2 Pt.1–3, [CW2] KK INS2/DOI SWEPs, [CW2] KK HK416, Unofficial Extra CW 2.0, White Snow's Attachment Pack | — | Стволы INS2 на CW 2.0 | ✅ |

Полный набор ARC9 EFT собран в коллекции [ARC9 Escape From Tarkov](https://steamcommunity.com/sharedfiles/filedetails/?id=2952911209), это около 7 ГБ. Ради одного АКС-74У хватит трёх аддонов из таблицы выше.

**Стационарное оружие (категория «stationary» в экипировке)**

| Аддон | ID | Статус |
|---|---|---|
| Gredwitch's Base | [1131455085](https://steamcommunity.com/sharedfiles/filedetails/?id=1131455085) | ❌ |
| Gredwitch's Emplacement Pack | [1391460275](https://steamcommunity.com/sharedfiles/filedetails/?id=1391460275) | ❌ |
| M142 HIMARS | [2846727323](https://steamcommunity.com/sharedfiles/filedetails/?id=2846727323) | ❌ |
| ATGM Kornet | [2884633518](https://steamcommunity.com/sharedfiles/filedetails/?id=2884633518) | ❌ |

**Техника (категории: лёгкая, БМП, танки, поддержка, вертолёты, самолёты)**

| Аддон | ID | Статус |
|---|---|---|
| [simfphys] WW2 Afrikakorps Tank Mini-Pack | [2677890679](https://steamcommunity.com/sharedfiles/filedetails/?id=2677890679) | ❌ |
| [simfphys] WW2 British North Africa Pack | [2332070213](https://steamcommunity.com/sharedfiles/filedetails/?id=2332070213) | ❌ |
| [simfphys] WW2 German 'Big Tanks' Pack | [2209428270](https://steamcommunity.com/sharedfiles/filedetails/?id=2209428270) | ❌ |
| [simfphys] Commission Pack #16 | [2805533305](https://steamcommunity.com/sharedfiles/filedetails/?id=2805533305) | ❌ |
| Shelby's Vehicles Shared Assets | [2726034232](https://steamcommunity.com/sharedfiles/filedetails/?id=2726034232) | ❌ |
| [LFS] Vietnam Helicopter Pack | [2125035846](https://steamcommunity.com/sharedfiles/filedetails/?id=2125035846) | ❌ (нужна база LFS, Steam предложит при подписке) |
| [LFS] A-10 Thunderbolt II | [1581181120](https://steamcommunity.com/sharedfiles/filedetails/?id=1581181120) | ❌ (нужна база LFS) |
| Bell AH-1G | [1430346908](https://steamcommunity.com/sharedfiles/filedetails/?id=1430346908) | ⚠️ стоит, но без базы [WAC Aircraft](https://steamcommunity.com/sharedfiles/filedetails/?id=104990330) не заработает |
| Wiremod | [160250458](https://steamcommunity.com/sharedfiles/filedetails/?id=160250458) | ❌ (без него турели simfphys armed и LVS пишут ошибку при загрузке) |

⚠️ **Gredwitch's Base** нужен танкам Гредвича (паки simfphys WW2 и Commission #16) и вертолётам/A-10 из LFS-паков: они стреляют через `gred.CreateBullet`. Steam может скачать его файлом без имени — `.gma` (виден только в `ls -a`), и тогда GMod его не монтирует: в консоли «Mounted 50 of 51», а в логе «unknown particle system gred_…». Лечится перекачкой в Steam или копией этого файла в `garrysmod/addons/gredwitch_base_1131455085.gma`.

**Техника в патрулях** (`gamemode/sv_patrols.lua`): наземная — любая simfphys (танки Луны из simfphys armed и танки Гредвича), её водит бот-экипаж, и каждая такая машина занимает слоты игроков (сколько ботов в экипаже); авиация — LFS/LVS со своим ИИ (стрелок — тоже бот, у Ми-24 и AH-1G).

**Прочее из коллекции**

| Аддон | ID | Статус |
|---|---|---|
| EFTMeds (твой) | [2917770571](https://steamcommunity.com/sharedfiles/filedetails/?id=2917770571) | ❌ |
| VIVO \| Health Overhaul | [2531451625](https://steamcommunity.com/sharedfiles/filedetails/?id=2531451625) | ❌ |
| Escape From Tarkov HUD | [2578541471](https://steamcommunity.com/sharedfiles/filedetails/?id=2578541471) | ❌ (режим и так рисует свой HUD) |
| [VJ] Escape From Tarkov PMC SNPC's Content 1/2 | [2839306336](https://steamcommunity.com/sharedfiles/filedetails/?id=2839306336) / [2842953703](https://steamcommunity.com/sharedfiles/filedetails/?id=2842953703) | ❌ (режим их не вызывает) |

## 4. Не нужно

- **~70 моделей игроков** из `concommands.lua` и `teamsetup.lua` (BF4, MGS4, PMC, R6S, Spetsnaz и т. д.). Этот код не вызывается. Одежду задаёт админ в магазине из установленных моделей.
- **Модель биткоина** `models/illusion/eftcontainers/bitcoin.mdl` (сущность `mp_coin`). Сущность пишет в старую переменную `MPcoin`, режим её не читает. Источник модели не нашёл.
- **Chevy Tahoe** (`models/LoneWolfie/...`): только в закомментированном коде.
