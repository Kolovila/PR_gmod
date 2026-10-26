-- Диагностика техники: каждая машина по очереди выходит в патруль против бота-цели, и в лог пишется
-- одна строка — появилась ли, сел ли экипаж, едет/летит ли, стреляет ли (пули, снаряды, ракеты),
-- попадает ли, в каких режимах был ИИ, были ли ошибки. Ничего не проверяет как «прошло/нет»:
-- это таблица, чтобы увидеть, под какую технику наш ИИ не годится.
-- Раннер кладёт файл на место pr_selftest_sv.lua: run_selftest.ps1 -Suite scan1 | scan2 (половины списка)
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")
util.AddNetworkString("PR_SELFTEST_WATCH")

local T = include("pr_selftest_lib.lua")
local S, log, check, step, waitFor = T.S, T.log, T.check, T.step, T.waitFor

-- Вертолёты новых паков — все; наземные — по 2–3 из пака, все зенитки и противотанковые
local AIR = {
	"gd_lfs_mi24a", "gd_lfs_mi24p", "gd_lfs_mi24v", "gd_lfs_mi24vm", "gd_lfs_mi28", "gd_lfs_mi28n",
	"gd_lfs_mi8amtsh", "gd_lfs_mi8mtv", "gd_lfs_mi8t1", "gd_lfs_mi8t2", "lfs_mi8", "lfs_mi8_amtsh", "lfs_uh60",
	"lfs_grdn_ah1g", "lfs_grdn_ah1z", "lfs_grdn_ah64d", "lfs_grdn_bo105pah1", "lfs_grdn_ec665uht", "lfs_grdn_hkp9a",
	"lfs_grdn_ka50", "lfs_grdn_md500tow", "lfs_grdn_mi24d", "lfs_grdn_mi28nm", "lfs_grdn_sa316b", "lfs_grdn_uh1c_xm30",
}
local GROUND = {
	"sim_fphys_m_atv_mg", "sim_fphys_iveco_mg1", "sim_fphys_hmmwv2", "simfphys_btr80", "simfphys_btr80a", "simfphys_dzik",
	"sim_fphys_ural_troop", "sim_fphys_UAZ1",
	"gred_simfphys_t72b3_custom", "gred_simfphys_t80u_custom", "gred_simfphys_m60a3tts_custom", "gred_simfphys_m3a3_bradley_custom",
	"gred_simfphys_ztz99_custom", "gred_simfphys_bmp1_custom", "gred_simfphys_bmp2_custom", "gred_simfphys_bmp3_custom",
	"gred_simfphys_leopard2a6_custom", "gred_simfphys_challenger2_2f_custom", "gred_simfphys_marder1a1_ifv_custom",
	"gred_simfphys_strykerm1128_custom", "gred_simfphys_t55am1_custom", "gred_simfphys_m1a1hc_abrams_custom",
	"gred_simfphys_sdkfz221_custom", "gred_simfphys_c13_t90_custom", "gred_simfphys_gazaa_dshk_custom", "gred_simfphys_m113_tow_custom",
	"gred_simfphys_is3_custom", "gred_simfphys_schutzenpanzer_puma_custom", "gred_simfphys_wiesel1a4_mk_custom",
	"gred_simfphys_mtlb_9p149_shturms_custom", "gred_simfphys_2s38_custom", "gred_simfphys_bmp2m_custom", "gred_simfphys_lav_6_0_custom",
	"gred_simfphys_leopard1a5_custom",
	"gred_simfphys_2s6tunguska_late_custom", "gred_simfphys_m163_vulcan_custom", "gred_simfphys_m247_custom",
	"gred_simfphys_zsu234shilka_custom", "gred_simfphys_zsu572_custom",
}

-- Перепроверка после правок: машины, у которых что-то было не так, и одна Луны со стрелком
local FIX = {
	"sim_fphys_m_atv_mg", "gred_simfphys_sdkfz221_custom",
}

-- Авиация для перепроверки после правок: A-10 (заходы с 8000, префайр по скрывшейся цели), Ми-24В
-- (стрелок GD), Ка-50 (лётчик: пушка и ракеты)
local AIRFIX = {"gred_lfs_a10", "gd_lfs_mi24v", "lfs_grdn_ka50"}
-- debugaim: один вертолёт со стрелком и подробный журнал наведения
local AIMDEBUG = {"gd_lfs_mi8amtsh", "gd_lfs_mi24v"}
local GROUNDDEBUG = {"simfphys_btr80", "gred_simfphys_marder1a1_ifv_custom"}
-- long: цель в 5000–7000 — пушки Гредвича и Луны, поправка на падение снаряда (ShellDrop)
local LONG = {"gred_simfphys_t72b3_custom", "gred_simfphys_leopard2a6_custom", "sim_fphys_tank", "simfphys_btr80a"}

