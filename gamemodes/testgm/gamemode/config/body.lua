-- Тарковское здоровье по частям тела (как в EFT): числа общего ядра (gamemode/sv_body.lua) — для бойцов
-- патрулей (npc_pr_soldier) и для игрока (VIVO, gamemode/sv_vivo_compat.lua). Правила — docs/body.md.
-- Игрок (2026-10-28): «допили vivo, чтобы как в Таркове работал» — и на ботов то же самое.
-- Источники: globals.json и файлы ботов EFT 0.16.9 (база SPT), вики и гайды EFT 1.x — docs/body.md

PR_BODY = {
	-- HP частей ЧВК (игрок и боец без своей таблицы): всего 440
	parts = {Head = 35, Thorax = 85, Stomach = 70, LeftArm = 60, RightArm = 60, LeftLeg = 65, RightLeg = 65},
	-- Голова или грудь в ноль от урона — смерть. В ноль от кровотечения — не сразу: убивает следующий
	-- урон или ноль всего здоровья (так в EFT: кровотечение снимает HP со всех частей, голова 35 уходит в
	-- ноль первой — после этого боец «стеклянный»; bleedVitalFloor 1 — голова и грудь от кровотечения не
	-- ниже 1)
	vital = {Head = true, Thorax = true},
	bleedVitalFloor = 0,
	-- Урон по «чёрной» (уничтоженной) части: × множитель части (HandsOverdamage 0,7, LegsOverdamage 1,
	-- StomachOverdamage 1,5) × spreadReceive (OverDamageReceivedMultiplier 0,7) поровну между остальными
	-- нечёрными частями, в том числе головой и грудью: рука ×0,49, нога ×0,7, живот ×1,05. Излишек удара,
	-- которым часть ушла в ноль, — по тому же правилу
	spread = {Stomach = 1.5, LeftArm = 0.7, RightArm = 0.7, LeftLeg = 1, RightLeg = 1},
	spreadReceive = 0.7,
	spreadOverflow = true,

	-- Не пуля: взрыв — × explosionMul на каждую из 7 частей (осколки бьют всё тело, как у VIVO);
	-- падение — × fallMul в каждую ногу; огонь, удар и прочее — × otherMul на каждую часть
	explosionMul = 2.5 / 7, fallMul = 1 / 1.2, otherMul = 2 / 7,

	-- Кровотечения: тик раз в period с снимает tick HP с КАЖДОЙ живой части — 0,8 и 0,9 по файлам EFT
	-- 0.16.9 и справке BSG (в гайдах 1.x — 1,36 и 1,53, ровно ×1,7: похоже на урон при обезвоживании).
	-- Шанс от пули по части (кроме убившего попадания; и по уже чёрной): x = урон / максимум HP части,
	-- шанс = k·x + b, если x ≥ from (Probability из globals.json; вход функции — наша оценка). Осколки
	-- взрыва — так же по доле урона на часть. Тяжёлое — первым
	bleed = {
		light = {tick = 0.8, period = 6, k = 0.5, b = -0.125, from = 0.35},
		heavy = {tick = 0.9, period = 4, k = 0.45, b = -0.17, from = 0.5},
	},
	-- Перелом (только руки и ноги): шанс = k·√x + b, если x ≥ from (FractureCausedByBulletHit); от
	-- падения — k·x + b по урону в ногу (FractureCausedByFalling)
	fracture = {k = 0.3, b = 0.05, from = 0.3},
	fallFracture = {k = 1, b = 0.38, from = 0.2},

	-- Бойцы патрулей. Тело — по модели (таблицы ботов EFT ниже); модель не из таблицы — как у ЧВК, а
	-- здоровье патруля больше 440 — части ЧВК пропорционально (главный 600 — голова 48, грудь 116)
	botStandard = 440,
	-- Ранения бойца: нога чёрная или сломана — не бегает (с обезболом — бегает); рука чёрная — разброс
	-- × armBlack, сломана — × armFracture (две — перемножаются); боль (перелом или чёрная часть, без
	-- обезбола) — × pain
	armBlack = 1.6, armFracture = 1.3, pain = 1.15,

	-- Таблицы ботов EFT по модели: голова, грудь, живот, рука (каждая), нога (каждая). pk — постоянный
	-- обезбол (Boss.EFFECT_PAINKILLER: боль не мешает, бегает со сломанной ногой); heal — лечится, когда
	-- часть ниже этой доли максимума, enemyDist — враг дальше стольких ю (PART_PERCENT_TO_HEAL,
	-- DIST_TO_ENEMY_YO_CAN_HEAL: 0,65 и 30 м, у Санитара и Knight 0,85 и 130 м). Первое совпадение подстроки
	-- пути модели (нижний регистр); дикие — один из трёх пресетов EFT наугад
	bots = {
		-- armor: самая вероятная броня бота в EFT (файлы ботов SPT, вставки 0.14+): {класс, прочность} —
		-- head (шлем или маска: макушка, затылок, уши), face (забрало), chest (пластины или мягкая на
		-- груди), belly (мягкая на животе); headP / bodyP — шанс, что шлем / броня тела вообще есть.
		-- Без брони в EFT: Решала, Санитар, Штурман, Кабан, Партизан, Зрячий (у Коллонтая — только шлем)
		{"bosses/reshala", {62, 145, 125, 100, 110}, stock = "boss"},
		{"bosses/killa", {70, 210, 170, 100, 120}, pk = true, stock = "boss",
			armor = {head = {4, 36}, face = {6, 50}, chest = {5, 50}, belly = {3, 48}}},
		{"glukhar_assault", {45, 150, 125, 100, 120}, armor = {head = {3, 15}, chest = {4, 50}, belly = {2, 34}, headP = 0.73, bodyP = 0.85}},
		{"glukhar_scout", {40, 140, 100, 70, 80}, armor = {head = {3, 27}, chest = {4, 50}, belly = {2, 34}, headP = 0.98, bodyP = 0.98}},
		{"glukhar_security", {41, 180, 125, 115, 115}, armor = {head = {4, 21}, face = {3, 50}, chest = {5, 60}, belly = {2, 40}, headP = 0.8, bodyP = 0.74}},
		{"bosses/glukhar", {70, 220, 140, 145, 145}, pk = true, stock = "boss", armor = {head = {4, 24}, chest = {4, 45}, headP = 0.62}},
		{"bosses/sanitar", {70, 360, 140, 120, 230}, pk = true, heal = 0.85, enemyDist = 6760, stock = "medic"},
		{"bosses/shturman", {62, 180, 150, 100, 110}, pk = true, stock = "boss"},
		{"bosses/tagilla", {100, 320, 260, 130, 140}, pk = true, stock = "boss", armor = {head = {5, 40, cover = 0.9}, chest = {6, 65}}},
		{"bosses/kaban", {85, 355, 260, 150, 150}, pk = true, stock = "boss"},
		{"bosses/kollontai", {65, 300, 150, 150, 120}, pk = true, stock = "boss", armor = {head = {2, 39}, face = {1, 39}}},
		{"bosses/partisan", {80, 220, 190, 110, 120}, pk = true, stock = "boss"},
		{"zryachii", {175, 450, 270, 190, 190}, stock = "boss"},
		{"knight", {80, 220, 220, 150, 150}, pk = true, heal = 0.85, enemyDist = 6760, stock = "boss",
			armor = {head = {1, 55, cover = 0.5}, chest = {5, 55}}},
		{"big_pipe", {70, 220, 200, 110, 100}, pk = true, stock = "boss", armor = {chest = {5, 45}}},
		{"birdeye", {70, 175, 150, 100, 100}, pk = true, stock = "boss", armor = {chest = {4, 50}, belly = {3, 25}, bodyP = 0.59}},
		{"scav", {{30, 80, 70, 60, 60}, {30, 85, 70, 60, 65}, {30, 100, 100, 70, 80}}, stock = "scav",
			armor = {head = {1, 35}, chest = {2, 32}, belly = {2, 32}, headP = 0.11, bodyP = 0.2}},
	},
	-- Броня бойцов: какую долю попаданий в часть закрывает кусок (шлем — макушка, затылок, уши; остальное
	-- головы — забрало; плиты не закрывают бока груди). Пуля: эффективная броня A = (121 − 5000 / (45 +
	-- 2·прочность%)) · класс · 0,1 (полная — ≈ 10 × класс); пробитие P против A (формулы TarkovGunsmith:
	-- P ≥ A — шанс ≈ 0,9–1; A − 15 < P < A — 0,4·(A − P − 15)² / 100; ниже — не пробивает). Пробила —
	-- урон × clamp(P / (A + 12), 0,6, 1), не пробила — блант урон × blunt × clamp(1 − 0,03·(A − P), 0,2, 1),
	-- без кровотечения и перелома. Прочность — минус P × durLoss за попадание. Пробитие P — по калибру
	-- ствола (Trivia_Calibre / патрон ArcCW, типовой патрон EFT), иначе по виду ствола; техника — penVehicle
	armor = {
		cover = {head = 0.65, chest = 0.85, belly = 0.8},
		blunt = 0.2, durLoss = 0.25,
		pen = {
			{"5.45", 28}, {"5.56", 31}, {"7.62x39", 35}, {"7.62x51", 41}, {".308", 41}, {"7.62x54", 42},
			{"9x39", 40}, {".338", 60}, {"12.7", 50}, {".50", 70}, {"5.7", 35}, {"4.6", 40}, {"7.62x25", 18},
			{"9x18", 12}, {"9x19", 20}, {"9mm", 20}, {".45", 19}, {".357", 25}, {".44", 25}, {".300", 30},
			{"12 gauge", 3}, {"12-gauge", 3}, {"12ga", 3}, {"buckshot", 3}, {"20 gauge", 3},
		},
		penKind = {pistol = 15, smg = 22, rifle = 30, mg = 40, dmr = 42, sniper = 55, shotgun = 3},
		penDefault = 30, penVehicle = 60,
	},
	-- Аптечки бойца по виду (stock в таблице выше; без него — follower): бинт (лёгкое), жгут (тяжёлое),
	-- шина, хирургия — штук; medHP — ресурс аптечки (AI-2 100, Salewa 400; у Санитара — ×3+)
	stocks = {
		scav = {light = 1, heavy = 0, fracture = 0, surgery = 0, medHP = 100},
		follower = {light = 2, heavy = 1, fracture = 1, surgery = 0, medHP = 300},
		boss = {light = 3, heavy = 2, fracture = 1, surgery = 1, medHP = 400},
		medic = {light = 9, heavy = 6, fracture = 3, surgery = 3, medHP = 1800},
	},

	-- Лечение бойца, когда безопасно: врага не видно safeSeen с, по нему не попадали safeHit с
	-- (HEAL_DELAY_SEC 5), подавление ниже safeSupp, свежая метка врага (моложе contactAge с) дальше
	-- enemyDist (30 м). Что лечит первым: тяжёлое кровотечение, лёгкое, перелом, чёрная часть (хирургия —
	-- до hp), аптечка — когда часть ниже heal × максимума (лечит share всего максимума). Время (с) и запас
	-- Не посреди маршрута, отхода, выстрела с колена. Виден с метки — сначала в укрытие (не дальше
	-- coverTravel, хромой — coverTravelLimp, на дорогу coverTime с); укрытия нет — только перевязка и только
	-- по метке старше contactAge. Бросает: увидел врага, попали, подавление выше dropSupp, метка обновилась
	-- ближе enemyDist; после — dropHold с без огня (убирает аптечку) и прицел заново. Пока лечится, замечает
	-- врага × detectMul медленнее и «держал угол» не считается. Хирургия (до hp; кровотечение не снимает) —
	-- в укрытии и по метке старше safeAge с или дальше enemyDist ю. Аптечка — за раз худшую часть до perUse
	-- HP из ресурса medHP. Звук аптечки слышен вокруг (как в EFT — окно для атаки)
	treat = {
		safeSeen = 4, safeHit = 5, safeSupp = 0.3, contactAge = 10, enemyDist = 1560, heal = 0.65,
		coverTravel = 600, coverTravelLimp = 300, coverTime = 8,
		dropSupp = 0.5, dropHold = {0.6, 1.0}, detectMul = 1.5,
		sound = "items/smallmedkit1.wav", soundLevel = 70,
		heavy = {time = {3, 4}},
		light = {time = {2.5, 3.5}},
		fracture = {time = {4, 5}},
		surgery = {time = {16, 20}, hp = 1, safeAge = 30, enemyDist = 3120},
		medkit = {time = {3, 4}, perUse = 85},
	},

	-- Хромота игрока (VIVO) — sh_vivo_limp.lua: PR_VIVO_LEG_SPEED (общий файл: видит и клиент)
}
