-- Пехота патрулей: числа общего слоя (gamemode/sv_infantry.lua, docs/infantry.md).
-- Юниты Source, 1 м ≈ 52 ю. Правки — здесь, логика их только читает.

PR_INF = {
	-- Зрение: время до обнаружения (с) от дистанции, точки {дистанция, время}, между ними — линейно
	detectCurve = {{0, 0.25}, {520, 0.25}, {5200, 0.8}, {9000, 1.5}},
	detectMin = 0.1,
	fov = 160,               -- полный угол зрения
	fogEnd = 9000,           -- дальше не видно ничего (туман карты)
	-- Реакция после обнаружения: обычная и «держал этот угол»
	reaction = {0.3, 0.8},
	reactionPrepared = 0.25,
	preparedAngle = 30, preparedDist = 200,
	-- Опрос зрения по дальности: {до дистанции, раз в столько секунд}
	visionPoll = {{4700, 0.1}, {8300, 1}, {math.huge, 3}},

	-- Слух: дальности (ю). Выстрел — по патрону оружия (shotByAmmo, по подстроке), иначе по типу
	shotByAmmo = {
		{"12.7", 7800}, {".50", 7800}, {"338", 6500}, {"7.62x54", 5850}, {"7.62x51", 5200}, {".308", 5200},
		{"12 gauge", 4800}, {"buckshot", 4800}, {"7.62x39", 4550}, {"5.45", 4150}, {"5.56", 4150},
		{"9x19", 2900}, {"9x18", 2900}, {".45", 3100}, {".357", 3250}, {".44", 3250}, {"7.62x25", 3000},
		{"pistol", 2900}, {"smg1", 3100}, {"ar2", 4300}, {"sniper", 5850}, {"357", 3250}
	},
	shotDefault = 4300, shotPistol = 3000,
	shotLauncher = 3000, shotGrenadeLauncher = 1500,
	suppressor = 0.6, suppressorSubsonic = 0.33,
	steps = {run = 1300, walk = 650, crouch = 250},
	reload = 800, landing = 1700,
	vehicle = {6000, 12000},
	alwaysHear = 156,
	-- Сквозь стену и в / из здания
	occludedShot = 0.8, occludedShotSuppressed = 0.65, occludedQuiet = 0.6,
	-- Маскировка: после выстрела рядом тихие звуки слышны хуже
	maskTime = 2, maskRadius = 1500, maskQuiet = 0.3,
	-- Ошибка «где»: пеленг (σ, градусы) и дальность (доля)
	errShot = {5, 0.2}, errQuiet = {8, 0.15},
	errBehind = 1.5, errFront = 0.5, errExactDist = 520,
	errNearKnown = {150, 2600}, -- рядом с известной точкой ошибка ×(0,05…1) на этом отрезке
	errNearMiss = 2,
	hearDelay = {calm = {0.25, 0.5}, enemy = 0.1, unknown = 0.6},
	crackRadius = 150,          -- пуля прошла ближе — «обстрел», пеленг на стрелка ±45°

	-- Знание о враге
	lostFire = 0.15,            -- прицельно стреляет после потери
	extrapolate = 2,
	growMin = 100, growSpeed = 0.6, growMax = 3000,
	forget = 180,               -- метка живёт 3 мин (решение игрока)
	checkRadius = 1500, checkShare = 0.7, checkTime = 1,
	sewSpeed = 450,             -- новый звук ближе sewSpeed·dt к метке — та же метка

	-- Рация и голос
	radioDelay = {2, 4}, radioRate = 2, radioMinR = 150, radioDistShare = 0.1,
	voiceRadius = 1500, voiceDelay = {0.5, 1},

	-- Подавление 0–1
	suppressNear = 0.25, suppressExplosion = 0.5, suppressExplosionRadius = 800,
	suppressDecay = 0.28,       -- в секунду (от 1 до 0 за ~3,5 с)
	suppressHide = 0.5, suppressHeavy = 0.8,

	-- Огонь
	spreadFirst = 0.4,          -- первый выстрел после паузы
	spreadPerShot = 0.35,       -- рост за выстрел в очереди
	spreadMax = 3,
	spreadRun = 3, spreadWalk = 1.5, spreadCrouch = 0.8,
	burstReset = {pistol = 0.3, rifle = 0.4, heavy = 0.55, mg = 0.7},
	burst = {4, 6},             -- по умолчанию; роли задают своё (штурмовик 8–10)
	burstPause = {0.4, 0.8},
	hitKnock = {0.5, 1.5},      -- попали — прицел сбит, разброс ×2

	-- Поиск после потери
	searchDelay = {leader = 30, follower = 10},
	searchWait = {0.75, 3.75},

	-- Движение
	-- Маршрут без продвижения к цели столько секунд — снять (застрял)
	stuckTime = 4,
	moveStep = 450,

	-- Урон NPC-копий стволов ArcCW: урон ArcCW вблизи × это (у бойцов нет брони игрока: АК ~33 -> ~7)
	npcDamageScale = 0.2,
	-- Ручные гранаты: класс (первый, что есть в игре), дальность броска
	grenadeClasses = {"arccw_thr_frag", "npc_grenade_frag"},
	grenadeRange = {400, 1600},
}

