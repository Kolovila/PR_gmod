-- Пехота патрулей: роли (этап 3) и отряд (этап 4) поверх общего слоя (sv_infantry.lua).
-- Числа — config/infantry.lua (PR_INF_ROLE_CFG, PR_INF_SQUAD); решения — docs/infantry.md
-- (сверено с тактиком и знатоком ИИ EFT). Каждая роль — решение раз в 0,2 с; вернула false —
-- решает «обычный» боец общего слоя.

local C, RC, SQ = PR_INF, PR_INF_ROLE_CFG, PR_INF_SQUAD
local U = PR_Inf.U
local Alive, Eye, Rand, Brain = U.Alive, U.Eye, U.Rand, U.Brain
local LOS = U.LOS

local STAND, CROUCH, CHEST = Vector(0, 0, 64), Vector(0, 0, 32), Vector(0, 0, 40)

PR_Inf.Roles = {}
PR_Inf.BadSpots = PR_Inf.BadSpots or {}

local function Flat(v) return Vector(v.x, v.y, 0) end
local function FlatDir(a, b) local d = Flat(b - a) return d:LengthSqr() > 1 and d:GetNormalized() or Vector(1, 0, 0) end
local function Rotate(v, deg) local a = v:Angle() a.y = a.y + deg return a:Forward() end

local function Ground(p)
	local tr = util.TraceLine({start = p + Vector(0, 0, 300), endpos = p - Vector(0, 0, 900), mask = MASK_NPCSOLID_BRUSHONLY})
	if not tr.Hit or tr.StartSolid or tr.HitNormal.z < 0.6 then return nil end
	local g = tr.HitPos + Vector(0, 0, 4)
	local hull = util.TraceHull({start = g, endpos = g, mins = Vector(-16, -16, 0), maxs = Vector(16, 16, 72), mask = MASK_NPCSOLID})
	if hull.Hit then return nil end
	return g
end

-- Город или пустыня: стены вокруг (8 лучей по 600 ю)
local function Urban(pos)
	local hits = 0
	for i = 0, 7 do
		local a = i * math.pi / 4
		if util.TraceLine({start = pos + Vector(0, 0, 50), endpos = pos + Vector(math.cos(a) * 600, math.sin(a) * 600, 50), mask = MASK_SOLID_BRUSHONLY}).Hit then
			hits = hits + 1
		end
	end
	return hits >= 3
end

-- Под крышей
local function Indoor(pos)
	return util.TraceLine({start = pos + Vector(0, 0, 40), endpos = pos + Vector(0, 0, 400), mask = MASK_SOLID_BRUSHONLY}).Hit
end

-- Не укрытие: стекло, сетка, листва, лёгкие пропы
local function SoftHit(tr)
	local m = tr.MatType
	if m == MAT_GLASS or m == MAT_GRATE or m == MAT_FOLIAGE then return true end
	if IsValid(tr.Entity) and not tr.Entity:IsWorld() then
		local phys = tr.Entity:GetPhysicsObject()
		if not IsValid(phys) or phys:GetMass() < 100 then return true end
	end
	return false
end

function PR_Inf.MarkBadSpot(npc, pos)
	table.insert(PR_Inf.BadSpots, {pos = pos, till = CurTime() + SQ.badSpot})
	if #PR_Inf.BadSpots > 64 then table.remove(PR_Inf.BadSpots, 1) end
end

local function BadSpot(pos, now)
	for _, s in ipairs(PR_Inf.BadSpots) do
		if s.till > now and s.pos:DistToSqr(pos) < SQ.badSpotR * SQ.badSpotR then return true end
	end
	return false
end

