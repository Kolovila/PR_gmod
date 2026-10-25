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
	if T.enabled("air") then
		table.insert(vehicles, {name = "Вертолёт охраны", class = {"gred_lfs_mi24a"}, count = 1, crew = 1, reward = {money = 2500, exp = 8}})
		-- Без стрелка: бьёт курсовым пулемётом заходами
		table.insert(vehicles, {name = "Вертушка", class = {"gred_lfs_oh6"}, count = 1, crew = 0, reward = {money = 1500, exp = 5}})
	end
	if T.enabled("plane") then
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
		elseif attacker == game.GetWorld() then S.oh6WorldHits = S.oh6WorldHits + 1 end
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
