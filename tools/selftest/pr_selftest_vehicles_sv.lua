-- Короткий автотест: техника в патрулях. Секции: tank (танк Гредвича с ботами-экипажем),
-- air (Ми-24 со стрелком и OH-6 без стрелка на своём ИИ), plane (штурмовик A-10). Полный — pr_selftest_sv.lua.
-- Раннер кладёт файл на место pr_selftest_sv.lua: run_selftest.ps1 -Suite vehicles | tank | air
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, check, step, waitFor = T.S, T.log, T.check, T.step, T.waitFor
local crewOf, lookAt, shot = T.crewOf, T.lookAt, T.shot

local function alive(v) return v and IsValid(v.ent) and not v.dead end

----------------------------------------------------------------------------------------------------
-- Подготовка: бот-цель, линия спотов, патруль с техникой выбранных секций
----------------------------------------------------------------------------------------------------
T.section("common")

step(0, function()
	log("start (vehicles), map=" .. game.GetMap() .. ", sections " .. (T.only and table.concat(table.GetKeys(T.only), " ") or "all"))
	S.host = player.GetHumans()[1]
	PR_Patrol.NextSpawn = math.huge
	RunConsoleCommand("ai_ignoreplayers", "1")
	RunConsoleCommand("pr_patrol_debug", "1")
	RunConsoleCommand("bot")
end)

waitFor(5, function() return IsValid(player.GetBots()[1]) end, "target bot")