-- Модели боссов EFT (addons/ws_npcs, только модели — tools/workshop/README.md): в список
-- плеермоделей сами не попадают, редактор патрулей предлагает их отсюда
PR_INF_BOSS_MODELS = {
	{"Решала", "models/player/eft/bosses/reshala.mdl"},
	{"Килла", "models/player/eft/bosses/killa.mdl"},
	{"Глухарь", "models/player/eft/bosses/glukhar.mdl"},
	{"Охрана Глухаря: штурм АР", "models/player/eft/followers/glukhar/glukhar_assault_ar.mdl"},
	{"Охрана Глухаря: штурм КР", "models/player/eft/followers/glukhar/glukhar_assault_cr.mdl"},
	{"Охрана Глухаря: разведчик", "models/player/eft/followers/glukhar/glukhar_scout.mdl"},
	{"Охрана Глухаря: охрана", "models/player/eft/followers/glukhar/glukhar_security.mdl"},
	{"Санитар", "models/player/eft/bosses/sanitar.mdl"},
	{"Штурман", "models/eft/bosses/shturman.mdl"},
	{"Тагилла", "models/eft/bosses/tagilla.mdl"},
	{"Кабан", "models/eft/bosses/kaban.mdl"},
	{"Коллонтай", "models/player/eft/bosses/kollontai.mdl"},
	{"Партизан", "models/eft/bosses/partisan.mdl"},
	{"Зрячий", "models/eft/bosses/zryachii_pm.mdl"},
	{"Knight", "models/eft/bosses/knight_pm.mdl"},
	{"Big Pipe", "models/eft/bosses/big_pipe_pm.mdl"},
	{"Birdeye", "models/eft/bosses/birdeye_pm.mdl"},
	{"Дикий", "models/eft/scavs/scav_extended_pm.mdl"},
}

-- Роли (sv_infantry_roles.lua). Ключ -> подпись в редакторе
PR_INF_ROLES = {
	{key = "", name = "Обычный"},
	{key = "sniper", name = "Снайпер"},
	{key = "marksman", name = "Марксман"},
	{key = "assault", name = "Штурмовик"},
	{key = "grenadier", name = "Гранатомётчик"},
	{key = "ebitel", name = "Ебитель"},
	{key = "sneak", name = "Тихоня"},
}

-- Роли (sv_infantry_roles.lua; сверено с тактиком и знатоком ИИ EFT 2026-10-28, docs/infantry.md).
-- dist — {ближе не лезет, желает, дальше не стреляет}; acc — множитель разброса; burst — очередь;
-- pause — пауза между очередями; search — через сколько идёт искать потерянного; sprint — шанс бегом
PR_INF_ROLE_CFG = {
	[""] = {dist = {300, 1500, 4500}, acc = 1, burst = {4, 6}, pause = {0.4, 0.8}, search = 10},
	sniper = {dist = {4500, 6500, 8000}, acc = 0.35, burst = {1, 1}, pause = {1.5, 3}, search = 9999,
		holdAngle = {20, 40}, exposedShots = 1, moveTown = 1000, moveDesert = 2000, angleChange = 15, tooClose = 2000},
	marksman = {dist = {2500, 4500, 7000}, acc = 0.6, burst = {1, 2}, pause = {0.6, 1.2}, search = 60,
		relocateShots = {3, 5}, moveTown = 800, moveDesert = 1500, angleChange = 15, tooClose = 1200},
	assault = {dist = {600, 1500, 3000}, acc = 1, burst = {8, 10}, pause = {0.4, 0.8}, pauseFar = {1, 1.5}, search = 10,
		bound = {3, 4}, boundMax = 800, press = {600, 900}, backoff = 400},
	grenadier = {dist = {1500, 3000, 5000}, acc = 1, burst = {3, 5}, pause = {0.6, 1}, search = 20,
		rpgMin = 800, rpgMax = 5000, rpgRadius = 250, rpgAge = 6, rockets = 3, backup = {"smg", "rifle"}, kneel = 0.8, relocate = 800,
		stillTime = 1.5, nadeRange = {400, 1600}, nadeCooldown = {8, 15}, nades = 2, squadNadeCooldown = 6, nadeSafe = 600},
	ebitel = {dist = {200, 600, 1500}, acc = 1.1, burst = {5, 8}, pause = {0.4, 0.8}, search = 0.1, searchFor = 150,
		stopShot = {0.4, 0.8}, cornerPause = {0.5, 1.5}, enterAfterBlast = {0.3, 0.8}, backoffHit = 0.3, backoffTime = {5, 8},
		healBelow = 0.35, healTime = {15, 25}, swear = {5, 10}},
	sneak = {dist = {0, 400, 1500}, acc = 0.9, burst = {6, 10}, pause = {0.3, 0.6}, search = {90, 240},
		rear = 110, freezeLook = 30, freezeMax = {2, 3}, lookedTrigger = 0.7, behind = 800, arcTown = 1500, arcDesert = 2500,
		reengage = {20, 40}, shift = 45, reloadTrigger = 1500},
}

-- Отряд (этап 4)
PR_INF_SQUAD = {
	spacingTown = 150, spacingDesert = 520,
	guardDist = {150, 300}, guardDistDesert = {300, 500},
	bossBehind = {1500, 3000}, bossRetreatAt = 1500, bossRetreatAgain = 30,
	retreatLoss = 0.5, retreatBossHp = 0.4, rallyTown = {2000, 4000}, rallyDesert = {4000, 6000},
	regroup = {15, 30}, reattackShare = 0.6, cycles = 2,
	holdToSearch = {30, 45}, flankChance = 0.7, flankTimeout = {45, 60}, pincerAt = 8,
	fireShiftDist = 600, fireShiftAngle = 10, ambushHits = 2, ambushWindow = 2, ambushFree = {3, 5},
	badSpot = 90, badSpotR = 300,
	-- Смерть босса: окно без приказов, ярость видевших, охрана тела, новый командир
	bossDeadQuiet = {8, 12}, rage = {30, 45}, rageRadius = 1500, guardBody = {120, 180}, guardBodyDist = {800, 2000},
	newLeaderAfter = 10, leaveBelow = 0.4,
}
