-- Пехота, общий слой (sv_infantry.lua, docs/infantry.md): боец на плеермодели, честное зрение
-- (за стеной не видит, замечает не мгновенно, вдали дольше, за спиной нет), слух выстрела с ошибкой,
-- рация, подавление от пуль рядом, разброс очереди, походки, «осмотрено», патруль из бойцов.
-- run_selftest.ps1 -Suite infantry. Площадка — западная взлётка аэродрома (ровная полоса вдоль +Y)
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step, waitFor, check = T.S, T.log, T.step, T.waitFor, T.check

local BOSS = "models/player/eft/bosses/reshala.mdl"

local function Ground(x, y)
	local tr = util.TraceLine({start = Vector(x, y, 2000), endpos = Vector(x, y, -3000), mask = MASK_PLAYERSOLID_BRUSHONLY})
	return tr.HitPos + Vector(0, 0, 4)
end

local function Soldier(pos, yaw, model)
	local n = ents.Create("npc_pr_soldier")
	n:SetModel(model or BOSS)
	n:SetKeyValue("additionalequipment", "weapon_vj_ak47")
	n:SetPos(pos)
	n:SetAngles(Angle(0, yaw or 90, 0))
	PR_Quietly(function() n:Spawn() n:Activate() end)
	return n
end

-- Забыть всё, что боец знает и видит
local function Reset(n)
	local b = n.PR_Brain
	if not b then return end
	b.detect, b.contacts, b.firedBy = {}, {}, {}
	b.state, b.route, b.waitUntil, b.supp = "patrol", nil, nil, 0
	if IsValid(n:GetEnemy()) then n:ResetEnemy() end
	n:SetAngles(Angle(0, 90, 0))
	n:SetIdealYawAndUpdate(90)
end

local function Contact(n, src)
	for _, c in ipairs(n.PR_Brain.contacts) do
		if not src or c.src == src then return c end
	end
end

-- Точное время: каждый тик (waitFor проверяет реже)
hook.Add("Think", "PR_SelfTestInfantry", function()
	if IsValid(S.n1) and S.t0 and not S.tSeen and S.n1:GetEnemy() == S.bot then S.tSeen = CurTime() end
	if IsValid(S.n2) and not S.radioT and S.n2.PR_Brain then
		for _, c in ipairs(S.n2.PR_Brain.contacts) do
			if c.src == "radio" then
				S.radioT = CurTime()
				S.enemyAtRadio = IsValid(S.n2:GetEnemy())
			end
		end
	end
end)

local function Name(e) return IsValid(e) and tostring(e) or "none" end

-- Точка в секторе перед бойцом, закрытая от его глаз стенами карты (все три точки тела), с землёй
local function HiddenSpot(n, minD, maxD)
	local eye = n:EyePos()
	local fwd = n:GetForward()
	for _, d in ipairs({minD, (minD + maxD) / 2, maxD}) do
		for a = -50, 50, 10 do
			local dir = Vector(fwd.x, fwd.y, 0):Angle()
			dir.y = dir.y + a
			local p0 = n:GetPos() + dir:Forward() * d
			local g = util.TraceLine({start = p0 + Vector(0, 0, 200), endpos = p0 - Vector(0, 0, 400), mask = MASK_PLAYERSOLID_BRUSHONLY})
			if g.Hit and not g.StartSolid and g.HitNormal.z > 0.7 then
				local feet = g.HitPos + Vector(0, 0, 4)
				local hull = util.TraceHull({start = feet, endpos = feet, mins = Vector(-16, -16, 0), maxs = Vector(16, 16, 72), mask = MASK_PLAYERSOLID})
				local blocked = true
				for _, z in ipairs({18, 40, 64}) do
					if not util.TraceLine({start = eye, endpos = feet + Vector(0, 0, z), mask = MASK_SOLID_BRUSHONLY}).Hit then blocked = false end
				end
				if blocked and not hull.Hit then return feet end
			end
		end
	end
end

local function Place(bot, pos)
	bot:SetPos(pos)
	bot:SetVelocity(-bot:GetVelocity())
end