-- Что гонять: air / ground (или всё) и половина списка: 1 — нечётные, 2 — чётные (две копии игры);
-- fix / airfix — ещё и список FIX / AIRFIX целиком (без деления на половины)
local only = T.only or {}
local LIST = {}
local anyList = only["air"] or only["ground"] or only["fix"] or only["airfix"] or only["debugaim"] or only["debugground"] or only["long"]
if only["air"] or not anyList then for _, c in ipairs(AIR) do LIST[#LIST + 1] = c end end
if only["ground"] or not anyList then for _, c in ipairs(GROUND) do LIST[#LIST + 1] = c end end
local part = only["2"] and 0 or (only["1"] and 1 or nil)
-- prefire: через 18 с боя цель накрывается кубом (как будто зашла в дом) — пишем, сколько выстрелов
-- и ракет ушло туда, где её видели, и сколько попаданий
local PREFIRE = only["prefire"]
local CLASSES = {}
for i, c in ipairs(LIST) do
	if part == nil or i % 2 == part then CLASSES[#CLASSES + 1] = c end
end
if only["fix"] then for _, c in ipairs(FIX) do CLASSES[#CLASSES + 1] = c end end
if only["airfix"] then for _, c in ipairs(AIRFIX) do CLASSES[#CLASSES + 1] = c end end
if only["debugaim"] then for _, c in ipairs(AIMDEBUG) do CLASSES[#CLASSES + 1] = c end end
if only["debugground"] then for _, c in ipairs(GROUNDDEBUG) do CLASSES[#CLASSES + 1] = c end end
if only["long"] then for _, c in ipairs(LONG) do CLASSES[#CLASSES + 1] = c end end

T.section("common")

step(0, function()
	log("start (scan), map=" .. game.GetMap() .. ", classes " .. #CLASSES)
	S.host = player.GetHumans()[1]
	PR_Patrol.NextSpawn = math.huge
	RunConsoleCommand("ai_ignoreplayers", "1")
	RunConsoleCommand("bot")
end)

waitFor(5, function() return IsValid(player.GetBots()[1]) end, "target bot")

step(0, function()
	S.b1 = player.GetBots()[1]
	if IsValid(S.b1) then S.b1:GodEnable() end
	-- moving: цель бегает боком к машине туда-обратно (смена каждые 3 с) — проверка упреждения;
	-- nolead — то же без упреждения у наземки (сравнить)
	PR_Patrol.NoGroundLead = only["nolead"] and true or nil
	if only["moving"] then
		hook.Add("StartCommand", "PR_SelftestScanMove", function(ply, cmd)
			if ply ~= S.b1 or not (S.cur and IsValid(S.cur.ent)) or IsValid(ply:GetVehicle()) then return end
			cmd:ClearMovement()
			cmd:SetViewAngles((S.cur.ent:GetPos() - ply:GetPos()):Angle())
			cmd:SetSideMove(math.floor(CurTime() / 3) % 2 == 0 and 400 or -400)
			cmd:SetButtons(IN_SPEED)
		end)
	end
	local pts = T.findLine({S.host:GetPos()})
	check("found a walkable line", pts ~= nil)
	if not pts then return end
	S.linePts = pts
	S.spotA = PR_Patrol.AddSpot(pts[1], "Скан-А")
	S.spotB = PR_Patrol.AddSpot(pts[2], "Скан-Б")
	S.spotC = PR_Patrol.AddSpot(pts[3], "Скан-В")
	S.host:SetPos(pts[1] + (pts[1] - pts[3]):GetNormalized() * 600 + Vector(0, 0, 5))

	-- Счётчики по текущей машине
	local function mine(e)
		local c = S.cur
		if not c or not IsValid(e) then return false end
		if e == c.ent then return true end
		if e:IsPlayer() and e.PR_PatrolCrew == c.entry then return true end
		if e.PR_Real then return mine(e.PR_Real) end
		local parent = e:GetParent()
		return IsValid(parent) and parent == c.ent
	end
	S.mine = mine
	-- Насколько ствол смотрит мимо цели (градусы между выстрелом и направлением на середину цели)
	local function aimErr(pos, dir)
		local c = S.cur
		if not (c and isvector(pos) and isvector(dir) and IsValid(S.b1)) then return end
		local to = (S.b1:WorldSpaceCenter() - pos):GetNormalized()
		local d = dir:GetNormalized()
		local deg = math.deg(math.acos(math.Clamp(d:Dot(to), -1, 1)))
		c.aimN, c.aimSum, c.aimMin = c.aimN + 1, c.aimSum + deg, math.min(c.aimMin, deg)
	end
	if istable(gred) and not gred.PR_ScanWrapped then
		gred.PR_ScanWrapped = true
		local createBullet, startShooting = gred.CreateBullet, gred.TankStartShooting
		gred.CreateBullet = function(ply, pos, ang, cal, filter, ...)
			local c = S.cur
			if c then
				local real = istable(ply) and ply.PR_Real or ply
				if mine(real) or filter == c.ent or (istable(filter) and (filter[1] == c.ent or filter[c.ent])) then
					c.bullets = c.bullets + 1
					aimErr(pos, isangle(ang) and ang:Forward() or ang)
				end
			end
			return createBullet(ply, pos, ang, cal, filter, ...)
		end
		if isfunction(startShooting) then
			gred.TankStartShooting = function(vehicle, ...)
				if S.cur and vehicle == S.cur.ent then S.cur.cannon = S.cur.cannon + 1 end
				return startShooting(vehicle, ...)
			end
		end
	end
	hook.Add("EntityFireBullets", "PR_SelftestScan", function(e, data)
		if S.cur and mine(e) then
			S.cur.hitscan = S.cur.hitscan + 1
			aimErr(data.Src, data.Dir)
		end
	end)
	local function projMine(e)
		local c = S.cur
		return mine(e:GetOwner()) or mine(e.Owner) or (IsValid(c.ent) and e:GetPos():Distance(c.ent:GetPos()) < 600)
	end
	local function countProj(e)
		e.PR_ScanMine = true
		S.cur.proj = S.cur.proj + 1
		S.cur.projClass[e:GetClass()] = true
	end
	hook.Add("OnEntityCreated", "PR_SelftestScan", function(e)
		if not S.cur then return end
		local cls = e:GetClass()
		if cls:find("logic_", 1, true) or cls:find("phys_", 1, true) then return end
		if not (cls:find("rocket") or cls:find("missile") or cls:find("shell") or cls:find("projectile") or cls:find("bomb")) then return end
		e.PR_ScanBorn = CurTime()
		timer.Simple(0, function()
			if not (IsValid(e) and S.cur) or e.PR_ScanChecked then return end
			e.PR_ScanChecked = true
			if projMine(e) then countProj(e) end
		end)
	end)
	-- Куда долетел снаряд: расстояние от места, где он исчез (взорвался), до цели
	hook.Add("EntityRemoved", "PR_SelftestScan", function(e)
		local c = S.cur
		if not (c and e.PR_ScanBorn and IsValid(S.b1)) then return end
		if not e.PR_ScanChecked then
			-- Взорвался в тот же тик, что появился (например, о свою же машину)
			e.PR_ScanChecked = true
			if not projMine(e) then return end
			countProj(e)
			c.projInstant = c.projInstant + 1
		end
		if not e.PR_ScanMine then return end
		local d = e:GetPos():Distance(S.b1:GetPos())
		c.missN, c.missSum, c.missMin = c.missN + 1, c.missSum + d, math.min(c.missMin, d)
		-- long: где разорвался снаряд и что там (снаряд Leopard рвался в 1500 от танка)
		if only["long"] and IsValid(c.ent) then
			local pos, vel = e:GetPos(), e:GetVelocity()
			local tr = util.TraceLine({start = pos - vel * 0.05, endpos = pos + vel * 0.05, filter = e})
			local near = {}
			for _, n in ipairs(ents.FindInSphere(pos, 150)) do
				if n ~= e and #near < 4 then near[#near + 1] = n:GetClass() end
			end
			log(string.format("SHELL END %s from tank %d to target %d h=%d hit=%s near=%s", c.class, pos:Distance(c.ent:GetPos()), d,
				pos.z - c.ent:GetPos().z, tostring(tr.Entity), table.concat(near, ",")))
		end
	end)
	hook.Add("EntityTakeDamage", "PR_SelftestScan", function(victim, dmg)
		-- moving: попадание по джипу с целью — тоже попадание
		local jeep = S.moveVeh
		local inJeep = IsValid(jeep) and (victim == jeep or victim:GetParent() == jeep or (isfunction(victim.GetBaseEnt) and victim:GetBaseEnt() == jeep))
		if not (S.cur and (victim == S.b1 or inJeep)) then return end
		if mine(dmg:GetAttacker()) or mine(dmg:GetInflictor()) then S.cur.hits = S.cur.hits + 1 end
		-- Любой урон по цели и от кого (пули без хозяина пишутся на мир)
		S.cur.anyHits = S.cur.anyHits + 1
		local att = dmg:GetAttacker()
		S.cur.anyFrom[IsValid(att) and att:GetClass() or tostring(att)] = true
	end)
	hook.Add("OnLuaError", "PR_SelftestScan", function(err)
		if S.cur and #S.cur.errors < 3 then table.insert(S.cur.errors, (tostring(err):gsub("\n.*", ""))) end
	end)
	hook.Add("Think", "PR_SelftestScan", function()
		-- Бессмертного бота-цель взрывы подбрасывали в воздух (живой игрок бы погиб) — вертолёт
		-- переходил на «воздушную цель» и уходил на 4000. Возвращаем его на место
		if S.cur and IsValid(S.b1) and S.b1Pos and S.b1:GetPos():DistToSqr(S.b1Pos) > 60 * 60 then
			S.b1:SetPos(S.b1Pos)
			S.b1:SetVelocity(-S.b1:GetVelocity())
		end
		local c = S.cur
		if not (c and IsValid(c.ent)) or CurTime() < (c.nextSample or 0) then return end
		c.nextSample = CurTime() + 0.5
		local e = c.ent
		c.moved = math.max(c.moved, e:GetPos():Distance(c.startPos))
		local tr = util.TraceLine({start = e:WorldSpaceCenter(), endpos = e:WorldSpaceCenter() - Vector(0, 0, 20000), filter = e, mask = MASK_SOLID_BRUSHONLY})
		local h = e:WorldSpaceCenter().z - tr.HitPos.z
		c.maxH = math.max(c.maxH, h)
		c.minUp = math.min(c.minUp, e:GetUp().z)
		-- moving: джип с целью едет по кругу
		local jeep = S.moveVeh
		if IsValid(jeep) and IsValid(jeep:GetDriver()) then
			if isfunction(jeep.EngineActive) and not jeep:EngineActive() and isfunction(jeep.StartEngine) then jeep:StartEngine() end
			jeep.PressedKeys = jeep.PressedKeys or {}
			jeep.PressedKeys["W"], jeep.PressedKeys["A"], jeep.PressedKeys["Space"] = true, true, false
		end
		-- Сколько цель на самом деле прошла и с какой скоростью, по её словам (moving)
		if IsValid(S.b1) then
			local bp = S.b1:GetPos()
			if c.tLast then c.tPath = (c.tPath or 0) + bp:Distance(c.tLast) end
			c.tLast = bp
			c.tVelSum, c.tVelN = (c.tVelSum or 0) + S.b1:GetVelocity():Length(), (c.tVelN or 0) + 1
		end
		local state = tostring(c.entry.driveState or c.entry.airMode)
		state = state:match("^[%a ]+") or state
		if not c.states[state] and table.Count(c.states) < 6 then c.states[state] = true end
		local crew = 0
		for _, bot in pairs(c.entry.crew or {}) do if IsValid(bot) and IsValid(bot:GetVehicle()) then crew = crew + 1 end end
		c.crewMax = math.max(c.crewMax, crew)

		-- debugaim: раз в секунду — куда смотрит стрелок, куда хотим и куда смотрит ствол
		if (only["debugaim"] or only["debugground"] or only["long"]) and CurTime() > (c.nextAimLog or 0) then
			c.nextAimLog = CurTime() + 1
			local en = c.entry
			-- Наземка: куда просим, куда смотрит ствол (по прицелу аддона), где башня, поправка
			if c.kind == "ground" and en.aimAng then
				local function A(a) return a and string.format("%.1f %.1f", a.p, a.y) or "-" end
				local att = en.muzzleId and e:GetAttachment(en.muzzleId)
				local real
				if att then
					local dir = Vector(en.crossDir or Vector(1, 0, 0))
					dir:Rotate(att.Ang)
					real = dir:Angle()
				end
				local toT = att and IsValid(S.b1) and (S.b1:WorldSpaceCenter() - att.Pos):Angle()
				local asked = e:WorldToLocalAngles(en.aimAng)
				log(string.format("GAIM %s want=%s fix=%s real=%s toTarget=%s asked(local)=%s pp=%s %s cross=%s fire=%s %s",
					c.class, A(en.aimAng), A(en.aimFix), A(real), A(toT), A(asked), tostring(e.sm_pp_pitch), tostring(e.sm_pp_yaw),
					tostring(en.crossDir), tostring(en.fire), tostring(en.aimDebug)))
			end
			if IsValid(S.b1) and c.kind ~= "ground" then
				local tpos = S.b1:GetPos()
				local flat = Vector(tpos.x - e:GetPos().x, tpos.y - e:GetPos().y, 0)
				log(string.format("AIR %s mode=%s dist=%d h=%d yawToTarget=%d hidden=%s seenAgo=%s left=%s rockets=%s fire=%s",
					c.class, tostring(en.airMode), flat:Length(), e:GetPos().z - tpos.z,
					math.AngleDifference(flat:Angle().y, e:GetAngles().y), tostring(en.prefireHidden),
					en.pilotSeenAt and string.format("%.1f", CurTime() - en.pilotSeenAt) or "-", tostring(en.prefireLeft),
					tostring(en.prefireShots), tostring(en.pilotDebug)))
			end
			local gunner = c.entry.crew and c.entry.crew[1]
			local seat = IsValid(gunner) and gunner:GetVehicle()
			if IsValid(seat) and c.entry.aimAng then
				local function A(a) return a and string.format("%d %d %d", a.p, a.y, a.r) or "-" end
				local muzzle = e:LookupAttachment("muzzle")
				if not muzzle or muzzle <= 0 then muzzle = 1 end
				local att = muzzle and muzzle > 0 and e:GetAttachment(muzzle)
				local toTarget = IsValid(S.b1) and att and (S.b1:WorldSpaceCenter() - att.Pos):Angle()
				local tpos = IsValid(S.b1) and S.b1:GetPos() or e:GetPos()
				local flat = Vector(e:GetPos().x - tpos.x, e:GetPos().y - tpos.y, 0):Length()
				local stand = c.entry.standPos and e:GetPos():Distance(c.entry.standPos) or -1
				log(string.format("AIM %s want=%s muzzle=%s toTarget=%s heli=%s bone1=%s bone2=%s dist=%d h=%d stand=%d fire=%s %s",
					c.class, A(c.entry.aimAng), A(att and att.Ang), A(toTarget), A(e:GetAngles()),
					A(e:GetManipulateBoneAngles(1)), A(e:GetManipulateBoneAngles(2)), flat, e:GetPos().z - tpos.z, stand,
					tostring(c.entry.fire), tostring(c.entry.aimDebug)))
			end
		end

		-- far: журнал езды раз в 2 с — расстояние до цели, видно ли её, что решил водитель
		if only["far"] and c.kind == "ground" and IsValid(S.b1) and CurTime() > (c.nextDriveLog or 0) then
			c.nextDriveLog = CurTime() + 2
			local en = c.entry
			local keys = e.PressedKeys or {}
			local slope = e:GetForward():Angle().p
			log(string.format("DRIVE %s dist=%d seenAgo=%s hunt=%s state=%s speed=%d fwd=%s keys=%s%s%s brake=%s hb=%s friction=%s hbp=%s gear=%s rpm=%s throttle=%s slope=%.0f", c.class,
				Vector(e:GetPos().x - S.b1:GetPos().x, e:GetPos().y - S.b1:GetPos().y, 0):Length(),
				en.seenAt and string.format("%.1f", CurTime() - en.seenAt) or "-", tostring(en.huntUntil and en.huntUntil > CurTime()),
				tostring(en.driveState), e:GetVelocity():Length(), tostring(e.ForwardSpeed and math.Round(e.ForwardSpeed)),
				keys.W and "W" or "-", keys.S and "S" or "-", keys.Space and "_" or "-",
				tostring(e.Brake and math.Round(e.Brake)), tostring(e.HandBrake and math.Round(e.HandBrake)), tostring(e.PhysicsEnabled),
				tostring(e.HandBrakePower and math.Round(e.HandBrakePower)), tostring(e.CurrentGear), tostring(e.EngineRPM and math.Round(e.EngineRPM)),
				tostring(isfunction(e.GetThrottle) and math.Round(e:GetThrottle(), 2)), slope))
		end

		-- Камера наблюдателя (pr_selftest_cl.lua): за какой машиной лететь и что писать сверху
		if IsValid(S.host) then
			net.Start("PR_SELFTEST_WATCH")
				net.WriteUInt(e:EntIndex(), 16)
				net.WriteUInt(IsValid(S.b1) and S.b1:EntIndex() or 0, 16)
				net.WriteString(string.format("Скан %d/%d: %s (%s)", S.scanIndex or 0, #CLASSES, c.class, tostring(c.kind)))
				net.WriteString(string.format("экипаж %d · пули %d · снаряды %d · ракеты %d · попаданий %d · %s",
					crew, c.bullets + c.hitscan, c.cannon, c.proj, c.hits, state))
			net.Send(S.host)
		end
	end)
	-- Машина и цель улетают далеко от игрока — пусть всё равно приходят клиенту (камера их видит)
	hook.Add("SetupPlayerVisibility", "PR_SelftestScan", function(ply)
		if ply ~= S.host then return end
		local c = S.cur
		if c and IsValid(c.ent) then AddOriginToPVS(c.ent:WorldSpaceCenter()) end
		if IsValid(S.b1) then AddOriginToPVS(S.b1:WorldSpaceCenter()) end
	end)
	if IsValid(S.host) then
		S.host:ChatPrint("Камера летит за техникой: мышь — вращать, колёсико — ближе/дальше. pr_scan_cam в консоли — свободный полёт (V — noclip)")
	end
end)

-- Два снимка машины: сбоку и сверху-сзади (как видит игрок рядом)
local function TwoShots(ent, name)
	if not (IsValid(ent) and IsValid(S.host)) then return end
	S.host:SetEyeAngles(Angle(12, ent:GetAngles().y + 90, 0))
	timer.Simple(0.5, function()
		if not IsValid(S.host) then return end
		net.Start("PR_SELFTEST_SHOT") net.WriteString(name .. "_side") net.Send(S.host)
		timer.Simple(0.5, function()
			if not (IsValid(S.host) and IsValid(ent)) then return end
			S.host:SetEyeAngles(Angle(35, ent:GetAngles().y + 30, 0))
			timer.Simple(0.5, function()
				if not IsValid(S.host) then return end
				net.Start("PR_SELFTEST_SHOT") net.WriteString(name .. "_top") net.Send(S.host)
			end)
		end)
	end)
end

-- Состояние колёс simfphys: повреждено ли, есть ли видимая модель колеса и как она нарисована
local function WheelState(veh)
	local out = {}
	for i, w in ipairs(IsValid(veh) and veh.Wheels or {}) do
		if IsValid(w) then
			local g = w.GhostEnt
			table.insert(out, string.format("%d:dmg=%s ghost=%s mdl=%s a=%d nodraw=%s pos=%d", i, tostring(isfunction(w.GetDamaged) and w:GetDamaged()),
				tostring(IsValid(g)), IsValid(g) and tostring(g:GetModel()):match("[^/]+$") or "-", IsValid(g) and g:GetColor().a or -1,
				tostring(IsValid(g) and g:GetNoDraw()), IsValid(g) and g:GetPos():Distance(w:GetPos()) or -1))
		end
	end
	return table.concat(out, " | ")
end

local function exists(class)
	return list.Get("simfphys_vehicles")[class] ~= nil or scripted_ents.GetStored(class) ~= nil
end

-- plain: та же машина, заспавненная обычным способом (без патруля и ботов), и снимок — сравнить,
-- наша ли беда (колёса-коробки у Sd.Kfz.221) или самого аддона
local PLAIN = {"gred_simfphys_sdkfz221_custom"}
if only["plain"] then
	CLASSES = {}
	for _, class in ipairs(PLAIN) do
		step(0, function()
			if not (S.linePts and simfphys and isfunction(simfphys.SpawnVehicleSimple)) then return end
			S.plain = simfphys.SpawnVehicleSimple(class, S.linePts[1] + Vector(0, 0, 40), Angle(0, 137, 0))
			log("PLAIN " .. class .. " spawned " .. tostring(IsValid(S.plain)))
		end)
		step(1, function()
			if not (IsValid(S.plain) and IsValid(S.host)) then return end
			net.Start("PR_SELFTEST_WATCH")
				net.WriteUInt(S.plain:EntIndex(), 16)
				net.WriteUInt(0, 16)
				net.WriteString("Обычный спавн: " .. class)
				net.WriteString("")
			net.Send(S.host)
		end)
		step(1, function() TwoShots(S.plain, "plain2s_" .. class) end)
		step(5, function()
			log("WHEELS plain " .. class .. " " .. WheelState(S.plain))
			TwoShots(S.plain, "plain8s_" .. class)
		end)
		step(3, function() end)
		-- Тот же обычный спавн, но с водителем-ботом и заведённым мотором (как у патруля)
		step(1, function()
			if not IsValid(S.plain) then return end
			S.plainBot = player.CreateNextBot("Водитель")
			local seat = isfunction(S.plain.GetDriverSeat) and S.plain:GetDriverSeat()
			if IsValid(S.plainBot) and IsValid(seat) then S.plainBot:EnterVehicle(seat) end
		end)
		step(2, function()
			log("PLAIN " .. class .. " driver " .. tostring(IsValid(S.plainBot) and IsValid(S.plainBot:GetVehicle())))
		end)
		step(6, function()
			log("WHEELS plaindriver " .. class .. " " .. WheelState(S.plain))
			TwoShots(S.plain, "plaindriver_" .. class)
		end)
		step(3, function()
			-- Как в бою у патруля: ручник каждый тик (PressedKeys.Space)
			hook.Add("Think", "PR_SelftestPlainKeys", function()
				if not IsValid(S.plain) then return end
				S.plain.PressedKeys = S.plain.PressedKeys or {}
				S.plain.PressedKeys["Space"] = true
			end)
		end)
		step(6, function()
			TwoShots(S.plain, "plainbrake_" .. class)
		end)
		step(3, function()
			hook.Remove("Think", "PR_SelftestPlainKeys")
			if IsValid(S.plain) then
				-- Не {}: там и служебные клавиши джойстика, без них simfphys падает в руле
				S.plain.PressedKeys["Space"] = false
				S.plain:SetNWBool("TurretSafeMode", false)
				S.plain.ForceTransmission = 1
				if isfunction(S.plain.StartEngine) then S.plain:StartEngine() end
			end
		end)
		step(6, function()
			TwoShots(S.plain, "plainengine_" .. class)
		end)
		step(3, function() end)
		step(1, function()
			if IsValid(S.plainBot) then S.plainBot:Kick("plain test") end
			if IsValid(S.plain) then S.plain:Remove() end
		end)
	end
end

for _, class in ipairs(CLASSES) do
	local air = string.find(class, "lfs_", 1, true) ~= nil
	step(0, function()
		S.cur = nil
		S.scanIndex = (S.scanIndex or 0) + 1
		if not exists(class) then log("SCAN " .. class .. " | нет в игре") return end
		local key = PR_Patrol.SaveType(nil, {
			name = "Скан",
			leader = {name = "Решала", class = {"npc_vj_mishawild_reshala1"}, weapons = {"weapon_vj_meft_reshala_ak101"}, health = 600},
			vehicles = {{name = "Скан", class = {class}, count = 1, crew = 2, reward = {money = 1, exp = 1}}}
		})
		if not key then log("SCAN " .. class .. " | тип не сохранился") return end
		local patrol = PR_Patrol.Spawn(key, S.spotA)
		local entry = patrol and patrol.vehicles[1]
		if not (entry and IsValid(entry.ent)) then
			log("SCAN " .. class .. " | не появилась")
			if patrol then PR_Patrol.Remove(patrol) end
			PR_Patrol.DeleteType(key)
			return
		end
		patrol.lingerUntil = CurTime() + 600
		local e = entry.ent
		-- shots: снимок машины, когда камера уже рядом (видно, все ли колёса и детали на месте)
		if only["shots"] then
			-- Сразу после появления и через 8 с
			timer.Simple(2, function()
				if S.cur and S.cur.ent == e then TwoShots(e, "scan2s_" .. class) end
			end)
			timer.Simple(8, function()
				if not (IsValid(S.host) and S.cur and S.cur.ent == e) then return end
				log("WHEELS patrol " .. class .. " " .. WheelState(e))
				TwoShots(e, "scan8s_" .. class)
			end)
		end
		-- Сколько раз ИИ нажал огонь лётчика (PrimaryAttack/SecondaryAttack самой машины)
		local calls = {}
		for _, fn in ipairs({"PrimaryAttack", "SecondaryAttack"}) do
			local orig = e[fn]
			if isfunction(orig) then
				e[fn] = function(self, ...)
					calls[fn] = (calls[fn] or 0) + 1
					return orig(self, ...)
				end
			end
		end
		local seats = 0
		if isfunction(e.GetDriverSeat) and IsValid(e:GetDriverSeat()) then seats = seats + 1 end
		for _, s in pairs(e.pSeat or {}) do if IsValid(s) then seats = seats + 1 end end
		if isfunction(e.GetPassengerSeats) then seats = math.max(seats, #(e:GetPassengerSeats() or {}) + 1) end
		S.cur = {class = class, key = key, patrol = patrol, entry = entry, ent = e, startPos = e:GetPos(), seats = seats,
			bullets = 0, cannon = 0, hitscan = 0, proj = 0, projClass = {}, hits = 0, errors = {}, states = {},
			moved = 0, maxH = 0, minUp = 1, crewMax = 0, kind = entry.kind, calls = calls,
			aimN = 0, aimSum = 0, aimMin = 180, missN = 0, missSum = 0, missMin = math.huge, projInstant = 0,
			anyHits = 0, anyFrom = {}, assist0 = {PR_Patrol.AssistStats and PR_Patrol.AssistStats.tries or 0, PR_Patrol.AssistStats and PR_Patrol.AssistStats.done or 0},
			ammo0 = {isfunction(e.GetAmmoPrimary) and e:GetAmmoPrimary(), isfunction(e.GetAmmoSecondary) and e:GetAmmoSecondary()}}
		-- Цель: пеший бот на открытом месте (для земли — в 1200 от машины)
		if IsValid(S.b1:GetVehicle()) then S.b1:ExitVehicle() end
		-- far: цель далеко (дальше, чем бьёт пулемёт) — проверяем, подъедет ли машина на дальность огня
		local p = air and (T.openPointNear(PR_Patrol.Center(patrol) or e:GetPos()) or e:GetPos())
			or (only["far"] and (T.openFirePoint(e:GetPos(), 4500) or T.openFirePoint(e:GetPos(), 3800)))
			-- long без открытой дальней точки — цель вплотную к машине (а не за домом в 900, как было у Tiger)
			or (only["long"] and (T.openFirePoint(e:GetPos(), 7000) or T.openFirePoint(e:GetPos(), 6000) or T.openFirePoint(e:GetPos(), 5000)
				or T.openFirePoint(e:GetPos(), 600) or e:GetPos() + e:GetForward() * 500))
			or (T.openFirePoint(e:GetPos(), 1200) or T.openFirePoint(e:GetPos(), 900) or e:GetPos() + Vector(900, 0, 0))
		S.b1:SetPos(p + Vector(0, 0, 5))
		S.b1Pos = p + Vector(0, 0, 5)
		S.cur.dist0 = Vector(e:GetPos().x - p.x, e:GetPos().y - p.y, 0):Length()
		entry.forceTarget = S.b1
		-- moving: цель — бот в джипе, который ездит кругами (газ и руль влево — в Think)
		if only["moving"] and simfphys and isfunction(simfphys.SpawnVehicleSimple) then
			if IsValid(S.moveVeh) then S.moveVeh:Remove() end
			local jeep = simfphys.SpawnVehicleSimple("sim_fphys_hmmwv2", p + Vector(0, 0, 50), Angle(0, math.random(0, 359), 0))
			S.moveVeh = jeep
			-- Как у машин патруля: у бота нет клиентских настроек — автомат, иначе стоит на нейтрали
			if IsValid(jeep) then jeep.ForceTransmission = 1 end
			timer.Simple(1, function()
				if IsValid(jeep) and IsValid(S.b1) and isfunction(jeep.GetDriverSeat) and IsValid(jeep:GetDriverSeat()) then
					S.b1:EnterVehicle(jeep:GetDriverSeat())
					-- Неубиваемый: скан длится 40 с, а автопушка разбирает джип за пару секунд
					if isfunction(jeep.SetMaxHealth) then jeep:SetMaxHealth(1e8) end
					if isfunction(jeep.SetCurHealth) then jeep:SetCurHealth(1e8) end
				end
			end)
		end
	end)

	if PREFIRE then
		step(18, function()
			local c = S.cur
			if not (c and IsValid(S.b1)) then return end
			c.hitsSeen, c.shotsSeen = c.hits, c.bullets + c.cannon + c.hitscan + c.proj
			PR_Patrol.VisibleMask = MASK_SOLID
			-- «Домик» из плит вокруг бота: стены и крыша, бота не касаются (сплошной куб его
			-- выталкивал и подбрасывал, а «обломок» проверка видимости не замечала)
			local base = S.b1:GetPos()
			S.box = {}
			for _, part in ipairs({
				{Vector(0, 0, 200), Angle(0, 0, 0)},
				{Vector(100, 0, 95), Angle(90, 0, 0)}, {Vector(-100, 0, 95), Angle(90, 0, 0)},
				{Vector(0, 100, 95), Angle(90, 90, 0)}, {Vector(0, -100, 95), Angle(90, 90, 0)},
			}) do
				local plate = ents.Create("prop_physics")
				plate:SetModel("models/hunter/plates/plate4x4.mdl")
				plate:SetPos(base + part[1])
				plate:SetAngles(part[2])
				plate:Spawn()
				local phys = plate:GetPhysicsObject()
				if IsValid(phys) then phys:EnableMotion(false) end
				table.insert(S.box, plate)
			end
		end)
	end

	step(PREFIRE and (air and 22 or 14) or (air and 35 or (only["long"] and 40 or 25)), function()
		local c = S.cur
		if not c then return end
		for _, plate in ipairs(S.box or {}) do if IsValid(plate) then plate:Remove() end end
		S.box = nil
		PR_Patrol.VisibleMask = nil
		local e = c.ent
		local ammo = "-"
		if IsValid(e) and c.ammo0[1] then
			ammo = string.format("%s→%s/%s→%s", tostring(c.ammo0[1]), tostring(e:GetAmmoPrimary()), tostring(c.ammo0[2]), tostring(isfunction(e.GetAmmoSecondary) and e:GetAmmoSecondary()))
		end
		local alive = IsValid(e) and not c.entry.dead
		local aim = c.aimN > 0 and string.format("%.1f/%.1f°", c.aimSum / c.aimN, c.aimMin) or "-"
		local st = PR_Patrol.AssistStats or {tries = 0, done = 0}
		local extra = string.format(" assist=%d/%d any=%d(%s)", st.done - c.assist0[2], st.tries - c.assist0[1], c.anyHits,
			table.concat(table.GetKeys(c.anyFrom), ","))
		if c.hitsSeen then
			extra = extra .. string.format(" | PREFIRE rockets=%d shots=%d hits=%d", c.entry.prefireShots or 0,
				c.bullets + c.cannon + c.hitscan + c.proj - c.shotsSeen, c.hits - c.hitsSeen)
		end
		local miss = c.missN > 0 and string.format("%d/%d", c.missSum / c.missN, c.missMin) or "-"
		if IsValid(e) and IsValid(S.b1) then
			extra = extra .. string.format(" | dist to target %d -> %d", c.dist0 or -1, Vector(e:GetPos().x - S.b1:GetPos().x, e:GetPos().y - S.b1:GetPos().y, 0):Length())
		end
		-- Замер падения снаряда: тип → дальность:падение (через 1000)
		for key, tab in pairs(c.entry.dropTables or {}) do
			local parts = {}
			for b = 4, 40, 4 do
				if tab[b] then parts[#parts + 1] = string.format("%d:%d", b * 250, tab[b]) end
			end
			extra = extra .. string.format(" | DROP %s %s", key, table.concat(parts, " "))
		end
		if c.entry.shellDropNow then extra = extra .. string.format(" | aim drop now %d", c.entry.shellDropNow) end
		if c.entry.leadDebug then extra = extra .. string.format(" | lead %d", c.entry.leadDebug) end
		if c.tVelN and c.tVelN > 0 then
			extra = extra .. string.format(" | target walked %d, said speed %d", c.tPath or 0, c.tVelSum / c.tVelN)
		end
		if c.entry.shellSpeeds and c.entry.shellKey and c.entry.shellSpeeds[c.entry.shellKey] then
			extra = extra .. string.format(" | shell speed %d", c.entry.shellSpeeds[c.entry.shellKey])
		end
		if c.entry.shellFix then extra = extra .. string.format(" | barrel fix %.2f %.2f", c.entry.shellFix.p, c.entry.shellFix.y) end
		log(string.format("SCAN %s | %s | alive=%s crew=%d/%d | moved=%d maxH=%d minUp=%.2f | bullets=%d cannon=%d hitscan=%d proj=%d%s ammo=%s | hits=%d | aim(avg/min)=%s miss(avg/min)=%s instant=%d calls=P%d/S%d | states=%s | errors=%s",
			c.class, tostring(c.kind), tostring(alive), c.crewMax, c.seats, c.moved, c.maxH, c.minUp,
			c.bullets, c.cannon, c.hitscan, c.proj, next(c.projClass) and "(" .. table.concat(table.GetKeys(c.projClass), ",") .. ")" or "",
			ammo, c.hits, aim, miss, c.projInstant, c.calls.PrimaryAttack or 0, c.calls.SecondaryAttack or 0,
			table.concat(table.GetKeys(c.states), ","), #c.errors > 0 and table.concat(c.errors, " || ") or "-") .. extra)
		S.cur = nil
		if IsValid(S.moveVeh) then
			if IsValid(S.b1) and IsValid(S.b1:GetVehicle()) then S.b1:ExitVehicle() end
			S.moveVeh:Remove()
		end
		if c.patrol then PR_Patrol.Remove(c.patrol) end
		PR_Patrol.DeleteType(c.key)
		for _, g in ipairs(ents.FindByClass("gmod_sent_vehicle_fphysics_gib")) do g:Remove() end
	end)

	step(1.5, function() end)
end

step(0, function()
	for _, h in ipairs({"EntityFireBullets", "OnEntityCreated", "EntityRemoved", "EntityTakeDamage", "OnLuaError", "Think", "SetupPlayerVisibility"}) do hook.Remove(h, "PR_SelftestScan") end
	if IsValid(S.host) then
		net.Start("PR_SELFTEST_WATCH")
			net.WriteUInt(0, 16)
			net.WriteUInt(0, 16)
			net.WriteString("Скан закончен")
			net.WriteString("")
		net.Send(S.host)
	end
	PR_Patrol.ClearAll()
	for _, id in ipairs({S.spotA, S.spotB, S.spotC}) do if id then PR_Patrol.RemoveSpot(id) end end
	RunConsoleCommand("ai_ignoreplayers", "0")
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
