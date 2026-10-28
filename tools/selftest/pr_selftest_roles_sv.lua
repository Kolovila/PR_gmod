-- Роли и отряд пехоты (sv_infantry_roles.lua): по сцене на роль против бессмертного бота-цели.
-- «Спрятать» цель — флаг notarget: слой её больше не видит, а метка остаётся.
-- run_selftest.ps1 -Suite roles
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step, waitFor, check = T.S, T.log, T.step, T.waitFor, T.check

local function Ground(x, y)
	local tr = util.TraceLine({start = Vector(x, y, 2000), endpos = Vector(x, y, -3000), mask = MASK_PLAYERSOLID_BRUSHONLY})
	return tr.HitPos + Vector(0, 0, 4)
end

local function Pick(kinds)
	local list = PR_NPCW.ForKind(kinds)
	return list[1]
end

local function Soldier(pos, yaw, role, weapon, model)
	local n = ents.Create("npc_pr_soldier")
	n:SetModel(model or "models/player/eft/followers/glukhar/glukhar_scout.mdl")
	n:SetKeyValue("additionalequipment", weapon)
	n:SetPos(pos)
	n:SetAngles(Angle(0, yaw or 90, 0))
	PR_Quietly(function() n:Spawn() n:Activate() end)
	n.PR_Role = role
	S.all = S.all or {}
	table.insert(S.all, n)
	return n
end

local function Clear()
	for _, n in ipairs(S.all or {}) do if IsValid(n) then n:Remove() end end
	S.all = {}
	PR_Patrol.ClearAll()
end

local function Hide(on)
	if not IsValid(S.bot) then return end
	if on then S.bot:AddFlags(FL_NOTARGET) else S.bot:RemoveFlags(FL_NOTARGET) end
end

-- Выстрелы бойцов: время каждого
hook.Add("EntityFireBullets", "PR_SelfTestRoles", function(ent)
	if IsValid(ent) and ent.PR_Brain then
		ent.PR_TestShots = ent.PR_TestShots or {}
		table.insert(ent.PR_TestShots, CurTime())
		ent.PR_TestShotD = ent.PR_TestShotD or {}
		table.insert(ent.PR_TestShotD, IsValid(S.bot) and ent:GetPos():Distance(S.bot:GetPos()) or 0)
	end
end)
hook.Add("OnEntityCreated", "PR_SelfTestRoles", function(ent)
	timer.Simple(0, function()
		if IsValid(ent) and ent:GetClass() == "arccw_ucex_rocket" then S.rocketAt = S.rocketAt or CurTime() S.rocketsN = (S.rocketsN or 0) + 1 end
		if IsValid(ent) and ent:GetClass() == "arccw_uc_40mm_he" then S.gl40 = (S.gl40 or 0) + 1 end
	end)
end)

-- Взгляд бота держим через его команду (иначе пустая команда бота может сбросить углы)
local function Look(ang) S.botAng = ang if IsValid(S.bot) then S.bot:SetEyeAngles(ang) end end
hook.Add("StartCommand", "PR_SelfTestRoles", function(ply, cmd)
	if ply == S.bot and S.botAng then cmd:ClearMovement() cmd:SetViewAngles(S.botAng) end
end)

local function Shots(n, from) local k = 0 for _, t in ipairs(n.PR_TestShots or {}) do if t >= (from or 0) then k = k + 1 end end return k end

step(0, function()
	log("start (roles)")
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	S.base = Ground(-12450, -2500)
	S.bot = player.CreateNextBot("roles_target")
end)

step(1, function()
	local bot = S.bot
	bot:Spawn()
	bot:SetNWString("PR_fraction", "")
	bot.VJ_NPC_Class = nil
	bot:GodEnable()
	bot:StripWeapons()
	bot:Give("arccw_ur_ak")

	-- 1. Снайпер: цель в открытую на 5500
	S.sn = Soldier(S.base, 90, "sniper", Pick({"sniper"}))
	bot:SetPos(S.base + Vector(0, 5500, 0))
	S.t0 = CurTime()
end)