step(0, function()
	S.b1 = player.GetBots()[1]
	check("target bot joined", IsValid(S.b1))
	-- Цель бессмертна: иначе после первого же попадания она возродится в другом месте
	if IsValid(S.b1) then S.b1:GodEnable() end

	local extra = {}
	for _, place in pairs(PR_DB.GetLayout(string.lower(game.GetMap()))) do
		if isvector(place.Pos) then table.insert(extra, place.Pos) end
	end
	table.insert(extra, S.host:GetPos())
	local pts, base = T.findLine(extra)
	check("found a walkable line", pts ~= nil)
	if not pts then return end
	log("patrol line from " .. tostring(base))

	S.spotA = PR_Patrol.AddSpot(pts[1], "Тест-А")
	S.spotB = PR_Patrol.AddSpot(pts[2], "Тест-Б")
	S.spotC = PR_Patrol.AddSpot(pts[3], "Тест-В")
	S.host:SetPos(pts[1] + (pts[1] - pts[3]):GetNormalized() * 300 + Vector(0, 0, 5))

	local vehicles = {}
	if T.enabled("tank") then
		table.insert(vehicles, {name = "Танк охраны", class = {"wt_king_tiger"}, count = 1, crew = 2, reward = {money = 4000, exp = 10}})
	end
	if T.enabled("air") or T.enabled("helistrike") then
		table.insert(vehicles, {name = "Вертолёт охраны", class = {"gred_lfs_mi24a"}, count = 1, crew = 1, reward = {money = 2500, exp = 8}})
		-- Без стрелка: бьёт курсовым пулемётом заходами
		table.insert(vehicles, {name = "Вертушка", class = {"gred_lfs_oh6"}, count = 1, crew = 0, reward = {money = 1500, exp = 5}})
	end
	if T.enabled("plane") or T.enabled("dogfight") or T.enabled("strike") then
		table.insert(vehicles, {name = "Штурмовик", class = {"gred_lfs_a10"}, count = 1, crew = 2, reward = {money = 3000, exp = 10}})
	end

	local key, err = PR_Patrol.SaveType(nil, {
		name = "Тест: броня",
		leader = {name = "Решала", class = {"npc_vj_mishawild_reshala1"}, weapons = {"weapon_vj_meft_reshala_ak101"}, health = 600},
		followers = {{name = "Охрана", class = {"npc_vj_mishawild_bully_security1"}, count = 2, weapons = {"weapon_vj_meft_ak74m"}}},
		vehicles = vehicles
	})
	S.armorType = key
	check("armored patrol type saved", key ~= nil, err)
	if not key then return end

	S.logMark = T.patrolLogMark()
	S.armor = PR_Patrol.Spawn(key, S.spotA)
	check("armored patrol spawned", S.armor ~= nil and #S.armor.vehicles == #vehicles, S.armor and #S.armor.vehicles)
	if not S.armor then return end

	for _, v in ipairs(S.armor.vehicles) do
		if v.kind == "ground" then S.tank = v end
		if v.class == "gred_lfs_mi24a" then S.heli = v end
		if v.class == "gred_lfs_oh6" then S.oh6 = v end
		if v.class == "gred_lfs_a10" then S.plane = v end
	end
	S.armor.lingerUntil = 0
	S.armor.route = {S.spotC}
	S.armor.routeIndex = 1
	S.armor.dest = S.spotC
	S.tankStart = S.tank and IsValid(S.tank.ent) and S.tank.ent:GetPos()
	S.leaderStart = PR_Patrol.Center(S.armor)

	check("Gredwitch's Base loaded", istable(gred) and isfunction(gred.CreateBullet) and isfunction(gred.TankGetDriverLocalAngles))

	-- Считаем выстрелы: пушка танка Гредвича, стрелок Ми-24 и курсовой пулемёт OH-6
	S.cannonShots, S.heliShots, S.oh6Shots, S.oh6Hits, S.oh6WorldHits = 0, 0, 0, 0, 0
	if istable(gred) and not gred.PR_SelftestWrapped then
		gred.PR_SelftestWrapped = true
		local startShooting, createBullet = gred.TankStartShooting, gred.CreateBullet
		gred.TankStartShooting = function(vehicle, ...)
			if S.tank and vehicle == S.tank.ent then
				S.cannonShots = S.cannonShots + 1
				if S.measureShot and not S.firstShotErr then S.firstShotErr = S.MuzzleError and S.MuzzleError(vehicle) end
			end
			return startShooting(vehicle, ...)
		end
		gred.CreateBullet = function(ply, pos, ang, cal, filter, ...)
			local real = istable(ply) and ply.PR_Real or ply
			if S.heli and real == crewOf(S.heli, 1) then S.heliShots = S.heliShots + 1 end
			if S.oh6 and istable(filter) and filter[1] == S.oh6.ent then S.oh6Shots = S.oh6Shots + 1 end
			if S.plane and istable(filter) and filter[1] == S.plane.ent then
				S.planeShots = (S.planeShots or 0) + 1
				if S.planeDives and S.planeDives > 0 then S.planeRunShots[S.planeDives] = (S.planeRunShots[S.planeDives] or 0) + 1 end
			end
			return createBullet(ply, pos, ang, cal, filter, ...)
		end
	end
	-- Попадания OH-6 по цели: урон должен идти от самой машины патруля, а не от «мира»
	hook.Add("EntityTakeDamage", "PR_SelftestOH6Hits", function(victim, dmg)
		if victim ~= S.b1 or not S.oh6 then return end
		local attacker = dmg:GetAttacker()
		if attacker == S.oh6.ent then S.oh6Hits = S.oh6Hits + 1
		elseif attacker == game.GetWorld() then
			S.oh6WorldHits = S.oh6WorldHits + 1
			local inflictor = dmg:GetInflictor()
			log(string.format("world hit on the target: %d dmg, type %d, inflictor %s, alive %s", dmg:GetDamage(), dmg:GetDamageType(),
				IsValid(inflictor) and inflictor:GetClass() or tostring(inflictor), tostring(victim:Alive())))
		end
	end)
end)

----------------------------------------------------------------------------------------------------
-- Танк
----------------------------------------------------------------------------------------------------
T.section("tank")

waitFor(8, function() return S.tank and IsValid(crewOf(S.tank, 1)) and IsValid(crewOf(S.tank, 2)) and IsValid(crewOf(S.tank, 2):GetVehicle()) end, "tank crew seated")

step(0, function()
	local tank = S.tank
	log("tank: " .. PR_Patrol.VehicleInfo(tank))
	check("our Gredwitch hooks installed", istable(gred) and gred.PR_Wrapped == true)
	local driver = crewOf(tank, 1)
	check("tank has a bot driver", alive(tank) and IsValid(driver) and tank.ent:GetDriver() == driver)
	check("tank MG gunner seated", IsValid(crewOf(tank, 2)) and IsValid(crewOf(tank, 2):GetVehicle()))
	if alive(tank) then
		lookAt(tank.ent:WorldSpaceCenter())
		shot("veh_armor")
	end
end)

-- Едет за патрулём: ждём, пока патруль уйдёт на 600 (или 15 секунд) — застрявший танк к тому
-- времени отстанет больше чем на 700
waitFor(15, function()
	local center = S.armor and PR_Patrol.Center(S.armor)
	return center and S.leaderStart and center:Distance(S.leaderStart) > 600
end, "patrol on the move")

step(0, function()
	local tank = S.tank
	local center = PR_Patrol.Center(S.armor)

	-- Танк не давит своих: Решала и двое охранников живы
	local living = 0
	for _, npc in ipairs(S.armor.members) do
		if IsValid(npc) and npc:Health() > 0 then living = living + 1 end
	end
	check("tank doesn't run over its own patrol", living == 3 and IsValid(S.armor.leader) and S.armor.leader:GetClass() == "npc_vj_mishawild_reshala1", living)

	if tank and IsValid(tank.ent) and S.tankStart then
		local moved = tank.ent:GetPos():Distance(S.tankStart)
		local toLeader = center and tank.ent:GetPos():Distance(center) or 99999
		local leaderMoved = (center and S.leaderStart) and center:Distance(S.leaderStart) or 99999
		log(string.format("tank moved %d, to leader %d, leader moved %d", moved, toLeader, leaderMoved))
		-- Держится у патруля: едет за ним, а если патруль сам почти стоит — рядом
		check("tank drives after the patrol", toLeader < 700 and (moved > 100 or leaderMoved < 200 or toLeader < 400),
			string.format("%d / %d / %d", moved, toLeader, leaderMoved))
	end
end)

-- Насколько ствол смотрит мимо цели (градусы). Ось дула у танков разная (у Луны — Up, у Гредвича —
-- Forward или другая): берём ближайшую к направлению на цель из шести
local function MuzzleError(veh)
	local id = veh:LookupAttachment("cannon_muzzle")
	if not id or id <= 0 then id = veh:LookupAttachment("muzzle") end
	local att = id and id > 0 and veh:GetAttachment(id)
	if not (att and IsValid(S.b1)) then return end
	local want = (PR_Patrol.AimPoint(S.b1) - att.Pos):GetNormalized()
	local best = 180
	for _, axis in ipairs({att.Ang:Forward(), att.Ang:Up(), att.Ang:Right()}) do
		for _, sign in ipairs({1, -1}) do
			best = math.min(best, math.deg(math.acos(math.Clamp((axis * sign):Dot(want), -1, 1))))
		end
	end
	return best
end
S.MuzzleError = MuzzleError

-- Цель — игрок в технике: бот за рулём танка Луны в 1200 от патрульного танка
step(0, function()
	local tank = S.tank
	if not (alive(tank) and IsValid(S.b1)) then return end
	local p = T.openFirePoint(tank.ent:GetPos(), 1200) or T.openFirePoint(tank.ent:GetPos(), 900)
	log("tank target vehicle at " .. tostring(p))
	if not (p and simfphys and list.Get("simfphys_vehicles")["sim_fphys_tank"]) then return end
	local yaw = (tank.ent:GetPos() - p):Angle().y + 90
	S.targetVeh = simfphys.SpawnVehicleSimple("sim_fphys_tank", p + Vector(0, 0, 30), Angle(0, yaw, 0))
end)

waitFor(5, function() return IsValid(S.targetVeh) and IsValid(S.targetVeh:GetDriverSeat()) end, "target vehicle ready")

step(0, function()
	local tank = S.tank
	check("target vehicle spawned", IsValid(S.targetVeh) and IsValid(S.targetVeh:GetDriverSeat()))
	if not (alive(tank) and IsValid(S.targetVeh)) then return end
	S.b1:EnterVehicle(S.targetVeh:GetDriverSeat())
	S.tankHits = 0
	hook.Add("EntityTakeDamage", "PR_SelftestTankHits", function(victim, dmg)
		if IsValid(S.targetVeh) and (victim == S.targetVeh or victim:GetParent() == S.targetVeh
			or (isfunction(victim.GetBaseEnt) and victim:GetBaseEnt() == S.targetVeh)) then
			S.tankHits = S.tankHits + 1
			if S.inVehicleAtHit == nil then S.inVehicleAtHit = IsValid(S.b1) and IsValid(S.b1:GetVehicle()) end
		end
	end)
	tank.forceTarget = S.b1
	S.tankShotBefore = tank.ent.NextShoot or 0
	S.cannonBefore = S.cannonShots
	S.firstShotErr, S.measureShot, S.inVehicleAtHit = nil, true, nil
	lookAt(tank.ent:WorldSpaceCenter())
end)

-- Башня King Tiger поворачивается медленно (6.5 на тик), плюс ствол и выстрел, плюс полёт снаряда
waitFor(35, function()
	return not alive(S.tank) or not IsValid(S.targetVeh) or (S.tankHits or 0) > 0
end, "tank hits the player's vehicle")

step(0, function()
	local tank = S.tank
	hook.Remove("EntityTakeDamage", "PR_SelftestTankHits")
	S.measureShot = false
	if not alive(tank) then
		check("tank alive for aiming", false, PR_Patrol.VehicleInfo(tank))
		return
	end
	local veh = tank.ent
	log(string.format("tank: target in vehicle at the first hit %s, cannon shots %d, first shot off by %s°, hits %d, aim tolerance %.1f°",
		tostring(S.inVehicleAtHit), S.cannonShots - (S.cannonBefore or 0), tostring(S.firstShotErr and math.Round(S.firstShotErr, 1)),
		S.tankHits or 0, tank.aimTolerance or -1))
	check("tank fired its cannon", S.cannonShots > (S.cannonBefore or 0) or (veh.NextShoot or 0) > (S.tankShotBefore or 0))
	check("tank fires only with the gun on target", S.firstShotErr ~= nil and S.firstShotErr < 4, S.firstShotErr)
	check("tank hits a player in a vehicle", (S.tankHits or 0) > 0 and S.inVehicleAtHit == true, tostring(S.tankHits) .. " / " .. tostring(S.inVehicleAtHit))
	local err = MuzzleError(veh)
	check("tank turret aims at the target", err ~= nil and err < 12, err)
	lookAt(veh:WorldSpaceCenter())
	shot("veh_tank_aim")
	tank.forceTarget = nil
	if IsValid(S.b1) and IsValid(S.b1:GetVehicle()) then S.b1:ExitVehicle() end
	if IsValid(S.targetVeh) then S.targetVeh:Remove() end
end)

T.addFlipSteps(function() return S.tank end)

step(0, function()
	local tank = S.tank
	if not alive(tank) then return end
	S.moneyTank = S.host:GetNWInt("PR_money")
	S.tankCrew = {crewOf(tank, 1), crewOf(tank, 2)}
	local d = DamageInfo()
	d:SetDamage(10000000)
	d:SetAttacker(S.host)
	d:SetInflictor(S.host)
	d:SetDamageType(DMG_BLAST)
	tank.ent:TakeDamageInfo(d)
end)

-- Подбитый танк: награда и уход экипажа — проверка раз в секунду в патруле, плюс кик ботов
waitFor(5, function()
	if not S.moneyTank then return true end
	for _, bot in pairs(S.tankCrew or {}) do
		if IsValid(bot) then return false end
	end
	return S.tank.dead
end, "tank destroyed and crew gone")

step(0, function()
	if not S.moneyTank then return end
	check("destroyed tank pays its reward", S.host:GetNWInt("PR_money") == S.moneyTank + 4000, S.host:GetNWInt("PR_money") - S.moneyTank)
	local left = 0
	for _, bot in pairs(S.tankCrew or {}) do
		if IsValid(bot) then left = left + 1 end
	end
	check("tank crew bots gone", left == 0, left)

	-- Журнал патрулей: появление патруля и подбитый танк (кем) записаны
	local text = T.patrolLogSince(S.logMark)
	check("patrol log: patrol spawn written", string.find(text, "патруль «Тест: броня» вышел на спот", 1, true) ~= nil)
	-- «уничтожена» или «без экипажа — взорвана» (если удар сперва убил экипаж) — и кому награда
	local line = string.match(text, "«Танк охраны» %(wt_king_tiger%) патруля «Тест: броня» [^\n]*награда: [^\n]*")
	check("patrol log: destroyed tank and who did it", line ~= nil and string.find(line, "награда: " .. S.host:Nick(), 1, true) ~= nil, line)
	if S.rightingTried then
		check("patrol log: rollover written", string.find(text, "перевернулся", 1, true) ~= nil and string.find(text, "снова на гусеницах", 1, true) ~= nil)
	end
end)

----------------------------------------------------------------------------------------------------
-- Вертолёты
----------------------------------------------------------------------------------------------------
T.section("air")

waitFor(8, function() return S.heli and IsValid(crewOf(S.heli, 1)) and IsValid(crewOf(S.heli, 1):GetVehicle()) end, "heli gunner seated")

step(0, function()
	local heli = S.heli
	log("heli: " .. PR_Patrol.VehicleInfo(heli))
	check("heli flies on its own AI", alive(heli) and heli.ent:GetAI() == true)
	check("heli gunner seated", IsValid(crewOf(heli, 1)) and IsValid(crewOf(heli, 1):GetVehicle()))
end)

-- Сопровождение: оба вертолёта отпущены (появляются в воздухе и держатся на месте, пока не
-- раскрутится мотор — до 15 секунд) и Ми-24 над патрулём
waitFor(20, function()
	local center = S.armor and PR_Patrol.Center(S.armor)
	if not (center and alive(S.heli)) then return true end
	if S.heli.holdUntil or (S.oh6 and S.oh6.holdUntil) then return false end
	return S.heli.ent:GetPos().z - center.z > 500
end, "helis released and above the patrol")

step(0, function()
	local heli = S.heli
	local center = PR_Patrol.Center(S.armor)
	if alive(heli) and center then
		local hp = heli.ent:GetPos()
		local above, flat = hp.z - center.z, Vector(hp.x - center.x, hp.y - center.y, 0):Length()
		log("heli above " .. math.Round(above) .. ", sideways " .. math.Round(flat))
		check("heli escorts above the patrol", above > 500 and flat < 3500, math.Round(above) .. " / " .. math.Round(flat))
	else
		check("heli still flying", false, PR_Patrol.VehicleInfo(heli))
	end

	-- Цель на открытом месте рядом с патрулём
	if IsValid(S.b1) and center then
		local p, clutter = T.openPointNear(center)
		log(string.format("air target at %s, clutter %s", tostring(p), tostring(clutter and math.Round(clutter))))
		S.b1:SetPos((p or center) + Vector(0, 0, 5))
	end
	if S.heli then S.heli.forceTarget = S.b1 end
	if S.oh6 then S.oh6.forceTarget = S.b1 end
	-- Попадания по цели считаем с этого места: до того цель сидела в машине под огнём танка
	S.oh6Hits, S.oh6WorldHits = 0, 0
	S.airStart = {heli = S.heliShots, oh6 = S.oh6Shots, hits = S.oh6Hits}
end)

-- Здесь только стрелок Ми-24: цель у патруля стоит меж домов, и OH-6 на заходе часто уходит от
-- препятствий, не успев выстрелить. Его стрельба проверяется в раундах ниже
waitFor(25, function()
	return S.heliShots > S.airStart.heli
end, "heli gunner firing")

step(0, function()
	local heliShots, oh6Shots, hits = S.heliShots - S.airStart.heli, S.oh6Shots - S.airStart.oh6, S.oh6Hits - S.airStart.hits
	log(string.format("heli gunner shots %d, oh6 shots %d, hits %d, world hits %d", heliShots, oh6Shots, hits, S.oh6WorldHits))
	check("heli gunner fired", heliShots > 0, heliShots)

	-- Очередь стрелка ранит игрока. VIVO (Workshop 2531451625) считает пулевой урон по игроку только
	-- через ScalePlayerDamage, а пули Гредвича бьют напрямую — VIVO их глотал, урона не было.
	-- Смотрим, дошло ли попадание стрелка до ран VIVO; цель на это время смертна
	S.vivo = istable(OJSWounds) and isfunction(OJSWounds.TakeDamage)
	check("VIVO loaded", S.vivo)
	if S.vivo and IsValid(S.b1) then
		S.gunnerWounds, S.woundHp, S.woundPos, S.woundShots = 0, S.b1:Health(), S.b1:GetPos(), S.heliShots
		if not OJSWounds.PR_SelftestWrapped then
			OJSWounds.PR_SelftestWrapped = true
			local takeDamage = OJSWounds.TakeDamage
			OJSWounds.TakeDamage = function(self, ply, dmg, part, attacker, dmginfo, ...)
				if S.gunnerWounds and ply == S.b1 and S.heli and attacker == crewOf(S.heli, 1) and dmginfo and dmginfo:IsBulletDamage() then
					S.gunnerWounds = S.gunnerWounds + 1
					-- Рана засчитана — дальше цель снова бессмертна: попадание в голову убивает, а
					-- возрождённого бота режим переносит на точку появления
					ply:GodEnable()
				end
				return takeDamage(self, ply, dmg, part, attacker, dmginfo, ...)
			end
		end
		S.b1:GodDisable()
	end
end)

-- 20 с ждём попадания из турели. С 2500–3000 на вираже 12,7 мм часто не попадает (это меткость ИИ,
-- а здесь проверяется путь урона) — тогда очередь от имени стрелка теми же пулями с 500
waitFor(20, function() return not S.vivo or (S.gunnerWounds or 0) > 0 or not (IsValid(S.b1) and S.b1:Alive()) end, "gunner wounds the target")

step(0, function()
	local gunner = S.heli and crewOf(S.heli, 1)
	if not S.vivo or (S.gunnerWounds or 0) > 0 or not IsValid(S.b1) or not IsValid(gunner) then return end
	local target = S.b1:WorldSpaceCenter()
	local from = target + Vector(350, 0, 350)
	for _ = 1, 6 do
		gred.CreateBullet(gunner, from, (target - from):Angle() + Angle(math.Rand(-0.5, 0.5), math.Rand(-0.5, 0.5), 0), "wac_base_12mm", {S.heli.ent})
	end
	log("gunner missed for 20 s: burst from 500 on the gunner's behalf")
end)

waitFor(3, function() return not S.vivo or (S.gunnerWounds or 0) > 0 or not (IsValid(S.b1) and S.b1:Alive()) end, "gunner burst wounds the target")

step(0, function()
	if S.vivo and IsValid(S.b1) then
		log(string.format("gunner bullet wounds %d (gunner shots meanwhile %d), target hp %d -> %d, alive %s", S.gunnerWounds,
			S.heliShots - (S.woundShots or 0), S.woundHp, S.b1:Health(), tostring(S.b1:Alive())))
		check("Mi-24 gunner's bullets wound a player (VIVO)", S.gunnerWounds > 0, S.gunnerWounds)
		S.gunnerWounds = nil
		S.b1:GodEnable()
		-- Убили — поднимаем там же, где стоял
		if not S.b1:Alive() then
			S.b1:Spawn()
			S.b1:GodEnable()
			S.b1:SetPos(S.woundPos)
		end
	end
	-- Ми-24 теряет цель (ушла за дом) — потом видит её снова
	if S.heli then S.heli.forceTarget = nil end
end)

step(2, function()
	if S.heli and IsValid(S.b1) then S.heli.forceTarget = S.b1 end
	S.heliShotsBack = S.heliShots
end)

-- Если Ми-24 как раз ушёл на заход своим оружием (пике, отход носом от цели, уход вверх),
-- стрелку из носовой турели цель не достать, пока он не вернётся на место сбоку — до ~20 с
waitFor(25, function() return S.heliShots > (S.heliShotsBack or 0) end, "gunner fires at the found target")

step(0, function()
	local back = S.heliShots - (S.heliShotsBack or 0)
	log("heli gunner shots after the target came back " .. back)
	check("heli gunner fires again at a target it lost and found", back > 0, back)

	-- Своя пехота не сбивает свою технику и экипаж; урон игрока проходит
	local heli, guard = S.heli and S.heli.ent, S.armor and S.armor.members[2]
	local gunner = crewOf(S.heli, 1)
	if IsValid(heli) and isfunction(heli.GetHP) and IsValid(guard) and IsValid(gunner) then
		local function hit(victim, attacker, amount)
			local d = DamageInfo()
			d:SetDamage(amount)
			d:SetAttacker(attacker)
			d:SetInflictor(attacker)
			d:SetDamageType(DMG_BLAST)
			victim:TakeDamageInfo(d)
		end
		local hp = heli:GetHP()
		hit(heli, guard, 300)
		local afterGuard = heli:GetHP()
		local gunnerHP = gunner:Health()
		hit(gunner, guard, 50)
		local gunnerAfter = gunner:Health()
		hit(heli, S.host, 50)
		local afterHost = heli:GetHP()
		log(string.format("heli hp %s -> guard %s -> host %s, gunner %s -> %s", hp, afterGuard, afterHost, gunnerHP, gunnerAfter))
		check("own guards don't damage their vehicle", afterGuard == hp, hp - afterGuard)
		check("own guards don't damage the crew", gunnerAfter == gunnerHP, gunnerHP - gunnerAfter)
		check("players still damage patrol vehicles", afterHost < afterGuard, afterGuard - afterHost)
	else
		check("heli, guard and gunner for the friendly fire check", false)
	end

	-- Ми-24 патруля берёт подвес с курсовым оружием и тратит его на заходах
	local h = S.heli and S.heli.ent
	if IsValid(h) and isfunction(h.GetLoadout) then
		S.heliLoadout, S.heliAmmo0 = h:GetLoadout(), {h:GetAmmoPrimary(), h:GetAmmoSecondary()}
		log(string.format("Mi-24 loadout %d, ammo %d/%d", S.heliLoadout, S.heliAmmo0[1], S.heliAmmo0[2]))
		check("patrol Mi-24 carries forward weapons", table.HasValue({1, 4, 5, 6, 7, 8, 9}, S.heliLoadout), S.heliLoadout)
	end

	-- Всё, что бьёт OH-6 и Ми-24, — в лог: так видно, разбился он или его сбили.
	-- И самый сильный наклон каждого вертолёта за раунд (up.z: 1 — ровно, 0.5 — 60°)
	S.airHits, S.minUp, S.minUpMode = {}, {}, {}
	hook.Add("Think", "PR_SelftestAirTilt", function()
		for _, v in ipairs({S.oh6, S.heli}) do
			if v and IsValid(v.ent) then
				local up = v.ent:GetUp().z
				if up < (S.minUp[v.class] or 1) then
					S.minUp[v.class] = up
					S.minUpMode[v.class] = tostring(v.airMode)
				end
			end
		end
	end)
	hook.Add("EntityTakeDamage", "PR_SelftestAirHits", function(victim, dmg)
		for _, v in ipairs({S.oh6, S.heli}) do
			if v and victim == v.ent then
				local key = string.format("%s by %s/%s type %d", v.class, tostring(dmg:GetAttacker()), tostring(dmg:GetInflictor()), dmg:GetDamageType())
				S.airHits[key] = (S.airHits[key] or 0) + dmg:GetDamage()
				local inflictor = dmg:GetInflictor()
				if v == S.heli and IsValid(inflictor) and string.find(inflictor:GetClass(), "rocket", 1, true) then
					S.ownRocketHits = (S.ownRocketHits or 0) + 1
				end
			end
		end
	end)
end)

local function airState(v)
	if not v then return "нет" end
	local e = v.ent
	if not IsValid(e) then return "убран" end
	local below = util.TraceLine({start = e:WorldSpaceCenter(), endpos = e:WorldSpaceCenter() - Vector(0, 0, 5000), filter = e, mask = MASK_SOLID_BRUSHONLY})
	return string.format("hp=%s rotor=%s clear=%d pullups=%d mode=%s pos=%s",
		isfunction(e.GetHP) and math.Round(e:GetHP()) or "-", tostring(isfunction(e.GetRotorDestroyed) and e:GetRotorDestroyed()),
		math.Round(below.HitPos:Distance(e:WorldSpaceCenter())), v.pullUps or 0, tostring(v.airMode), tostring(e:GetPos()))
end

-- Сложный рельеф: цель на спотах у домов, холма и крана. Раунд не короче 15 секунд (вертолёт
-- должен там продержаться) и не длиннее 30: кончается, когда оба отстрелялись (а во втором Ми-24
-- ещё и потратил ракеты/пушки на заходе)
for round = 1, #T.HARD_SPOTS do
	step(0, function()
		local p = T.HARD_SPOTS[round]
		if not IsValid(S.b1) then return end
		S.b1:SetPos(p + Vector(0, 0, 5))
		if S.oh6 then S.oh6.forceTarget = S.b1 end
		if S.heli then S.heli.forceTarget = S.b1 end
		S.roundStart = {t = CurTime(), oh6 = S.oh6Shots, heli = S.heliShots, logged = 0,
			hp = S.oh6 and IsValid(S.oh6.ent) and isfunction(S.oh6.ent.GetHP) and S.oh6.ent:GetHP()}
		log("air round " .. round .. " at " .. tostring(p))
	end)

	waitFor(30, function()
		local r = S.roundStart
		local t = CurTime() - r.t
		if t - r.logged >= 5 then
			r.logged = r.logged + 5
			for _, v in ipairs({S.oh6, S.heli}) do
				if v then log("round " .. round .. " " .. v.class .. ": " .. airState(v)) end
			end
		end
		if t < 15 then return false end
		local h = S.heli and S.heli.ent
		local used = IsValid(h) and S.heliAmmo0 and (S.heliAmmo0[1] - h:GetAmmoPrimary()) + (S.heliAmmo0[2] - h:GetAmmoSecondary()) or 0
		return S.oh6Shots > r.oh6 and S.heliShots > r.heli and (round < #T.HARD_SPOTS or used > 0)
	end, "air round " .. round)

	step(0, function()
		local oh6 = S.oh6 and S.oh6.ent
		local flying = IsValid(oh6) and not (isfunction(oh6.GetRotorDestroyed) and oh6:GetRotorDestroyed())
			and not (isfunction(oh6.GetDestroyed) and oh6:GetDestroyed())
		check("round " .. round .. ": OH-6 still flying", flying, airState(S.oh6))
		local hpNow = IsValid(oh6) and isfunction(oh6.GetHP) and oh6:GetHP()
		check("round " .. round .. ": OH-6 didn't hit anything", hpNow and S.roundStart.hp and hpNow >= S.roundStart.hp,
			tostring(S.roundStart.hp) .. " -> " .. tostring(hpNow))
		check("round " .. round .. ": OH-6 fired", S.oh6Shots > S.roundStart.oh6, S.oh6Shots - S.roundStart.oh6)
		check("round " .. round .. ": Mi-24 alive and its gunner fired", alive(S.heli) and S.heliShots > S.roundStart.heli,
			S.heliShots - S.roundStart.heli)
		for key, amount in pairs(S.airHits or {}) do log("air damage: " .. key .. " = " .. math.Round(amount)) end
		S.airHits = {}
		for class, up in pairs(S.minUp or {}) do
			log(string.format("round %d %s: worst tilt %.0f° (%s)", round, class, math.deg(math.acos(math.Clamp(up, -1, 1))), S.minUpMode[class] or "?"))
			check("round " .. round .. ": " .. class .. " never tilts past 50°", up > math.cos(math.rad(50)), string.format("%.2f", up))
		end
		S.minUp, S.minUpMode = {}, {}
		local h = S.heli and S.heli.ent
		if IsValid(h) and S.heliAmmo0 then
			log(string.format("round %d Mi-24 ammo %d/%d, runs %d", round, h:GetAmmoPrimary(), h:GetAmmoSecondary(), S.heli.runs or 0))
			if round == #T.HARD_SPOTS then
				local used = (S.heliAmmo0[1] - h:GetAmmoPrimary()) + (S.heliAmmo0[2] - h:GetAmmoSecondary())
				check("Mi-24 pilot fires rockets or gun pods on runs", used > 0, used)
				check("Mi-24 rockets don't blow up on the Mi-24 itself", (S.ownRocketHits or 0) == 0, S.ownRocketHits)
			end
		end
	end)
end

step(0, function()
	hook.Remove("EntityTakeDamage", "PR_SelftestAirHits")
	hook.Remove("Think", "PR_SelftestAirTilt")
	-- Попадания OH-6 за все заходы: урон от самой машины патруля, а не от «мира»
	log(string.format("oh6 hits in all runs %d, world hits %d", S.oh6Hits, S.oh6WorldHits))
	check("its bullets hit the target and count as the vehicle's", S.oh6Hits > 0 and S.oh6WorldHits == 0, S.oh6Hits .. " / " .. S.oh6WorldHits)
end)

----------------------------------------------------------------------------------------------------
-- Уборка
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- Гепард (зенитный танк Гредвича из Commission Pack #16): снаряды танка игрока его убивают.
-- Как было у игрока: сначала пушка штурмовика (30 мм), потом танк T-72M2 — 125 мм HEATFS сбоку;
-- хозяин снарядов — игрок (бот). У взрыва 30 мм Гредвича нет «чем били», и взрыв simfphys падал
-- с ошибкой: Гепард горел и больше не убивался (sv_simfphys_compat.lua)
----------------------------------------------------------------------------------------------------
T.section("gepard")

-- Свой патруль: в одном варианте не больше 4 групп техники, а у основного их и так 4
step(0, function()
	local key, err = PR_Patrol.SaveType(nil, {
		name = "Тест: Гепард",
		leader = {name = "Решала", class = {"npc_vj_mishawild_reshala1"}, weapons = {"weapon_vj_meft_reshala_ak101"}, health = 600},
		vehicles = {{name = "Гепард", class = {"gred_simfphys_flakpanzerigepard_custom"}, count = 1, crew = 1, reward = {money = 3000, exp = 15}}}
	})
	S.gepardType = key
	check("Gepard patrol type saved", key ~= nil, err)
	if not key then return end
	S.gepardPatrol = PR_Patrol.Spawn(key, S.spotB or S.spotA)
	S.gepard = S.gepardPatrol and S.gepardPatrol.vehicles[1]
	if S.gepardPatrol then S.gepardPatrol.lingerUntil = CurTime() + 600 end
end)

local function gepardState()
	local g = S.gepard and S.gepard.ent
	if not IsValid(g) then return "нет (убран)" end
	return string.format("hp %s/%s, destroyed %s, dead %s", tostring(g.GetCurHealth and g:GetCurHealth()), tostring(g:GetMaxHealth()),
		tostring(g.destroyed), tostring(S.gepard.dead))
end

waitFor(15, function()
	local g = S.gepard and S.gepard.ent
	return IsValid(g) and isfunction(g.IsInitialized) and g:IsInitialized() and g:GetCurHealth() > 0 and IsValid(crewOf(S.gepard, 1))
end, "gepard ready")

step(0, function()
	local g = S.gepard and S.gepard.ent
	check("gepard spawned with its crew", IsValid(g) and IsValid(crewOf(S.gepard, 1)), gepardState())
	if not IsValid(g) then return end
	log("gepard: " .. gepardState() .. ", armored " .. tostring(g.IsArmored) .. ", GRED_TANK " .. tostring(g.GRED_TANK))
	S.gepardHits, S.gepardErrors = {}, {}
	S.gepardLogMark = T.patrolLogMark()
	-- Ошибки самого взрыва (simfphys, его обработчики у Гредвича, режим). VIVO и CW 2.0 сыплют своими,
	-- когда бот экипажа гибнет и его выкидывают (таймер VIVO через 1,5 с после появления не
	-- проверяет, что игрок ещё есть), — это не про взрыв
	hook.Add("OnLuaError", "PR_SelftestGepardErrors", function(err)
		err = tostring(err)
		if err:find("fphysics", 1, true) or err:find("simfphys", 1, true) or err:find("gamemodes/testgm", 1, true) then
			table.insert(S.gepardErrors, err)
		end
	end)
	hook.Add("EntityTakeDamage", "PR_SelftestGepard", function(victim, dmg)
		if victim ~= g then return end
		local inflictor = dmg:GetInflictor()
		local line = string.format("%.2f by %s/%s, type %d, dmg %.0f, hp %s", CurTime(), tostring(dmg:GetAttacker()),
			IsValid(inflictor) and inflictor:GetClass() or tostring(inflictor), dmg:GetDamageType(), dmg:GetDamage(), tostring(g:GetCurHealth()))
		local index = #S.gepardHits + 1
		S.gepardHits[index] = line
		-- Прочность после обработки урона
		timer.Simple(0, function()
			S.gepardHits[index] = line .. " -> " .. (IsValid(g) and tostring(g:GetCurHealth()) or "removed")
		end)
	end)
	S.gepardShots = 0
end)

-- Сначала пушка штурмовика (30 мм сверху) — пока Гепард не загорится
for _ = 1, 12 do
	step(0.5, function()
		local g = S.gepard and S.gepard.ent
		if not IsValid(g) or S.gepard.dead or g:GetCurHealth() <= g:GetMaxHealth() * 0.3 then return end
		local target = g:WorldSpaceCenter()
		local from = target + Vector(300, 0, 900)
		for _ = 1, 8 do
			gred.CreateBullet(S.b1, from, (target - from):Angle() + Angle(math.Rand(-1, 1), math.Rand(-1, 1), 0), "wac_base_30mm", {S.b1})
		end
	end)
end

step(1, function()
	local g = S.gepard and S.gepard.ent
	log("gepard after the 30 mm: " .. gepardState() .. ", on fire " .. tostring(IsValid(g) and g.GetOnFire and g:GetOnFire()))
end)

for _ = 1, 6 do
	step(1.5, function()
		local g = S.gepard and S.gepard.ent
		if not IsValid(g) or S.gepard.dead or g:GetCurHealth() <= 0 then return end
		-- Сбоку, по каткам (как у игрока), откуда их видно
		local target = g:GetPos() + Vector(0, 0, 30)
		local from
		for _, dir in ipairs({g:GetRight(), -g:GetRight(), g:GetForward(), -g:GetForward()}) do
			local p = target + dir * 700 + Vector(0, 0, 30)
			local tr = util.TraceLine({start = p, endpos = target, filter = {S.b1}, mask = MASK_SHOT})
			if tr.Entity == g then from = p break end
		end
		if not from then log("gepard: no clear side to shoot from") return end
		local hpBefore = g:GetCurHealth()
		local shell = gred.CreateShell(from, (target - from):Angle(), S.b1, {S.b1}, 125, "HEATFS", 905, 19, "white", nil, nil, 2.53, nil, 440)
		if IsValid(shell) and isfunction(shell.Launch) then shell:Launch() end
		S.gepardShots = S.gepardShots + 1
		log(string.format("gepard shot %d from %s, hp before %d", S.gepardShots, tostring(from), hpBefore))
	end)
end

step(2, function()
	local g = S.gepard and S.gepard.ent
	for _, line in ipairs(S.gepardHits or {}) do log("  gepard hit: " .. line) end
	log("gepard after " .. tostring(S.gepardShots) .. " shells: " .. gepardState())
	check("the patrol Gepard dies to the player's cannon fire (30 mm, then 125 mm)", not IsValid(g) or S.gepard.dead or g:GetCurHealth() <= 0, gepardState())
	for _, e in ipairs(S.gepardErrors or {}) do log("  gepard lua error: " .. e) end
	check("no simfphys/Gredwitch Lua errors while the Gepard is destroyed", #(S.gepardErrors or {}) == 0, #(S.gepardErrors or {}))
	local stuck = string.find(T.patrolLogSince(S.gepardLogMark) or "", "взрыв не завершился", 1, true)
	check("the Gepard's explosion completes by itself (no stuck burning tank)", not stuck)
	hook.Remove("EntityTakeDamage", "PR_SelftestGepard")
	hook.Remove("OnLuaError", "PR_SelftestGepardErrors")
end)

----------------------------------------------------------------------------------------------------
-- Самолёт: A-10 кружит над патрулём без ошибок LFS (ИИ самолёта ждёт углы, а не точку), не падает,
-- по врагу бьёт пушкой своим ИИ
----------------------------------------------------------------------------------------------------
T.section("plane")

local function planeState()
	local v = S.plane
	if not (v and IsValid(v.ent)) then return "нет" end
	local e = v.ent
	local center = S.armor and PR_Patrol.Center(S.armor) or e:GetPos()
	return string.format("speed=%d above patrol=%d away=%d hp=%s destroyed=%s mode=%s", e:GetVelocity():Length(), e:GetPos().z - center.z,
		Vector(e:GetPos().x - center.x, e:GetPos().y - center.y, 0):Length(), isfunction(e.GetHP) and math.Round(e:GetHP()) or "-",
		tostring(isfunction(e.IsDestroyed) and e:IsDestroyed()), tostring(v.airMode))
end

waitFor(20, function() return S.plane and IsValid(S.plane.ent) and not S.plane.holdUntil end, "plane released")

step(0, function()
	check("plane spawned and released", S.plane and IsValid(S.plane.ent) and not S.plane.holdUntil, planeState())
	S.planeErrors = 0
	hook.Add("OnLuaError", "PR_SelftestPlane", function() S.planeErrors = S.planeErrors + 1 end)
	S.planeMinUp = math.huge
end)

-- Кружит над патрулём (врагов нет — игроков ИИ не видит)
for _ = 1, 3 do
	step(5, function() log("plane escort: " .. planeState()) end)
end

step(0, function()
	local v = S.plane
	local alive = v and IsValid(v.ent) and not (isfunction(v.ent.IsDestroyed) and v.ent:IsDestroyed())
	check("plane escorts without falling", alive and v.ent:GetVelocity():Length() > 300, planeState())
	local center = S.armor and PR_Patrol.Center(S.armor)
	if alive and center then
		check("plane stays over the patrol", v.ent:GetPos().z - center.z > 800 and Vector(v.ent:GetPos().x - center.x, v.ent:GetPos().y - center.y, 0):Length() < 9000, planeState())
	end
	-- Враг: бот на открытом месте у патрула
	if alive and center and IsValid(S.b1) then
		if IsValid(S.b1:GetVehicle()) then S.b1:ExitVehicle() end
		local p = T.openPointNear(center) or center
		S.b1:SetPos(p + Vector(0, 0, 5))
		v.forceTarget = S.b1
		S.planeShots = 0
		S.planeLogMark = T.patrolLogMark()
		-- Заходы: сколько раз начал пике и сколько выстрелов в каждом
		S.planeDives, S.planeRunShots = 0, {}
		local last = v.planeMode
		-- Запись полёта за последние 4 с: если самолёт разобьётся, видно, как он шёл к земле
		S.planeTrack, S.planeTrackNext = {}, 0
		hook.Add("Think", "PR_SelftestPlaneRuns", function()
			if not IsValid(v.ent) then
				if S.planeTrack and #S.planeTrack > 0 and not S.planeTrackLogged then
					S.planeTrackLogged = true
					log("plane lost; last seconds (t, above ground, pitch, speed, mode):")
					for _, line in ipairs(S.planeTrack) do log("  " .. line) end
				end
				return
			end
			if v.planeMode == "dive" and last ~= "dive" then
				S.planeDives = S.planeDives + 1
				S.planeRunShots[S.planeDives] = 0
			end
			last = v.planeMode
			if CurTime() >= S.planeTrackNext then
				S.planeTrackNext = CurTime() + 0.25
				local e = v.ent
				local pos = e:GetPos()
				local tr = util.TraceLine({start = pos, endpos = pos - Vector(0, 0, 20000), filter = e, mask = MASK_SOLID_BRUSHONLY})
				local ahead = util.TraceLine({start = pos, endpos = pos + e:GetVelocity() * 2, filter = e, mask = MASK_SOLID_BRUSHONLY})
				table.insert(S.planeTrack, string.format("%.2f h=%d pitch=%d vpitch=%d speed=%d mode=%s ahead=%s", CurTime(), pos.z - tr.HitPos.z,
					e:GetAngles().p, e:GetVelocity():Angle().p, e:GetVelocity():Length(), tostring(v.planeMode),
					ahead.Hit and math.Round(ahead.Fraction * 2, 2) .. "s" or "-"))
				if #S.planeTrack > 16 then table.remove(S.planeTrack, 1) end
			end
		end)
	end
end)

waitFor(40, function()
	return not (S.plane and IsValid(S.plane.ent)) or (S.planeShots or 0) > 0
end, "plane cannon run")

step(0, function()
	log("plane attack: shots " .. tostring(S.planeShots) .. ", " .. planeState())
	for _, line in ipairs(string.Explode("\n", T.patrolLogSince(S.planeLogMark) or "")) do
		if line:find("заход", 1, true) then log("  " .. line) end
	end
	check("plane attacks the enemy with its cannon", (S.planeShots or 0) > 0, S.planeShots)
end)

-- Выходит из пике, отходит и заходит снова: ещё один заход с огнём (не каждый заход успевает
-- навести нос — тогда следующий)
local function firingRuns()
	local n = 0
	for _, shots in pairs(S.planeRunShots or {}) do
		if shots > 0 then n = n + 1 end
	end
	return n
end

waitFor(60, function()
	return not (S.plane and IsValid(S.plane.ent)) or firingRuns() >= 2
end, "second plane run")

step(0, function()
	local v = S.plane
	log("plane runs: dives " .. tostring(S.planeDives) .. ", shots per run " .. table.concat(S.planeRunShots or {}, "/") .. ", " .. planeState())
	local dmg = {}
	for k, amount in pairs(v and v.damageBy or {}) do dmg[#dmg + 1] = k .. " " .. math.Round(amount) end
	log("plane damage: " .. (#dmg > 0 and table.concat(dmg, ", ") or "none"))
	for _, line in ipairs(string.Explode("\n", T.patrolLogSince(S.planeLogMark) or "")) do
		if line:find("заход", 1, true) then log("  " .. line) end
	end
	check("plane comes back for another run and fires", firingRuns() >= 2, tostring(S.planeDives) .. " / " .. table.concat(S.planeRunShots or {}, "/"))
	check("plane survives its attack runs", v and IsValid(v.ent) and not (isfunction(v.ent.IsDestroyed) and v.ent:IsDestroyed()) and v.ent:GetVelocity():Length() > 300, planeState())
	check("no Lua errors from the plane", (S.planeErrors or 0) == 0, S.planeErrors)
	hook.Remove("OnLuaError", "PR_SelftestPlane")
	hook.Remove("Think", "PR_SelftestPlaneRuns")
	if v then v.forceTarget = nil end
end)



----------------------------------------------------------------------------------------------------
-- Самолёт сел и не взлетает (носом в склон): через 8 с его возвращают в небо. В игре — только
-- если рядом нет игроков; хост теста всегда рядом, поэтому recoverAnyway
----------------------------------------------------------------------------------------------------
step(0, function()
	local v = S.plane
	if not (v and IsValid(v.ent)) then return end
	local center = S.armor and PR_Patrol.Center(S.armor) or v.ent:GetPos()
	local spot = T.openPointNear(center) or center
	v.forceTarget = nil
	v.recoverAnyway = true
	S.groundMark = T.patrolLogMark()
	v.ent:SetPos(spot + Vector(0, 0, 120))
	v.ent:SetAngles(Angle(0, 0, 0))
	local phys = v.ent:GetPhysicsObject()
	if IsValid(phys) then phys:SetVelocity(Vector(0, 0, 0)) phys:EnableMotion(false) end
	log("plane put on the ground at " .. tostring(v.ent:GetPos()))
end)

waitFor(25, function()
	local v = S.plane
	return not (v and IsValid(v.ent)) or (T.patrolLogSince(S.groundMark) or ""):find("снова в небе", 1, true) ~= nil
end, "grounded plane relaunched")

waitFor(15, function()
	local v = S.plane
	return not (v and IsValid(v.ent)) or (not v.holdUntil and v.ent:GetVelocity():Length() > 600)
end, "relaunched plane flying")

step(0, function()
	local v = S.plane
	local relaunched = (T.patrolLogSince(S.groundMark) or ""):find("снова в небе", 1, true) ~= nil
	check("plane stuck on the ground is relaunched into the sky", relaunched)
	check("relaunched plane flies again", v and IsValid(v.ent) and not v.holdUntil and v.ent:GetVelocity():Length() > 600,
		v and IsValid(v.ent) and math.Round(v.ent:GetVelocity():Length()))
	if v then v.recoverAnyway = nil end
end)

----------------------------------------------------------------------------------------------------
-- Цель — игрок в технике на открытом месте (бот в танке Луны). Общие для самолёта и вертолёта
----------------------------------------------------------------------------------------------------
local function spawnStrikeTarget()
	local center = S.armor and PR_Patrol.Center(S.armor)
	if not (center and IsValid(S.b1) and simfphys and list.Get("simfphys_vehicles")["sim_fphys_tank"]) then return end
	local p = T.openPointNear(center) or center
	-- Бот мог остаться «в машине», которую взорвали: высаживаем и ставим на ноги
	if S.b1:InVehicle() then S.b1:ExitVehicle() end
	S.b1:SetPos(p + Vector(200, 0, 10))
	S.strikeVeh = simfphys.SpawnVehicleSimple("sim_fphys_tank", p + Vector(0, 0, 30), Angle(0, math.random(0, 359), 0))
	S.strikeHits, S.strikeRocketHits, S.strikeHP0 = 0, 0, nil
	log("strike target vehicle at " .. tostring(p))
end

local function watchStrike(shooter)
	hook.Add("EntityTakeDamage", "PR_SelftestStrike", function(victim, dmg)
		local veh = S.strikeVeh
		if not IsValid(veh) or not (victim == veh or victim:GetParent() == veh or (isfunction(victim.GetBaseEnt) and victim:GetBaseEnt() == veh)) then return end
		local a, i = dmg:GetAttacker(), dmg:GetInflictor()
		local own = IsValid(a) and (a == shooter.ent or (a:IsPlayer() and a.PR_PatrolCrew == shooter))
		if not own then return end
		S.strikeHits = S.strikeHits + 1
		if IsValid(i) and string.find(i:GetClass(), "rocket", 1, true) then S.strikeRocketHits = S.strikeRocketHits + 1 end
	end)
end

-- Машина потеряла прочность (или уничтожена)
local function strikeDamaged()
	local veh = S.strikeVeh
	if not IsValid(veh) then return true end
	return S.strikeHP0 ~= nil and veh:GetCurHealth() < S.strikeHP0
end

local function strikeVehicleState()
	local veh = S.strikeVeh
	if not IsValid(veh) then return "уничтожена (убрана)" end
	return string.format("hp %s/%s", tostring(veh:GetCurHealth()), tostring(veh:GetMaxHealth()))
end

----------------------------------------------------------------------------------------------------
-- Штурмовик по технике: заходы «по технике», залп ракет, урон по машине
----------------------------------------------------------------------------------------------------
T.section("strike")

waitFor(20, function() return S.plane and IsValid(S.plane.ent) and not S.plane.holdUntil end, "plane released for the strike")

step(0, function()
	-- Остальная авиация в стороне (forceTarget у неё мог остаться от прошлых проверок — он главнее)
	for _, v in ipairs({S.heli, S.oh6}) do if v then v.ignoreTargets, v.forceTarget = true, nil end end
	spawnStrikeTarget()
end)

waitFor(5, function() return IsValid(S.strikeVeh) and IsValid(S.strikeVeh:GetDriverSeat()) end, "strike target ready")

step(0, function()
	local v = S.plane
	check("strike target vehicle spawned", IsValid(S.strikeVeh))
	if not (v and IsValid(v.ent) and IsValid(S.strikeVeh)) then return end
	S.b1:EnterVehicle(S.strikeVeh:GetDriverSeat())
	check("target bot sits in the strike vehicle", S.b1:GetVehicle() == S.strikeVeh:GetDriverSeat(), tostring(S.b1:GetVehicle()))
	-- Пушка на время проверки пустая: 30 мм убивал танк раньше, чем уходила хоть одна ракета
	S.planeGunAmmo = v.ent:GetAmmoPrimary()
	v.ent:SetAmmoPrimary(0)
	S.strikeHP0 = S.strikeVeh:GetCurHealth()
	S.strikeRockets0 = v.rocketsFired or 0
	S.strikeAmmo0 = v.ent:GetAmmoSecondary()
	S.strikeMark = T.patrolLogMark()
	v.planeMode, v.planeRunYaw = nil, nil
	v.forceTarget = S.b1
	watchStrike(v)
end)

waitFor(75, function()
	local v = S.plane
	return not (v and IsValid(v.ent)) or not IsValid(S.strikeVeh) or ((v.rocketsFired or 0) > S.strikeRockets0 and strikeDamaged())
end, "plane strikes the vehicle")

step(1, function()
	local v = S.plane
	local lines = T.patrolLogSince(S.strikeMark) or ""
	local rockets = v and (v.rocketsFired or 0) - (S.strikeRockets0 or 0) or 0
	log(string.format("strike: plane rockets %d (ammo %s -> %s), hits on the vehicle %d (rockets %d), vehicle %s", rockets,
		tostring(S.strikeAmmo0), v and IsValid(v.ent) and tostring(v.ent:GetAmmoSecondary()) or "-", S.strikeHits or 0, S.strikeRocketHits or 0, strikeVehicleState()))
	for _, line in ipairs(string.Explode("\n", lines)) do
		if line:find("заход по технике", 1, true) and line:find("dive", 1, true) then log("  " .. line) end
	end
	check("plane flies vehicle runs against a player in a vehicle", lines:find("заход по технике", 1, true) ~= nil)
	check("plane fires rockets at the vehicle", rockets > 0, rockets)
	check("plane's fire damages the vehicle (or destroys it)", strikeDamaged(), strikeVehicleState())
	check("plane survives its strike", v and IsValid(v.ent) and not (isfunction(v.ent.IsDestroyed) and v.ent:IsDestroyed()))
	if v and IsValid(v.ent) and S.planeGunAmmo then v.ent:SetAmmoPrimary(S.planeGunAmmo) end
	if v then v.forceTarget = nil end
	hook.Remove("EntityTakeDamage", "PR_SelftestStrike")
	if IsValid(S.b1) and IsValid(S.b1:GetVehicle()) then S.b1:ExitVehicle() end
	if IsValid(S.strikeVeh) then S.strikeVeh:Remove() end
	for _, h in ipairs({S.heli, S.oh6}) do if h then h.ignoreTargets = nil end end
end)

----------------------------------------------------------------------------------------------------
-- Ми-24 по технике: заходы с ракетами (подвес 8 — контейнеры и ракеты) и управляемые ракеты стрелка
----------------------------------------------------------------------------------------------------
T.section("helistrike")

-- Свой патруль со свежим Ми-24 (вертолёт основного мог разбиться в раундах выше — тогда всё ниже
-- падало бы следом). Две части: сначала без управляемых ракет стрелка (одна такая убивает танк
-- сразу, и пилот не успевал выстрелить) — ракеты пилота; потом по новой цели — ракеты стрелка
step(0, function()
	local key, err = PR_Patrol.SaveType(nil, {
		name = "Тест: Ми-24",
		leader = {name = "Решала", class = {"npc_vj_mishawild_reshala1"}, weapons = {"weapon_vj_meft_reshala_ak101"}, health = 600},
		vehicles = {{name = "Ми-24", class = {"gred_lfs_mi24a"}, count = 1, crew = 1, reward = {money = 2500, exp = 8}}}
	})
	S.hsType = key
	check("Mi-24 strike patrol type saved", key ~= nil, err)
	if not key then return end
	S.hsPatrol = PR_Patrol.Spawn(key, S.spotB or S.spotA)
	S.hs = S.hsPatrol and S.hsPatrol.vehicles[1]
	if S.hsPatrol then S.hsPatrol.lingerUntil = CurTime() + 600 end
end)

waitFor(25, function() return S.hs and IsValid(S.hs.ent) and not S.hs.holdUntil and IsValid(crewOf(S.hs, 1)) end, "Mi-24 ready for the strike")

step(0, function()
	for _, v in ipairs({S.plane, S.oh6, S.heli}) do if v then v.ignoreTargets, v.forceTarget = true, nil end end
	if S.hs and IsValid(S.hs.ent) then
		S.hs.ent:SetLoadout(8)
		S.hs.ent:SetMissiles(false)
	end
	spawnStrikeTarget()
end)

waitFor(5, function() return IsValid(S.strikeVeh) and IsValid(S.strikeVeh:GetDriverSeat()) end, "heli strike target ready")

step(0, function()
	local v = S.hs
	check("heli strike target vehicle spawned", IsValid(S.strikeVeh))
	if not (v and IsValid(v.ent) and IsValid(S.strikeVeh)) then return end
	S.b1:EnterVehicle(S.strikeVeh:GetDriverSeat())
	check("target bot sits in the heli strike vehicle", S.b1:GetVehicle() == S.strikeVeh:GetDriverSeat(), tostring(S.b1:GetVehicle()))
	S.strikeHP0 = S.strikeVeh:GetCurHealth()
	S.heliRockets0, S.heliMissiles0 = v.rocketsFired or 0, v.missilesFired or 0
	log(string.format("Mi-24 loadout %d, ammo %d/%d", v.ent:GetLoadout(), v.ent:GetAmmoPrimary(), v.ent:GetAmmoSecondary()))
	v.forceTarget = S.b1
	watchStrike(v)
end)

waitFor(60, function()
	local v = S.hs
	return not (v and IsValid(v.ent)) or not IsValid(S.strikeVeh) or ((v.rocketsFired or 0) > S.heliRockets0 and strikeDamaged())
end, "Mi-24 rocket runs on the vehicle")

step(1, function()
	local v = S.hs
	local rockets = v and (v.rocketsFired or 0) - (S.heliRockets0 or 0) or 0
	log(string.format("heli strike (rockets): rockets %d, hits on the vehicle %d (rockets %d), runs %s, vehicle %s", rockets,
		S.strikeHits or 0, S.strikeRocketHits or 0, v and tostring(v.runs) or "-", strikeVehicleState()))
	check("Mi-24 fires rockets at a vehicle on its runs", rockets > 0, rockets)
	check("Mi-24 rockets damage the vehicle (or destroy it)", strikeDamaged(), strikeVehicleState())
	check("Mi-24 rockets count as its own (owner set: kill credit, no friendly fire)", (S.strikeRocketHits or 0) > 0 or not IsValid(S.strikeVeh), S.strikeRocketHits)
	hook.Remove("EntityTakeDamage", "PR_SelftestStrike")
	if IsValid(S.b1) and IsValid(S.b1:GetVehicle()) then S.b1:ExitVehicle() end
	if IsValid(S.strikeVeh) then S.strikeVeh:Remove() end
	-- Часть вторая: управляемые ракеты стрелка
	if v and IsValid(v.ent) then v.ent:SetMissiles(true) end
	spawnStrikeTarget()
end)

waitFor(5, function() return IsValid(S.strikeVeh) and IsValid(S.strikeVeh:GetDriverSeat()) end, "missile target ready")

step(0, function()
	local v = S.hs
	if not (v and IsValid(v.ent) and IsValid(S.strikeVeh)) then check("missile target vehicle spawned", false) return end
	S.b1:EnterVehicle(S.strikeVeh:GetDriverSeat())
	S.strikeHP0 = S.strikeVeh:GetCurHealth()
	S.heliMissiles0 = v.missilesFired or 0
	v.forceTarget = S.b1
	watchStrike(v)
	-- Куда легли управляемые ракеты: расстояние до машины в момент взрыва
	S.missileMiss = {}
	hook.Add("EntityRemoved", "PR_SelftestMissiles", function(e)
		if IsValid(e) and e:GetClass() == "gb_rocket_nebel" and IsValid(S.strikeVeh) then
			table.insert(S.missileMiss, math.Round(e:GetPos():Distance(S.strikeVeh:WorldSpaceCenter())))
		end
	end)
end)

waitFor(40, function()
	local v = S.hs
	return not (v and IsValid(v.ent)) or ((v.missilesFired or 0) > (S.heliMissiles0 or 0) and strikeDamaged())
end, "Mi-24 gunner missiles hit the vehicle")

step(1, function()
	local v = S.hs
	local missiles = v and (v.missilesFired or 0) - (S.heliMissiles0 or 0) or 0
	log(string.format("heli strike (missiles): guided missiles %d, blew up this far from the vehicle: %s, vehicle %s", missiles,
		table.concat(S.missileMiss or {}, ", "), strikeVehicleState()))
	check("Mi-24 gunner launches guided missiles at a vehicle", missiles > 0, missiles)
	check("guided missiles hit the vehicle (or destroy it)", strikeDamaged(), strikeVehicleState())
	if v then v.forceTarget = nil end
	hook.Remove("EntityTakeDamage", "PR_SelftestStrike")
	hook.Remove("EntityRemoved", "PR_SelftestMissiles")
	if IsValid(S.b1) and IsValid(S.b1:GetVehicle()) then S.b1:ExitVehicle() end
	if IsValid(S.strikeVeh) then S.strikeVeh:Remove() end
end)

-- Цель уничтожена, пока управляемая ракета летит: ракета не должна сыпать ошибками
-- (было: gred_lfs_mi24a/init.lua:763 LocalToWorld — ×800 и «аддон создаёт ошибки»)
step(0, function()
	local v = S.hs
	if not (v and IsValid(v.ent)) then return end
	-- Без оружия пилота (подвес 0): иначе его ракеты убивали цель раньше, чем стрелок пускал свою
	v.ent:SetLoadout(0)
	v.missilesLeft, v.nextMissile = 4, 0
	spawnStrikeTarget()
	S.nullErrors = {}
	hook.Add("OnLuaError", "PR_SelftestNullSafety", function(err)
		err = tostring(err)
		if err:find("gred_lfs_mi24a", 1, true) or err:find("base_rocket", 1, true) or err:find("base_bomb", 1, true) then
			table.insert(S.nullErrors, err)
		end
	end)
end)

waitFor(5, function() return IsValid(S.strikeVeh) and IsValid(S.strikeVeh:GetDriverSeat()) end, "vanishing target ready")

step(0, function()
	local v = S.hs
	if not (v and IsValid(v.ent) and IsValid(S.strikeVeh)) then return end
	S.b1:EnterVehicle(S.strikeVeh:GetDriverSeat())
	S.vanishMissiles0 = v.missilesFired or 0
	v.forceTarget = S.b1
	-- Как только ракета ушла — через полсекунды цель исчезает
	hook.Add("OnEntityCreated", "PR_SelftestVanish", function(e)
		if not IsValid(e) or e:GetClass() ~= "gb_rocket_nebel" then return end
		hook.Remove("OnEntityCreated", "PR_SelftestVanish")
		S.vanishMissile = e
		timer.Simple(0.5, function()
			if IsValid(S.b1) and S.b1:InVehicle() then S.b1:ExitVehicle() end
			if IsValid(S.strikeVeh) then S.strikeVeh:Remove() end
		end)
	end)
end)

waitFor(40, function()
	local v = S.hs
	return not (v and IsValid(v.ent)) or ((v.missilesFired or 0) > (S.vanishMissiles0 or 0) and not IsValid(S.strikeVeh))
end, "missile launched and its target gone")

waitFor(10, function() return not IsValid(S.vanishMissile) end, "missile without a target comes down")

step(0, function()
	local v = S.hs
	hook.Remove("OnEntityCreated", "PR_SelftestVanish")
	if v then v.forceTarget = nil end
	check("Mi-24 launched a missile at the vanishing target", v and (v.missilesFired or 0) > (S.vanishMissiles0 or 0))
	check("missile whose target vanished comes down", not IsValid(S.vanishMissile))
	-- Ракета, хозяина которой убрали до взрыва (вертолёт сбит, бот выкинут): было base_rocket:741 SetAttacker(NULL)
	local center = S.armor and PR_Patrol.Center(S.armor) or S.host:GetPos()
	local spot = T.openPointNear(center) or center
	local owner = ents.Create("prop_physics")
	owner:SetModel("models/props_junk/wood_crate001a.mdl")
	owner:SetPos(spot + Vector(0, 0, 3000))
	owner:Spawn()
	local rocket = ents.Create("gb_rocket_hydra")
	rocket:SetPos(spot + Vector(0, 0, 1200))
	rocket:SetAngles(Angle(90, 0, 0))
	rocket:Spawn()
	rocket:Activate()
	PR_Patrol.GiveRocketOwner(rocket, owner)
	rocket:Launch()
	owner:Remove()
	S.orphanRocket = rocket
end)

waitFor(8, function() return not IsValid(S.orphanRocket) end, "orphan rocket explodes")

step(1, function()
	for _, e in ipairs(S.nullErrors or {}) do log("  null-safety error: " .. e) end
	check("rocket whose owner is gone explodes without errors", not IsValid(S.orphanRocket) and #(S.nullErrors or {}) == 0, #(S.nullErrors or {}))
	check("no Mi-24 or rocket Lua errors when a target or owner vanishes", #(S.nullErrors or {}) == 0, #(S.nullErrors or {}))
	hook.Remove("OnLuaError", "PR_SelftestNullSafety")
	for _, p in ipairs({S.plane, S.oh6, S.heli}) do if p then p.ignoreTargets = nil end end
	if S.hsPatrol then PR_Patrol.Remove(S.hsPatrol) end
end)

----------------------------------------------------------------------------------------------------
-- Воздушный бой: штурмовик патруля против самолёта в воздухе (игрок на своём A-10). Цель — «дрон»:
-- модель A-10 без своей физики полёта, летит по кругу над патрулём со скоростью 1200, каждые 8 с
-- разворачивается в обратную сторону и ходит по высоте ±600 — как игрок, уходящий от атаки
----------------------------------------------------------------------------------------------------
T.section("dogfight")

waitFor(20, function() return S.plane and IsValid(S.plane.ent) and not S.plane.holdUntil end, "plane released for the dogfight")

local function dogfightState()
	local v = S.plane
	if not (v and IsValid(v.ent)) then return "самолёта нет" end
	local e = v.ent
	return string.format("plane speed %d, mode %s, hp %s, dist to drone %s", e:GetVelocity():Length(), tostring(v.airMode),
		isfunction(e.GetHP) and math.Round(e:GetHP()) or "-", IsValid(S.drone) and math.Round(e:GetPos():Distance(S.drone:GetPos())) or "-")
end

step(0, function()
	local v = S.plane
	if not (v and IsValid(v.ent)) then check("plane for the dogfight", false) return end
	local center = S.armor and PR_Patrol.Center(S.armor) or v.ent:GetPos()
	local tr = util.TraceLine({start = center + Vector(0, 0, 64), endpos = center + Vector(0, 0, 16000), mask = MASK_SOLID_BRUSHONLY})
	S.droneCenter = center + Vector(0, 0, math.min(2500, tr.HitPos.z - center.z - 800))
	local drone = ents.Create("prop_physics")
	drone:SetModel("models/gredwitch/a10/a10_lfs.mdl")
	drone:SetPos(S.droneCenter + Vector(3000, 0, 0))
	drone:Spawn()
	local phys = drone:GetPhysicsObject()
	if IsValid(phys) then phys:EnableGravity(false) phys:Wake() end
	S.drone, S.droneAngle, S.droneHits, S.droneDir, S.droneFlipAt = drone, 0, 0, 1, CurTime() + 8
	hook.Add("Think", "PR_SelftestDrone", function()
		if not IsValid(S.drone) then return end
		local ph = S.drone:GetPhysicsObject()
		if not IsValid(ph) then return end
		-- Разворот не мгновенный (так не может ни один самолёт): скорость по кругу за 2 с меняет знак
		if CurTime() > S.droneFlipAt then S.droneWant, S.droneFlipAt = -(S.droneWant or 1), CurTime() + 8 end
		S.droneDir = math.Approach(S.droneDir, S.droneWant or 1, FrameTime())
		S.droneAngle = S.droneAngle + FrameTime() * 1200 / 3000 * S.droneDir
		local a = S.droneAngle
		local want = S.droneCenter + Vector(math.cos(a) * 3000, math.sin(a) * 3000, math.sin(a * 3) * 600)
		local vel = Vector(-math.sin(a), math.cos(a), 0) * 1200 * S.droneDir + (want - S.drone:GetPos()) * 2
		ph:SetVelocity(vel)
		ph:SetAngles(vel:Angle())
		ph:SetAngleVelocity(Vector(0, 0, 0))
	end)
	-- Попадания — только пули и разрывы; удар корпусом (таран) считаем отдельно
	S.droneRams = 0
	hook.Add("EntityTakeDamage", "PR_SelftestDroneHits", function(victim, dmg)
		local a = dmg:GetAttacker()
		if victim ~= S.drone or not IsValid(a) or not (a == v.ent or (a:IsPlayer() and a.PR_PatrolCrew == v)) then return end
		if dmg:IsDamageType(DMG_CRUSH) or dmg:IsDamageType(DMG_VEHICLE) or dmg:GetDamageType() == DMG_GENERIC then
			S.droneRams = S.droneRams + 1
		else
			S.droneHits = S.droneHits + 1
		end
	end)
	S.dogfightShots0 = S.planeShots or 0
	S.dogfightMark = T.patrolLogMark()
	v.forceTarget = drone
	-- Вертолёты против самолёта: не гонятся, держатся у патруля; стрелок Ми-24 бьёт по нему
	S.heliDefense = {maxAway = 0, modes = {}, shots0 = S.heliShots or 0}
	for _, h in ipairs({S.heli, S.oh6}) do
		if h and IsValid(h.ent) then h.forceTarget = drone end
	end
	hook.Add("Think", "PR_SelftestHeliDefense", function()
		local center = S.armor and PR_Patrol.Center(S.armor)
		if not center then return end
		for _, h in ipairs({S.heli, S.oh6}) do
			if h and IsValid(h.ent) then
				local p = h.ent:GetPos()
				S.heliDefense.maxAway = math.max(S.heliDefense.maxAway, Vector(p.x - center.x, p.y - center.y, 0):Length())
				S.heliDefense.modes[tostring(h.airMode)] = true
			end
		end
	end)
	log("drone at " .. tostring(drone:GetPos()) .. ", " .. dogfightState())
end)

-- Бой подольше: 10 попаданий (или минута) — с проскоками, отворотами и новыми заходами
waitFor(60, function()
	return not (S.plane and IsValid(S.plane.ent)) or (S.droneHits or 0) >= 10
end, "plane hits the air target")

-- Штурмовик бывает быстрее: стрелку Ми-24 даём ещё до 20 с довернуть турель на самолёт
waitFor(20, function()
	return not (S.heli and IsValid(S.heli.ent)) or not S.heliDefense or (S.heliShots or 0) > S.heliDefense.shots0
end, "Mi-24 gunner fires at the aircraft")

step(0, function()
	local v = S.plane
	local shots = (S.planeShots or 0) - (S.dogfightShots0 or 0)
	log(string.format("dogfight: shots %d, hits %d, rams %d, %s", shots, S.droneHits or 0, S.droneRams or 0, dogfightState()))
	local lines = T.patrolLogSince(S.dogfightMark) or ""
	for _, line in ipairs(string.Explode("\n", lines)) do
		if line:find("воздушный бой", 1, true) then log("  " .. line) end
	end
	check("plane switches to air combat against an aircraft", lines:find("воздушный бой", 1, true) ~= nil)
	check("plane fires at the aircraft", shots > 0, shots)
	check("plane hits the maneuvering aircraft again and again (10 hits in a minute)", (S.droneHits or 0) >= 10, S.droneHits)
	check("plane doesn't ram the aircraft", (S.droneRams or 0) == 0, S.droneRams)
	hook.Remove("Think", "PR_SelftestHeliDefense")
	if S.heliDefense and (alive(S.heli) or alive(S.oh6)) then
		local modes = table.concat(table.GetKeys(S.heliDefense.modes), ",")
		log(string.format("helis vs the aircraft: modes %s, max away from the patrol %d, Mi-24 gunner shots %d", modes,
			S.heliDefense.maxAway, (S.heliShots or 0) - S.heliDefense.shots0))
		check("helicopters don't chase an aircraft (air defense near the patrol)", S.heliDefense.modes["air defense"] and S.heliDefense.maxAway < 4500,
			modes .. " / " .. math.Round(S.heliDefense.maxAway))
		if alive(S.heli) then
			check("Mi-24 gunner fires at the aircraft", (S.heliShots or 0) > S.heliDefense.shots0, (S.heliShots or 0) - S.heliDefense.shots0)
		end
	end
	for _, h in ipairs({S.heli, S.oh6}) do if h then h.forceTarget = nil end end
	check("plane survives the dogfight", v and IsValid(v.ent) and not (isfunction(v.ent.IsDestroyed) and v.ent:IsDestroyed()), dogfightState())
	hook.Remove("Think", "PR_SelftestDrone")
	hook.Remove("EntityTakeDamage", "PR_SelftestDroneHits")
	if IsValid(S.drone) then S.drone:Remove() end
	if v then v.forceTarget = nil end
end)

T.section("common")

step(0, function()
	hook.Remove("EntityTakeDamage", "PR_SelftestOH6Hits")
	S.heliCrew = crewOf(S.heli, 1)
	PR_Patrol.ClearAll()
end)

step(1, function()
	check("patrol vehicles and crew removed", not (S.heli and IsValid(S.heli.ent)) and not IsValid(S.heliCrew)
		and not (S.oh6 and IsValid(S.oh6.ent)) and not (S.tank and IsValid(S.tank.ent)) and not (S.plane and IsValid(S.plane.ent)))
	if S.armorType then PR_Patrol.DeleteType(S.armorType) end
	if S.gepardType then PR_Patrol.DeleteType(S.gepardType) end
	if S.hsType then PR_Patrol.DeleteType(S.hsType) end
	for _, id in ipairs({S.spotA, S.spotB, S.spotC}) do
		if id then PR_Patrol.RemoveSpot(id) end
	end
	local crewLeft = 0
	for _, ply in ipairs(player.GetAll()) do
		if ply:GetNWBool("PR_PatrolCrew") then crewLeft = crewLeft + 1 end
	end
	check("no crew bots left", crewLeft == 0, crewLeft)
	RunConsoleCommand("ai_ignoreplayers", "0")
	RunConsoleCommand("pr_patrol_debug", "0")
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
