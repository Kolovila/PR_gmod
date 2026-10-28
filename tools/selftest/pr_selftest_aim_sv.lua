-- Меткость пехоты: боец каждого профиля прицела стреляет по стоящему бессмертному боту на 25/50/75/100 м.
-- Пишет строки AIM (выстрелы, попадания, доля, время до первого выстрела и попадания) — по ним
-- подгоняются числа PR_INF.aim; проверки — нижняя граница доли попаданий по профилям.
-- run_selftest.ps1 -Suite aim
if engine.ActiveGamemode() ~= "testgm" then return end

local T = include("pr_selftest_lib.lua")
local S, log, step, check = T.S, T.log, T.step, T.check

local SCENE = 13   -- секунд на сцену (9 с давали разброс доли ±20 п. п. между прогонами)
local STEADY = 3   -- «установившаяся» доля попаданий — по выстрелам после этого (сведение уже прошло)
local EARLY = 1    -- «с ходу» — доля попаданий за столько секунд от первого выстрела

local function Ground(x, y)
	local tr = util.TraceLine({start = Vector(x, y, 2000), endpos = Vector(x, y, -3000), mask = MASK_PLAYERSOLID_BRUSHONLY})
	return tr.HitPos + Vector(0, 0, 4)
end

local function Pick(kinds)
	return PR_NPCW.ForKind(kinds)[1]
end

