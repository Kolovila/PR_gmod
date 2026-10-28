-- Пехота патрулей: общий слой — что боец видит и слышит, что знает о враге, рация, подавление,
-- разброс, движение. Что и почему — docs/infantry.md; числа — config/infantry.lua.
-- Боец — npc_pr_soldier (VJ на плеермодели): VJ только целится, стреляет, перезаряжается и
-- анимирует; врага ему выдаём мы, когда боец его честно заметил.
-- Роли (этап 3) пока не различаются: «обычный» боец видит — стреляет, потерял — держит
-- направление и через время идёт проверять, осмотрел — возвращается в патруль.

include("config/infantry.lua")
util.AddNetworkString("PR_InfDebug")

PR_Inf = PR_Inf or {}
PR_Inf.Soldiers = PR_Inf.Soldiers or {}
local C = PR_INF

local LOS_MASK = MASK_BLOCKLOS   -- стены, пропы; сетка-рабица (GRATE) видимость не рвёт
local UP = Vector(0, 0, 36)

local function Rand(range) return math.Rand(range[1], range[2]) end

local function Gauss()
	local u, v = math.max(math.random(), 1e-6), math.random()
	return math.sqrt(-2 * math.log(u)) * math.cos(2 * math.pi * v)
end

local function Alive(e)
	return IsValid(e) and e:Health() > 0 and not e.Dead and (not e:IsPlayer() or e:Alive())
end

local function Eye(npc)
	local ok, eye = pcall(npc.EyePos, npc)
	return ok and eye or npc:GetPos() + Vector(0, 0, 60)
end

----------------------------------------------------------------------------------------------------
-- Кто кому враг: общий VJ-класс — свои (игроки получают класс своей группировки, sv_vj_compat.lua)
----------------------------------------------------------------------------------------------------
local function SharesClass(a, b)
	local ca, cb = a.VJ_NPC_Class, b.VJ_NPC_Class
	if not (istable(ca) and istable(cb)) then return false end
	for _, x in ipairs(ca) do
		if table.HasValue(cb, x) then return true end
	end
	return false
end

function PR_Inf.Hostile(npc, t)
	if not Alive(t) or t == npc then return false end
	if t:IsPlayer() then
		if t:GetNWBool("PR_PatrolCrew") or t:IsFlagSet(FL_NOTARGET) then return false end
		-- Ноклип в режиме только у админов (sv_sandbox.lua) — наблюдатель, не цель
		if t:GetMoveType() == MOVETYPE_NOCLIP and not t:InVehicle() then return false end
		local ig = GetConVar("ai_ignoreplayers")
		if ig and ig:GetBool() then return false end
	elseif not (t:IsNPC() and (t.PR_GuardPoint or t.PR_Brain or t.IsVJBaseSNPC)) then
		return false
	end
	return not SharesClass(npc, t)
end

