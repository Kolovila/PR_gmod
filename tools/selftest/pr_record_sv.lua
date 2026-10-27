-- Полигон: игрок сам летает на вертолёте по цели, а мы пишем полёт — по нему подстраиваем ИИ
-- заходов. run_selftest.ps1 -Suite record -Instance 1 (до 60 мин).
--   F6 — начать запись / пауза, F7 — сохранить и выйти (игра закроется), F8 — другой вертолёт,
--   F9 — другой подвес. Вертолёт неубиваемый, боезапас пополняется сам, патрулей нет.
-- Запись — data/pr_selftest/flight_<n>.csv, 10 строк в секунду (столбцы — в первой строке)
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step, waitFor = T.S, T.log, T.step, T.waitFor

local HELIS = {"gred_lfs_oh6", "lfs_grdn_md500tow", "gd_lfs_mi24v", "lfs_grdn_ah64d", "gd_lfs_mi28n", "lfs_grdn_ka50"}
-- recordplane: штурмовик A-10 — появляется в воздухе в ~9000 от цели на ~3000 над ней, носом на цель;
-- висит, пока игрок не возьмёт управление, и отпускается сразу на скорости 1500 с полным газом
local PLANE = T.only and T.only.plane
if PLANE then HELIS = {"gred_lfs_a10"} end
local LOADOUTS = {
	lfs_grdn_ka50 = {2, 1}, gd_lfs_mi24v = {2, 0}, lfs_grdn_ah64d = {3, 1, 2}, gd_lfs_mi28n = {1, 2, 3}, lfs_grdn_md500tow = {1, 2},
}
local TARGET = Vector(-8245.6, -860.5, -213.3)   -- открытое место (то же, что в тесте авиации)
local START_DIST = 2500

local function Say(text)
	if IsValid(S.host) then S.host:ChatPrint("[Полигон] " .. text) end
end

local function Center(text)
	if IsValid(S.host) then S.host:PrintMessage(HUD_PRINTCENTER, text) end
end

local function Ground(p)
	local tr = util.TraceLine({start = p + Vector(0, 0, 2000), endpos = p - Vector(0, 0, 4000), mask = MASK_SOLID_BRUSHONLY})
	return tr.HitPos
end

-- Ровное открытое место для вертолёта в 1800–3200 от цели: земля под всем корпусом (±300) с перепадом
-- не больше 20 и свободно над ним (первый раз встал на склон дюны и стоял с креном)
local function FlatSpot()
	for _, d in ipairs({2500, 2000, 3000, 1800, 3200}) do
		for yaw = 0, 345, 15 do
			local c = Ground(TARGET + Angle(0, yaw, 0):Forward() * d)
			local ok = true
			for _, off in ipairs({Vector(300, 0, 0), Vector(-300, 0, 0), Vector(0, 300, 0), Vector(0, -300, 0), Vector(210, 210, 0), Vector(-210, -210, 0)}) do
				if math.abs(Ground(c + off).z - c.z) > 20 then ok = false break end
			end
			if ok and not util.TraceHull({start = c + Vector(0, 0, 60), endpos = c + Vector(0, 0, 400), mins = Vector(-350, -350, 0),
				maxs = Vector(350, 350, 10), mask = MASK_SOLID_BRUSHONLY}).Hit then
				return c
			end
		end
	end
	return Ground(TARGET + Vector(START_DIST, 0, 0))
end