step(0, function()
	log("start (infantry)")
	log("navmesh areas loaded: " .. navmesh.GetNavAreaCount())
	-- Поиск пути по навмешу: через город и из города на аэродром — не дольше 50 мс
	if navmesh.IsLoaded() then
		local worst = 0
		for _, pr in ipairs({{Ground(-10000, -4000), Ground(-6500, 2300)}, {Ground(-8000, -1000), Ground(-11500, 1000)}, {Ground(-9000, 0), Ground(-8200, 600)}}) do
			local t0 = SysTime()
			local path = PR_Inf.NavPath(pr[1], pr[2])
			local ms = (SysTime() - t0) * 1000
			worst = math.max(worst, ms)
			log(string.format("navpath %s -> %s: %.1f ms, %s points", tostring(pr[1]), tostring(pr[2]), ms, path and #path or "no path"))
		end
		check("navmesh path search stays under 50 ms", worst < 50, math.Round(worst, 1))
	end
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	RunConsoleCommand("ai_ignoreplayers", "0")
	S.base = Ground(-12450, -2500)
	S.n1 = Soldier(S.base, 90)
	S.bot = player.CreateNextBot("inf_target")
end)

step(1, function()
	local n = S.n1
	check("soldier spawned", IsValid(n) and n:GetClass() == "npc_pr_soldier")
	if not IsValid(n) then return end
	check("soldier has the boss model set before spawn", n:GetModel() == BOSS, n:GetModel())
	check("soldier uses the player animation set", n.AnimModelSet == VJ.ANIM_SET_PLAYER, tostring(n.AnimModelSet))
	check("soldier holds a weapon", IsValid(n:GetActiveWeapon()), tostring(n:GetActiveWeapon()))
	check("soldier is driven by the infantry layer", n.PR_Brain ~= nil and table.HasValue(PR_Inf.Soldiers, n))
	check("VJ does not look for enemies by itself", n.EnemyDetection == false)

	local bot = S.bot
	bot:Spawn()
	bot:SetNWString("PR_fraction", "")
	bot.VJ_NPC_Class = nil
	bot:GodEnable()
	bot:StripWeapons()
	bot:Give("arccw_ur_ak")
	bot:SelectWeapon("arccw_ur_ak")
	-- За стеной: боец в городе, цель — в точке, закрытой домами
	S.town = T.FIXED_BASES[1]
	n:SetPos(S.town)
	Reset(n)
	Place(bot, S.base + Vector(0, -9000, 0))
end)

-- Глаза NPC встают на новое место на следующем тике — точку ищем шагом позже
step(0.5, function()
	local n = S.n1
	Reset(n)
	S.hidden = HiddenSpot(n, 500, 1500)
	log("hidden spot: " .. tostring(S.hidden) .. " from " .. tostring(n:EyePos()))
	if S.hidden then Place(S.bot, S.hidden) end
end)

-- 1. За стеной — не видит
step(3, function()
	local n = S.n1
	local eye = n:EyePos()
	local blocked = 0
	for _, p in ipairs({S.bot:EyePos(), S.bot:WorldSpaceCenter(), S.bot:GetPos() + Vector(0, 0, 18)}) do
		if util.TraceLine({start = eye, endpos = p, mask = MASK_BLOCKLOS, filter = {n, S.bot}}).Hit then blocked = blocked + 1 end
	end
	local d = n.PR_Brain.detect[S.bot]
	local srcs = {}
	for _, c in ipairs(n.PR_Brain.contacts) do srcs[#srcs + 1] = c.src end
	log(string.format("hidden: wall blocks %d of 3 sight lines, detect %s %.2f, contacts [%s], engine enemies undone %d",
		blocked, d and d.state or "-", d and d.meter or 0, table.concat(srcs, ","), n.PR_EngineEnemyCount or 0))
	check("hidden target behind a wall is not seen", not IsValid(n:GetEnemy()) and not Contact(n, "seen"),
		Name(n:GetEnemy()) .. " " .. table.Count(n.PR_Brain.contacts))
	-- Выстрел из-за домов: слышит, но не видит
	S.shotPos = S.hidden
	Reset(n)
	if S.hidden then
		S.bot:SetEyeAngles(Angle(-60, 0, 0))
		S.bot:FireBullets({Num = 1, Src = S.bot:GetShootPos(), Dir = Vector(0, 0, 1), Spread = vector_origin, Tracer = 0, Damage = 0, Attacker = S.bot})
	end
end)

waitFor(3, function() return Contact(S.n1, "heard") ~= nil end, "soldier hears the shot")
step(0.5, function()
	local n = S.n1
	local c = Contact(n, "heard")
	check("soldier hears a shot from behind houses", c ~= nil)
	if c and S.shotPos then
		local err = c.pos:Distance(S.shotPos)
		log(string.format("heard: error %.0f at %.0f, radius %.0f", err, n:GetPos():Distance(S.shotPos), c.r))
		check("heard position is near the shooter (error < 700)", err < 700, math.Round(err))
		check("heard contact has an error radius", c.r >= 60, math.Round(c.r))
	end
	check("heard but hidden shooter is not an enemy target", not IsValid(n:GetEnemy()), Name(n:GetEnemy()))
	check("soldier turns to hold the direction", n.PR_Brain.state == "hold", n.PR_Brain.state)
	-- Дальше — снова взлётка
	n:SetPos(S.base)
	Reset(n)
	Place(S.bot, S.base + Vector(0, 800, 0))
	S.t0, S.tSeen = CurTime(), nil
end)

-- 2. В открытую на 800 ю спереди: заметил, но не мгновенно
waitFor(5, function() return S.n1:GetEnemy() == S.bot end, "soldier notices the target at 800")
step(0, function()
	S.near = (S.tSeen or CurTime()) - S.t0
	log(string.format("detect at 800: %.2f s", S.near))
	check("target at 800 in front is noticed", S.n1:GetEnemy() == S.bot, S.near)
	check("noticing is not instant (0.3 s+)", S.near >= 0.3, S.near)
	Reset(S.n1)
	Place(S.bot, S.base + Vector(0, 4000, 0))
	S.t0, S.tSeen = CurTime(), nil
end)

-- 3. На 4000 ю — дольше
waitFor(8, function() return S.n1:GetEnemy() == S.bot end, "soldier notices the target at 4000")
step(0, function()
	S.far = (S.tSeen or CurTime()) - S.t0
	log(string.format("detect at 4000: %.2f s", S.far))
	check("target at 4000 is noticed", S.n1:GetEnemy() == S.bot, S.far)
	check("far target takes longer to notice than a near one", S.far > S.near, string.format("%.2f vs %.2f", S.far, S.near))
	Reset(S.n1)
	Place(S.bot, S.base + Vector(0, -800, 0))
end)

-- 4. За спиной — не видит
step(3, function()
	check("target right behind is not seen", not IsValid(S.n1:GetEnemy()), Name(S.n1:GetEnemy()))
	S.t0 = nil
	Reset(S.n1)
end)

step(0, function()
	local n = S.n1
	-- 6. Рация: второй боец того же патруля в 2500 ю, без прямой видимости
	Reset(n)
	S.n2 = Soldier(S.base + Vector(0, -2500, 0), 270)
	S.patrol = {members = {n, S.n2}}
	n.PR_Patrol, S.n2.PR_Patrol = S.patrol, S.patrol
	Place(S.bot, S.base + Vector(0, 900, 0))
end)

waitFor(4, function() return S.n1:GetEnemy() == S.bot end, "soldier 1 sees the target")
waitFor(6, function() return IsValid(S.n2) and Contact(S.n2, "radio") ~= nil end, "radio reaches soldier 2")
step(0, function()
	local c = IsValid(S.n2) and Contact(S.n2, "radio")
	check("radio passes the contact to the squad", c ~= nil)
	if c then check("radio contact is not exact (radius 150+)", c.r >= 150, math.Round(c.r)) end
	check("soldier 2 learns by radio before seeing the target itself", S.radioT ~= nil and S.enemyAtRadio == false, tostring(S.enemyAtRadio))

	-- 7. Подавление: пуля врага мимо бойца в 80 ю
	Reset(S.n1)
	local from = S.base + Vector(-600, 600, 60)
	local past = S.n1:WorldSpaceCenter() + Vector(80, 0, 0)
	Place(S.bot, from - Vector(0, 0, 60))
	S.bot:FireBullets({Num = 1, Src = from, Dir = (past - from):GetNormalized(), Spread = vector_origin, Tracer = 0, Damage = 0, Attacker = S.bot})
end)

step(0.3, function()
	local b = S.n1.PR_Brain
	check("near miss suppresses the soldier", b.supp >= 0.1, b.supp)
	check("near miss gives a direction to the shooter", #S.n1.PR_Brain.contacts > 0, #S.n1.PR_Brain.contacts)

	-- 8. Разброс очереди
	Reset(S.n1)
	b.lastShot = 0
	local first = PR_Inf.SpreadMul(S.n1)
	local second = PR_Inf.SpreadMul(S.n1)
	local third = PR_Inf.SpreadMul(S.n1)
	log(string.format("spread mul: %.2f %.2f %.2f", first, second, third))
	check("first shot is the most accurate, the burst spreads", first < second and second < third, string.format("%.2f %.2f %.2f", first, second, third))

	-- 9. Походки — на свежем бойце (до первого ещё долетают отложенные звуки выстрелов)
	Place(S.bot, S.base + Vector(0, -9000, 0))
	S.n3 = Soldier(S.base + Vector(600, 0, 0), 90)
end)

step(1, function()
	S.n1, S.old1 = S.n3, S.n1
	S.p0 = S.n1:GetPos()
	S.n1:PR_Move(S.base + Vector(600, 400, 0), "crouch")
end)

step(1, function()
	local n = S.n1
	local act = n:GetMovementActivity()
	local a1, a2 = n.BaseClass.TranslateActivity(n, ACT_WALK_CROUCH), n.BaseClass.TranslateActivity(n, ACT_WALK_CROUCH_AIM)
	for _, a in ipairs({a1, a2, n:TranslateActivity(ACT_WALK)}) do
		local seq = n:SelectWeightedSequence(a)
		log(string.format("crouch diag: act %d seq %d (%s) ground speed %.1f", a, seq, seq >= 0 and n:GetSequenceName(seq) or "-", seq >= 0 and n:GetSequenceGroundSpeed(seq) or 0))
	end
	log(string.format("crouch diag: gait %s moving %s schedule %s ideal act %d", tostring(n.PR_Gait), tostring(n:IsMoving()),
		tostring(n.CurrentSchedule and n.CurrentSchedule.Name), n:GetIdealActivity()))
	check("crouch walk moves the soldier", n:GetPos():Distance(S.p0) > 15, math.Round(n:GetPos():Distance(S.p0)))
	local seqName = n:GetSequenceName(n:GetSequence()) or ""
	check("crouch walk uses the crouch animation", string.find(seqName, "cwalk", 1, true) ~= nil, seqName)
	S.p0 = n:GetPos()
	n:PR_Move(S.base + Vector(600, -400, 0), "run")
end)

-- 1,5 с: бег в обратную сторону — сперва разворот на 180°
step(1.5, function()
	local n = S.n1
	local act = n:GetMovementActivity()
	log(string.format("run diag: gait %s moving %s schedule %s move act %d ideal act %d goal %s route %s state %s", tostring(n.PR_Gait), tostring(n:IsMoving()),
		tostring(n.CurrentSchedule and n.CurrentSchedule.Name), act, n:GetIdealActivity(), tostring(n.PR_MoveGoal), tostring(n.PR_Brain.route ~= nil), tostring(n.PR_Brain.state)))
	check("run moves the soldier", n:GetPos():Distance(S.p0) > 90, math.Round(n:GetPos():Distance(S.p0)))
	local runSeq = n:GetSequenceName(n:GetSequence()) or ""
	check("run uses a run animation", string.find(runSeq, "run", 1, true) ~= nil, runSeq)
	n:PR_Stop()

	-- 10. «Осмотрено»: метка в открытом месте в 800 ю, никого нет — снимается
	Reset(n)
	PR_Inf.Learn(n, n:GetPos() + Vector(0, 800, 0), 200, "heard")
end)

waitFor(4, function() return #S.n1.PR_Brain.contacts == 0 end, "empty spot is checked")
step(0, function()
	check("a contact in plain sight with nobody there is checked and dropped", #S.n1.PR_Brain.contacts == 0, #S.n1.PR_Brain.contacts)

	-- 11. Патруль из бойцов: роль и модели из варианта
	for _, n in ipairs({S.n1, S.n2, S.old1}) do if IsValid(n) then n:Remove() end end
	local key = PR_Patrol.SaveType("selftest_inf", {
		name = "Тест пехоты", weight = 0, chance = 1, maxAlive = 1, formation = "wedge",
		leader = {name = "Командир", class = {"npc_pr_soldier"}, role = "marksman", models = {BOSS}, weapons = {"weapon_vj_ak47"}, health = 300, reward = {money = 100, exp = 1}},
		followers = {{name = "Бойцы", class = {"npc_pr_soldier"}, role = "assault", count = 2,
			models = {"models/player/eft/bosses/killa.mdl", "models/eft/bosses/tagilla.mdl"}, weapons = {"weapon_vj_ak47"}, health = 200, reward = {money = 50, exp = 1}}}
	})
	S.typeKey = key
	local spot = PR_Patrol.AddSpot(S.base + Vector(0, 200, 0), "Тест-пехота")
	S.spot = spot
	S.patrol2 = key and PR_Patrol.Spawn(key, spot)
end)

step(2, function()
	local p = S.patrol2
	check("patrol of soldiers spawns", p ~= nil and #p.members == 3, p and #p.members)
	if p then
		local okModels, okRoles = true, true
		for _, m in ipairs(p.members) do
			if m.PR_PatrolRole == "leader" then
				okModels = okModels and m:GetModel() == BOSS
				okRoles = okRoles and m.PR_Role == "marksman"
			else
				okModels = okModels and (m:GetModel() == "models/player/eft/bosses/killa.mdl" or m:GetModel() == "models/eft/bosses/tagilla.mdl")
				okRoles = okRoles and m.PR_Role == "assault"
			end
		end
		check("patrol soldiers get models from the patrol type", okModels)
		check("patrol soldiers get roles from the patrol type", okRoles)
	end
	PR_Patrol.ClearAll()
	if S.typeKey then PR_Patrol.DeleteType(S.typeKey) end
	if S.spot then PR_Patrol.RemoveSpot(S.spot) end
	if IsValid(S.bot) then S.bot:Kick("selftest") end
	hook.Remove("Think", "PR_SelfTestInfantry")
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