----------------------------------------------------------------------------------------------------
-- Отряд: свои, центр, занятые точки
----------------------------------------------------------------------------------------------------
local function Members(patrol)
	local out = {}
	for _, m in ipairs(patrol and patrol.members or {}) do
		if Alive(m) and m.PR_Brain then out[#out + 1] = m end
	end
	return out
end

local function Center(npc)
	local ms = Members(npc.PR_Patrol)
	if #ms == 0 then return npc:GetPos() end
	local s = Vector()
	for _, m in ipairs(ms) do s = s + m:GetPos() end
	return s / #ms
end

-- С какой стороны от врага наш отряд
local function SideDir(npc, E) return FlatDir(E, Center(npc)) end

local function Taken(npc, p, spacing)
	for _, m in ipairs(Members(npc.PR_Patrol)) do
		if m ~= npc then
			local b = m.PR_Brain
			if m:GetPos():DistToSqr(p) < spacing * spacing then return true end
			if b and b.posGoal and b.posGoal:DistToSqr(p) < spacing * spacing then return true end
		end
	end
	return false
end

----------------------------------------------------------------------------------------------------
-- Поиск позиции. E — оценка врага; o.dist {min, pref, max}, o.sectorDir/o.sectorHalf — сторона,
-- o.needLOS (стоя видно оценку), o.wantHidden (точка сбора: не видно), o.maxTravel, o.minMove,
-- o.minAngleChange, o.heightW, o.indoorW, o.concealOK. Возвращает точку и оценку
----------------------------------------------------------------------------------------------------
local function Score(npc, g, E, r, o, me)
	local score = 0
	local toE = FlatDir(g, E)
	local lat = Vector(-toE.y, toE.x, 0) * math.min((r or 100) / 2, 300)
	local stand, hidden, soft = 0, 0, 0
	for _, t in ipairs({E + CHEST, E + CHEST + lat, E + CHEST - lat}) do
		if not util.TraceLine({start = g + STAND, endpos = t, mask = LOS}).Hit then stand = stand + 1 end
		local tr = util.TraceLine({start = g + CROUCH, endpos = t, mask = LOS})
		if tr.Hit then
			if SoftHit(tr) then soft = soft + 1 else hidden = hidden + 1 end
		end
	end
	if o.wantHidden then
		score = score + (stand == 0 and 3 or -3)
	else
		if o.needLOS and stand == 0 then score = score - 5 end
		score = score + stand * 0.6 + hidden * 0.4
		if stand >= 1 and hidden >= 2 then score = score + 2.5 end
		if o.concealOK and soft >= 2 then score = score + 0.5 end
	end
	score = score + math.Clamp((g.z - E.z) / 400, -0.5, 1) * (o.heightW or 0.4)
	if o.indoorW and Indoor(g) then score = score + o.indoorW end
	-- Силуэт на гребне: за спиной (от врага) до 1500 ю ничего нет
	local back = (Flat(g - E):GetNormalized() + Vector(0, 0, 0.1)):GetNormalized()
	if not util.TraceLine({start = g + STAND, endpos = g + STAND + back * 1500, mask = MASK_SOLID_BRUSHONLY}).Hit then score = score - 1 end
	-- Путь на виду у врага
	if me then
		for _, f in ipairs({0.33, 0.66}) do
			local mid = LerpVector(f, me, g)
			if not util.TraceLine({start = E + CHEST, endpos = mid + STAND, mask = LOS}).Hit then score = score - 0.6 end
		end
	end
	return score
end

-- Точка или середина пути к ней — в коридоре чужой линии огня ({от, до, ширина})
local function OnLines(lines, me, g)
	if not lines then return false end
	local mid = LerpVector(0.5, me, g)
	for _, l in ipairs(lines) do
		if util.DistanceToLine(l[1], l[2], g) < l[3] or util.DistanceToLine(l[1], l[2], mid) < l[3] then return true end
	end
	return false
end

function PR_Inf.FindPosition(npc, E, o)
	local now = CurTime()
	local me = npc:GetPos()
	local spacing = Urban(me) and SQ.spacingTown or SQ.spacingDesert
	local base = (o.sectorDir or FlatDir(E, me)):Angle().y
	local half = o.sectorHalf or 60
	local dists = {o.dist[1], o.dist[2], (o.dist[2] + o.dist[3]) / 2}
	local cands = {}
	for a = -half, half, 10 do
		local yaw = math.rad(base + a)
		for _, d in ipairs(dists) do
			cands[#cands + 1] = E + Vector(math.cos(yaw) * d, math.sin(yaw) * d, 0)
		end
	end
	-- Укрытия навмеша рядом с бойцом (без «открытых» точек)
	if navmesh.IsLoaded() then
		local n = 0
		for _, area in ipairs(navmesh.Find(me, math.min(o.maxTravel, 2000), 200, 200)) do
			for _, hs in ipairs(area:GetHidingSpots(1)) do
				cands[#cands + 1] = hs
				n = n + 1
			end
			if n > 40 then break end
		end
	end
	local scored = {}
	for _, p in ipairs(cands) do
		local g = Ground(p)
		if g then
			local travel = g:Distance(me)
			local dE = Flat(g - E):Length()
			local dirOk = true
			if o.sectorDir and half < 180 then
				local ang = math.deg(math.acos(math.Clamp(FlatDir(E, g):Dot(o.sectorDir), -1, 1)))
				dirOk = ang <= half + 5
			end
			if dirOk and travel <= o.maxTravel and (not o.minMove or travel >= o.minMove)
				and dE >= o.dist[1] * 0.85 and dE <= o.dist[3] and not Taken(npc, g, spacing) and not BadSpot(g, now)
				and not OnLines(o.avoid, me, g) then
				scored[#scored + 1] = {p = g, s = -math.abs(dE - o.dist[2]) / o.dist[2] * 2 - travel / 3000}
			end
		end
	end
	table.sort(scored, function(a, b) return a.s > b.s end)
	local best = {}
	for i = 1, math.min(#scored, 16) do
		local c = scored[i]
		c.s = c.s + Score(npc, c.p, E, o.r, o, me)
		if o.minAngleChange then
			local a = math.deg(math.acos(math.Clamp(FlatDir(E, me):Dot(FlatDir(E, c.p)), -1, 1)))
			if a < o.minAngleChange then c.s = c.s - 3 end
		end
		best[#best + 1] = c
	end
	if #best == 0 then return nil end
	table.sort(best, function(a, b) return a.s > b.s end)
	-- Случайно из трёх лучших (с весом) — непредсказуемо
	local top = {}
	for i = 1, math.min(3, #best) do top[i] = best[i] end
	local total = 0
	for _, c in ipairs(top) do c.w = math.exp(c.s - top[1].s) total = total + c.w end
	local r = math.random() * total
	for _, c in ipairs(top) do
		r = r - c.w
		if r <= 0 then return c.p, c.s end
	end
	return top[1].p, top[1].s
end

----------------------------------------------------------------------------------------------------
-- Общие действия ролей
----------------------------------------------------------------------------------------------------
local function Apply(npc, b, cfg)
	if b.cfgFor == npc.PR_Role then return end
	b.cfgFor = npc.PR_Role
	b.burst, b.burstPause, b.accMul = cfg.burst, cfg.pause, cfg.acc
	b.burstN = math.random(cfg.burst[1], cfg.burst[2])
	-- Дальность огня — по стволу (npc_pr_soldier:OnWeaponChange), роль решает, куда идти
	b.burstNear = cfg.burstNear
end

-- Видит врага: он — цель VJ, свои узнают по голосу и рации
local function Engage(npc, b, seen, now)
	npc:PR_SetEnemy(seen)
	b.state = "fight"
	npc.PR_AimAt, npc.PR_Face = nil, nil
	b.lastSeenAt = now
	if now >= (b.reportAt or 0) then
		local c = PR_Inf.Learn(npc, seen:WorldSpaceCenter(), 30, "seen", seen, seen:GetVelocity())
		if c then PR_Inf.Report(npc, c) end
		b.reportAt = now + 3
	end
end

local function GoPos(npc, b, pos, gait, face)
	PR_Inf.Goto(npc, pos, gait, face)
	b.posGoal, b.posAt = pos, CurTime()
end

local function Stop(npc, b)
	if b.route then npc:PR_Stop() end
	b.route = nil
end

local function Backoff(npc, b, from, dist, gait)
	local me = npc:GetPos()
	local p = Ground(me + FlatDir(from, me) * dist) or Ground(me + Rotate(FlatDir(from, me), 40) * dist)
	if p then GoPos(npc, b, p, gait, from) end
end

-- Свой на линии огня «я — цель» (VJ сквозь своего не стреляет): Birdeye 7,5 с молчал, пока Knight
-- бежал по его линии
local function FriendOnLine(npc, E, r)
	local from = Eye(npc)
	local to = E + CHEST
	local len = from:Distance(to)
	for _, m in ipairs(Members(npc.PR_Patrol)) do
		if m ~= npc then
			local dist, _, along = util.DistanceToLine(from, to, m:WorldSpaceCenter())
			if dist < r and along > 40 and along < len - 40 then return m end
		end
	end
end

PR_Inf.FriendOnLine = FriendOnLine

-- Свой перекрыл линию огня дольше SQ.blockedAfter — шаг вбок поперёк линии, в сторону от него
local function ClearLine(npc, b, E, now)
	if b.route and now < (b.sidestepUntil or 0) then return true end
	local f = FriendOnLine(npc, E, SQ.blockedWidth)
	if not f then b.blockedSince = nil return false end
	b.blockedSince = b.blockedSince or now
	if now - b.blockedSince < SQ.blockedAfter then return false end
	local me = npc:GetPos()
	local side = Rotate(FlatDir(me, E), 90)
	if side:Dot(f:GetPos() - me) > 0 then side = -side end
	local p = Ground(me + side * Rand(SQ.sidestep))
	if not p then return false end
	if b.route then Stop(npc, b) end
	GoPos(npc, b, p, "walk", E)
	b.blockedSince, b.sidestepUntil = nil, now + 3
	return true
end

-- Подавление по оценке: только свежая и узкая, 1 выстрел в 1–1,5 с, в край укрытия
local function Suppress(npc, b, c, now)
	if not c or now - c.t > 10 or c.r > 400 or now < (b.suppNext or 0) then return false end
	local wep = npc:GetActiveWeapon()
	if not IsValid(wep) or wep.PR_Projectile or wep:Clip1() <= 0 then return false end
	if PR_Inf.HoldFire(npc) then return false end
	local off = VectorRand() off.z = 0
	npc.PR_AimAt = c.pos + off:GetNormalized() * c.r * 0.5 + CHEST
	if IsValid(c.ent) and npc:GetEnemy() ~= c.ent then npc:PR_SetEnemy(c.ent) end
	if not IsValid(npc:GetEnemy()) then return false end
	npc:SetTurnTarget(npc.PR_AimAt, 1)
	wep:PrimaryAttack()
	b.suppNext = now + math.Rand(1, 1.5)
	return true
end

-- Видит ли цель бойца сейчас и смотрит ли на него (известно, только пока боец её видит)
local function LooksAt(t, npc, deg)
	local eye = t:IsPlayer() and t:EyePos() or t:WorldSpaceCenter()
	local dir = t:IsPlayer() and t:GetAimVector() or t:GetForward()
	local to = (npc:WorldSpaceCenter() - eye):GetNormalized()
	if math.deg(math.acos(math.Clamp(dir:Dot(to), -1, 1))) > deg then return false end
	return not util.TraceLine({start = eye, endpos = npc:WorldSpaceCenter(), mask = LOS, filter = {t, npc}}).Hit
end

local function Behind(t, npc, deg)
	local dir = t:IsPlayer() and t:GetAimVector() or t:GetForward()
	local to = FlatDir(t:GetPos(), npc:GetPos())
	return math.deg(math.acos(math.Clamp(Flat(dir):GetNormalized():Dot(to), -1, 1))) > deg
end

local function NoFriendNear(npc, pos, r)
	for _, m in ipairs(Members(npc.PR_Patrol)) do
		if m:GetPos():DistToSqr(pos) < r * r then return false end
	end
	return true
end

-- Дуга броска свободна (лучи по параболе)
local function ArcClear(npc, pos)
	local from = Eye(npc)
	local mid = LerpVector(0.5, from, pos) + Vector(0, 0, from:Distance(pos) * 0.25)
	return not util.TraceLine({start = from, endpos = mid, mask = MASK_SOLID_BRUSHONLY}).Hit
		and not util.TraceLine({start = mid, endpos = pos + Vector(0, 0, 30), mask = MASK_SOLID_BRUSHONLY}).Hit
end

local function SquadNadeReady(npc, now)
	local p = npc.PR_Patrol
	return not p or now >= (p.nadeAt or 0)
end
local function SquadNadeMark(npc, now)
	if npc.PR_Patrol then npc.PR_Patrol.nadeAt = now + (RC.grenadier.squadNadeCooldown or 6) end
end

local function SearchDelay(cfg)
	if istable(cfg.search) then return Rand(cfg.search) end
	return cfg.search
end

-- Нет видимого врага: держать направление, через время — идти проверять (как общий слой)
local function HoldOrSearch(npc, b, c, now, cfg, gait)
	npc.PR_AimAt, npc.PR_Face = c.pos + CHEST, c.pos
	b.state = b.state == "search" and "search" or "fight"
	b.holdSince = b.holdSince or now
	b.searchAfter = b.searchAfter or SearchDelay(cfg)
	if b.route then return end
	if now - b.holdSince > b.searchAfter and now - (b.lastSeenAt or 0) > b.searchAfter then
		if npc:GetPos():Distance(c.pos) < 90 then
			b.waitUntil = b.waitUntil or now + Rand(C.searchWait)
			if now >= b.waitUntil then U.Forget(b, c) b.waitUntil = nil b.holdSince = now end
		else
			GoPos(npc, b, c.pos, gait or "crouch", c.pos)
		end
	end
end

----------------------------------------------------------------------------------------------------
-- Приказы отряда (отход, охрана босса, место босса, охрана тела) — раньше роли
----------------------------------------------------------------------------------------------------
local function Orders(npc, b, now)
	local o = b.order
	if not o then return false end
	local seen = U.BestVisible(npc, b)
	if seen then Engage(npc, b, seen, now) end
	-- Не видит, но метка свежая (попали, слышал выстрелы) — лицом к ней, а не туда, куда велит приказ:
	-- марксман при отходе стоял спиной к игроку, по нему попали трижды, а он не обернулся
	local c = U.BestContact(b)
	local threat = not seen and c and now - c.t < C.orderThreatAge and c.pos or nil
	b.state = "fight"
	npc.PR_Fire = true
	-- Гранатомётчик и под приказом бьёт из гранатомёта (при отходе Big pipe 40 с видел стоящего игрока
	-- и молчал: приказ решал раньше роли)
	if PR_Inf.LauncherTick and PR_Inf.LauncherTick(npc, b, now, seen, c, true) then return true end
	local d = npc:GetPos():Distance(o.pos)
	-- Застрял по пути к точке приказа (StepGoto снял маршрут) — точка приказа там, где стоит, и он
	-- «дошёл»: иначе тот же путь в ту же недостижимую точку по кругу (босс 31 с «бежал» на месте), а
	-- отход отряда не кончался никогда
	if b.stuckAt and now - b.stuckAt < 1 and d > 150 and o.kind ~= "guardbody" then
		o.pos = npc:GetPos()
		o.arrived = true
		d = 0
	end
	-- Попали, стрелка не видно — пара выстрелов в его сторону (по свежей узкой метке)
	if not seen and c and now - (b.hitAt or -10) < 2 then Suppress(npc, b, c, now) end
	if o.kind == "retreat" then
		local face = seen and seen:GetPos() or threat
		-- Марксман прикрывает отход: стоит и стреляет, уходит последним
		if o.startAt and now < o.startAt then
			if b.route then Stop(npc, b) end
			if not seen and face then npc.PR_Face, npc.PR_AimAt = face, face + CHEST end
			return true
		end
		-- Бегом; враг на виду — лицом к нему и перекатами: 3–5 с бегом, 2–3 с огня с места. Шагом
		-- (≈ 46 ю/с лицом назад) до точки сбора в 2000–6000 не дойти
		if seen then
			if b.route and now > (b.legUntil or 0) then Stop(npc, b) b.legFireUntil = now + Rand(SQ.retreatLegFire) end
			if now < (b.legFireUntil or 0) then npc.PR_Crouch = false return true end
		end
		-- Попали на бегу — маршрут заново, лицом к стрелку (и огонь, когда увидит); не чаще раза в 2 с
		if b.route and face and now - (b.hitAt or 0) < 0.3 and now - (b.faceRestartAt or -10) > 2
			and not (b.route.face and b.route.face:Distance(face) < 300) then
			Stop(npc, b)
			b.faceRestartAt = now
		end
		if not b.route and d > 200 then GoPos(npc, b, o.pos, "run", face) b.legUntil = now + Rand(SQ.retreatLeg) end
		npc.PR_Crouch = d <= 200 and not seen
		if not seen and not b.route and face then npc.PR_Face, npc.PR_AimAt = face, face + CHEST end
		return true
	elseif o.kind == "guard" or o.kind == "boss" then
		if not b.route and d > 150 then GoPos(npc, b, o.pos, "run", threat or o.face) end
		-- Босс на «держать» стоит и стреляет из укрытия; под плотным огнём приседает за него
		npc.PR_Crouch = d <= 150 and (b.supp > C.suppressHide or (o.kind == "boss" and not o.hold))
		local face = threat or o.face
		if not seen and face then npc.PR_Face, npc.PR_AimAt = face, face + CHEST end
		return true
	elseif o.kind == "guardbody" then
		if not b.route and d > 150 then GoPos(npc, b, o.pos, "walk", threat or o.face) end
		npc.PR_Crouch = d <= 150 and not threat
		local face = threat or o.face
		if not seen and face then npc.PR_Face, npc.PR_AimAt = face, face + CHEST end
		return true
	end
	return false
end

PR_Inf.Roles[""] = function(npc, b, now)
	return Orders(npc, b, now)
end

----------------------------------------------------------------------------------------------------
-- Снайпер и марксман: позиция на дистанции роли, огонь с места, смена позиции
----------------------------------------------------------------------------------------------------
local function Shooter(npc, b, now, cfg, isSniper)
	if Orders(npc, b, now) then return true end
	local seen, c = U.BestVisible(npc, b), U.BestContact(b)
	if not (seen or c) then return false end
	Apply(npc, b, cfg)
	b.rs = b.rs or {}
	local s = b.rs
	local me = npc:GetPos()
	npc.PR_Fire = true

	if seen then
		Engage(npc, b, seen, now)
		s.lastVis = now
		local d = me:Distance(seen:GetPos())
		if d < 800 and LooksAt(seen, npc, 40) then
			-- Враг рядом и видит: пятится лицом и стреляет
			if not b.route then Backoff(npc, b, seen:GetPos(), 400, "walk") end
		elseif d < cfg.tooClose then
			if not b.route then s.want = "retreat" end
		else
			-- Видит цель на рабочей дистанции — стоп и огонь отсюда, позицию не ищет (бежал к «своим» 4500
			-- у игрока на виду и получал в спину). Позицию меняет, когда цель скроется или по нему попадают.
			-- Свой перекрыл линию дольше 1 с — шаг вбок
			if ClearLine(npc, b, seen:GetPos(), now) then return true end
			if b.route then Stop(npc, b) end
			s.moving = false
			if not s.pos or s.pos:Distance(me) > 150 then s.pos = me b.shotsHere = 0 end
		end
		npc.PR_Crouch = now - (b.lastFireAt or 0) < 0.8 and b.supp > 0.3
		if s.want ~= "retreat" then return true end
	end

	local E = seen and seen:GetPos() or c.pos
	if not seen then npc.PR_AimAt, npc.PR_Face = E + CHEST, E end
	if b.route then return true end
	s.moving = false

	-- Сменить или занять позицию
	if not s.pos or s.want then
		local o = {dist = cfg.dist, sectorDir = SideDir(npc, E), sectorHalf = 60, needLOS = true, maxTravel = 4000,
			heightW = 1, indoorW = isSniper and 1 or 0.5, concealOK = true, r = c and c.r}
		if s.want then
			o.minMove = Urban(me) and cfg.moveTown or cfg.moveDesert
			o.minAngleChange = cfg.angleChange
		end
		if s.want == "retreat" then o.dist = {math.max(cfg.dist[1], cfg.tooClose + 500), cfg.dist[2], cfg.dist[3]} end
		local p = PR_Inf.FindPosition(npc, E, o)
		s.want = nil
		if p then
			s.pos, s.moving = p, true
			b.shotsHere, s.holdT = 0, nil
			-- Спринтом, пока путь не на виду; вприсядку — только последние ~400 ю (тут — шагом)
			GoPos(npc, b, p, p:Distance(me) > 600 and "run" or "walk", E)
			return true
		end
		s.pos = s.pos or me
	end

	-- На позиции: выглядывает, после выстрела и под огнём приседает
	npc.PR_Crouch = b.supp > 0.3 or now - (b.lastFireAt or 0) < 0.8

	-- Цель скрылась: засвечен (стрелял отсюда, попали, подавлен) — уходит через 2–4 с,
	-- иначе держит угол 20–40 с (снайпер) / после 3–5 выстрелов (марксман)
	if s.lastVis and now - s.lastVis > 2 then
		local hidden = now - s.lastVis
		local exposed = (b.shotsHere or 0) >= (cfg.exposedShots or 99) or now - (b.hitAt or 0) < 10 or b.supp > 0.3
		if isSniper then
			s.holdT = s.holdT or (exposed and Rand({2, 4}) or Rand(cfg.holdAngle))
			if hidden > s.holdT then s.want, s.lastVis = "relocate", nil end
		else
			s.need = s.need or math.random(cfg.relocateShots[1], cfg.relocateShots[2])
			-- Свежая узкая метка, а цели не видно дольше relocateHidden — на другой угол (стоял 37 с лицом к
			-- метке и ничего не делал)
			-- (только засвеченный — стрелял отсюда или по нему попали: иначе всё время в движении)
			local stale = hidden > cfg.relocateHidden and c and now - c.t < 15 and c.r <= 800
				and ((b.shotsHere or 0) > 0 or now - (b.hitAt or -10) < 15)
			if (b.shotsHere or 0) >= s.need or exposed or stale then s.want, s.lastVis, s.need = "relocate", nil, nil end
			Suppress(npc, b, c, now)
		end
	elseif not isSniper and c and not seen then
		Suppress(npc, b, c, now)
	end
	return true
end

PR_Inf.Roles.sniper = function(npc, b, now) return Shooter(npc, b, now, RC.sniper, true) end
PR_Inf.Roles.marksman = function(npc, b, now) return Shooter(npc, b, now, RC.marksman, false) end

----------------------------------------------------------------------------------------------------
-- Штурмовик: перебежки от укрытия к укрытию к врагу, очереди 8–10, держит 1500 (манёвр — 600–900)
----------------------------------------------------------------------------------------------------
PR_Inf.Roles.assault = function(npc, b, now)
	if Orders(npc, b, now) then return true end
	local cfg = RC.assault
	local seen, c = U.BestVisible(npc, b), U.BestContact(b)
	if not (seen or c) then return false end
	Apply(npc, b, cfg)
	npc.PR_Fire = true
	local me = npc:GetPos()

	if seen then
		Engage(npc, b, seen, now)
		local E = seen:GetPos()
		local d = me:Distance(E)
		b.burstPause = d > 1500 and cfg.pauseFar or cfg.pause
		if d < cfg.dist[1] then
			if not b.route then Backoff(npc, b, E, cfg.backoff, "walk") end
			return true
		end
		local want = b.maneuver and Rand(cfg.press) or cfg.dist[2]
		if b.route and now > (b.boundUntil or 0) then Stop(npc, b) end
		if not b.route and d > want + 250 and now >= (b.nextBound or 0) and PR_Inf.CanMove(npc)
			and now - (b.lastFireAt or 0) < 1.5 then
			-- Бросок стартует, пока сам или напарник ведёт огонь; укрытие в конусе ±45° к цели
			-- Манёвр — во фланг: сектор повёрнут на 70° от линии «враг — отряд», иначе шёл по линии огня
			-- своей базы и выключал её перенос огня
			local sector, half = FlatDir(E, me), 45
			if b.maneuver then sector, half = Rotate(FlatDir(E, Center(npc)), 70 * (b.flankSign or 1)), 25 end
			local p = PR_Inf.FindPosition(npc, E, {dist = {math.max(cfg.dist[1], want * 0.8), want, math.max(want + 100, d - 150)},
				sectorDir = sector, sectorHalf = half, needLOS = true, maxTravel = cfg.boundMax, heightW = 0.3})
			if p then
				GoPos(npc, b, p, "run", nil)
				b.bounding = true
				b.boundUntil = now + Rand(cfg.bound)
				b.nextBound = now + Rand(cfg.bound) + Rand(cfg.holdBetween)
			end
		end
		if not b.route then b.bounding = false end
		npc.PR_Crouch = not b.route and b.supp > C.suppressHide
		return true
	end

	b.bounding = false
	-- Не видно: подавление по свежей оценке, выйти на позицию с обзором, потом искать
	if not Suppress(npc, b, c, now) and not b.route and now >= (b.nextBound or 0) then
		local eyeSees = not util.TraceLine({start = Eye(npc), endpos = c.pos + CHEST, mask = LOS, filter = npc}).Hit
		if not eyeSees and now - (b.lastSeenAt or 0) < 20 then
			local p = PR_Inf.FindPosition(npc, c.pos, {dist = cfg.dist, sectorDir = FlatDir(c.pos, me), sectorHalf = 60, needLOS = true, maxTravel = 1200, r = c.r})
			if p then GoPos(npc, b, p, "run", c.pos) b.nextBound = now + 4 end
		end
	end
	HoldOrSearch(npc, b, c, now, cfg, "walk")
	return true
end

----------------------------------------------------------------------------------------------------
-- Гранатомётчик: РПГ по стоящему или укрывшемуся (и по свежей узкой оценке в укрытии),
-- на колене 0,8 с, выкрик, после выстрела — на другую позицию; ручные гранаты в здание/укрытие
----------------------------------------------------------------------------------------------------
local function BehindCover(npc, c)
	return util.TraceLine({start = Eye(npc), endpos = c.pos + CHEST, mask = LOS, filter = npc}).Hit
end

-- Гранатомёт (роль и приказы отряда): видит цель на rpgMin–rpgMax, стоит она (stillTime) или идёт не
-- быстрее slowSpeed, либо свежая узкая метка за укрытием — на колено и выстрел. С одного места —
-- shotsPerSpot выстрела через seriesGap (по нему попали — сразу уходит), потом шаг вбок и пауза
-- seriesPause. Свой у точки падения ближе friendSafe или на линии — не стреляет. Под приказом отряда
-- место не меняет (движением ведает приказ)
function PR_Inf.LauncherTick(npc, b, now, seen, c, inOrder)
	if npc.PR_Role ~= "grenadier" then return false end
	local wep = npc:GetActiveWeapon()
	if not (IsValid(wep) and wep.PR_Projectile) then return false end
	local cfg = RC.grenadier
	npc.PR_Fire = false -- VJ сам пускал бы гранаты по бегущему
	local tpos, aimPos
	if seen then
		if seen:GetVelocity():Length2D() <= cfg.slowSpeed then b.stillSince = b.stillSince or now else b.stillSince = nil end
		tpos, aimPos = seen:WorldSpaceCenter(), seen:GetPos()
	elseif c then
		tpos, aimPos = c.pos + Vector(0, 0, 30), c.pos
	else
		return false
	end
	local me = npc:GetPos()
	local d = me:Distance(tpos)
	local okSeen = seen and ((b.stillSince and now - b.stillSince >= cfg.stillTime) or (seen:IsPlayer() and seen:Crouching()))
	local okHidden = not seen and c and now - c.t <= cfg.rpgAge and c.r <= cfg.rpgRadius and (Indoor(c.pos) or BehindCover(npc, c))
	b.rockets = b.rockets or cfg.rockets
	local can = (okSeen or okHidden) and d >= cfg.rpgMin and d <= cfg.rpgMax and b.rockets > 0 and now >= (b.rpgNext or 0)
		and NoFriendNear(npc, aimPos, cfg.friendSafe) and not FriendOnLine(npc, aimPos, SQ.blockedWidth)
	if not can then
		if b.kneelUntil then b.kneelUntil, npc.PR_Crouch = nil, false end
		return false
	end
	if b.route then Stop(npc, b) end
	if not b.kneelUntil then
		b.kneelUntil = now + cfg.kneel
		npc:SetTurnTarget(tpos, 1)
		npc:PlaySoundSystem("Suppressing")
	end
	npc.PR_Crouch = true
	if not seen then npc.PR_AimAt, npc.PR_Face = tpos, aimPos end
	if now < b.kneelUntil then return true end
	local cpos = c and c.pos or aimPos
	if b.rpgAt and b.rpgAt:Distance(cpos) < 300 then b.rpgShots = (b.rpgShots or 0) + 1 else b.rpgShots = 0 end
	b.rpgAt = cpos
	-- Пристрелка: первая — firstSpread°, каждая следующая по той же метке ×0,5, не точнее 0,6° (база
	-- FireProjectile); широкая метка — шире
	npc.PR_LauncherSpread = math.max(1, cfg.firstSpread / 0.6 * 0.5 ^ b.rpgShots) * math.Clamp((c and c.r or 100) / 250, 1, 1.5)
	npc.PR_AimOverride = tpos
	local ene = seen or (c and c.ent)
	if IsValid(ene) then npc:PR_SetEnemy(ene) end
	if IsValid(npc:GetEnemy()) and wep:Clip1() > 0 then wep:PrimaryAttack() end
	timer.Simple(0.2, function() if IsValid(npc) then npc.PR_AimOverride = nil end end)
	-- Граната списывается в FireProjectile (sh_npc_weapons.lua) — только при настоящем пуске
	b.kneelUntil = nil
	b.spotShots = (b.spotShots or 0) + 1
	local again = b.spotShots < cfg.shotsPerSpot and now - (b.hitAt or -10) >= 3
	b.rpgNext = now + (again and cfg.seriesGap or Rand(cfg.seriesPause))
	if not again then
		b.spotShots = 0
		npc.PR_Crouch = false
		if not inOrder then
			-- Выстрелы выдали — шаг вбок поперёк линии на цель
			local p = Ground(me + Rotate(FlatDir(me, cpos), math.random() < 0.5 and 90 or -90) * Rand(cfg.sidestep))
			if p then GoPos(npc, b, p, "run", cpos) b.relocating = true end
		end
	end
	return true
end

PR_Inf.Roles.grenadier = function(npc, b, now)
	if Orders(npc, b, now) then return true end
	local cfg = RC.grenadier
	local seen, c = U.BestVisible(npc, b), U.BestContact(b)
	if not (seen or c) then return false end
	Apply(npc, b, cfg)
	local wep = npc:GetActiveWeapon()
	local launcher = IsValid(wep) and wep.PR_Projectile ~= nil
	local me = npc:GetPos()
	b.state = "fight"
	npc.PR_Fire = not launcher
	if seen then Engage(npc, b, seen, now) npc.PR_Fire = not launcher end
	local tpos = seen and seen:WorldSpaceCenter() or (c.pos + Vector(0, 0, 30))
	if not seen then npc.PR_AimAt, npc.PR_Face = tpos, c.pos end
	local d = me:Distance(tpos)

	-- Запасной ствол: гранаты кончились или цель ближе rpgMin (взвод гранаты; раньше бежал назад) — смена;
	-- цель снова дальше rpgMin + swapBackExtra и гранаты есть — обратно гранатомёт
	if launcher then b.launcherClass = wep:GetClass() end
	b.rockets = b.rockets or cfg.rockets
	if now >= (b.swapAt or 0) then
		if launcher and (b.rockets <= 0 or d < cfg.rpgMin) then
			if not b.backupClass then
				local list = PR_NPCW.ForKind(cfg.backup)
				if #list > 0 then b.backupClass = list[math.random(#list)] end
			end
			if b.backupClass then
				b.swapAt = now + cfg.swapCooldown
				b.kneelUntil, npc.PR_Crouch = nil, false
				npc:DoChangeWeapon(b.backupClass)
				return true
			end
		elseif not launcher and b.launcherClass and b.rockets > 0 and d > cfg.rpgMin + cfg.swapBackExtra then
			b.swapAt = now + cfg.swapCooldown
			npc:DoChangeWeapon(b.launcherClass)
			return true
		end
	end

	if launcher then
		if PR_Inf.LauncherTick(npc, b, now, seen, c, false) then return true end
		-- После своей серии — дойти до новой точки; видит цель в дальности выстрела — работает отсюда,
		-- а не бежит на «свои» 3000 (бежал от игрока с 2473 до 3796 и не стрелял)
		if b.route and b.relocating then return true end
		if b.route and seen and d >= cfg.rpgMin and d <= cfg.rpgMax then Stop(npc, b) end
	elseif seen then
		-- Запасной ствол: видит — стоп и огонь, как стрелок; свой на линии дольше 1 с — шаг вбок
		if not ClearLine(npc, b, seen:GetPos(), now) and b.route then Stop(npc, b) end
	end
	if not b.route then b.relocating = nil end
	if b.route then return true end

	-- Ручная граната: враг в здании или за укрытием, в 400–1600, свои далеко, дуга свободна
	b.nades = b.nades or cfg.nades
	if c and d >= cfg.nadeRange[1] and d <= cfg.nadeRange[2] and (Indoor(c.pos) or not seen) and c.r <= 400 and now - c.t <= 10
		and b.nades > 0 and now >= (b.nadeNext or 0) and SquadNadeReady(npc, now) and NoFriendNear(npc, c.pos, cfg.nadeSafe) and ArcClear(npc, c.pos) then
		if PR_Inf.ThrowGrenade(npc, c.pos) then
			b.nades = b.nades - 1
			b.nadeNext = now + Rand(cfg.nadeCooldown)
			SquadNadeMark(npc, now)
		end
		return true
	end

	-- Держит позицию с обзором на своей дистанции; уже видит цель в дальности выстрела — работает отсюда
	if not b.rs then b.rs = {} end
	if not b.rs.pos and seen and d >= cfg.rpgMin and d <= cfg.rpgMax then b.rs.pos = me end
	if not b.rs.pos then
		local p = PR_Inf.FindPosition(npc, c and c.pos or tpos, {dist = cfg.dist, sectorDir = SideDir(npc, c and c.pos or tpos), sectorHalf = 60, needLOS = true, maxTravel = 2500})
		b.rs.pos = p or me
		if p then GoPos(npc, b, p, "run", tpos) end
	end
	if c and not seen then HoldOrSearch(npc, b, c, now, cfg, "walk") end
	return true
end

----------------------------------------------------------------------------------------------------
-- «Ебитель» (Knight): давит везде. Дальше 600 — от укрытия к укрытию с остановкой на очередь,
-- ближе — бегом со стрельбой; в комнату — граната и вход после взрыва; отход при -30% HP за 3 с
----------------------------------------------------------------------------------------------------
local function LostRecently(npc, b, now)
	local sum = 0
	for _, h in ipairs(b.hits or {}) do
		if now - h.t < 3 then sum = sum + h.dmg end
	end
	return sum / math.max(npc:GetMaxHealth(), 1)
end

-- Линии огня своих стрелков (марксман, снайпер, гранатомётчик) — рывок «Ебителя» их не пересекает
local function ShooterLanes(npc, E)
	local out = {}
	for _, m in ipairs(Members(npc.PR_Patrol)) do
		local r = m.PR_Role
		if m ~= npc and (r == "marksman" or r == "sniper" or r == "grenadier") then out[#out + 1] = {m:GetPos(), E, SQ.laneWidth} end
	end
	return out
end

PR_Inf.Roles.ebitel = function(npc, b, now)
	if Orders(npc, b, now) then return true end
	local cfg = RC.ebitel
	local seen, c = U.BestVisible(npc, b), U.BestContact(b)
	if not (seen or c) then return false end
	Apply(npc, b, cfg)
	npc.PR_Fire = true
	b.state = "fight"
	local me = npc:GetPos()

	-- Отход / лечение. Ранен на открытом — спиной не поворачивается (развернулся на 179° и погиб): присел,
	-- 1–2 с ответного огня, потом рывок вбок-назад (60° от линии угрозы) лицом к ней
	if b.backoffUntil and now < b.backoffUntil then
		if seen then Engage(npc, b, seen, now) end
		if b.backoffPrepUntil then
			npc.PR_Crouch = true
			if now < b.backoffPrepUntil then return true end
			b.backoffPrepUntil = nil
			npc.PR_Crouch = false
			local from = b.backoffFrom or me
			local p = Ground(me + Rotate(FlatDir(from, me), 60 * (b.flankSign or 1)) * cfg.backoffDash)
				or Ground(me + Rotate(FlatDir(from, me), -60 * (b.flankSign or 1)) * cfg.backoffDash)
			if p then GoPos(npc, b, p, "run", from) end
		end
		return true
	end
	if b.healUntil and now < b.healUntil then
		npc.PR_Crouch = true
		if now >= (b.healTick or 0) then
			b.healTick = now + 1
			npc:SetHealth(math.min(npc:GetMaxHealth(), npc:Health() + npc:GetMaxHealth() * 0.03))
		end
		return true
	end
	local E = seen and seen:GetPos() or c.pos
	if LostRecently(npc, b, now) > cfg.backoffHit then
		b.hits = {}
		Stop(npc, b)
		b.backoffFrom = E
		b.backoffPrepUntil = now + Rand(cfg.backoffPrep)
		b.backoffUntil = b.backoffPrepUntil + Rand(cfg.backoffTime)
		b.flankSign = math.random() < 0.5 and (b.flankSign or 1) * -1 or (b.flankSign or 1)
		return true
	end
	if npc:Health() / math.max(npc:GetMaxHealth(), 1) < cfg.healBelow and not b.healed then
		b.healed = true
		Stop(npc, b)
		Backoff(npc, b, E, 600, "run")
		b.healUntil = now + Rand(cfg.healTime)
		return true
	end

	-- Мат — не чаще раза в 5–10 с
	if now >= (b.swearAt or 0) then
		b.swearAt = now + Rand(cfg.swear)
		npc:PlaySoundSystem("CombatIdle")
	end

	if seen then
		Engage(npc, b, seen, now)
		local d = me:Distance(E)
		npc.PR_Crouch = false
		b.runSpread = d <= cfg.dist[2] and cfg.closeRunSpread or nil
		-- На бегу дальше runFireMax не стреляет: 8 с огня на бегу на 57–73 м — ни одного попадания
		if b.route and d > cfg.runFireMax then npc.PR_Fire = false end
		if d > cfg.dist[2] then
			if b.route and now > (b.boundUntil or 0) then
				Stop(npc, b)
				b.stopAt = now
				b.stopUntil = now + Rand(d > 1000 and cfg.stopShotFar or cfg.stopShot)
			end
			-- Рывок — только после очереди с новой точки (за 0,4–0,8 с остановки не успевал прицелиться)
			local fired = (b.lastFireAt or 0) > (b.stopAt or 0) or now - (b.stopAt or 0) > 6
			-- Попадает по цели — стоит и добивает (убегал от стоящего игрока, по которому попадал). Рывок —
			-- когда не попадает и есть «окно»: цель не стреляла 1,5 с, перезаряжается, не смотрит на него
			-- или с остановки прошло boundAfter
			local hitting = d <= cfg.hittingMax and now - (b.hitEnemyAt or -10) < cfg.hittingFor
			local window = not hitting and (now - (seen.PR_ShotAt or 0) >= cfg.windowQuiet
				or (b.heardReloadAt and now - b.heardReloadAt < 2)
				or not LooksAt(seen, npc, 30)
				or now - (b.stopAt or 0) > cfg.boundAfter)
			if not b.route and now >= (b.stopUntil or 0) and fired and window and PR_Inf.CanMove(npc) then
				b.bounding = true
				b.flankSign = b.flankSign or (math.random() < 0.5 and 1 or -1)
				-- Под прицельным огнём рывок короче; не через линии огня своих стрелков; 600–1000 — шагом со
				-- стрельбой лицом к цели
				local underFire = now - (b.hitAt or -10) < 2 or b.supp > 0.3
				local p = PR_Inf.FindPosition(npc, E, {dist = {300, 600, math.max(700, d - 200)}, sectorDir = Rotate(FlatDir(E, me), 20 * b.flankSign),
					sectorHalf = 40, needLOS = false, maxTravel = underFire and cfg.boundUnderFire[2] or cfg.boundTravel, avoid = ShooterLanes(npc, E)})
				local walk = d <= cfg.walkFireMax
				GoPos(npc, b, p or (me + FlatDir(me, E) * 500), walk and "walk" or "run", walk and E or nil)
				b.boundUntil = now + (underFire and cfg.boundUnderFire[1] or cfg.boundTime)
			end
			if not b.route then b.bounding = false end
		else
			-- Вплотную: бегом на него со стрельбой
			if not b.route or (b.posGoal and b.posGoal:Distance(E) > 150) then GoPos(npc, b, E, "run", nil) end
		end
		return true
	end

	-- Не видно: граната в комнату и вход после взрыва, иначе рывок к оценке
	local d = me:Distance(c.pos)
	if b.waitBlast then
		if now < b.waitBlast then return true end
		b.waitBlast = nil
		GoPos(npc, b, c.pos, "run", c.pos)
		return true
	end
	-- Дошёл до метки, там пусто — прочёсывает округу searchFor с, потом метку снимает
	if d < 90 or b.sweepC == c then
		if b.sweepC ~= c then b.sweepC, b.sweepUntil = c, now + cfg.searchFor end
		if now >= b.sweepUntil then
			U.Forget(b, c)
			b.sweepC = nil
			return true
		end
		if not b.route then
			local p = Ground(c.pos + Rotate(Vector(1, 0, 0), math.random(0, 359)) * math.Rand(300, 900))
			if p then GoPos(npc, b, p, "walk", nil) end
		end
		return true
	end
	b.nades = b.nades or 2
	-- Граната — в здание, а потеряв цель ближе nadeOpen — и под открытым небом, за угол (6 с бегал без
	-- видимости в 9 м от игрока с двумя гранатами)
	if (Indoor(c.pos) or (d < cfg.nadeOpen and c.r <= 400 and now - c.t < 10)) and d < 1200 and d > 350 and b.nades > 0 and now >= (b.nadeNext or 0) and NoFriendNear(npc, c.pos, 500) and ArcClear(npc, c.pos) then
		local g, fuse = PR_Inf.ThrowGrenade(npc, c.pos)
		if g then
			b.nades = b.nades - 1
			b.nadeNext = now + 10
			Stop(npc, b)
			b.waitBlast = now + (fuse or 3) + Rand(cfg.enterAfterBlast)
			return true
		end
	end
	-- Перед углом / дверью — пауза
	if d < 500 and b.cornerFor ~= c then
		b.cornerFor = c
		Stop(npc, b)
		b.pauseUntil = now + Rand(cfg.cornerPause)
		npc.PR_Crouch = true
	end
	if b.pauseUntil and now < b.pauseUntil then return true end
	npc.PR_Crouch = false
	if not b.route or (b.posGoal and b.posGoal:Distance(c.pos) > 300) then GoPos(npc, b, c.pos, "run", c.pos) end
	return true
end

----------------------------------------------------------------------------------------------------
-- Тихоня: заходит с тыла вприсядку, замирает под взглядом, стреляет только при поводе
----------------------------------------------------------------------------------------------------
PR_Inf.Roles.sneak = function(npc, b, now)
	if Orders(npc, b, now) then return true end
	local cfg = RC.sneak
	local seen, c = U.BestVisible(npc, b), U.BestContact(b)
	if not (seen or c) then return false end
	Apply(npc, b, cfg)
	b.state = "fight"
	b.rs = b.rs or {}
	local s = b.rs
	local me = npc:GetPos()

	local looked = seen and LooksAt(seen, npc, cfg.freezeLook)
	s.lookedT = math.max(0, (s.lookedT or 0) + (looked and 0.2 or -0.2))
	local hit = now - (b.hitAt or 0) < 3
	local behind = seen and me:Distance(seen:GetPos()) <= cfg.behind and Behind(seen, npc, cfg.rear) and now - (seen.PR_ShotAt or 0) < 2
	local reload = b.heardReloadAt and now - b.heardReloadAt < 2 and (b.heardReloadDist or 1e9) <= cfg.reloadTrigger
	local trigger = hit or s.lookedT >= cfg.lookedTrigger or behind or reload

	if seen and (trigger or s.firing) then
		Engage(npc, b, seen, now)
		npc.PR_Fire = true
		npc.PR_Crouch = false
		s.firing = s.firing or now
		if now - s.firing > 2.5 then
			-- Очередь дал — отходит и заходит снова, со сдвигом
			s.firing = nil
			s.reengageAt = now + Rand(cfg.reengage)
			s.shift = ((s.shift or 0) + cfg.shift) % 360
			Stop(npc, b)
			Backoff(npc, b, seen:GetPos(), 600, "crouch")
		end
		return true
	end
	npc.PR_Fire = false

	-- Под взглядом — замереть, потом уйти в маскировку вне линии огня
	if looked then
		if not s.freezeAt then s.freezeAt = now Stop(npc, b) npc.PR_Crouch = true end
		if now - s.freezeAt > Rand(cfg.freezeMax) then
			s.freezeAt = nil
			local p = PR_Inf.FindPosition(npc, seen:GetPos(), {dist = {300, 700, 1500}, sectorDir = FlatDir(seen:GetPos(), me), sectorHalf = 90, wantHidden = true, maxTravel = 600})
			if p then GoPos(npc, b, p, "crouch", nil) end
		end
		return true
	end
	s.freezeAt = nil
	if s.reengageAt and now < s.reengageAt then return true end
	if b.route then return true end

	-- Заход: дугой на расстоянии, потом в тыл (тыл — от направления «враг -> наш отряд»)
	local E = seen and seen:GetPos() or c.pos
	local toSquad = SideDir(npc, E)
	local rear = Rotate(-toSquad, s.shift or 0)
	local arc = Urban(me) and cfg.arcTown or cfg.arcDesert
	local dist = Flat(me - E):Length()
	local target
	if dist > arc * 1.2 and not s.onArc then
		local side = (s.side or (math.random() < 0.5 and 1 or -1))
		s.side = side
		target = E + Rotate(toSquad, 100 * side) * arc
		s.onArc = true
	else
		target = E + rear * math.max(cfg.dist[2], 300)
	end
	local g = Ground(target)
	if g then GoPos(npc, b, g, "crouch", E) end
	npc.PR_Crouch = false
	return true
end

----------------------------------------------------------------------------------------------------
-- Отряд: раз в 0,5 с на патруль
----------------------------------------------------------------------------------------------------
-- Можно ли бойцу сейчас двигаться (жетоны): не больше половины отряда, напарник стоит; в засаде — всем
function PR_Inf.CanMove(npc)
	local p = npc.PR_Patrol
	local sq = p and p.squad
	if not sq then return true end
	if CurTime() < (sq.ambushUntil or 0) then return true end
	local ms = Members(p)
	local moving = 0
	for _, m in ipairs(ms) do
		if m ~= npc and m.PR_Brain.bounding then moving = moving + 1 end
	end
	if moving >= math.max(1, math.floor(#ms / 2)) then return false end
	local partner = npc.PR_Partner
	if IsValid(partner) and partner.PR_Brain and partner.PR_Brain.bounding then return false end
	return true
end

local function SquadEnemy(ms)
	local best, bestS, seenBy
	local now = CurTime()
	for _, m in ipairs(ms) do
		local b = m.PR_Brain
		local seen = U.BestVisible(m, b)
		if seen then return seen:GetPos(), seen, m end
		local c = U.BestContact(b)
		if c then
			local s = (now - c.t) + c.r / 200
			if not bestS or s < bestS then best, bestS = c.pos, s end
		end
	end
	return best
end

-- Босс — только главный, заданный в варианте патруля (не «первый попавшийся», когда главного нет),
-- и только с ролью «Обычный»: главному с ролью (Knight-«Ебитель» у Goons) командует роль
local function BossOf(patrol)
	local L = patrol.leader
	if IsValid(L) and L.PR_PatrolRole == "leader" and (L.PR_Role or "") == "" then return L end
end

local function SetupSquad(patrol, ms)
	local sq = {initial = #ms, cycles = 0, phase = "patrol"}
	patrol.squad = sq
	sq.boss = BossOf(patrol)
	-- Goons (есть «Ебитель») не отступают — и после смерти Knight
	for _, m in ipairs(ms) do
		if m.PR_Role == "ebitel" then sq.goons = true end
	end
	local followers = {}
	for _, m in ipairs(ms) do
		if m ~= sq.boss then followers[#followers + 1] = m end
	end
	for i = 1, #followers, 2 do
		local a, b = followers[i], followers[i + 1]
		if IsValid(b) then a.PR_Partner, b.PR_Partner = b, a end
	end
	-- Охрана босса: первые двое «обычных» или штурмовиков (нет босса — нет и охраны). Остальные
	-- «обычные» в отряде с боссом давят как штурмовики (как у Решалы в EFT: двое при нём, остальные
	-- обходят и давят)
	sq.guards = {}
	for _, m in ipairs(sq.boss and followers or {}) do
		if #sq.guards < 2 and (m.PR_Role == nil or m.PR_Role == "" or m.PR_Role == "assault") then
			sq.guards[#sq.guards + 1] = m
		elseif m.PR_Role == nil or m.PR_Role == "" then
			m.PR_Role = "assault"
		end
	end
	if #followers >= 4 then sq.rear = followers[#followers] end
	-- Флаги для сведения прицела (PR_Inf.SpreadMul): босс сводит быстрее и точнее, охрана — как бойцы
	if sq.boss then
		sq.boss.PR_Brain.isBoss = true
		sq.boss.PR_Brain.accMul = SQ.bossAccMul
	end
	for _, g in ipairs(sq.guards) do g.PR_Brain.isGuard = true end
	return sq
end

local function Rally(patrol, ms, E)
	local center = Vector()
	for _, m in ipairs(ms) do center = center + m:GetPos() end
	center = center / #ms
	local band = Urban(center) and SQ.rallyTown or SQ.rallyDesert
	local npc = IsValid(patrol.leader) and patrol.leader or ms[1]
	local p = PR_Inf.FindPosition(npc, E, {dist = {band[1], (band[1] + band[2]) / 2, band[2]}, sectorDir = FlatDir(E, center), sectorHalf = 45,
		wantHidden = true, maxTravel = band[2] + 2000})
	return p or (center + FlatDir(E, center) * band[1])
end

local function SquadTick(patrol, now)
	local ms = Members(patrol)
	if #ms == 0 then return end
	local sq = patrol.squad or SetupSquad(patrol, ms)
	for _, m in ipairs(ms) do m.PR_Brain.holdFireShift = false end
	local E, seenEnt = SquadEnemy(ms)
	local boss = sq.boss

	-- Смерть босса: выкрик, окно без приказов, ярость видевших, охрана тела, новый командир.
	-- Мёртвого NPC VJ удаляет (труп — отдельная сущность): место — последнее известное
	if Alive(boss) then sq.bossLastPos = boss:GetPos() end
	if boss and not Alive(boss) and not sq.bossDeadAt and sq.bossLastPos then
		sq.bossDeadAt, sq.bossPos = now, sq.bossLastPos
		for _, m in ipairs(ms) do
			local b = m.PR_Brain
			b.order = nil
			if m:GetPos():Distance(sq.bossPos) <= SQ.rageRadius then
				b.rageUntil = now + Rand(SQ.rage)
				b.searchAfter = 0.1
			else
				local p = Ground(sq.bossPos + Rotate(Vector(1, 0, 0), math.random(0, 359)) * Rand(SQ.guardBodyDist))
				if p then b.order = {kind = "guardbody", pos = p, face = sq.bossPos, till = now + Rand(SQ.guardBody)} end
			end
		end
		if ms[1] then ms[1]:PlaySoundSystem("AllyDeath") end
		sq.quietUntil = now + Rand(SQ.bossDeadQuiet)
	end
	if sq.bossDeadAt and not sq.newLeader and now - sq.bossDeadAt > SQ.newLeaderAfter then
		local best
		for _, m in ipairs(ms) do
			if (m.PR_Role == "assault" or not best) and (not best or m:Health() > best:Health()) then best = m end
		end
		sq.newLeader, patrol.leader = best, best
		if #ms / sq.initial < SQ.leaveBelow then sq.leave = true end
	end
	for _, m in ipairs(ms) do
		local b = m.PR_Brain
		if b.order and b.order.till and now > b.order.till then b.order = nil end
	end
	if sq.quietUntil and now < sq.quietUntil then return end

	if not E then
		-- Нет врага: приказы сняты, отряд — патруль
		if sq.phase ~= "patrol" and sq.phase ~= "regroup" then sq.phase = "patrol" end
		for _, m in ipairs(ms) do
			local b = m.PR_Brain
			if b.order and b.order.kind ~= "guardbody" and b.order.kind ~= "retreat" then b.order = nil end
		end
		if sq.phase == "regroup" and now > (sq.regroupUntil or 0) then
			sq.phase = "patrol"
			for _, m in ipairs(ms) do m.PR_Brain.order = nil end
			if sq.leave then patrol.expiresAt = now end
		end
		return
	end

	-- Начало боя: обход или нет, сторона, кто база, кто манёвр
	if sq.phase == "patrol" then
		sq.phase = "combat"
		-- Потери считаются за этот бой: погибшие до контакта — не повод отходить (одиночка отходил на
		-- первом же контакте)
		sq.initial, sq.contactAt = #ms, now
		sq.flank = math.random() < SQ.flankChance
		sq.flankSign = math.random() < 0.5 and 1 or -1
		sq.flankUntil = now + Rand(SQ.flankTimeout)
		local n = 0
		for _, m in ipairs(ms) do
			local b = m.PR_Brain
			b.maneuver = false
			if sq.flank and (m.PR_Role == "assault" or m.PR_Role == "ebitel") and m ~= boss and not table.HasValue(sq.guards, m) then
				n = n + 1
				-- Клещи при 8+: манёвр с двух сторон
				b.maneuver = true
				b.flankSign = (#ms >= SQ.pincerAt and n % 2 == 0) and -sq.flankSign or sq.flankSign
			end
		end
	end
	if sq.flank and now > (sq.flankUntil or 0) then
		sq.flank = false
		for _, m in ipairs(ms) do m.PR_Brain.maneuver = false end
	end

	-- Засада: 2+ попадания по отряду за 2 с — все в укрытие сразу
	local hits = 0
	for _, m in ipairs(ms) do
		for _, h in ipairs(m.PR_Brain.hits or {}) do
			if now - h.t < SQ.ambushWindow then hits = hits + 1 end
		end
	end
	if hits >= SQ.ambushHits and now > (sq.ambushUntil or 0) + 5 then
		sq.ambushUntil = now + Rand(SQ.ambushFree)
		for _, m in ipairs(ms) do
			-- Гранатомётчика на колене не трогать (срывало выстрел)
			if not m.PR_Brain.kneelUntil then
				local p = PR_Inf.FindPosition(m, E, {dist = {200, 800, 3000}, sectorDir = FlatDir(E, m:GetPos()), sectorHalf = 90, wantHidden = true, maxTravel = 500})
				if p then GoPos(m, m.PR_Brain, p, "run", E) end
			end
		end
	end

	-- Отход: потеряна половина или босс плох; не больше двух циклов
	local share = #ms / sq.initial
	local bossLow = IsValid(boss) and Alive(boss) and boss:Health() / math.max(boss:GetMaxHealth(), 1) < SQ.retreatBossHp
	-- Отряд с «Ебителем» не отступает (Goons в EFT давят до конца), одиночка — тоже (воюет по роли).
	-- Не раньше retreatMinContact с начала боя (сначала — ответный огонь и укрытие) и только если враг
	-- сильнее: retreatHits+ попаданий по отряду за retreatHitWindow или нас не больше известных врагов
	-- Гибель своих — тоже попадания по отряду (по два за погибшего)
	if sq.lastCount and #ms < sq.lastCount then
		sq.deaths = sq.deaths or {}
		for _ = 1, sq.lastCount - #ms do sq.deaths[#sq.deaths + 1] = now end
	end
	sq.lastCount = #ms
	local hitsRecent, foes = 0, {}
	for _, t in ipairs(sq.deaths or {}) do
		if now - t < SQ.retreatHitWindow then hitsRecent = hitsRecent + 2 end
	end
	for _, m in ipairs(ms) do
		local mb = m.PR_Brain
		for _, h in ipairs(mb.hits or {}) do
			if now - h.t < SQ.retreatHitWindow then hitsRecent = hitsRecent + 1 end
		end
		for _, c in ipairs(mb.contacts or {}) do
			if IsValid(c.ent) and now - c.t < 20 then foes[c.ent] = true end
		end
	end
	local nFoes = math.max(table.Count(foes), 1)
	local stronger = hitsRecent >= SQ.retreatHits or #ms <= nFoes
	if not sq.goons and #ms > 1 and sq.phase == "combat" and now - (sq.contactAt or now) >= SQ.retreatMinContact
		and ((share <= SQ.retreatLoss and stronger) or bossLow) and sq.cycles < SQ.cycles then
		sq.phase = "retreat"
		sq.cycles = sq.cycles + 1
		sq.rally = Rally(patrol, ms, E)
		for i, m in ipairs(ms) do
			local p = Ground(sq.rally + Rotate(Vector(1, 0, 0), i * 50) * 150) or sq.rally
			m.PR_Brain.order = {kind = "retreat", pos = p}
			-- Марксман и снайпер прикрывают: стреляют, пока свои делают первый рывок, уходят последними
			if m.PR_Role == "marksman" or m.PR_Role == "sniper" then m.PR_Brain.order.startAt = now + Rand(SQ.retreatCover) end
		end
		if ms[1] then ms[1]:PlaySoundSystem("CallForHelp") end
	end
	if sq.phase == "retreat" then
		local arrived = 0
		for _, m in ipairs(ms) do
			local o = m.PR_Brain.order
			if m:GetPos():Distance(sq.rally) < 600 or (o and o.arrived) then arrived = arrived + 1 end
		end
		if arrived >= math.ceil(#ms * 0.6) then
			sq.phase = "regroup"
			sq.regroupUntil = now + Rand(SQ.regroup)
			if share < SQ.reattackShare or sq.cycles >= SQ.cycles then sq.leave = true end
		end
		return
	end
	if sq.phase == "regroup" then
		if now > (sq.regroupUntil or 0) then
			sq.phase = "combat"
			for _, m in ipairs(ms) do m.PR_Brain.order = nil end
			if sq.leave then patrol.expiresAt = now end
		end
		return
	end

	-- Босс во второй линии, охрана между ним и угрозой; враг близко — отход один раз
	if IsValid(boss) and Alive(boss) and boss.PR_Brain then
		local bb = boss.PR_Brain
		local dB = boss:GetPos():Distance(E)
		if dB < SQ.bossRetreatAt then
			if not sq.bossRetreatAt then
				sq.bossRetreatAt = now
				local p = Rally(patrol, {boss}, E)
				bb.order = {kind = "retreat", pos = p, till = now + 25}
				for _, g in ipairs(sq.guards) do
					if Alive(g) then g.PR_Brain.order = {kind = "retreat", pos = Ground(p + VectorRand() * 150) or p, till = now + 25} end
				end
			elseif now - sq.bossRetreatAt < SQ.bossRetreatAgain + 25 then
				-- Догнали снова: держит комнату с охраной
				bb.order = {kind = "boss", pos = boss:GetPos(), face = E}
			end
		elseif not (bb.order and bb.order.kind == "retreat") then
			-- Фронт — средняя точка штурмовиков (или всех, кроме босса и охраны)
			local front, n = Vector(), 0
			for _, m in ipairs(ms) do
				if m ~= boss and not table.HasValue(sq.guards, m) then front = front + m:GetPos() n = n + 1 end
			end
			front = n > 0 and front / n or boss:GetPos()
			-- Расстояние «позади» и места охраны — одни на весь бой (раньше Rand каждые 0,5 с: приказ
			-- менялся почти каждый тик, босс и охрана всё время бежали). Переназначаем, только если враг
			-- или фронт сдвинулись дальше SQ.reorderMove. Босс видит врага с 2000+ — он и есть вторая
			-- линия: стоит и стреляет
			sq.bossBehindD = sq.bossBehindD or Rand(SQ.bossBehind)
			local moved = not sq.orderE or sq.orderE:Distance(E) > SQ.reorderMove or sq.orderFront:Distance(front) > SQ.reorderMove
			local seesFar = U.BestVisible(boss, bb) and dB >= SQ.bossHoldSeen
			if seesFar and not (bb.order and bb.order.kind == "boss" and bb.order.hold) then
				-- Укрытие рядом (стоя видно врага, присев — нет), иначе — где стоит
				local p = PR_Inf.FindPosition(boss, E, {dist = {math.max(dB - 400, 600), dB, dB + 400}, sectorDir = FlatDir(E, boss:GetPos()),
					sectorHalf = 60, needLOS = true, maxTravel = SQ.bossCoverTravel})
				bb.order = {kind = "boss", pos = p or boss:GetPos(), face = E, hold = true}
				moved = true
			elseif moved and not seesFar then
				local goal = Ground(front - FlatDir(front, E) * sq.bossBehindD) or boss:GetPos()
				bb.order = {kind = "boss", pos = goal, face = E}
			end
			if moved then
				sq.orderE, sq.orderFront = E, front
				local goal = bb.order and bb.order.pos or boss:GetPos()
				local gd = Urban(boss:GetPos()) and SQ.guardDist or SQ.guardDistDesert
				sq.guardD = sq.guardD or {}
				for i, g in ipairs(sq.guards) do
					if Alive(g) then
						local side = (i == 1) and 1 or -1
						sq.guardD[i] = sq.guardD[i] or Rand(gd)
						local gp = Ground(goal + FlatDir(goal, E) * sq.guardD[i] + Rotate(FlatDir(goal, E), 90 * side) * 120) or goal
						g.PR_Brain.order = {kind = "guard", pos = gp, face = E}
					end
				end
			end
		end
	end

	-- Перенос огня базы: свой манёвр ближе 600 к цели или в ±10° от линии стрельбы
	for _, m in ipairs(ms) do
		local b = m.PR_Brain
		b.holdFireShift = false
		if not b.maneuver then
			for _, o in ipairs(ms) do
				if o ~= m and o.PR_Brain.maneuver then
					if o:GetPos():Distance(E) < SQ.fireShiftDist then b.holdFireShift = true break end
					local a = math.deg(math.acos(math.Clamp(FlatDir(m:GetPos(), E):Dot(FlatDir(m:GetPos(), o:GetPos())), -1, 1)))
					if a < SQ.fireShiftAngle and m:GetPos():Distance(o:GetPos()) < m:GetPos():Distance(E) then b.holdFireShift = true break end
				end
			end
		end
	end

	-- Тыловой: смотрит назад, пока враг не ближе 1500 с тыла
	-- В бою — только в большом отряде (от SQ.rearMinSquad); по нему стреляют или он видит врага —
	-- приказ снимается и не возвращается 10 с (ловил пули, отвернувшись назад по приказу)
	if IsValid(sq.rear) and Alive(sq.rear) then
		local b = sq.rear.PR_Brain
		local back = sq.rear:GetPos() - FlatDir(sq.rear:GetPos(), E) * 500
		local underFire = now - (b.hitAt or 0) < 5 or b.supp > 0.25 or U.BestVisible(sq.rear, b)
		if underFire then b.rearOffUntil = now + 10 end
		local want = (sq.phase ~= "combat" or #ms >= SQ.rearMinSquad) and now >= (b.rearOffUntil or 0)
			and sq.rear:GetPos():Distance(E) > 1500
		if want then
			if not (b.order and b.order.rear) then b.order = {kind = "guard", pos = sq.rear:GetPos(), face = back, rear = true} end
		elseif b.order and b.order.rear then
			b.order = nil
		end
	end
end
PR_Inf.SquadTick = SquadTick

timer.Create("PR_InfSquad", 0.5, 0, function()
	local now = CurTime()
	for _, patrol in ipairs(PR_Patrol and PR_Patrol.Active or {}) do
		local ok, err = pcall(SquadTick, patrol, now)
		if not ok then ErrorNoHalt("[PR] отряд: " .. tostring(err) .. "\n") end
	end
end)

-- Попал по врагу — «Ебитель», который попадает по стоящему, стоит и добивает
hook.Add("PostEntityTakeDamage", "PR_InfHitEnemy", function(ent, dmg, took)
	if not took or not IsValid(ent) or not (ent:IsPlayer() or ent:IsNPC()) then return end
	local a = dmg:GetAttacker()
	if IsValid(a) and a ~= ent and a.PR_Brain then a.PR_Brain.hitEnemyAt = CurTime() end
end)