-- Кого вообще можно увидеть: игроки и NPC с VJ-классом (защитники точек, бойцы других патрулей)
local function Candidates()
	local out = {}
	for _, p in ipairs(player.GetAll()) do out[#out + 1] = p end
	for _, n in ipairs(ents.FindByClass("npc_*")) do
		if n.PR_GuardPoint or n.PR_Brain then out[#out + 1] = n end
	end
	return out
end

----------------------------------------------------------------------------------------------------
-- Регистрация бойца
----------------------------------------------------------------------------------------------------
function PR_Inf.Register(npc)
	npc.PR_Brain = {
		contacts = {}, detect = {}, firedBy = {},
		supp = 0, knockUntil = 0, shot = 0, lastShot = 0, burstN = math.random(C.burst[1], C.burst[2]),
		state = "patrol", nextId = 0
	}
	npc.PR_Fire = true
	table.insert(PR_Inf.Soldiers, npc)
end

local function Brain(npc) return IsValid(npc) and npc.PR_Brain end

----------------------------------------------------------------------------------------------------
-- Метки врага (анонимные): {pos, r, t, src, vel, ent — только для слияния, seen}
----------------------------------------------------------------------------------------------------
local function FindContact(b, pos, r, now)
	local best, bestD
	for _, c in ipairs(b.contacts) do
		local d = c.pos:Distance(pos)
		local reach = math.max(c.r, C.sewSpeed * (now - c.t)) + r + 100
		if d <= reach and (not bestD or d < bestD) then best, bestD = c, d end
	end
	return best
end

-- Новое сведение: «видел» — точная точка; иначе сливаем с меткой (обратные дисперсии)
function PR_Inf.Learn(npc, pos, r, src, ent, vel)
	local b = Brain(npc)
	if not b then return end
	local now = CurTime()
	local c = FindContact(b, pos, r, now)
	if not c then
		b.nextId = b.nextId + 1
		c = {id = b.nextId, pos = pos, r = r, src = src, t = now, vel = vel or vector_origin, ent = ent, born = now}
		table.insert(b.contacts, c)
	elseif src == "seen" then
		c.pos, c.r = pos, r
	else
		local a2, n2 = c.r * c.r, r * r
		local w = a2 / (a2 + n2)
		c.pos = c.pos + (pos - c.pos) * w
		c.r = math.sqrt(a2 * n2 / (a2 + n2))
	end
	c.t, c.src = now, src
	if vel then c.vel = vel end
	if IsValid(ent) then c.ent = ent end
	if src == "seen" then c.seenAt, c.checkT = now, 0 end
	if src ~= "seen" then c.seen = false end
	return c
end

local function Forget(b, c)
	table.RemoveByValue(b.contacts, c)
end

-- Лучшая метка: свежая и узкая
local function BestContact(b)
	local best, bestS
	local now = CurTime()
	for _, c in ipairs(b.contacts) do
		local s = (now - c.t) + c.r / 200
		if not bestS or s < bestS then best, bestS = c, s end
	end
	return best
end
PR_Inf.BestContact = function(npc) local b = Brain(npc) return b and BestContact(b) end

----------------------------------------------------------------------------------------------------
-- Рация и голос: делиться меткой со своим патрулём
----------------------------------------------------------------------------------------------------
local function Squad(npc)
	local patrol = npc.PR_Patrol
	if not patrol then return {} end
	local out = {}
	for _, m in ipairs(patrol.members or {}) do
		if m ~= npc and Alive(m) and m.PR_Brain then out[#out + 1] = m end
	end
	return out
end

function PR_Inf.Report(npc, c)
	local patrol = npc.PR_Patrol
	if not patrol then return end
	local now = CurTime()
	local pos, r, ent = c.pos, c.r, c.ent
	local from = npc:GetPos()
	for _, m in ipairs(Squad(npc)) do
		local d = m:GetPos():Distance(from)
		if d <= C.voiceRadius then
			-- Голос: только сектор — широкий круг вокруг точки
			timer.Simple(Rand(C.voiceDelay), function()
				if Alive(m) then PR_Inf.Learn(m, pos, math.max(r, from:Distance(pos) * 0.5), "voice", ent) end
			end)
		end
	end
	if now < (patrol.radioAt or 0) then return end
	patrol.radioAt = now + C.radioRate
	local rr = math.max(C.radioMinR, r + from:Distance(pos) * C.radioDistShare)
	timer.Simple(Rand(C.radioDelay), function()
		for _, m in ipairs(Squad(npc)) do PR_Inf.Learn(m, pos, rr, "radio", ent) end
	end)
end

----------------------------------------------------------------------------------------------------
-- Зрение
----------------------------------------------------------------------------------------------------
local function Curve(dist)
	local pts = C.detectCurve
	for i = 2, #pts do
		if dist <= pts[i][1] then
			local a, b = pts[i - 1], pts[i]
			return Lerp((dist - a[1]) / math.max(b[1] - a[1], 1), a[2], b[2])
		end
	end
	return pts[#pts][2]
end

local function PollInterval(dist)
	for _, p in ipairs(C.visionPoll) do
		if dist <= p[1] then return p[2] end
	end
	return 3
end

-- Сколько из трёх точек цели (голова, грудь, таз) видно
local function VisibleParts(npc, t, eye)
	local pts = {t:IsPlayer() and t:EyePos() or (t:GetPos() + Vector(0, 0, 62)), t:WorldSpaceCenter(), t:GetPos() + Vector(0, 0, 18)}
	local n = 0
	for _, p in ipairs(pts) do
		local tr = util.TraceLine({start = eye, endpos = p, mask = LOS_MASK, filter = {npc, t}})
		if not tr.Hit then n = n + 1 end
	end
	return n
end

local function NearKnown(b, pos)
	local d
	for _, c in ipairs(b.contacts) do
		local x = c.pos:Distance(pos)
		if not d or x < d then d = x end
	end
	return d
end

-- Время до обнаружения (с) этой цели сейчас: кривая от дистанции на множители (docs/infantry.md)
function PR_Inf.DetectTime(npc, t, eye, tp, dist, parts, angle, now)
	local b = npc.PR_Brain
	local T = Curve(dist)
	if angle < 3 then T = T * 0.66 elseif angle < 6 then T = T * 0.8 elseif angle > 30 then T = T * Lerp((angle - 30) / 50, 1, 2) end
	local speed = t:GetVelocity():Length2D()
	T = T * Lerp(math.Clamp(speed / 300, 0, 1), 1, 0.5)
	local flash = now - (t.PR_ShotAt or 0) < 0.5
	if flash then T = T * 0.2 end
	if t:IsPlayer() and t:Crouching() then T = T * 1.25 end
	if parts == 2 then T = T * 1.2 elseif parts == 1 then T = T * 1.75 end
	local elev = math.deg(math.atan2(tp.z - eye.z, math.max(Vector(tp.x - eye.x, tp.y - eye.y, 0):Length(), 1)))
	if elev > 0 then T = T * (1 + 1.5 * math.min(elev, 60) / 60) elseif elev < -30 then T = T * 0.75 end
	if dist > C.fogEnd * 0.7 then T = T * 2 end
	T = T * (b.state == "patrol" and 1.5 or 0.7)
	if now - (b.firedBy[t] or 0) < 3 then T = T * 0.5 end
	local ene = npc:GetEnemy()
	if IsValid(ene) and ene ~= t and npc.EnemyData and npc.EnemyData.Visible then T = T * 1.5 end
	local dk = NearKnown(b, tp)
	if dk and dk < 1300 then T = T * Lerp(dk / 1300, 0.05, 1) end
	return math.max(T, C.detectMin), flash
end

local function Perceive(npc, b, t, now)
	local d = b.detect[t]
	if not d then d = {meter = 0, state = "unseen"} b.detect[t] = d end
	if now < (d.next or 0) then return d end
	local eye = Eye(npc)
	local tp = t:WorldSpaceCenter()
	local dist = eye:Distance(tp)
	local dt = math.min(now - (d.last or now), 3)
	d.last = now
	d.next = now + PollInterval(dist)

	local fwd = npc:GetForward()
	local dir = (tp - eye):GetNormalized()
	local angle = math.deg(math.acos(math.Clamp(fwd:Dot(dir), -1, 1)))
	local parts = 0
	if dist <= C.fogEnd and angle <= C.fov / 2 then parts = VisibleParts(npc, t, eye) end
	local T, flash = 1, false
	if parts > 0 then T, flash = PR_Inf.DetectTime(npc, t, eye, tp, dist, parts, angle, now) end
	if parts > 0 and dist > C.fogEnd * 0.9 and not flash then parts = 0 end

	d.visible = parts > 0
	if d.visible then
		d.meter = math.min(d.meter + dt / T, 1.5)
		if d.state == "unseen" and d.meter >= 1 then
			-- Держал этот угол — быстрая реакция
			local c = BestContact(b)
			local prepared = c and c.pos:Distance(tp) <= C.preparedDist and angle <= C.preparedAngle
			d.state, d.reactAt = "react", now + (prepared and C.reactionPrepared or Rand(C.reaction))
		elseif d.state == "lost" and d.meter >= 0.3 then
			d.state, d.reactAt = "react", now + 0.1
		end
		if d.state == "react" and now >= d.reactAt then d.state = "seen" end
	else
		d.meter = math.max(0, d.meter - dt / math.max(T, 0.5) * 2)
		if d.state == "seen" then d.state, d.lostAt = "lost", now end
		if d.state == "react" then d.state = "unseen" end
	end
	return d
end

----------------------------------------------------------------------------------------------------
-- Слух. PR_Inf.Hear(pos, range, kind, source): kind "shot" | "quiet" | "loud" | "crack"
----------------------------------------------------------------------------------------------------
local function Occluded(ear, pos, src)
	local tr = util.TraceLine({start = ear, endpos = pos + UP, mask = MASK_SOLID_BRUSHONLY, filter = src})
	return tr.Hit
end

function PR_Inf.Hear(pos, range, kind, source, opts)
	opts = opts or {}
	local now = CurTime()
	for _, npc in ipairs(PR_Inf.Soldiers) do
		local b = Brain(npc)
		if b and Alive(npc) and npc ~= source then
			local ear = Eye(npc)
			local dist = ear:Distance(pos)
			local hostile = IsValid(source) and PR_Inf.Hostile(npc, source)
			if kind == "shot" and dist <= C.maskRadius then b.maskUntil = now + C.maskTime end
			if hostile and dist <= range then
				local eff = range
				if dist > C.alwaysHear then
					if Occluded(ear, pos, source) then
						eff = eff * (kind == "shot" and (opts.suppressed and C.occludedShotSuppressed or C.occludedShot) or C.occludedQuiet)
					end
					if kind == "quiet" and (b.maskUntil or 0) > now then eff = eff * C.maskQuiet end
				end
				if dist <= eff or dist <= C.alwaysHear then
					-- Ошибка: пеленг и дальность
					local err = kind == "quiet" and C.errQuiet or C.errShot
					local mul = 1
					local fwd = npc:GetForward()
					local dir = (pos - ear):GetNormalized()
					local dot = fwd:Dot(dir)
					if dot > 0.5 then mul = mul * C.errFront elseif dot < -0.5 then mul = mul * C.errBehind end
					if dist < C.errExactDist then mul = mul * (dist / C.errExactDist) end
					local dk = NearKnown(b, pos)
					if dk and dk < C.errNearKnown[2] then
						mul = mul * Lerp(math.Clamp((dk - C.errNearKnown[1]) / (C.errNearKnown[2] - C.errNearKnown[1]), 0, 1), 0.05, 1)
					end
					if now - (b.nearMissAt or 0) < 1 then mul = mul * C.errNearMiss end
					local ang = dir:Angle()
					ang.y = ang.y + Gauss() * err[1] * mul
					local rng = dist * math.max(0.2, 1 + Gauss() * err[2] * mul)
					local est = ear + ang:Forward() * rng
					est.z = pos.z
					local r = math.max(60, math.sqrt((dist * math.rad(err[1] * mul)) ^ 2 + (dist * err[2] * mul) ^ 2))
					local known = npc:GetEnemy() == source
					local delay = known and C.hearDelay.enemy or (b.state == "patrol" and Rand(C.hearDelay.calm) or C.hearDelay.unknown)
					delay = delay * math.Rand(0.75, 1.25)
					local src = IsValid(source) and source or nil
					timer.Simple(delay, function()
						if not Alive(npc) then return end
						local c = PR_Inf.Learn(npc, est, r, "heard", src)
						if c and kind ~= "quiet" then PR_Inf.Report(npc, c) end
						if c and opts.reload then
							local bb = Brain(npc)
							if bb then bb.heardReloadAt, bb.heardReloadDist = CurTime(), dist end
						end
					end)
				end
			end
		end
	end
end

-- Калибр -> дальность выстрела
local function ShotRange(wep)
	if not IsValid(wep) then return C.shotDefault end
	local ammo = string.lower(tostring(wep.Primary and wep.Primary.Ammo or wep:GetPrimaryAmmoType() or ""))
	for _, p in ipairs(C.shotByAmmo) do
		if string.find(ammo, p[1], 1, true) then return p[2] end
	end
	local hold = string.lower(tostring(wep.HoldtypeActive or wep.HoldType or (wep.GetHoldType and wep:GetHoldType()) or ""))
	if hold == "pistol" or hold == "revolver" then return C.shotPistol end
	if hold == "rpg" then return C.shotLauncher end
	return C.shotDefault
end

local function Suppressed(wep)
	if not IsValid(wep) then return false end
	-- ArcCW: глушитель — обвес с Silencer
	if wep.GetBuff_Override and wep:GetBuff_Override("Silencer") then return true end
	return wep.Suppressed == true or wep.IsSuppressed == true
end

-- Пуля прошла рядом с бойцом: подавление и «по мне стреляют оттуда»
local function BulletCrack(shooter, src, dir)
	local tr = util.TraceLine({start = src, endpos = src + dir * 20000, mask = MASK_SHOT, filter = shooter})
	local a, b = src, tr.HitPos
	local ab = b - a
	local len2 = ab:LengthSqr()
	if len2 < 1 then return end
	for _, npc in ipairs(PR_Inf.Soldiers) do
		local br = Brain(npc)
		if br and Alive(npc) and PR_Inf.Hostile(npc, shooter) then
			local p = npc:WorldSpaceCenter()
			local t = math.Clamp((p - a):Dot(ab) / len2, 0, 1)
			local d = (a + ab * t):Distance(p)
			if d <= C.crackRadius then
				br.supp = math.min(1, br.supp + C.suppressNear)
				br.nearMissAt = CurTime()
				br.firedBy[shooter] = CurTime()
				-- Пеленг на стрелка ±45°, дальность неизвестна
				local ear = Eye(npc)
				local toShooter = (src - ear)
				local ang = toShooter:Angle()
				ang.y = ang.y + Gauss() * 20
				local dist = toShooter:Length()
				local est = ear + ang:Forward() * dist * math.Rand(0.6, 1.4)
				PR_Inf.Learn(npc, est, math.max(dist * 0.5, 400), "fire", shooter)
			end
		end
	end
end

hook.Add("EntityFireBullets", "PR_InfHearShots", function(ent, data)
	if not IsValid(ent) or not (ent:IsPlayer() or ent:IsNPC()) then return end
	local now = CurTime()
	-- Одно событие на выстрел (дробь — пачка пуль одним вызовом), не чаще раза в кадр
	if ent.PR_ShotFrame == FrameNumber() then return end
	ent.PR_ShotFrame = FrameNumber()
	ent.PR_ShotAt = now
	local wep = ent:GetActiveWeapon()
	local supp = Suppressed(wep)
	local range = ShotRange(wep) * (supp and C.suppressor or 1)
	local pos = ent.GetShootPos and ent:GetShootPos() or ent:WorldSpaceCenter()
	PR_Inf.Hear(pos, range, "shot", ent, {suppressed = supp})
	if data and data.Src and data.Dir then BulletCrack(ent, data.Src, data.Dir) end
end)

hook.Add("PlayerFootstep", "PR_InfHearSteps", function(ply, pos)
	if not ply:Alive() or #PR_Inf.Soldiers == 0 then return end
	local gait = ply:Crouching() and "crouch" or ((ply:KeyDown(IN_WALK) or ply:GetVelocity():Length2D() < 150) and "walk" or "run")
	local range = C.steps[gait]
	local tr = util.TraceLine({start = pos + Vector(0, 0, 8), endpos = pos - Vector(0, 0, 32), mask = MASK_PLAYERSOLID_BRUSHONLY, filter = ply})
	local mat = tr.MatType
	if mat == MAT_SAND or mat == MAT_GRASS or mat == MAT_DIRT or mat == MAT_FOLIAGE or mat == MAT_SNOW then range = range * 0.7
	elseif mat == MAT_METAL or mat == MAT_GRATE or mat == MAT_GLASS or mat == MAT_VENT then range = range * 1.3 end
	PR_Inf.Hear(pos, range, "quiet", ply)
end)

hook.Add("OnPlayerHitGround", "PR_InfHearLanding", function(ply, inWater, onFloater, speed)
	if speed > 300 and #PR_Inf.Soldiers > 0 then PR_Inf.Hear(ply:GetPos(), C.landing, "quiet", ply) end
end)

hook.Add("KeyPress", "PR_InfHearReload", function(ply, key)
	if key ~= IN_RELOAD or #PR_Inf.Soldiers == 0 then return end
	local wep = ply:GetActiveWeapon()
	if IsValid(wep) and wep:Clip1() >= 0 and wep:Clip1() < wep:GetMaxClip1() then
		PR_Inf.Hear(ply:GetPos(), C.reload, "quiet", ply, {reload = true})
	end
end)

-- Взрывы: подавление рядом; слышат все, но это точка взрыва, а не стрелок — только тревога
hook.Add("EntityTakeDamage", "PR_InfExplosions", function(target, dmg)
	if not dmg:IsDamageType(DMG_BLAST) or #PR_Inf.Soldiers == 0 then return end
	local pos = dmg:GetDamagePosition()
	local now = CurTime()
	if PR_Inf.lastBlast and PR_Inf.lastBlast.t > now - 0.3 and PR_Inf.lastBlast.pos:Distance(pos) < 300 then return end
	PR_Inf.lastBlast = {t = now, pos = pos}
	for _, npc in ipairs(PR_Inf.Soldiers) do
		local b = Brain(npc)
		if b and Alive(npc) and npc:GetPos():Distance(pos) <= C.suppressExplosionRadius then
			b.supp = math.min(1, b.supp + C.suppressExplosion)
		end
		if b and b.state == "patrol" then b.alertAt, b.alertPos = now, pos end
	end
end)

-- Техника игроков: двигатель слышно далеко
timer.Create("PR_InfHearVehicles", 1, 0, function()
	if #PR_Inf.Soldiers == 0 then return end
	for _, ply in ipairs(player.GetHumans()) do
		if ply:InVehicle() then
			local veh = ply:GetVehicle()
			local base = IsValid(veh:GetParent()) and veh:GetParent() or veh
			local speed = base:GetVelocity():Length()
			if speed > 50 then PR_Inf.Hear(base:GetPos(), Lerp(math.Clamp(speed / 800, 0, 1), C.vehicle[1], C.vehicle[2]), "loud", ply) end
		end
	end
end)

----------------------------------------------------------------------------------------------------
-- Урон по бойцу: прицел сбит, пеленг на стрелка
----------------------------------------------------------------------------------------------------
function PR_Inf.OnDamaged(npc, dmg)
	local b = Brain(npc)
	if not b then return end
	local now = CurTime()
	b.knockUntil = now + Rand(b.isBoss and C.hitKnockBoss or C.hitKnock)
	b.aimT = (b.aimT or 0) - C.aimHitPenalty
	b.hits = b.hits or {}
	table.insert(b.hits, {t = now, dmg = dmg:GetDamage()})
	b.hitAt = now
	if PR_Inf.MarkBadSpot then PR_Inf.MarkBadSpot(npc, npc:GetPos()) end
	local att = dmg:GetAttacker()
	if IsValid(att) and (att:IsPlayer() or att:IsNPC()) and PR_Inf.Hostile(npc, att) then
		b.firedBy[att] = now
		local ear = Eye(npc)
		local to = att:WorldSpaceCenter() - ear
		local ang = to:Angle()
		ang.y = ang.y + Gauss() * 20 / 2
		PR_Inf.Learn(npc, ear + ang:Forward() * to:Length() * math.Rand(0.8, 1.2), math.max(to:Length() * 0.3, 200), "fire", att)
	end
end

----------------------------------------------------------------------------------------------------
-- Огонь: множитель разброса на выстрел (вызывается из GetAimSpread бойца на каждый выстрел)
----------------------------------------------------------------------------------------------------
local function ResetTime(wep)
	local r = ShotRange(wep)
	if r <= 3300 then return C.burstReset.pistol end
	if r >= 5800 then return C.burstReset.mg end
	if r >= 4500 then return C.burstReset.heavy end
	return C.burstReset.rifle
end

-- Профиль сведения прицела: босс, охрана, бойцы ролей, марксман, снайпер, обычный
local function AimProfile(npc, b)
	local P = C.aim
	if b.isBoss then return P.boss end
	if b.isGuard then return P.guard end
	local role = npc.PR_Role or ""
	if role == "sniper" then return P.sniper end
	if role == "marksman" then return P.marksman end
	if role ~= "" then return P.fighter end
	return P.regular
end

function PR_Inf.SpreadMul(npc)
	local b = Brain(npc)
	if not b then return 1 end
	local now = CurTime()
	local wep = npc:GetActiveWeapon()
	if now - b.lastShot > ResetTime(wep) then b.shot = 0 end
	b.lastShot = now
	b.shot = b.shot + 1
	b.shotsHere = (b.shotsHere or 0) + 1
	b.lastFireAt = now
	-- Сведение прицела: от 1 до «пола» профиля за время T непрерывной видимости цели (своё движение
	-- за последние 0,5 с — T ×1,5). Первый прицельный выстрел точный, если успел свести
	local A = AimProfile(npc, b)
	local T = A.T * (now - (b.selfMovedAt or -10) < 0.5 and 1.5 or 1)
	local m = Lerp(math.Clamp(math.max(b.aimT or 0, 0) / T, 0, 1), 1, A.floor)
	-- Отдача очереди: каждый следующий выстрел шире
	if b.shot > 1 then m = m * math.min(C.spreadMax, 1 + C.spreadPerShot * (b.shot - 1)) end
	-- Начало очереди: длина и пауза от дальности (далеко — одиночные, средняя — 2–3, близко — очередь
	-- роли); роль не может стрелять чаще своей паузы
	if b.shot == 1 then
		local e = npc:GetEnemy()
		local d = IsValid(e) and npc:GetPos():Distance(e:GetPos()) or 1500
		local burst, pause = b.burst or C.burst, b.burstPause or C.burstPause
		local band, bandPause
		if d > C.burstFar then band, bandPause = {1, 1}, C.burstPauseFar
		elseif d > (b.burstNear or C.burstNear) then band, bandPause = C.burstMid, C.burstPauseMid end
		if band then
			burst = {math.min(burst[1], band[1]), math.min(burst[2], band[2])}
			pause = {math.max(pause[1], bandPause[1]), math.max(pause[2], bandPause[2])}
		end
		b.burstN = math.random(burst[1], burst[2])
		b.curPause = pause
	end
	-- Конец очереди: пауза (VJ перезаписывает время следующего выстрела сразу после этого — ставим на кадр позже)
	if b.shot >= b.burstN then
		b.shot = 0
		local pause = b.curPause or b.burstPause or C.burstPause
		local k = now < (b.suppPauseUntil or 0) and 2 or 1
		timer.Simple(0, function()
			if IsValid(wep) then wep.NPC_NextPrimaryFireT = CurTime() + Rand(pause) * k end
		end)
	end
	-- Своё движение — по скорости, а не по «есть маршрут» (застрявший с маршрутом считался бегущим)
	local v = b.moveSpeed or 0
	if v > C.aimRunSpeed then
		m = m * (b.runSpread or C.spreadRun)
	elseif v > C.aimStillSpeed then
		m = m * C.spreadWalk
	elseif npc.PR_Crouch then
		m = m * C.spreadCrouch
	end
	m = m * (1 + C.suppressSpread * b.supp)
	if now < b.knockUntil then m = m * C.knockMul end
	if b.accMul then m = m * b.accMul end
	if b.rageUntil and now < b.rageUntil then m = m * 1.25 end
	return m
end

----------------------------------------------------------------------------------------------------
-- Гранаты и гранатомёт
----------------------------------------------------------------------------------------------------
local function GrenadeClass()
	for _, c in ipairs(C.grenadeClasses) do
		if scripted_ents.GetStored(c) or c == "npc_grenade_frag" then return c end
	end
end

-- Бросить ручную гранату в точку: дуга под гравитацию, запал = полёт + 0,3–0,8 с
function PR_Inf.ThrowGrenade(npc, pos)
	if not Alive(npc) then return end
	local from = Eye(npc) + npc:GetForward() * 12
	local d = pos - from
	local flat = Vector(d.x, d.y, 0):Length()
	if flat > C.grenadeRange[2] * 1.1 then return end
	local cls = GrenadeClass()
	local g = ents.Create(cls)
	if not IsValid(g) then return end
	local t = math.Clamp(flat / 750, 0.7, 2.2)
	local grav = physenv.GetGravity()
	local vel = (d - grav * 0.5 * t * t) / t
	g:SetPos(from)
	g:SetAngles(vel:Angle())
	g:Spawn()
	g:Activate()
	g:SetOwner(npc)
	local phys = g:GetPhysicsObject()
	if IsValid(phys) then phys:SetVelocity(vel) phys:AddAngleVelocity(VectorRand() * 300) end
	local fuse = t + math.Rand(0.3, 0.8)
	-- Граната ArcCW рвётся через FuseTime после появления; у HL2 — таймер
	if g.FuseTime ~= nil then g.FuseTime = fuse
	elseif cls == "npc_grenade_frag" then g:Fire("SetTimer", tostring(fuse)) end
	npc:PlayAnim("vjges_gesture_item_throw", false, 0, false)
	if npc.PlaySoundSystem then npc:PlaySoundSystem("GrenadeAttack") end
	local b = Brain(npc)
	if b then b.grenadeAt = CurTime() end
	return g, fuse
end

-- Выстрел из гранатомёта (sh_npc_weapons.lua): громко, выдаёт стрелка
function PR_Inf.OnLauncherFired(npc, from, to)
	PR_Inf.Hear(from, C.shotLauncher, "shot", npc)
	local b = Brain(npc)
	if b then b.launcherAt = CurTime() end
end

-- Тяжёлое подавление: 2–4 с не стреляет
function PR_Inf.HoldFire(npc)
	local b = Brain(npc)
	return b and (CurTime() < (b.holdFireUntil or 0) or b.holdFireShift == true) or false
end

function PR_Inf.Think(npc) end

----------------------------------------------------------------------------------------------------
-- Пути: навмеш, где он есть (A* по областям), иначе по прямой шагами
----------------------------------------------------------------------------------------------------
local function NavPath(from, to)
	if not navmesh.IsLoaded() then return nil end
	local a, z = navmesh.GetNearestNavArea(from, false, 300), navmesh.GetNearestNavArea(to, false, 300)
	if not (IsValid(a) and IsValid(z)) then return nil end
	if a == z then return {to} end
	-- A* на двоичной куче: сортировка всего списка на каждом шаге на 21 тыс. областей — секунды
	local heap, hn = {}, 0
	local function push(area, f)
		hn = hn + 1
		local i = hn
		heap[i] = {area, f}
		while i > 1 do
			local p = math.floor(i / 2)
			if heap[p][2] <= heap[i][2] then break end
			heap[p], heap[i] = heap[i], heap[p]
			i = p
		end
	end
	local function pop()
		local top = heap[1]
		heap[1] = heap[hn]
		heap[hn] = nil
		hn = hn - 1
		local i = 1
		while true do
			local l, r, m = i * 2, i * 2 + 1, i
			if l <= hn and heap[l][2] < heap[m][2] then m = l end
			if r <= hn and heap[r][2] < heap[m][2] then m = r end
			if m == i then break end
			heap[m], heap[i] = heap[i], heap[m]
			i = m
		end
		return top[1]
	end
	local g, came, closed = {[a] = 0}, {}, {}
	local goal = z:GetCenter()
	push(a, 0)
	local n = 0
	while hn > 0 and n < 3000 do
		local cur = pop()
		if cur == z then break end
		if not closed[cur] then
			closed[cur] = true
			n = n + 1
			local cc = cur:GetCenter()
			for _, nb in ipairs(cur:GetAdjacentAreas()) do
				if not closed[nb] and cur:ComputeAdjacentConnectionHeightChange(nb) < 60 then
					local nc = nb:GetCenter()
					local cost = g[cur] + cc:Distance(nc)
					if not g[nb] or cost < g[nb] then
						g[nb], came[nb] = cost, cur
						push(nb, cost + nc:Distance(goal))
					end
				end
			end
		end
	end
	if not came[z] then return nil end
	local pts, cur = {to}, came[z]
	while cur and cur ~= a do
		table.insert(pts, 1, cur:GetCenter())
		cur = came[cur]
	end
	return pts
end
PR_Inf.NavPath = NavPath

-- Идти к цели: путь (если есть) и шаги не длиннее moveStep
function PR_Inf.Goto(npc, pos, gait, face)
	local b = Brain(npc)
	if not b then return end
	b.route = {goal = pos, gait = gait, face = face, path = NavPath(npc:GetPos(), pos) or {pos}, i = 1, at = CurTime()}
end

local function StepGoto(npc, b)
	local g = b.route
	if not g then return end
	local pos = npc:GetPos()
	while g.i < #g.path and pos:Distance(g.path[g.i]) < 100 do g.i = g.i + 1 end
	local target = g.path[g.i]
	local flat = Vector(target.x - pos.x, target.y - pos.y, 0)
	if g.i == #g.path and flat:Length() < 70 then
		b.route = nil
		npc:PR_Stop()
		return true
	end
	-- Застрял (движок не ведёт: нет пути, упёрся) — маршрут снимаем, точку на время в «плохие»:
	-- иначе роль ждёт конца маршрута вечно (гранатомётчик видел цель 13 с и не стрелял)
	local now = CurTime()
	local left = pos:Distance(g.goal)
	if not g.bestLeft or left < g.bestLeft - 30 then g.bestLeft, g.progressAt = left, now end
	if now - (g.progressAt or g.at or now) > C.stuckTime then
		b.route = nil
		npc:PR_Stop()
		b.stuckAt = now
		if PR_Inf.MarkBadSpot then PR_Inf.MarkBadSpot(npc, g.goal) end
		return true
	end
	if flat:Length() > C.moveStep then target = pos + flat:GetNormalized() * C.moveStep end
	if not npc:IsMoving() or now - (npc.PR_MoveAt or 0) > 2 then npc:PR_Move(target, g.gait, g.face) end
end

----------------------------------------------------------------------------------------------------
-- Обычный боец (до ролей): решение раз в 0,2 с
----------------------------------------------------------------------------------------------------
local function BestVisible(npc, b)
	local best, bestD
	for t, d in pairs(b.detect) do
		if IsValid(t) and d.state == "seen" and d.visible and PR_Inf.Hostile(npc, t) then
			local dist = npc:GetPos():Distance(t:GetPos())
			if not bestD or dist < bestD then best, bestD = t, dist end
		end
	end
	return best
end

local function Decide(npc, b, now)
	local seen = BestVisible(npc, b)
	if seen then
		if b.state == "patrol" or b.state == "search" then
			if npc:IsMoving() then npc:PR_Stop() end
			b.route = nil
			b.crouchPref = math.random() < 0.5
		end
		-- Свои узнают по голосу и рации: сразу при контакте и дальше раз в 3 с, пока видит
		if b.state ~= "fight" or now >= (b.reportAt or 0) then
			local c = PR_Inf.Learn(npc, seen:WorldSpaceCenter(), 30, "seen", seen, seen:GetVelocity())
			if c then PR_Inf.Report(npc, c) end
			b.reportAt = now + 3
		end
		b.state = "fight"
		npc:PR_SetEnemy(seen)
		npc.PR_Fire = true
		npc.PR_Crouch = b.supp > C.suppressHide or b.crouchPref
		npc.PR_AimAt, npc.PR_Face = nil, nil
		return
	end

	local c = BestContact(b)
	if c then
		npc.PR_AimAt = c.pos + Vector(0, 0, 40)
		npc.PR_Face = c.pos
		if b.state == "patrol" or b.state == "fight" then
			if b.state == "patrol" and npc:IsMoving() then npc:PR_Stop() end
			b.state, b.holdSince = "hold", now
		end
		if b.state == "hold" then
			npc.PR_Crouch = b.supp > C.suppressHide
			local delay = npc.PR_PatrolRole == "leader" and C.searchDelay.leader or C.searchDelay.follower
			if now - b.holdSince > delay and b.supp < C.suppressHide then
				b.state = "search"
				b.searchTarget = c
				npc.PR_Crouch = false
				PR_Inf.Goto(npc, c.pos, "crouch", c.pos)
			end
		elseif b.state == "search" then
			if b.searchTarget ~= c and b.route then PR_Inf.Goto(npc, c.pos, "crouch", c.pos) b.searchTarget = c end
			if not b.route then
				-- Дошёл: постоять, осмотреться — и место осмотрено
				b.waitUntil = b.waitUntil or now + Rand(C.searchWait)
				if now >= b.waitUntil then
					Forget(b, c)
					b.waitUntil = nil
					b.state = "hold"
					b.holdSince = now
				end
			end
		end
		return
	end

	if b.state ~= "patrol" then
		b.state = "patrol"
		b.route, b.waitUntil = nil, nil
		-- Память роли о прошлом бое (позиция, ракеты, гранаты, поиск) — заново
		b.rs, b.rockets, b.nades, b.holdSince, b.searchAfter, b.cornerFor, b.healed = nil, nil, nil, nil, nil, nil, nil
		b.bounding, b.maneuver, b.kneelUntil, b.waitBlast, b.pauseUntil = false, false, nil, nil, nil
		npc.PR_Fire = true
		npc.PR_Crouch, npc.PR_Face, npc.PR_AimAt = false, nil, nil
		if IsValid(npc:GetEnemy()) then npc:ResetEnemy() end
	end
end

-- Метки: старение, рост радиуса, «осмотрено», забыть
local function AgeContacts(npc, b, now, dt)
	local eye = Eye(npc)
	for i = #b.contacts, 1, -1 do
		local c = b.contacts[i]
		local seenNow = c.ent and b.detect[c.ent] and b.detect[c.ent].state == "seen" and b.detect[c.ent].visible
		if seenNow then
			c.pos, c.r, c.t, c.seenAt = c.ent:WorldSpaceCenter(), 30, now, now
			c.vel = c.ent:GetVelocity()
		else
			if c.seenAt and now - c.seenAt < C.extrapolate then
				local next = c.pos + c.vel * dt
				local tr = util.TraceLine({start = c.pos, endpos = next, mask = MASK_PLAYERSOLID_BRUSHONLY})
				c.pos = tr.HitPos
			else
				c.r = math.min(C.growMax, c.r + math.max(C.growMin, C.growSpeed * c.vel:Length()) * dt)
			end
			-- Враг точно мёртв или забыт
			if (IsValid(c.ent) and not Alive(c.ent) and c.r < 300) or now - c.t > C.forget then
				table.remove(b.contacts, i)
			elseif eye:Distance(c.pos) <= C.checkRadius then
				-- Осмотрено: центр и ≥ 70% круга в прямой видимости ≥ 1 с, никого не видно
				local vis, n = 0, 8
				local rr = math.min(c.r, 800)
				local center = util.TraceLine({start = eye, endpos = c.pos + UP, mask = LOS_MASK, filter = npc})
				if not center.Hit then
					for k = 1, n do
						local a = k / n * math.pi * 2
						local p = c.pos + Vector(math.cos(a) * rr, math.sin(a) * rr, 36)
						if not util.TraceLine({start = eye, endpos = p, mask = LOS_MASK, filter = npc}).Hit then vis = vis + 1 end
					end
				end
				if not center.Hit and vis / n >= C.checkShare then
					c.checkT = (c.checkT or 0) + dt
					if c.checkT >= C.checkTime then table.remove(b.contacts, i) end
				else
					c.checkT = 0
				end
			end
		end
	end
end

local lastTick = 0
timer.Create("PR_InfThink", 0.1, 0, function()
	local now = CurTime()
	local dt = math.min(now - lastTick, 0.5)
	lastTick = now
	local list = PR_Inf.Soldiers
	for i = #list, 1, -1 do
		if not Alive(list[i]) then table.remove(list, i) end
	end
	if #list == 0 then return end
	local cands = Candidates()
	for _, npc in ipairs(list) do
		local b = npc.PR_Brain
		local ok, err = pcall(function()
			for _, t in ipairs(cands) do
				if PR_Inf.Hostile(npc, t) then Perceive(npc, b, t, now) end
			end
			for t in pairs(b.detect) do
				if not IsValid(t) then b.detect[t] = nil end
			end
			b.supp = math.max(0, b.supp - C.suppressDecay * dt)
			-- Тяжёлое подавление: не замолкает (первый ответ на контакт — ответный огонь), а приседает и
			-- стреляет реже: паузы между очередями ×2 на 2–4 с
			if b.supp > C.suppressHeavy and now > (b.suppPauseUntil or 0) + 4 then b.suppPauseUntil = now + math.Rand(2, 4) end
			-- Сведение прицела (как SAIN): пока цель на виду, а сам стоит, прицел сходится; бег сбрасывает,
			-- шаг сводит вдвое медленнее
			local seen = BestVisible(npc, b)
			local speed = VJ.GetMoveVelocity(npc):Length2D()
			b.moveSpeed = speed
			if speed > C.aimStillSpeed then b.selfMovedAt = now end
			if seen ~= b.aimTarget then
				b.aimTarget = seen
				b.aimT = (seen and not b.aimSeenBefore) and -C.aimFirstContact or 0
				if seen then b.aimSeenBefore = true end
			elseif seen then
				if speed > C.aimRunSpeed then b.aimT = 0
				else b.aimT = math.min((b.aimT or 0) + dt * (speed > C.aimStillSpeed and 0.5 or 1), 5) end
			end
			AgeContacts(npc, b, now, dt)
			if now >= (b.decideAt or 0) then
				b.decideAt = now + 0.2
				local role = PR_Inf.Roles and PR_Inf.Roles[npc.PR_Role or ""]
				if not (role and role(npc, b, now)) then Decide(npc, b, now) end
			end
			StepGoto(npc, b)
		end)
		if not ok then ErrorNoHalt("[PR] пехота: " .. tostring(err) .. "\n") end
	end
end)

-- Помощники общего слоя для ролей и отряда (sv_infantry_roles.lua)
PR_Inf.U = {
	Alive = Alive, Eye = Eye, Rand = Rand, Gauss = Gauss, LOS = LOS_MASK, Brain = Brain,
	BestContact = BestContact, BestVisible = BestVisible, Forget = Forget, Decide = Decide, Squad = Squad,
	StepGoto = StepGoto
}

-- Боец патруля занят боем / поиском — патруль его не водит (sv_patrols.lua: InCombat)
function PR_Inf.Busy(npc)
	local b = Brain(npc)
	return b and b.state ~= "patrol" or false
end

----------------------------------------------------------------------------------------------------
-- Отладка: pr_inf_debug 1 у админа — над бойцами состояние, шкалы и метки (cl_infantry.lua)
----------------------------------------------------------------------------------------------------
timer.Create("PR_InfDebug", 0.25, 0, function()
	if #PR_Inf.Soldiers == 0 then return end
	local to = {}
	for _, ply in ipairs(player.GetHumans()) do
		if ply:GetInfoNum("pr_inf_debug", 0) == 1 and PR_IsAdmin(ply) then to[#to + 1] = ply end
	end
	if #to == 0 then return end
	local rows = {}
	for _, npc in ipairs(PR_Inf.Soldiers) do
		local b = Brain(npc)
		if b and Alive(npc) then
			local meter, mstate = 0, ""
			for _, d in pairs(b.detect) do
				if d.meter > meter then meter, mstate = d.meter, d.state end
			end
			local cs = {}
			for k, c in ipairs(b.contacts) do
				if k > 4 then break end
				cs[#cs + 1] = {pos = c.pos, r = c.r, src = c.src, age = CurTime() - c.t}
			end
			rows[#rows + 1] = {ent = npc, state = b.state, supp = b.supp, meter = meter, mstate = mstate,
				gait = npc:IsMoving() and (npc.PR_Gait or "?") or "", contacts = cs}
		end
	end
	net.Start("PR_InfDebug")
		net.WriteTable(rows)
	net.Send(to)
end)