step(14, function()
	local n = S.sn
	local shots = n.PR_TestShots or {}
	local minGap = 99
	for i = 2, #shots do minGap = math.min(minGap, shots[i] - shots[i - 1]) end
	log(string.format("sniper: %d shots, min gap %.2f s, weapon %s", #shots, minGap, tostring(IsValid(n:GetActiveWeapon()) and n:GetActiveWeapon():GetClass())))
	check("sniper fires at a visible target at 5500", #shots >= 2, #shots)
	check("sniper fires single aimed shots (gap 1.2 s+)", #shots < 2 or minGap >= 1.2, minGap)
	S.snPos = n:GetPos()
	Hide(true)
end)

-- Цель скрылась, снайпер стрелял отсюда — уходит на новую точку
waitFor(10, function() return S.sn.PR_Brain.route ~= nil end, "sniper relocates")
step(0, function()
	local b = S.sn.PR_Brain
	local goal = b.route and b.route.goal
	check("sniper relocates after the target hides", goal ~= nil)
	if goal then check("sniper's new spot is 1000+ away", goal:Distance(S.snPos) >= 1000, math.Round(goal:Distance(S.snPos))) end
	Hide(false)
	Clear()

	-- 2. Штурмовик: цель на 2600
	S.as = Soldier(S.base, 90, "assault", "weapon_vj_arccw_ur_ak")
	S.bot:SetPos(S.base + Vector(0, 2600, 0))
	S.d0 = 2600
end)

step(20, function()
	local n = S.as
	local d = n:GetPos():Distance(S.bot:GetPos())
	-- Самая длинная очередь (выстрелы с промежутком < 0,3 с)
	-- Самая длинная очередь дальше 1700 (ближе 1600 — длинные очереди роли)
	local shots, sd, best, run = n.PR_TestShots or {}, n.PR_TestShotD or {}, 0, 1
	for i = 2, #shots do
		if shots[i] - shots[i - 1] < 0.3 and (sd[i] or 0) > 1700 then run = run + 1 else run = 1 end
		best = math.max(best, run)
	end
	log(string.format("assault: distance %.0f (from 2600), shots %d, longest burst beyond 1700 %d", d, #shots, best))
	check("assault closes in by bounds", d < S.d0 - 400, math.Round(d))
	-- Решение игрока: все жмут на спуск без очередей — и дальше 1700 огонь подряд
	check("assault holds the trigger beyond 1700 (6+ in a row)", best >= 6, best)
	n:SetPos(S.base + Vector(0, 1400, 0))
	S.asShots0 = #shots
end)

step(10, function()
	local shots, best, run = S.as.PR_TestShots or {}, 0, 1
	for i = (S.asShots0 or 0) + 2, #shots do
		if shots[i] - shots[i - 1] < 0.3 then run = run + 1 else run = 1 end
		best = math.max(best, run)
	end
	log(string.format("assault close: shots %d, longest burst %d", #shots - (S.asShots0 or 0), best))
	check("assault fires long bursts (6+) at 1200", best >= 6, best)
	Clear()

	-- 3. Гранатомётчик: стоящая цель на 2500
	S.gr = Soldier(S.base, 90, "grenadier", "weapon_vj_arccw_uc_rpg7")
	S.bot:SetPos(S.base + Vector(0, 2500, 0))
	S.rocketAt, S.rocketsN = nil, 0
	S.t0 = CurTime()
end)

waitFor(15, function() return S.rocketAt ~= nil end, "grenadier fires a rocket")
-- Серия: второй выстрел с того же места, потом шаг вбок
waitFor(8, function() return (S.rocketsN or 0) >= 2 end, "grenadier fires the second rocket")
step(1.5, function()
	local gb = S.gr.PR_Brain
	log(string.format("grenadier: rocket after %s s, still %s, rockets %s, route %s, dist %.0f, weapon %s", S.rocketAt and string.format("%.1f", S.rocketAt - S.t0) or "-",
		tostring(gb.stillSince and math.Round(CurTime() - gb.stillSince, 1)), tostring(gb.rockets), tostring(gb.route ~= nil), S.gr:GetPos():Distance(S.bot:GetPos()),
		tostring(IsValid(S.gr:GetActiveWeapon()) and S.gr:GetActiveWeapon():GetClass())))
	check("grenadier fires the RPG at a standing target", S.rocketAt ~= nil)
	check("grenadier fires a series of two from one spot", (S.rocketsN or 0) >= 2, S.rocketsN)
	check("grenadier moves after the series", S.gr.PR_Brain.route ~= nil or (S.gr.PR_Brain.posGoal ~= nil))
	check("grenadier spends rockets only on launches", gb.rockets == PR_INF_ROLE_CFG.grenadier.rockets - (S.rocketsN or 0), tostring(gb.rockets) .. " / " .. tostring(S.rocketsN))
	-- Ракеты кончились — запасной ствол
	S.gr.PR_Brain.rockets = 0
end)

step(1.5, function()
	local w = S.gr:GetActiveWeapon()
	check("grenadier out of rockets takes a backup gun", IsValid(w) and w.PR_Projectile == nil and string.StartWith(w:GetClass(), "weapon_vj_arccw_"), IsValid(w) and w:GetClass())
	Clear()

	-- 4. «Ебитель»: цель на 2000
	S.eb = Soldier(S.base, 90, "ebitel", "weapon_vj_arccw_ud_870")
	S.bot:SetPos(S.base + Vector(0, 2000, 0))
end)

step(18, function()
	local d = S.eb:GetPos():Distance(S.bot:GetPos())
	log(string.format("ebitel: distance %.0f (from 2000)", d))
	check("ebitel closes in on the target", d < 900, math.Round(d))
	Clear()

	-- 5. Тихоня: цель стоит к нему спиной на 1200 — молчит и подходит
	S.sk = Soldier(S.base, 90, "sneak", "weapon_vj_arccw_ur_mp5")
	S.bot:SetPos(S.base + Vector(0, 1200, 0))
	Look(Angle(0, 90, 0))
	S.t0 = CurTime()
	S.skP0 = S.sk:GetPos()
end)

step(6, function()
	local n = S.sk
	log(string.format("sneak: moved %.0f, bot aim %s", n:GetPos():Distance(S.skP0), tostring(S.bot:GetAimVector())))
	check("sneak holds fire while not provoked", Shots(n, S.t0) == 0, Shots(n, S.t0))
	check("sneak moves in on an unaware target", n:GetPos():Distance(S.skP0) > 50 or n:IsMoving(), math.Round(n:GetPos():Distance(S.skP0)))
	-- Цель обернулась на тихоню
	Look((n:WorldSpaceCenter() - S.bot:EyePos()):Angle())
	S.t1 = CurTime()
end)

step(0.5, function()
	check("sneak freezes under the target's gaze", not S.sk:IsMoving(), tostring(S.sk:IsMoving()))
end)

step(2, function()
	-- Смотрит на него дольше 0,7 с — тихоня считает себя раскрытым и стреляет
	check("sneak fires once it is surely spotted", Shots(S.sk, S.t1) > 0, Shots(S.sk, S.t1))
	Clear()
	-- Отдельно: в тихоню попали, а цель на него не смотрит — отвечает
	S.sk2 = Soldier(S.base, 90, "sneak", "weapon_vj_arccw_ur_mp5")
	S.bot:SetPos(S.base + Vector(300, 1100, 0))
	Look(Angle(0, 0, 0))
end)

step(3, function()
	local d = DamageInfo()
	d:SetDamage(5)
	d:SetDamageType(DMG_BULLET)
	d:SetAttacker(S.bot)
	d:SetInflictor(S.bot)
	S.sk2:TakeDamageInfo(d)
	S.t2 = CurTime()
end)

step(4, function()
	check("sneak fires back when hit", Shots(S.sk2, S.t2) > 0, Shots(S.sk2, S.t2))
	Clear()

	-- 6. Отряд: босс, двое охраны, двое штурмовиков, марксман
	local key = PR_Patrol.SaveType("selftest_squad", {
		name = "Тест отряда", weight = 0, chance = 1, maxAlive = 1, formation = "wedge",
		leader = {name = "Босс", class = {"npc_pr_soldier"}, models = {"models/player/eft/bosses/reshala.mdl"}, weapons = {"weapon_vj_arccw_ur_ak"}, health = 600, reward = {money = 1, exp = 0}},
		followers = {
			{name = "Охрана", class = {"npc_pr_soldier"}, role = "", count = 2, weapons = {"weapon_vj_arccw_ur_ak"}, health = 200, reward = {money = 1, exp = 0}},
			{name = "Штурм", class = {"npc_pr_soldier"}, role = "assault", count = 2, weapons = {"weapon_vj_arccw_ur_ak"}, health = 200, reward = {money = 1, exp = 0}},
			{name = "Марксман", class = {"npc_pr_soldier"}, role = "marksman", count = 1, weapons = {Pick({"dmr"})}, health = 200, reward = {money = 1, exp = 0}},
		}
	})
	S.typeKey = key
	S.spot = PR_Patrol.AddSpot(S.base, "Тест-отряд")
	S.patrol = PR_Patrol.Spawn(key, S.spot)
	S.bot:SetPos(S.base + Vector(0, 2600, 0))
end)

step(8, function()
	local p = S.patrol
	check("squad patrol spawned", p ~= nil and #p.members == 6, p and #p.members)
	if not p then return end
	local sq = p.squad
	check("squad is set up (pairs, guards)", sq ~= nil and #(sq.guards or {}) >= 1)
	local boss = p.leader
	local bossOrder = boss.PR_Brain and boss.PR_Brain.order
	check("boss gets the second-line order", bossOrder ~= nil and (bossOrder.kind == "boss" or bossOrder.kind == "retreat"), bossOrder and bossOrder.kind)
	local guarded = 0
	for _, g in ipairs(sq.guards or {}) do
		local o = IsValid(g) and g.PR_Brain.order
		if o and (o.kind == "guard" or o.kind == "retreat") then guarded = guarded + 1 end
	end
	check("guards cover the boss", guarded >= 1, guarded)
	-- Убить половину (не босса) — отход
	local killed = 0
	for _, m in ipairs(p.members) do
		if m ~= boss and killed < 3 and IsValid(m) then
			local d = DamageInfo()
			d:SetDamage(100000)
			d:SetDamageType(DMG_BULLET)
			d:SetAttacker(game.GetWorld())
			m:TakeDamageInfo(d)
			killed = killed + 1
		end
	end
	S.dBefore = boss:GetPos():Distance(S.bot:GetPos())
end)

-- Отход — не раньше 8 с с начала боя (сначала ответный огонь и укрытие)
waitFor(12, function() local sq = S.patrol and S.patrol.squad return sq ~= nil and (sq.phase == "retreat" or sq.phase == "regroup") end, "squad retreat")
step(0.5, function()
	local sq = S.patrol and S.patrol.squad
	check("squad retreats after losing half", sq ~= nil and (sq.phase == "retreat" or sq.phase == "regroup"), sq and sq.phase)
end)

step(12, function()
	local p = S.patrol
	if not p then return end
	local boss = p.leader
	local d = IsValid(boss) and boss:GetPos():Distance(S.bot:GetPos()) or 0
	log(string.format("retreat: boss distance %.0f -> %.0f", S.dBefore or 0, d))
	check("retreating squad moves away from the enemy", d > (S.dBefore or 0) + 300, math.Round(d - (S.dBefore or 0)))
	-- Смерть босса: новый командир через 10 с
	S.oldBoss = boss
	local dmg = DamageInfo()
	dmg:SetDamage(100000)
	dmg:SetDamageType(DMG_BULLET)
	dmg:SetAttacker(game.GetWorld())
	boss:TakeDamageInfo(dmg)
end)

step(12, function()
	local p = S.patrol
	local sq = p and p.squad
	check("boss death is noticed by the squad", sq ~= nil and sq.bossDeadAt ~= nil)
	check("a new leader takes command", p ~= nil and IsValid(p.leader) and p.leader ~= S.oldBoss, p and tostring(p.leader))
	Clear()

	-- 7. Патруль без главного (как «Тестовички» игрока — Goons): никто не «босс», Knight давит,
	-- у Big Pipe GP-25 стреляет гранатами
	S.typeKey2 = PR_Patrol.SaveType("selftest_goons", {
		name = "Тест без главного", weight = 0, chance = 1, maxAlive = 1, formation = "wedge",
		followers = {
			{name = "Knight", class = {"npc_pr_soldier"}, role = "ebitel", count = 1, models = {"models/eft/bosses/knight_pm.mdl"}, weapons = {"weapon_vj_arccw_ur_ak"}, health = 200, reward = {money = 1, exp = 0}},
			{name = "Big Pipe", class = {"npc_pr_soldier"}, role = "grenadier", count = 1, models = {"models/eft/bosses/big_pipe_pm.mdl"}, weapons = {"weapon_vj_arccw_ud_m79"}, health = 200, reward = {money = 1, exp = 0}},
			{name = "Birdeye", class = {"npc_pr_soldier"}, role = "marksman", count = 1, models = {"models/eft/bosses/birdeye_pm.mdl"}, weapons = {Pick({"dmr"})}, health = 200, reward = {money = 1, exp = 0}},
		}
	})
	S.patrol3 = S.typeKey2 and PR_Patrol.Spawn(S.typeKey2, S.spot)
	S.bot:SetPos(S.base + Vector(0, 2600, 0))
	S.gl40 = 0
end)

step(18, function()
	local p = S.patrol3
	check("leaderless patrol spawned", p ~= nil and #p.members == 3, p and #p.members)
	if p then
		local sq = p.squad
		check("leaderless squad has no boss and no guards", sq ~= nil and sq.boss == nil and #(sq.guards or {}) == 0, sq and tostring(sq.boss))
		local bossOrders, knightD = 0, nil
		for _, m in ipairs(p.members) do
			local o = IsValid(m) and m.PR_Brain and m.PR_Brain.order
			if o and (o.kind == "boss" or o.kind == "guard") then bossOrders = bossOrders + 1 end
			if IsValid(m) and m.PR_Role == "ebitel" then knightD = m:GetPos():Distance(S.bot:GetPos()) end
		end
		log(string.format("leaderless: knight distance %s (from 2600), 40 mm grenades %d", tostring(knightD and math.Round(knightD)), S.gl40 or 0))
		for _, m in ipairs(p.members) do
			if IsValid(m) then
				local b, w = m.PR_Brain or {}, m:GetActiveWeapon()
				log(string.format("leaderless member %s role %s model %s hp %d weapon %s state %s contacts %d enemy %s moving %s route %s sched %s",
					tostring(m.PR_PatrolDef and m.PR_PatrolDef.name), tostring(m.PR_Role), m:GetModel(), m:Health(), IsValid(w) and w:GetClass() or "-",
					tostring(b.state), #(b.contacts or {}), tostring(m.PR_Enemy), tostring(m:IsMoving()), tostring(b.route ~= nil),
					tostring(m.CurrentSchedule and m.CurrentSchedule.Name)))
			end
		end
		log("leaderless bot " .. tostring(S.bot) .. " alive " .. tostring(IsValid(S.bot) and S.bot:Alive()) .. " pos " .. tostring(IsValid(S.bot) and S.bot:GetPos()) .. " flags notarget " .. tostring(IsValid(S.bot) and S.bot:IsFlagSet(FL_NOTARGET)))
		check("nobody in a leaderless squad gets boss/guard orders", bossOrders == 0, bossOrders)
		check("ebitel of a leaderless squad presses the enemy (< 1200)", knightD ~= nil and knightD < 1200, knightD and math.Round(knightD))
		check("GP-25 grenadier fires 40 mm grenades", (S.gl40 or 0) >= 1, S.gl40)
	end
	-- Бой пехоты пишется в запись геймплея (data/pr_gamemode/gameplay) — для разбора боёв игрока
	local files = file.Find("pr_gamemode/gameplay/*.csv", "DATA", "datedesc") or {}
	local text = files[1] and file.Read("pr_gamemode/gameplay/" .. files[1], "DATA") or ""
	check("infantry fight is recorded to the gameplay log", string.find(text, "inf:ebitel,Knight@", 1, true) ~= nil, files[1] or "no file")
	Clear()
	if S.typeKey then PR_Patrol.DeleteType(S.typeKey) end
	if S.typeKey2 then PR_Patrol.DeleteType(S.typeKey2) end
	if S.spot then PR_Patrol.RemoveSpot(S.spot) end
	if IsValid(S.bot) then S.bot:Kick("selftest") end
	hook.Remove("EntityFireBullets", "PR_SelfTestRoles")
	hook.Remove("OnEntityCreated", "PR_SelfTestRoles")
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