-- Выстрелы и попадания по цели (пуля, чья трасса попала в бота)
hook.Add("EntityFireBullets", "PR_SelfTestAim", function(ent, data)
	if not (IsValid(ent) and ent == S.n) then return end
	local sc = S.cur
	if not sc then return end
	-- Очередь в голову (PR_Inf.HeadAim) — мимо «установившейся» доли: она про сведение по корпусу, а
	-- серии в голову (бросок раз в 0,6 с) при паре десятков выстрелов за сцену дают шум ±20 п. п.
	local head = ent.PR_Brain and ent.PR_Brain.headAim == true
	local late = CurTime() - sc.t0 >= STEADY
	local steady = late and not head
	if ent.PR_AimShotFrame ~= FrameNumber() then
		ent.PR_AimShotFrame = FrameNumber()
		sc.shots = sc.shots + 1
		if steady then sc.shotsS = sc.shotsS + 1 end
		if late then sc.shotsL = sc.shotsL + 1 end
		sc.first = sc.first or (CurTime() - sc.t0)
		if CurTime() - sc.t0 - sc.first <= EARLY then sc.shotsE = sc.shotsE + 1 end
	end
	local orig = data.Callback
	data.Callback = function(att, tr, dmg)
		-- Куда ушла пуля: смещение луча от центра цели в её плоскости (вверх/вниз, вбок)
		if IsValid(S.bot) then
			local T0 = S.bot:WorldSpaceCenter()
			local t = (T0 - tr.StartPos):Dot(tr.Normal)
			local off = tr.StartPos + tr.Normal * t - T0
			local right = tr.Normal:Cross(Vector(0, 0, 1)):GetNormalized()
			sc.offs[#sc.offs + 1] = {z = off.z, x = off:Dot(right), hit = tr.Entity == S.bot, what = IsValid(tr.Entity) and tr.Entity:GetClass() or (tr.HitWorld and "world" or "none")}
		end
		if tr.Entity == S.bot then
			sc.hits = sc.hits + 1 / math.max(data.Num or 1, 1)
			if steady then sc.hitsS = sc.hitsS + 1 / math.max(data.Num or 1, 1) end
			if late then sc.hitsL = sc.hitsL + 1 / math.max(data.Num or 1, 1) end
			if sc.first and CurTime() - sc.t0 - sc.first <= EARLY then sc.hitsE = sc.hitsE + 1 / math.max(data.Num or 1, 1) end
			sc.firstHit = sc.firstHit or (CurTime() - sc.t0)
			if tr.HitGroup == HITGROUP_HEAD then sc.head = sc.head + 1 end
			-- Время до смерти игрока (оценка): голова (35 HP у VIVO) — сразу, иначе урон набрал 440
			local w = IsValid(S.n) and S.n:GetActiveWeapon()
			sc.dmg = sc.dmg + ((IsValid(w) and w.Primary and tonumber(w.Primary.Damage)) or 30) / math.max(data.Num or 1, 1)
			if not sc.ttk and (tr.HitGroup == HITGROUP_HEAD or sc.dmg >= 440) then sc.ttk = CurTime() - sc.t0 end
		end
		if orig then return orig(att, tr, dmg) end
	end
	return true
end)

local function Look(ang) S.botAng = ang if IsValid(S.bot) then S.bot:SetEyeAngles(ang) end end
hook.Add("StartCommand", "PR_SelfTestAim", function(ply, cmd)
	if ply == S.bot and S.botAng then
		cmd:ClearMovement()
		cmd:SetViewAngles(S.botAng)
		-- Идущая цель: вбок туда-обратно (2 с в каждую сторону)
		if S.botWalk then cmd:SetSideMove(S.botWalk * ((math.floor(CurTime() / 2) % 2 == 0) and 1 or -1)) end
	end
end)

-- Цели (игрок: «точность ставь хорошую прям», 2026-10-28) — доля попаданий по стоящему на 50 / 75 м
-- (время до первого выстрела включает ~0,3 с на появление бойца)
local PROFILES = {
	{name = "regular", profile = "regular", weapon = "weapon_vj_arccw_ur_ak", goal = {0.65, 0.35}},
	{name = "guard", profile = "guard", weapon = "weapon_vj_arccw_ur_ak", goal = {0.8, 0.55}},
	{name = "knight", profile = "knight", weapon = "weapon_vj_arccw_ur_ak", goal = {0.9, 0.7}},
	{name = "boss", profile = "boss", weapon = "weapon_vj_arccw_ur_ak", goal = {0.9, 0.7}},
	{name = "marksman", profile = "marksman", kind = "dmr", goal = {0.95, 0.85}},
	{name = "sniper", profile = "sniper", kind = "sniper", goal = {0.9, 0.9}},   -- ~6 выстрелов за сцену: порог 80% — один промах можно
}
local DISTS = {1300, 2600, 3900, 5200}   -- 25 / 50 / 75 / 100 м
S.results = {}

step(0, function()
	log("start (aim)")
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	S.base = Ground(-12450, -2500)
	S.bot = player.CreateNextBot("aim_target")
end)

step(1, function()
	local bot = S.bot
	bot:Spawn()
	bot:SetNWString("PR_fraction", "")
	bot.VJ_NPC_Class = nil
	bot:GodEnable()
	bot:StripWeapons()
end)

-- Сцена: боец профиля P на дистанции d; opts.walk — цель идёт вбок с этой скоростью, opts.flicker —
-- цель видна 1,5 с / скрыта 1 с по кругу; opts.known — боец до появления знает, где цель (метка по
-- рации), иначе замечает сам; opts.key — имя результата
local function Scene(P, d, opts)
	opts = opts or {}
	step(1, function()
		if IsValid(S.n) then S.n:Remove() end
		local weapon = P.weapon or Pick({P.kind})
		local n = ents.Create("npc_pr_soldier")
		n:SetModel("models/player/eft/followers/glukhar/glukhar_scout.mdl")
		n:SetKeyValue("additionalequipment", weapon)
		n:SetPos(S.base)
		n:SetAngles(Angle(0, 90, 0))
		PR_Quietly(function() n:Spawn() n:Activate() end)
		n.PR_Role = ""
		S.n = n
		if opts.known and n.PR_Brain then PR_Inf.Learn(n, S.base + Vector(0, d, 36), 100, "radio", S.bot) end
		S.bot:SetPos(S.base + Vector(0, d, 0))
		S.bot:RemoveFlags(FL_NOTARGET)
		Look(Angle(0, -90, 0))
		S.botWalk = opts.walk
		if opts.walk then S.bot:SetWalkSpeed(opts.walk) S.bot:SetRunSpeed(opts.walk) S.bot:SetMaxSpeed(opts.walk) end
		S.cur = {name = opts.key or P.name, d = d, shots = 0, hits = 0, shotsS = 0, hitsS = 0, shotsE = 0, hitsE = 0, shotsL = 0, hitsL = 0, head = 0, dmg = 0, t0 = CurTime(), weapon = weapon, offs = {}}
		S.aimFrom = nil
		if opts.flicker then
			local t0 = CurTime()
			timer.Create("PR_SelfTestAimFlicker", 0.1, 0, function()
				if not IsValid(S.bot) then return end
				if (CurTime() - t0) % 2.5 < 1.5 then S.bot:RemoveFlags(FL_NOTARGET) else S.bot:AddFlags(FL_NOTARGET) end
			end)
		end
		-- Профиль прицела — как у бойца этого профиля; стоит на месте
		timer.Simple(0.3, function()
			local b = IsValid(n) and n.PR_Brain
			if b then b.aimProfile, b.accMul = P.profile, 1 end
		end)
	end)
	step(SCENE, function()
		timer.Remove("PR_SelfTestAimFlicker")
		S.botWalk = nil
		if IsValid(S.bot) then S.bot:RemoveFlags(FL_NOTARGET) end
		local sc, n = S.cur, S.n
		local b = IsValid(n) and n.PR_Brain or {}
		local moved = IsValid(n) and n:GetPos():Distance(S.base) or -1
		sc.pct = sc.shots > 0 and sc.hits / sc.shots or 0
		-- Мало выстрелов по корпусу (снайпер: 5 за сцену, половина в голову) — по всем после STEADY
		if sc.shotsS >= 5 then sc.steady = sc.hitsS / sc.shotsS else sc.steady = sc.shotsL > 0 and sc.hitsL / sc.shotsL or 0 end
		sc.early = sc.shotsE > 0 and sc.hitsE / sc.shotsE or 0
		log(string.format("AIM %-8s d=%d shots=%d hits=%.0f pct=%.0f%% steady=%.0f%% early=%.0f%% head=%d first=%s firstHit=%s ttk=%s moved=%.0f aimT=%.1f weapon=%s",
			sc.name, sc.d, sc.shots, sc.hits, sc.pct * 100, sc.steady * 100, sc.early * 100, sc.head, sc.first and string.format("%.1f", sc.first) or "-",
			sc.firstHit and string.format("%.1f", sc.firstHit) or "-", sc.ttk and string.format("%.1f", sc.ttk) or "-", moved, b.aimT or 0, sc.weapon))
		-- Промахи: среднее смещение (перекос прицела) и разброс по высоте и вбок, что задело вместо цели
		local n, mz, mx, az, ax, what = 0, 0, 0, 0, 0, {}
		for _, o in ipairs(sc.offs) do
			n = n + 1
			mz, mx, az, ax = mz + o.z, mx + o.x, az + math.abs(o.z), ax + math.abs(o.x)
			if not o.hit then what[o.what] = (what[o.what] or 0) + 1 end
		end
		if n > 0 then
			local w = {}
			for k, v in pairs(what) do w[#w + 1] = k .. "=" .. v end
			log(string.format("AIMOFF %-8s d=%d bullets=%d meanZ=%.0f meanX=%.0f absZ=%.0f absX=%.0f missHit: %s", sc.name, sc.d, n, mz / n, mx / n, az / n, ax / n, table.concat(w, " ")))
		end
		S.results[sc.name .. sc.d] = sc
		S.cur = nil
	end)
end

T.section("grid")
for _, P in ipairs(PROFILES) do
	for _, d in ipairs(DISTS) do Scene(P, d) end
end
-- Быстрый разбор: Knight и обычный на 50 и 75 м (run_selftest.ps1 -Suite aimdiag)
T.section("diag")
for _, i in ipairs({1, 3}) do
	for _, d in ipairs({2600, 3900}) do Scene(PROFILES[i], d) end
end
-- Идущая цель (130 ю/с) и мигающая видимость — у Knight и обычного на 50 м
T.section("extra")
Scene(PROFILES[3], 2600, {walk = 130, key = "knightWalk"})
Scene(PROFILES[1], 2600, {walk = 130, key = "regularWalk"})
Scene(PROFILES[3], 2600, {flicker = true, key = "knightFlicker"})
-- Knight знал, где цель (метка по рации), — против «сам заметил» (сетка выше)
Scene(PROFILES[3], 2600, {known = true, key = "knightKnown"})

T.section("grid")
step(1, function()
	if IsValid(S.n) then S.n:Remove() end
	local R = S.results
	-- Цель с запасом 10 п. п. (тест — 9 с одной сцены, шум): установившаяся доля на 50 и 75 м
	for _, P in ipairs(PROFILES) do
		for i, d in ipairs({2600, 3900}) do
			local r = R[P.name .. d]
			check(string.format("%s hits %d%%+ at %d m", P.name, math.Round((P.goal[i] - 0.1) * 100), d == 2600 and 50 or 75),
				r and r.steady >= P.goal[i] - 0.1, r and math.Round(r.steady * 100))
		end
	end
	-- Игрок (2026-10-28): «слишком круто, чуть уменьшим точность и реакцию, когда бот сам увидел игрока» —
	-- сам заметивший стреляет не мгновенно и с ходу мажет чаще; знавший, где враг, — быстрее и точнее
	local r = R.knight2600
	check("knight fires within 1.7 s at 50 m", r and r.first and r.first <= 1.7, r and r.first)
	check("self-spotted knight: early hits 65% or less at 50 m", r and r.shotsE > 0 and r.early <= 0.65, r and math.Round(r.early * 100))
	local k = R.knightKnown2600
	check("knight that knew where the target is fires sooner", k and r and k.first and r.first and k.first < r.first, k and r and string.format("%s / %s", tostring(k.first), tostring(r.first)))
	check("knight that knew where the target is hits more early on (+10 pp)", k and r and k.early >= r.early + 0.1, k and r and string.format("%.0f / %.0f", k.early * 100, r.early * 100))
	local w, f = R.knightWalk2600, R.knightFlicker2600
	if not w then return end
	check("knight hits a walking target 25%+ at 50 m", w and w.pct >= 0.25, w and math.Round(w.pct * 100))
	-- Мигание видимости не сбрасывает сведение: установившаяся доля не ниже 70% от непрерывной (первые
	-- секунды не в счёт — сам заметивший сводит позже, а при мигании ещё и с перерывами)
	check("knight keeps aim through visibility flicker (70%+ of steady)", f and r and f.steady >= 0.7 * r.steady, f and r and string.format("%.0f / %.0f", f.steady * 100, r.steady * 100))
	r = R.regular2600
	check("regular fires within 1.8 s at 50 m", r and r.first and r.first <= 1.8, r and r.first)
	if IsValid(S.bot) then S.bot:Kick("selftest") end
	hook.Remove("EntityFireBullets", "PR_SelfTestAim")
	hook.Remove("StartCommand", "PR_SelfTestAim")
	timer.Remove("PR_SelfTestAimFlicker")
end)

T.section("common")
step(1, function()
	if IsValid(S.bot) then S.bot:Kick("selftest") end
	hook.Remove("EntityFireBullets", "PR_SelfTestAim")
	hook.Remove("StartCommand", "PR_SelfTestAim")
	timer.Remove("PR_SelfTestAimFlicker")
end)
step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