-- Вертолёт рядом с игроком, игрок — за штурвал
local function SpawnHeli()
	if IsValid(S.heli) then
		if IsValid(S.host) and S.host:InVehicle() then S.host:ExitVehicle() end
		S.heli:Remove()
	end
	local class = HELIS[S.heliIndex]
	S.spawnPos = S.spawnPos or FlatSpot()
	-- Сразу в воздухе, на 400 над площадкой: колёса шасси — отдельные детали на шарнирах и
	-- появляются вместе с корпусом. Раньше ставили на землю и потом поднимали корпус — колёса
	-- оставались в земле и держали вертолёт, как на привязи (выше ~900 он не поднимался)
	local pos = S.spawnPos + Vector(0, 0, 400)
	if PLANE then
		-- Направление захода — где над путём к цели свободно
		pos = nil
		for yaw = 0, 345, 30 do
			local p = TARGET + Angle(0, yaw, 0):Forward() * 9000 + Vector(0, 0, 3000)
			if not util.TraceLine({start = p, endpos = TARGET + Vector(0, 0, 1500), mask = MASK_SOLID_BRUSHONLY}).Hit
				and not util.TraceHull({start = p, endpos = p + Vector(0, 0, 1), mins = Vector(-800, -800, -300), maxs = Vector(800, 800, 300), mask = MASK_SOLID_BRUSHONLY}).Hit then
				pos = p
				break
			end
		end
		pos = pos or TARGET + Vector(9000, 0, 3000)
	end
	local ent = ents.Create(class)
	if not IsValid(ent) then Say("нет вертолёта " .. class) return end
	ent:SetPos(pos)
	ent:SetAngles(Angle(0, (TARGET - pos):Angle().y, 0))
	ent:Spawn()
	ent:Activate()
	-- Мотор заводим и держим на месте, пока игрок не возьмёт управление
	S.holdPos = pos
	S.holdUntil = CurTime() + 12
	S.flyPressed, S.spunSaid = nil, nil
	S.heli, S.heliClass = ent, class
	S.loadoutIndex = 1
	timer.Simple(1, function()
		if not IsValid(ent) then return end
		local l = LOADOUTS[class]
		if l and isfunction(ent.SetLoadout) then ent:SetLoadout(l[1]) end
		if isfunction(ent.SetMissiles) then ent:SetMissiles(true) end
		local seat = isfunction(ent.GetDriverSeat) and ent:GetDriverSeat()
		if IsValid(S.host) and IsValid(seat) then S.host:EnterVehicle(seat) end
		if isfunction(ent.StartEngine) then ent:StartEngine() end
		Say(string.format("%s, подвес %s. F6 — запись, F7 — сохранить и выйти, F8 — другой вертолёт, F9 — другой подвес",
			class, tostring(isfunction(ent.GetLoadout) and ent:GetLoadout())))
	end)
end

-- Держим в воздухе, пока винт не наберёт 80% оборотов И игрок не возьмёт управление (W/S/A/D,
-- пробел, Shift): отпущенный сам он садился обратно колёсами в землю
local FLY_KEYS = {IN_FORWARD, IN_BACK, IN_MOVELEFT, IN_MOVERIGHT, IN_JUMP, IN_SPEED}
hook.Add("Think", "PR_RecordHold", function()
	local ent = S.heli
	if not (S.holdPos and IsValid(ent)) then return end
	local rpm = isfunction(ent.GetRPM) and ent:GetRPM() or 0
	local max = isfunction(ent.GetMaxRPM) and ent:GetMaxRPM() or 1
	local spun = CurTime() > (S.holdUntil or 0) or rpm >= max * 0.8
	if spun and not S.spunSaid then
		S.spunSaid = true
		Say("винт раскручен — висит, пока не возьмёте управление (W/S/A/D, пробел, Shift)")
	end
	-- В кресле LFS кнопки движения не доходят до KeyDown — отпускаем по самим клавишам (PlayerButtonDown)
	if S.flyPressed then
		S.holdPos, S.spunSaid, S.flyPressed = nil, nil, nil
		if PLANE then
			-- Самолёт с места не полетит: сразу скорость и полный газ, шасси убрано
			local phys = ent:GetPhysicsObject()
			if IsValid(phys) then phys:SetVelocity(ent:GetForward() * 1500) end
			if isfunction(ent.GetMaxRPM) then ent.TargetRPM = ent:GetMaxRPM() end
			if isfunction(ent.RaiseLandingGear) then ent:RaiseLandingGear() end
		end
		Say("управление ваше")
		return
	end
	ent:SetPos(S.holdPos)
	local phys = ent:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetVelocity(Vector(0, 0, 0))
		phys:SetAngleVelocity(Vector(0, 0, 0))
	end
end)

-- Сколько ракет ушло: снаряды с Launch, появившиеся у вертолёта
hook.Add("OnEntityCreated", "PR_RecordRockets", function(e)
	-- Через 0,1 с и только летящие: детали подвеса при появлении вертолёта тоже бывают с Launch
	timer.Simple(0.1, function()
		if IsValid(e) and IsValid(S.heli) and isfunction(e.Launch) and e:GetVelocity():Length() > 300
			and e:GetPos():Distance(S.heli:GetPos()) < 2500 then
			S.rockets = (S.rockets or 0) + 1
		end
	end)
end)

local COLUMNS = "t,x,y,z,pitch,yaw,roll,speed,fwd_speed,side_speed,vz,height_ground,target_dist,target_dz,yaw_to_target,nose_off,angle_below,attack1,attack2,rockets"

