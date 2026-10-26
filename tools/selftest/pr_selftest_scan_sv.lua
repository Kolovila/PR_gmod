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
	"gred_simfphys_2s6tunguska_late_custom", "gred_simfphys_gazaa_dshk_custom", "simfphys_btr80", "simfphys_btr80a",
	"sim_fphys_m_atv_mg", "gred_simfphys_t72b3_custom", "wt_king_tiger",
}

-- Вертолёты для перепроверки после правок: Ми-8 с бортовыми пулемётами (круги), Ми-24П (пушка лётчика),
-- Ка-50 и BO-105 (лётчик), Ми-24Д (турель Гордона)
local AIRFIX = {"gd_lfs_mi8mtv", "gd_lfs_mi8t2", "gd_lfs_mi8t1"}
-- debugaim: один вертолёт со стрелком и подробный журнал наведения
local AIMDEBUG = {"gd_lfs_mi8amtsh", "gd_lfs_mi24v"}

-- Что гонять: air / ground (или всё) и половина списка: 1 — нечётные, 2 — чётные (две копии игры);
-- fix / airfix — ещё и список FIX / AIRFIX целиком (без деления на половины)
local only = T.only or {}
local LIST = {}
local anyList = only["air"] or only["ground"] or only["fix"] or only["airfix"] or only["debugaim"]
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
	local pts = T.findLine({S.host:GetPos()})
	check("found a walkable line", pts ~= nil)
	if not pts then return end
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
	end)
	hook.Add("EntityTakeDamage", "PR_SelftestScan", function(victim, dmg)
		if not (S.cur and victim == S.b1) then return end
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
		local c = S.cur
		if not (c and IsValid(c.ent)) or CurTime() < (c.nextSample or 0) then return end
		c.nextSample = CurTime() + 0.5
		local e = c.ent
		c.moved = math.max(c.moved, e:GetPos():Distance(c.startPos))
		local tr = util.TraceLine({start = e:WorldSpaceCenter(), endpos = e:WorldSpaceCenter() - Vector(0, 0, 20000), filter = e, mask = MASK_SOLID_BRUSHONLY})
		local h = e:WorldSpaceCenter().z - tr.HitPos.z
		c.maxH = math.max(c.maxH, h)
		c.minUp = math.min(c.minUp, e:GetUp().z)
		local state = tostring(c.entry.driveState or c.entry.airMode)
		state = state:match("^[%a ]+") or state
		if not c.states[state] and table.Count(c.states) < 6 then c.states[state] = true end
		local crew = 0
		for _, bot in pairs(c.entry.crew or {}) do if IsValid(bot) and IsValid(bot:GetVehicle()) then crew = crew + 1 end end
		c.crewMax = math.max(c.crewMax, crew)

		-- debugaim: раз в секунду — куда смотрит стрелок, куда хотим и куда смотрит ствол
		if only["debugaim"] and CurTime() > (c.nextAimLog or 0) then
			c.nextAimLog = CurTime() + 1
			local en = c.entry
			if IsValid(S.b1) then
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

local function exists(class)
	return list.Get("simfphys_vehicles")[class] ~= nil or scripted_ents.GetStored(class) ~= nil
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
		local p = air and (T.openPointNear(PR_Patrol.Center(patrol) or e:GetPos()) or e:GetPos())
			or (T.openFirePoint(e:GetPos(), 1200) or T.openFirePoint(e:GetPos(), 900) or e:GetPos() + Vector(900, 0, 0))
		S.b1:SetPos(p + Vector(0, 0, 5))
		entry.forceTarget = S.b1
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

	step(PREFIRE and (air and 22 or 14) or (air and 35 or 25), function()
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
		log(string.format("SCAN %s | %s | alive=%s crew=%d/%d | moved=%d maxH=%d minUp=%.2f | bullets=%d cannon=%d hitscan=%d proj=%d%s ammo=%s | hits=%d | aim(avg/min)=%s miss(avg/min)=%s instant=%d calls=P%d/S%d | states=%s | errors=%s",
			c.class, tostring(c.kind), tostring(alive), c.crewMax, c.seats, c.moved, c.maxH, c.minUp,
			c.bullets, c.cannon, c.hitscan, c.proj, next(c.projClass) and "(" .. table.concat(table.GetKeys(c.projClass), ",") .. ")" or "",
			ammo, c.hits, aim, miss, c.projInstant, c.calls.PrimaryAttack or 0, c.calls.SecondaryAttack or 0,
			table.concat(table.GetKeys(c.states), ","), #c.errors > 0 and table.concat(c.errors, " || ") or "-") .. extra)
		S.cur = nil
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
