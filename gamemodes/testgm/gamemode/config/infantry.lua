-- Пехота патрулей: числа общего слоя (gamemode/sv_infantry.lua, docs/infantry.md).
-- Юниты Source, 1 м ≈ 52 ю. Правки — здесь, логика их только читает.

PR_INF = {
	-- Зрение: время до обнаружения (с) от дистанции, точки {дистанция, время}, между ними — линейно
	-- 2026-10-28 (знаток ИИ Таркова по записи боя: от появления цели на 50 м до сведённого выстрела
	-- было 2,4–2,8 с — «тормознутые»): быстрее, как у ЧВК EFT
	detectCurve = {{0, 0.15}, {520, 0.2}, {2600, 0.35}, {5200, 0.6}, {9000, 1.2}},
	detectMin = 0.1,
	fov = 160,               -- полный угол зрения
	fogEnd = 9000,           -- дальше не видно ничего (туман карты)
	-- Реакция после обнаружения, по тому, как заметил. Игрок: «в Таркове боты спустя 0,5 с ебашат в
	-- голову» (было 0,1–0,25 с для всех), потом (2026-10-28): «слишком круто стало, чуть уменьшим точность
	-- и реакцию, когда бот сам увидел игрока». Сам заметил (рядом с целью у него не было метки) —
	-- reaction; знал, где враг (метка ближе knownDist: слышал, рация, видел раньше) — reactionKnown;
	-- держал этот угол — reactionPrepared
	reaction = {0.25, 0.45},
	reactionKnown = {0.12, 0.25},
	reactionPrepared = 0.1,
	knownDist = 800,
	detectPatrolMul = 1.3, detectFightMul = 0.7,   -- в патруле (не ждёт врага) дольше, в бою быстрее
	preparedAngle = 30, preparedDist = 200,
	-- Опрос зрения по дальности: {до дистанции, раз в столько секунд}
	-- (раз в 1 с на 4700–8300 — рабочей дальности марксмана — было слишком редко)
	visionPoll = {{4700, 0.1}, {8300, 0.2}, {math.huge, 1}},

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

	-- Огонь. Сведение прицела (как SAIN / EFT; сверено с тремя экспертами 2026-10-28 по записи боя
	-- игрока и тесту меткости -Suite aim): пока цель на виду, а боец стоит, разброс сходится от start до
	-- floor за T секунд. Бег не сбрасывает, а размывает (−aimRunDecay·T в секунду: рывок 1,5 с оставляет
	-- ~40%), шаг сводит вдвое медленнее, цель пропала — гаснет на aimLostDecay·T в секунду (вернулась та
	-- же — остаток); первый контакт — −0,2 с, попадание по бойцу — −0,3 с, своё движение за 0,5 с —
	-- T ×1,3. holdUntil — марксман и снайпер не стреляют, пока не свели holdUntil·T. Множитель роли (acc)
	-- уже внутри профиля. burstFar/burstMid — свои очереди профиля (босс, Knight, охрана бьют и на 75 м)
	-- Цели по стоящему (игрок: «точность ставь хорошую прям»; тест -Suite aim, прицел в центр груди):
	-- 50 м / 75 м — босс и Knight ~90% / ~70%, охрана и бойцы ролей ~80% / ~55%, обычный ~60% / ~40%,
	-- марксман ~100% / ~90%, снайпер ~100% / ~100%. Промахи — в основном вбок (торс ~15 ю шириной):
	-- доля ≈ 1 − (1 − 9 / (0,05·floor·d))²
	-- Решение игрока: первый прицельный выстрел точный, доводка — только при внезапном контакте. Боец,
	-- который уже в бою (слышал, видел, знает о враге), новую цель берёт сразу сведённой; доводка от start —
	-- только у застигнутого врасплох (был в патруле). head — шанс целить в голову (как боты EFT; голова у
	-- игрока 35 HP — одно попадание), когда прицел сведён на aimHeadMinK и сам стоит; бросок раз в aimHeadRoll
	aim = {
		boss = {T = 0.5, start = 0.45, floor = 0.1, burstFar = 3900, burstMid = {3, 4}, head = 0.3},
		knight = {T = 0.5, start = 0.45, floor = 0.1, burstFar = 3900, burstMid = {3, 4}, head = 0.3},
		guard = {T = 0.6, start = 0.5, floor = 0.13, burstFar = 3900, burstMid = {3, 4}, head = 0.2},
		fighter = {T = 0.6, start = 0.5, floor = 0.13, head = 0.15},
		marksman = {T = 0.8, start = 0.4, floor = 0.06, holdUntil = 0.8, head = 0.4},
		sniper = {T = 1.2, start = 0.4, floor = 0.04, holdUntil = 0.8, head = 0.5},
		regular = {T = 1.0, start = 0.7, floor = 0.16, head = 0.05},
	},
	aimHeadMinK = 0.8, aimHeadRoll = 0.6,
	-- Новая цель (не та же, что вернулась), по тому, как заметил (см. reaction): держал угол — сразу сведён;
	-- знал, где враг, — сведён на aimKnownK; сам заметил — первые aimSelfSpot с (+ aimFirstContact, если
	-- был в патруле и боя не ждал) бьёт с разбросом start × aimSurpriseStart и только потом сводит за T.
	-- Голова — только у сведённого (aimHeadMinK), так что сам заметивший в голову бьёт не сразу
	aimSelfSpot = 0.3, aimKnownK = 0.5, aimSurpriseStart = 1.4,
	aimFirstContact = 0.2, aimHitPenalty = 0.3,
	aimRunDecay = 0.4, aimLostDecay = 0.5, aimWalkGain = 0.5, aimMoveT = 1.3,
	aimStillSpeed = 40, aimRunSpeed = 150,  -- ю/с: медленнее — стоит, быстрее — бежит
	targetMoveSpread = 0.6,     -- бегущая цель: разброс × (1 + это × min(скорость / 250, 1))
	-- Решение игрока (2026-10-28): «все будут жать в гашетку, без очередей, точность ставь хорошую прям» —
	-- огонь без пауз (очереди ролей и от дальности не действуют), отдача почти не разносит прицел
	fullAuto = true,
	spreadPerShot = 0.03,       -- отдача: рост за выстрел подряд
	spreadMax = 1.25,
	spreadRun = 2.5, spreadWalk = 1.5, spreadCrouch = 0.8,
	-- Длина очереди от дальности: дальше burstFar — одиночные, дальше burstNear — 2–3, ближе — очередь роли
	burstNear = 1000, burstFar = 2600, burstMid = {2, 3}, burstPauseMid = {0.3, 0.5}, burstPauseFar = {0.4, 0.6},
	-- Приказ отряда (отход, охрана): метка моложе этого — лицом к ней, а не по приказу
	orderThreatAge = 6,
	suppressSpread = 0.5,       -- подавление: разброс × (1 + это × подавление)
	burstReset = {pistol = 0.3, rifle = 0.4, heavy = 0.55, mg = 0.7},
	burst = {4, 6},             -- по умолчанию; роли задают своё (штурмовик 8–10)
	burstPause = {0.4, 0.8},
	hitKnock = {0.3, 0.8}, hitKnockBoss = {0.2, 0.4}, knockMul = 1.5,   -- попали — прицел сбит ненадолго

	-- Поиск после потери
	searchDelay = {leader = 30, follower = 10},
	searchWait = {0.75, 3.75},

	-- Движение
	-- Маршрут без продвижения к цели столько секунд — снять (застрял)
	stuckTime = 4,
	moveStep = 450,

	-- Урон NPC-копий стволов ArcCW: среднее урона ArcCW вблизи и вдали × это. Было 0,2 («под броню
	-- игрока»), а у игрока VIVO — тарковское здоровье по частям (голова 35, грудь 85): 6–12 за попадание
	-- давали 13 попаданий в грудь, игрок называл ботов «очень слабыми». Теперь как в Таркове: АКМ ~37
	npcDamageScale = 1.0,
	-- Чужие стволы VJ в руках бойца (старый пак EFT weapon_vj_meft_*: урон 5–12) — урон × это,
	-- дробь (несколько дробин) — × npcLegacyPelletMul
	npcLegacyDamageMul = 3, npcLegacyPelletMul = 1.5,
	-- Не меньше этого за пулю по виду ствола (у ArcCW SR-25 — 41, а 7,62×51 в EFT ≈ 80): марксману
	-- должно хватать двух попаданий в грудь (85)
	npcDamageFloor = {dmr = 55, sniper = 80},
	-- Старый пак EFT для VJ (addons/eft_weapons): урон за пулю (дробовик — за дробину), разброс и вид
	-- ствола — по таблице эксперта по ИИ Таркова (урон пака 3–12 и случайные 7600 у мосинки)
	legacyWeapons = {
		weapon_vj_meft_ak74m = {damage = 38, spread = 0.6, kind = "rifle"},
		weapon_vj_meft_aks74u = {damage = 33, spread = 0.6, kind = "rifle"},
		weapon_vj_meft_reshala_ak101 = {damage = 38, spread = 0.5, kind = "rifle"},
		weapon_vj_meft_m4a1 = {damage = 38, spread = 0.6, kind = "rifle"},
		weapon_vj_meft_scar = {damage = 42, spread = 0.4, kind = "rifle"},
		weapon_vj_meft_asval = {damage = 30, spread = 0.4, kind = "rifle"},
		weapon_vj_meft_sks = {damage = 50, spread = 0.2, kind = "dmr"},
		weapon_vj_meft_mosin = {damage = 75, spread = 0.1, kind = "sniper"},
		weapon_vj_meft_vpo215 = {damage = 67, spread = 0.1, kind = "sniper"},
		weapon_vj_meft_mp5 = {damage = 25, spread = 0.4, kind = "smg"},
		weapon_vj_meft_ump45 = {damage = 27, spread = 0.4, kind = "smg"},
		weapon_vj_meft_kedr = {damage = 22, spread = 0.5, kind = "smg"},
		weapon_vj_meft_pm = {damage = 20, spread = 0.5, kind = "pistol"},
		weapon_vj_meft_mp153 = {damage = 12, spread = 2.5, kind = "shotgun"},
		weapon_vj_meft_mr43 = {damage = 12, spread = 2.5, kind = "shotgun"},
		weapon_vj_meft_toz = {damage = 12, spread = 2.5, kind = "shotgun"},
	},
	-- Дальность огня бойца по виду ствола (а не по роли: та решает, куда идти)
	weaponRange = {pistol = 2000, shotgun = 1200, smg = 3500, rifle = 7000, mg = 7000, dmr = 9000, sniper = 9000, launcher = 5000},
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
	sniper = {dist = {4500, 6500, 8000}, acc = 1, burst = {1, 1}, pause = {1.5, 3}, search = 9999,
		holdAngle = {20, 40}, exposedShots = 1, moveTown = 1000, moveDesert = 2000, angleChange = 15, tooClose = 2000},
	marksman = {dist = {2500, 4500, 7000}, acc = 1, burst = {1, 2}, pause = {0.6, 1.0}, search = 60, relocateHidden = 8,
		relocateShots = {2, 3}, moveTown = 800, moveDesert = 1500, angleChange = 15, tooClose = 1200},
	assault = {dist = {600, 1500, 3000}, acc = 1, burst = {8, 10}, pause = {0.4, 0.8}, pauseFar = {1, 1.5}, search = 10,
		bound = {3, 4}, holdBetween = {4, 6}, boundMax = 800, burstNear = 1600, press = {600, 900}, backoff = 400},
	grenadier = {dist = {1500, 3000, 5000}, acc = 1, burst = {3, 5}, pause = {0.6, 1}, search = 20,
		-- 2026-10-28 (тактик + знаток EFT по записи боя: Big pipe не выстрелил за бой ни разу): бьёт с
		-- места на 1600 (взвод гранаты, своя безопасность) – 6000, цель стоит 0,5 с или идёт ≤ 150 ю/с,
		-- метка за укрытием до 15 с и 400 ю; серия 2 выстрела через 2,5 с, потом шаг вбок 260–520 и пауза
		-- 6–10 с; 8 гранат; ближе 1600 — запасной ствол, дальше 2200 — снова гранатомёт; свой ближе 520 к
		-- точке падения — не стреляет
		rpgMin = 1600, rpgMax = 6000, rpgRadius = 400, rpgAge = 15, rockets = 8, backup = {"smg", "rifle"}, kneel = 0.6, relocate = 800,
		-- Критик: не «лазерная артиллерия» — первый выстрел с разбросом firstSpread° (пристрелка: каждый
		-- следующий по той же метке ×0,5, не точнее 0,6°), цель стоит 0,8 с или идёт ≤ 100 ю/с
		stillTime = 0.8, slowSpeed = 100, shotsPerSpot = 2, seriesGap = 2.5, seriesPause = {6, 10}, sidestep = {260, 520},
		friendSafe = 520, swapCooldown = 3, swapBackExtra = 600, firstSpread = 2.5,
		nadeRange = {400, 1600}, nadeCooldown = {8, 15}, nades = 2, squadNadeCooldown = 6, nadeSafe = 600},
	ebitel = {dist = {200, 600, 1500}, acc = 1, burst = {5, 8}, pause = {0.4, 0.8}, search = 0.1, searchFor = 150,
		stopShot = {0.8, 1.5}, stopShotFar = {2.5, 4}, windowQuiet = 1.5, closeRunSpread = 1.5, cornerPause = {0.5, 1.5}, enterAfterBlast = {0.3, 0.8}, backoffHit = 0.3, backoffTime = {5, 8},
		-- hittingMax: «попадает — стоит и добивает» только ближе этого (дальше давит: Ебитель, а не стрелок на
		-- 3000); ранен — одна очередь (backoffPrep) и рывок (критик: под сбитым прицелом добивали на месте)
		runFireMax = 1000, walkFireMax = 1000, hittingFor = 2.5, hittingMax = 2000, boundAfter = 4, boundTime = 3.5, boundTravel = 800,
		boundUnderFire = {2.5, 500}, nadeOpen = 800, backoffPrep = {0.5, 0.8}, backoffDash = 500,
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
	retreatMinContact = 8, retreatHits = 2, retreatHitWindow = 10, retreatLeg = {3, 5}, retreatLegFire = {2, 3}, retreatCover = {5, 8},
	-- Свой на линии огня (коридор blockedWidth) дольше blockedAfter — шаг вбок sidestep; коридор линий
	-- огня стрелков, который не пересекает рывок «Ебителя», — laneWidth
	blockedWidth = 60, blockedAfter = 1, sidestep = {150, 300}, laneWidth = 150,
	regroup = {15, 30}, reattackShare = 0.6, cycles = 2,
	holdToSearch = {30, 45}, flankChance = 0.7, flankTimeout = {45, 60}, pincerAt = 8,
	fireShiftDist = 600, fireShiftAngle = 10, ambushHits = 2, ambushWindow = 2, ambushFree = {3, 5},
	badSpot = 90, badSpotR = 300,
	-- Смерть босса: окно без приказов, ярость видевших, охрана тела, новый командир
	bossDeadQuiet = {8, 12}, rage = {30, 45}, rageRadius = 1500, guardBody = {120, 180}, guardBodyDist = {800, 2000},
	newLeaderAfter = 10, leaveBelow = 0.4,
	-- Босс и охрана: переназначать места, только если враг или фронт сдвинулись дальше этого; босс,
	-- который видит врага с bossHoldSeen и дальше, стоит и стреляет. Тыловой в бою — от rearMinSquad человек
	reorderMove = 800, bossHoldSeen = 1500, bossCoverTravel = 400, rearMinSquad = 6,
	bossAccMul = 1,            -- точность босса — в его профиле прицела (PR_INF.aim.boss)
}