local function Sample()
	local ent, ply = S.heli, S.host
	if not (IsValid(ent) and IsValid(ply)) then return end
	local pos, ang, vel = ent:GetPos(), ent:GetAngles(), ent:GetVelocity()
	local lv = ent:WorldToLocal(pos + vel)
	local flat = Vector(TARGET.x - pos.x, TARGET.y - pos.y, 0)
	local toT = (TARGET - ent:WorldSpaceCenter()):GetNormalized()
	local noseOff = math.deg(math.acos(math.Clamp(ent:GetForward():Dot(toT), -1, 1)))
	local below = math.deg(math.atan2(pos.z - TARGET.z, math.max(flat:Length(), 1)))
	local down = util.TraceLine({start = pos, endpos = pos - Vector(0, 0, 8000), filter = ent, mask = MASK_SOLID_BRUSHONLY})
	S.lines[#S.lines + 1] = string.format("%.1f,%d,%d,%d,%.1f,%.1f,%.1f,%d,%d,%d,%d,%d,%d,%d,%.1f,%.1f,%.1f,%d,%d,%d",
		CurTime() - S.recStart, pos.x, pos.y, pos.z, ang.p, ang.y, ang.r, vel:Length(), lv.x, lv.y, vel.z,
		pos.z - down.HitPos.z, flat:Length(), pos.z - TARGET.z, math.AngleDifference(flat:Angle().y, ang.y), noseOff, below,
		ply:KeyDown(IN_ATTACK) and 1 or 0, ply:KeyDown(IN_ATTACK2) and 1 or 0, S.rockets or 0)
end

local function Save()
	if not S.lines or #S.lines == 0 then return end
	S.fileN = (S.fileN or 0) + 1
	file.CreateDir("pr_selftest")
	local name = string.format("pr_selftest/flight_%d_%s.csv", S.fileN, S.heliClass or "heli")
	file.Write(name, COLUMNS .. "\n" .. table.concat(S.lines, "\n"))
	log(string.format("RECORD saved %s: %d samples (%.0f s)", name, #S.lines, #S.lines / 10))
	S.lines = nil
end

local function StartRecording()
	S.lines, S.recStart, S.rockets = {}, CurTime(), 0
	timer.Create("PR_RecordSample", 0.1, 0, Sample)
	Say("запись пошла (F6 — пауза)")
	log("RECORD start " .. tostring(S.heliClass))
end

local function StopRecording()
	timer.Remove("PR_RecordSample")
	Save()
end

local FLY_BUTTONS = {[KEY_W] = true, [KEY_S] = true, [KEY_A] = true, [KEY_D] = true, [KEY_SPACE] = true, [KEY_LSHIFT] = true}

hook.Add("PlayerButtonDown", "PR_Record", function(ply, button)
	if ply ~= S.host or not S.ready then return end
	if S.holdPos and FLY_BUTTONS[button] then S.flyPressed = true end
	if button == KEY_F6 then
		if timer.Exists("PR_RecordSample") then
			StopRecording()
			Say("пауза, запись сохранена (F6 — новая запись, F7 — выйти)")
		else
			StartRecording()
		end
	elseif button == KEY_F7 then
		StopRecording()
		Say("сохранено, выходим")
		S.finished = true
	elseif button == KEY_F8 then
		StopRecording()
		S.heliIndex = S.heliIndex % #HELIS + 1
		SpawnHeli()
	elseif button == KEY_F9 and IsValid(S.heli) and isfunction(S.heli.SetLoadout) then
		local l = LOADOUTS[S.heliClass] or {}
		if #l > 0 then
			S.loadoutIndex = S.loadoutIndex % #l + 1
			S.heli:SetLoadout(l[S.loadoutIndex])
			Say("подвес " .. l[S.loadoutIndex])
		end
	end
end)

step(0, function()
	log("start (record), map=" .. game.GetMap())
	S.host = player.GetHumans()[1]
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	RunConsoleCommand("ai_ignoreplayers", "1")
	RunConsoleCommand("bot")
end)

waitFor(10, function() return IsValid(player.GetBots()[1]) end, "target bot")

step(0, function()
	-- Цель: бот (бессмертный) и джип рядом — видно, куда бить
	S.b1 = player.GetBots()[1]
	if IsValid(S.b1) then
		S.b1:GodEnable()
		S.b1:SetPos(Ground(TARGET) + Vector(0, 0, 5))
	end
	if simfphys and isfunction(simfphys.SpawnVehicleSimple) then
		S.jeep = simfphys.SpawnVehicleSimple("sim_fphys_hmmwv2", Ground(TARGET + Vector(250, 0, 0)) + Vector(0, 0, 50), Angle(0, 0, 0))
	end
	S.heliIndex = 1
	S.startYaw = 0
	SpawnHeli()
	S.ready = true
	-- Вертолёт и боезапас: неубиваемый, ракеты и патроны пополняются
	timer.Create("PR_RecordKeep", 2, 0, function()
		local ent = S.heli
		if not IsValid(ent) then return end
		if isfunction(ent.SetHP) and isfunction(ent.GetMaxHP) then ent:SetHP(ent:GetMaxHP()) end
		for _, w in ipairs({"Primary", "Secondary", "Tertiary"}) do
			local get, set, max = ent["GetAmmo" .. w], ent["SetAmmo" .. w], ent["GetMaxAmmo" .. w]
			if isfunction(get) and isfunction(set) and isfunction(max) and max(ent) > 0 and get(ent) < max(ent) * 0.5 then set(ent, max(ent)) end
		end
		if timer.Exists("PR_RecordSample") then
			Center(string.format("ЗАПИСЬ %d с · ракет %d · до цели %d", CurTime() - S.recStart, S.rockets or 0,
				Vector(TARGET.x - ent:GetPos().x, TARGET.y - ent:GetPos().y, 0):Length()))
		end
	end)
	log("RECORD ready: F6 record, F7 save and quit, F8 next heli, F9 next loadout")
	-- climb: поднимается ли вертолёт здесь выше ~900 над землёй (игрок упирался) — ИИ LFS ведёт
	-- его в точку на 3000 выше, раз в секунду пишем высоту
	if T.only and T.only.climb then
		timer.Simple(3, function()
			local ent = S.heli
			if not IsValid(ent) then return end
			if IsValid(S.host) and S.host:InVehicle() then S.host:ExitVehicle() end
			S.holdPos = nil
			local goal = ent:GetPos() + Vector(0, 0, 3000)
			ent.RunAI = function() return goal end
			ent.AIGetTarget = function() return nil end
			if isfunction(ent.SetAI) then ent:SetAI(true) end
			local n = 0
			timer.Create("PR_RecordClimb", 1, 25, function()
				n = n + 1
				if not IsValid(ent) then return end
				local down = util.TraceLine({start = ent:GetPos(), endpos = ent:GetPos() - Vector(0, 0, 8000), filter = ent, mask = MASK_SOLID_BRUSHONLY})
				local up = util.TraceLine({start = ent:GetPos(), endpos = ent:GetPos() + Vector(0, 0, 8000), filter = ent, mask = MASK_SOLID})
				local phys = ent:GetPhysicsObject()
				local cons = {}
				for _, c in ipairs(constraint.GetTable(ent)) do cons[#cons + 1] = tostring(c.Type) end
				log(string.format("RECORD climb t=%d z=%d above ground %d vz=%d rpm=%d engine=%s ai=%s motion=%s asleep=%s mass=%d constraints=%s parent=%s",
					n, ent:GetPos().z, ent:GetPos().z - down.HitPos.z, ent:GetVelocity().z, isfunction(ent.GetRPM) and ent:GetRPM() or -1,
					tostring(isfunction(ent.GetEngineActive) and ent:GetEngineActive()), tostring(isfunction(ent.GetAI) and ent:GetAI()),
					tostring(IsValid(phys) and phys:IsMotionEnabled()), tostring(IsValid(phys) and phys:IsAsleep()), IsValid(phys) and phys:GetMass() or -1,
					table.concat(cons, ","), tostring(ent:GetParent())))
				if n == 25 then S.finished = true end
			end)
		end)
	end
	-- auto (проверка полигона): сам жмёт F6, через 3 с — F7
	if T.only and T.only.auto then
		timer.Simple(16, function()
			log(string.format("RECORD auto: heli %s, host in seat %s", tostring(S.heliClass), tostring(IsValid(S.host) and S.host:InVehicle())))
			hook.Run("PlayerButtonDown", S.host, KEY_F6)
		end)
		timer.Simple(19, function() hook.Run("PlayerButtonDown", S.host, KEY_F7) end)
	end
end)

waitFor(60 * 60, function() return S.finished end, "player finished recording")

step(0, function()
	timer.Remove("PR_RecordKeep")
	timer.Remove("PR_RecordSample")
end)

step(1, T.done)

T.noDirector = true   -- игрок летает сам: камера-режиссёр не нужна
hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
