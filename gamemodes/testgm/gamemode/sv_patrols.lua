-- Патрули NPC: время от времени на случайном споте появляется группа (например, Решала со свитой)
-- и ходит по карте между территориями, пока не выйдет её время.
--
-- На rp_desert_conflict нет AI-узлов и навмеша, поэтому сами NPC дорогу через полкарты не находят.
-- Админ расставляет споты «Редактором патрулей» (entities/weapons/pr_patrol_tool.lua). Соседние
-- споты, между которыми можно пройти по прямой, соединяются сами, и патруль идёт от спота к споту.
-- Варианты патрулей и общие настройки — config/patrols.lua.

include("config/patrols.lua")

util.AddNetworkString("PR_PatrolSpots")
util.AddNetworkString("PR_PatrolSetZone")
util.AddNetworkString("PR_PatrolSpotZone")

PR_Patrol = PR_Patrol or {}
PR_Patrol.Spots = PR_Patrol.Spots or {}   -- [id] = {Id, Pos, Zone}
PR_Patrol.Links = PR_Patrol.Links or {}   -- [id] = {[соседний id] = расстояние}
PR_Patrol.Active = PR_Patrol.Active or {} -- патрули на карте

local ENABLED = CreateConVar("pr_patrols", "1", {FCVAR_ARCHIVE}, "Выпускать патрули NPC по таймеру")

local function Settings()
	return PR_PATROL_SETTINGS
end

local function CurrentMap()
	return string.lower(game.GetMap())
end

local function RandRange(range)
	return math.Rand(range[1], range[2])
end

local function Pick(value)
	if istable(value) then return value[math.random(#value)] end
	return value
end

----------------------------------------------------------------------------------------------------
-- Игроки рядом
----------------------------------------------------------------------------------------------------

local function PlayersNear(pos, dist)
	for _, ply in ipairs(player.GetAll()) do
		if ply:Alive() and ply:GetPos():DistToSqr(pos) < dist * dist then return true end
	end
	return false
end

local function SeenByPlayer(pos)
	for _, ply in ipairs(player.GetAll()) do
		if ply:Alive() then
			local tr = util.TraceLine({start = ply:EyePos(), endpos = pos + Vector(0, 0, 48), mask = MASK_SOLID_BRUSHONLY})
			if not tr.Hit then return true end
		end
	end
	return false
end

----------------------------------------------------------------------------------------------------
-- Споты и связи между ними
----------------------------------------------------------------------------------------------------

local WALK_HEIGHT = 36 -- на этой высоте над полом проверяем проход между спотами

-- Можно ли пройти напрямую от a до b: не дальше linkDistance, нет стен, и по пути везде есть пол
function PR_Patrol.CanWalk(a, b)
	local dist = a:Distance(b)
	if dist > Settings().linkDistance then return false end

	local up = Vector(0, 0, WALK_HEIGHT)
	local wall = util.TraceHull({
		start = a + up,
		endpos = b + up,
		mins = Vector(-10, -10, -16),
		maxs = Vector(10, 10, 24),
		mask = MASK_NPCSOLID_BRUSHONLY
	})
	if wall.Hit then return false end

	local steps = math.max(math.floor(dist / 96), 1)
	for i = 1, steps - 1 do
		local p = LerpVector(i / steps, a, b) + up
		local floor = util.TraceLine({start = p, endpos = p - Vector(0, 0, WALK_HEIGHT + 96), mask = MASK_NPCSOLID_BRUSHONLY})
		if not floor.Hit then return false end
	end

	return true
end

function PR_Patrol.RebuildLinks()
	local links, list = {}, {}
	for id, spot in pairs(PR_Patrol.Spots) do
		links[id] = {}
		table.insert(list, spot)
	end

	for i = 1, #list do
		for j = i + 1, #list do
			local a, b = list[i], list[j]
			if PR_Patrol.CanWalk(a.Pos, b.Pos) then
				local d = a.Pos:Distance(b.Pos)
				links[a.Id][b.Id] = d
				links[b.Id][a.Id] = d
			end
		end
	end

	PR_Patrol.Links = links
end

function PR_Patrol.LoadSpots()
	PR_Patrol.Spots = {}
	for _, spot in ipairs(PR_DB.GetPatrolSpots(CurrentMap())) do
		PR_Patrol.Spots[spot.Id] = spot
	end
	PR_Patrol.RebuildLinks()
end

-- Ближайший спот к pos (не дальше maxDist, если задан)
function PR_Patrol.NearestSpot(pos, maxDist)
	local best, bestD
	for id, spot in pairs(PR_Patrol.Spots) do
		local d = spot.Pos:DistToSqr(pos)
		if (not maxDist or d <= maxDist * maxDist) and (not bestD or d < bestD) then
			best, bestD = id, d
		end
	end
	return best
end

-- Споты и связи — админам, чтобы редактор их рисовал
function PR_Patrol.SendSpots(target)
	local spots = {}
	for id, spot in SortedPairs(PR_Patrol.Spots) do
		local linked = {}
		for other in pairs(PR_Patrol.Links[id] or {}) do table.insert(linked, other) end
		table.insert(spots, {id = id, pos = spot.Pos, zone = spot.Zone, links = linked})
	end

	local recipients = {}
	if IsValid(target) then
		recipients = {target}
	else
		for _, ply in ipairs(player.GetHumans()) do
			if PR_IsAdmin(ply) then table.insert(recipients, ply) end
		end
	end
	if #recipients == 0 then return end

	net.Start("PR_PatrolSpots")
		net.WriteTable(spots)
	net.Send(recipients)
end

local function SpotsChanged()
	PR_Patrol.RebuildLinks()
	PR_Patrol.SendSpots()
end

function PR_Patrol.AddSpot(pos, zone)
	local id = PR_DB.AddPatrolSpot(CurrentMap(), pos, zone or "")
	if not id then return end

	PR_Patrol.Spots[id] = {Id = id, Pos = pos, Zone = zone or ""}
	SpotsChanged()
	return id
end

function PR_Patrol.RemoveSpot(id)
	if not PR_Patrol.Spots[id] then return false end

	PR_DB.RemovePatrolSpot(id)
	PR_Patrol.Spots[id] = nil
	SpotsChanged()
	return true
end

function PR_Patrol.SetZone(id, zone)
	local spot = PR_Patrol.Spots[id]
	if not spot then return false end

	spot.Zone = zone or ""
	PR_DB.SetPatrolSpotZone(id, spot.Zone)
	PR_Patrol.SendSpots()
	return true
end

-- Название территории из меню редактора: без пробелов по краям, до 32 символов
local function CleanZone(text)
	text = string.Trim(tostring(text or ""))
	if (utf8.len(text) or 99) > 32 then return nil end
	return text
end

----------------------------------------------------------------------------------------------------
-- Путь по сети спотов
----------------------------------------------------------------------------------------------------

-- Дейкстра от спота from: расстояния по сети и откуда пришли
local function Dijkstra(from)
	local dist, prev, done = {[from] = 0}, {}, {}

	while true do
		local best, bestD
		for id, d in pairs(dist) do
			if not done[id] and (not bestD or d < bestD) then best, bestD = id, d end
		end
		if not best then break end

		done[best] = true
		for other, len in pairs(PR_Patrol.Links[best] or {}) do
			local nd = bestD + len
			if not dist[other] or nd < dist[other] then
				dist[other] = nd
				prev[other] = best
			end
		end
	end

	return dist, prev
end

-- Список спотов от from (не включая его) до to, или nil, если не дойти
function PR_Patrol.FindPath(from, to)
	local dist, prev = Dijkstra(from)
	if not dist[to] then return end

	local path, id = {}, to
	while id and id ~= from do
		table.insert(path, 1, id)
		id = prev[id]
	end
	return path
end

-- Новая цель: спот другой территории (если территории подписаны), иначе просто подальше
local function PlanRoute(patrol)
	local from = patrol.spot
	local here = PR_Patrol.Spots[from]
	if not here then return false end

	local dist, prev = Dijkstra(from)

	local maxD = 0
	for id, d in pairs(dist) do
		if id ~= from then maxD = math.max(maxD, d) end
	end

	local otherZone, far = {}, {}
	for id, d in pairs(dist) do
		local spot = PR_Patrol.Spots[id]
		if id ~= from and spot then
			if spot.Zone ~= "" and spot.Zone ~= here.Zone then table.insert(otherZone, id) end
			if d >= maxD * 0.5 then table.insert(far, id) end
		end
	end

	local pool = #otherZone > 0 and otherZone or far
	if #pool == 0 then return false end

	local dest = pool[math.random(#pool)]
	local route, id = {}, dest
	while id and id ~= from do
		table.insert(route, 1, id)
		id = prev[id]
	end

	patrol.route = route
	patrol.routeIndex = 1
	patrol.dest = dest
	return true
end

----------------------------------------------------------------------------------------------------
-- Появление
----------------------------------------------------------------------------------------------------

-- Место для NPC рядом с pos: на полу, хитбокс ни во что не упирается, не вплотную к другим
local function FreeSpotNear(pos, used)
	for i = 1, 20 do
		local ang = math.rad(math.random(0, 359))
		local dist = i == 1 and 0 or math.random(40, 160)
		local p = pos + Vector(math.cos(ang) * dist, math.sin(ang) * dist, 0)

		local down = util.TraceLine({start = p + Vector(0, 0, 64), endpos = p - Vector(0, 0, 128), mask = MASK_NPCSOLID_BRUSHONLY})
		if down.Hit and not down.StartSolid then
			local spot = down.HitPos + Vector(0, 0, 4)
			local hull = util.TraceHull({start = spot, endpos = spot, mins = Vector(-18, -18, 0), maxs = Vector(18, 18, 72), mask = MASK_NPCSOLID})

			local crowded = false
			for _, u in ipairs(used) do
				if u:DistToSqr(spot) < 48 * 48 then crowded = true break end
			end

			if not hull.Hit and not crowded then return spot end
		end
	end

	return pos + Vector(math.random(-60, 60), math.random(-60, 60), 8)
end

-- Спот для появления: подальше от игроков, вне их видимости, и чтобы оттуда было куда идти
local function PickSpawnSpot()
	local candidates = {}
	for id, spot in pairs(PR_Patrol.Spots) do
		if next(PR_Patrol.Links[id] or {}) and not PlayersNear(spot.Pos, Settings().safeDistance) and not SeenByPlayer(spot.Pos) then
			table.insert(candidates, id)
		end
	end
	if #candidates == 0 then return end
	return candidates[math.random(#candidates)]
end

local function SpawnMember(patrol, def, pos, role)
	local class = Pick(def.class)
	-- Не все NPC есть в спавн-меню: охрану Решалы пак регистрирует только как сущности
	local npcData = list.Get("NPC")[class] or {}
	if not npcData.Class and not scripted_ents.GetStored(class) then
		MsgN("[PR] патруль: нет NPC " .. tostring(class) .. " (не установлен аддон?)")
		return
	end

	local npc = ents.Create(class)
	if not IsValid(npc) then return end

	local weapon = Pick(def.weapons)
	if weapon then npc:SetKeyValue("additionalequipment", weapon) end

	local flags = bit.bor(SF_NPC_FADE_CORPSE, SF_NPC_ALWAYSTHINK)
	if npcData.SpawnFlags then flags = bit.bor(flags, npcData.SpawnFlags) end
	npc:SetKeyValue("spawnflags", flags)
	for k, v in pairs(npcData.KeyValues or {}) do
		npc:SetKeyValue(k, v)
	end

	npc:SetPos(pos)
	npc:SetAngles(Angle(0, math.random(0, 359), 0))
	npc:Spawn()
	npc:Activate()

	-- VJ-паки в Initialize ставят свой класс и дружбу с игроками (vj_me_scav): перебиваем после спавна
	npc.VJ_NPC_Class = {patrol.cfg.npcClass or "CLASS_PR_BANDITS"}
	npc.PlayerFriendly = false
	npc.FriendsWithAllPlayerAllies = false
	npc.WhiteFractionList = nil
	-- Сами не бродят: куда идти, решает патруль
	npc.DisableWandering = true

	if def.health then
		npc:SetMaxHealth(def.health)
		npc:SetHealth(def.health)
		npc.StartHealth = def.health
	end

	npc.PR_Patrol = patrol
	npc.PR_PatrolRole = role
	npc.PR_PatrolDef = def
	npc.PR_Reward = def.reward

	table.insert(patrol.members, npc)
	return npc
end

-- Выпустить патруль typeKey на спот spotId (без spotId — случайный безопасный).
-- Возвращает патруль или nil и причину.
function PR_Patrol.Spawn(typeKey, spotId)
	local cfg = PR_PATROL_TYPES[typeKey]
	if not cfg then return nil, "нет патруля «" .. tostring(typeKey) .. "»" end

	spotId = spotId or PickSpawnSpot()
	local spot = spotId and PR_Patrol.Spots[spotId]
	if not spot then return nil, "нет подходящего спота (все рядом с игроками или ни с чем не связаны)" end

	PR_Patrol.LastId = (PR_Patrol.LastId or 0) + 1
	local patrol = {
		id = PR_Patrol.LastId,
		type = typeKey,
		cfg = cfg,
		members = {},
		spot = spotId,
		dir = Vector(1, 0, 0),
		lingerUntil = CurTime() + 5,
		expiresAt = CurTime() + RandRange(Settings().lifetime),
		lastCombat = 0
	}

	local used = {}
	local function Place()
		local p = FreeSpotNear(spot.Pos, used)
		table.insert(used, p)
		return p
	end

	if cfg.leader then
		patrol.leader = SpawnMember(patrol, cfg.leader, Place(), "leader")
	end
	for _, group in ipairs(cfg.followers or {}) do
		for _ = 1, group.count or 1 do
			SpawnMember(patrol, group, Place(), "follower")
		end
	end

	if #patrol.members == 0 then return nil, "не удалось создать NPC" end
	if not IsValid(patrol.leader) then patrol.leader = patrol.members[1] end

	table.insert(PR_Patrol.Active, patrol)

	if cfg.announce then PrintMessage(HUD_PRINTTALK, cfg.announce) end
	MsgN("[PR] патруль «" .. cfg.name .. "» вышел на спот #" .. spotId .. " (" .. #patrol.members .. " NPC)")

	return patrol
end

-- Убрать патруль с карты целиком
function PR_Patrol.Remove(patrol)
	for _, npc in ipairs(patrol.members) do
		if IsValid(npc) then npc:Remove() end
	end
	table.RemoveByValue(PR_Patrol.Active, patrol)
end

function PR_Patrol.ClearAll()
	for _, patrol in ipairs({unpack(PR_Patrol.Active)}) do
		PR_Patrol.Remove(patrol)
	end
end

----------------------------------------------------------------------------------------------------
-- Движение
----------------------------------------------------------------------------------------------------

local ARRIVE_DIST = 120

local function Alive(npc)
	return IsValid(npc) and npc:Health() > 0 and not npc.Dead
end

-- Без AI-узлов движок строит путь только «на глаз» и примерно на 600 юнитов (предел Source
-- для пеших NPC), дальше NPC просто стоит. Поэтому далёкую цель даём шагами по прямой.
local MOVE_STEP = 450

-- Идти к pos (шагом не длиннее MOVE_STEP). Возвращает точку, куда реально отправили
local function MoveTo(npc, pos, run)
	local from = npc:GetPos()
	local flat = Vector(pos.x - from.x, pos.y - from.y, 0)

	if flat:Length() > MOVE_STEP then
		local mid = from + flat:GetNormalized() * MOVE_STEP
		local floor = util.TraceLine({start = mid + Vector(0, 0, 72), endpos = mid - Vector(0, 0, 256), mask = MASK_NPCSOLID_BRUSHONLY})
		pos = floor.Hit and floor.HitPos or mid
	end

	npc:SetLastPosition(pos)
	if isfunction(npc.VJ_TASK_GOTO_LASTPOS) then
		npc:VJ_TASK_GOTO_LASTPOS(run and "TASK_RUN_PATH" or "TASK_WALK_PATH")
	else
		npc:SetSchedule(run and SCHED_FORCED_GO_RUN or SCHED_FORCED_GO)
	end

	return pos
end

local function FlatDist(a, b)
	return Vector(a.x - b.x, a.y - b.y, 0):Length()
end

local function InCombat(patrol)
	for _, npc in ipairs(patrol.members) do
		if IsValid(npc:GetEnemy()) then return true end
	end
	return false
end

-- Если никто не видит — переставить NPC поближе к pos
local function TeleportIfUnseen(npc, pos)
	local safe = Settings().safeDistance
	if PlayersNear(npc:GetPos(), safe) or PlayersNear(pos, safe) then return false end
	npc:SetPos(FreeSpotNear(pos, {}))
	return true
end

-- Свита держит строй вокруг главного: formation из конфига, forward — куда идём
local function KeepFormation(patrol, center, forward)
	local fwd = Vector(forward.x, forward.y, 0)
	if fwd:LengthSqr() < 0.01 then fwd = Vector(1, 0, 0) end
	fwd:Normalize()
	local right = Vector(fwd.y, -fwd.x, 0)

	local slots = patrol.cfg.formation or {}
	local i = 0

	for _, npc in ipairs(patrol.members) do
		if npc ~= patrol.leader then
			i = i + 1
			local slot = slots[(i - 1) % math.max(#slots, 1) + 1] or {-80, 0}
			local want = center + fwd * slot[1] + right * slot[2]
			local d = npc:GetPos():Distance(want)

			if d > 2500 then
				TeleportIfUnseen(npc, want)
			elseif d > 120 and (not npc:IsMoving() or CurTime() - (npc.PR_OrderAt or 0) > 2) then
				MoveTo(npc, want, d > 450)
				npc.PR_OrderAt = CurTime()
			end
		end
	end
end

-- Главный не может дойти до спота: если никто не видит, переносим патруль, иначе меняем маршрут
local function Unstick(patrol, target)
	if TeleportIfUnseen(patrol.leader, target.Pos) then
		for _, npc in ipairs(patrol.members) do
			if npc ~= patrol.leader then TeleportIfUnseen(npc, target.Pos) end
		end
		return
	end

	patrol.route = nil
	patrol.spot = PR_Patrol.NearestSpot(patrol.leader:GetPos()) or patrol.spot
	patrol.lingerUntil = CurTime() + 3
end

local function ThinkPatrol(patrol)
	local alive = {}
	for _, npc in ipairs(patrol.members) do
		if Alive(npc) then table.insert(alive, npc) end
	end
	patrol.members = alive

	if #alive == 0 then
		table.RemoveByValue(PR_Patrol.Active, patrol)
		MsgN("[PR] патруль «" .. patrol.cfg.name .. "» перебит")
		return
	end

	-- Главного убили — дальше ведёт первый живой из свиты
	if not Alive(patrol.leader) then patrol.leader = alive[1] end
	local leader = patrol.leader
	local now = CurTime()

	-- В бою командует VJ: не мешаем
	if InCombat(patrol) then
		patrol.lastCombat = now
		patrol.orderAt = nil
		return
	end

	-- Время вышло и игроков рядом нет — уходят
	if now > patrol.expiresAt and not PlayersNear(leader:GetPos(), Settings().safeDistance) then
		MsgN("[PR] патруль «" .. patrol.cfg.name .. "» ушёл с карты")
		PR_Patrol.Remove(patrol)
		return
	end

	-- После боя чуть приходят в себя
	if now - patrol.lastCombat < 5 then return end

	-- Стоят на территории
	if patrol.lingerUntil and now < patrol.lingerUntil then
		KeepFormation(patrol, leader:GetPos(), patrol.dir)
		return
	end
	patrol.lingerUntil = nil

	if not patrol.route or patrol.routeIndex > #patrol.route then
		if not PlanRoute(patrol) then
			-- Идти некуда (спот ни с чем не связан): стоим и пробуем позже
			patrol.lingerUntil = now + 10
			return
		end
		patrol.progressDist = nil
	end

	local target = PR_Patrol.Spots[patrol.route[patrol.routeIndex]]
	if not target then
		-- Спот удалили, пока шли
		patrol.route = nil
		return
	end

	local pos = leader:GetPos()
	local flat = Vector(target.Pos.x - pos.x, target.Pos.y - pos.y, 0)
	local dist = flat:Length()

	if dist < ARRIVE_DIST then
		patrol.spot = target.Id
		patrol.routeIndex = patrol.routeIndex + 1
		patrol.progressDist = nil
		patrol.orderAt = nil
		if patrol.routeIndex > #patrol.route then
			patrol.lingerUntil = now + RandRange(Settings().linger)
		end
		return
	end

	patrol.dir = flat

	-- Застрял: 12 секунд не стал ближе к цели
	if not patrol.progressDist or dist < patrol.progressDist - 48 then
		patrol.progressDist = dist
		patrol.progressAt = now
	elseif now - patrol.progressAt > 12 then
		patrol.progressDist = nil
		Unstick(patrol, target)
		return
	end

	-- Приказ идти: в начале, когда почти дошёл до промежуточного шага (чтобы не останавливался)
	-- и если расписание закончилось или сбилось
	local nearStep = patrol.stepGoal and FlatDist(patrol.stepGoal, target.Pos) > 10 and FlatDist(pos, patrol.stepGoal) < 150
	if not patrol.orderAt or nearStep or (not leader:IsMoving() and now - patrol.orderAt > 2) then
		patrol.stepGoal = MoveTo(leader, target.Pos, false)
		patrol.orderAt = now
	end

	KeepFormation(patrol, pos, flat)
end

----------------------------------------------------------------------------------------------------
-- Расписание
----------------------------------------------------------------------------------------------------

local function CountOfType(key)
	local n = 0
	for _, patrol in ipairs(PR_Patrol.Active) do
		if patrol.type == key then n = n + 1 end
	end
	return n
end

-- Случайный вариант по весам среди тех, кого ещё не слишком много
function PR_Patrol.PickType()
	local pool, total = {}, 0
	for key, cfg in SortedPairs(PR_PATROL_TYPES) do
		if CountOfType(key) < (cfg.maxAlive or 1) then
			table.insert(pool, key)
			total = total + (cfg.weight or 1)
		end
	end
	if total <= 0 then return end

	local r = math.Rand(0, total)
	for _, key in ipairs(pool) do
		r = r - (PR_PATROL_TYPES[key].weight or 1)
		if r <= 0 then return key end
	end
	return pool[#pool]
end

-- Попытка по таймеру: есть игроки, есть место и выпал шанс
function PR_Patrol.TrySpawn()
	if #player.GetHumans() == 0 then return end
	if #PR_Patrol.Active >= Settings().maxActive then return end

	local key = PR_Patrol.PickType()
	if not key then return end
	if math.random() > (PR_PATROL_TYPES[key].chance or 1) then return end

	return PR_Patrol.Spawn(key)
end

timer.Create("PR_PatrolThink", 1, 0, function()
	for _, patrol in ipairs({unpack(PR_Patrol.Active)}) do
		local ok, err = pcall(ThinkPatrol, patrol)
		if not ok then ErrorNoHalt("[PR] патруль: " .. tostring(err) .. "\n") end
	end

	if ENABLED:GetBool() and PR_Patrol.NextSpawn and CurTime() >= PR_Patrol.NextSpawn then
		PR_Patrol.NextSpawn = CurTime() + RandRange(Settings().interval)
		PR_Patrol.TrySpawn()
	end
end)

hook.Add("InitPostEntity", "PR_PatrolLoad", function()
	PR_Patrol.LoadSpots()
	PR_Patrol.NextSpawn = CurTime() + RandRange(Settings().firstDelay)
	MsgN("[PR] споты патрулей: " .. table.Count(PR_Patrol.Spots))
end)

----------------------------------------------------------------------------------------------------
-- Смерть: объявление и добыча (деньги за убийство платит PR_KillReward в init.lua)
----------------------------------------------------------------------------------------------------

local function DropLoot(npc, def)
	for _, class in ipairs(def.drop or {}) do
		if weapons.GetStored(class) then
			local wep = ents.Create(class)
			if not IsValid(wep) then return end

			wep:SetPos(npc:GetPos() + Vector(0, 0, 40))
			wep:SetAngles(Angle(0, math.random(0, 359), 0))
			wep:Spawn()
			if def.dropGold then
				wep:SetMaterial("models/shiny")
				wep:SetColor(Color(255, 196, 60))
			end
			return wep
		end
	end
end

hook.Add("OnNPCKilled", "PR_PatrolKilled", function(npc, attacker)
	local patrol = npc.PR_Patrol
	if not patrol then return end

	if npc.PR_PatrolRole == "leader" and patrol.cfg.leaderKilled then
		local killer = PR_KillerPlayer and PR_KillerPlayer(attacker)
		if killer then
			PrintMessage(HUD_PRINTTALK, string.format(patrol.cfg.leaderKilled, killer:Nick()))
		end
	end

	DropLoot(npc, npc.PR_PatrolDef or {})
end)

----------------------------------------------------------------------------------------------------
-- Редактор и команды админа
----------------------------------------------------------------------------------------------------

net.Receive("PR_PatrolSetZone", function(len, ply)
	if not PR_IsAdmin(ply) then return end
	local zone = CleanZone(net.ReadString())
	if zone then ply.PR_PatrolZone = zone end
end)

net.Receive("PR_PatrolSpotZone", function(len, ply)
	if not PR_IsAdmin(ply) then return end
	local id = net.ReadUInt(32)
	local zone = CleanZone(net.ReadString())
	if zone and PR_Patrol.SetZone(id, zone) then
		PR_Log(ply, "назвал спот патруля #" .. id .. " «" .. zone .. "»")
	end
end)

local function AdminOrConsole(ply)
	return not IsValid(ply) or PR_IsAdmin(ply)
end

local function Reply(ply, text)
	if IsValid(ply) then ply:ChatPrint(text) else MsgN(text) end
end

local function TypeComplete(cmd, args)
	local out = {}
	for key in SortedPairs(PR_PATROL_TYPES) do
		table.insert(out, cmd .. " " .. key)
	end
	return out
end

-- pr_patrol_spawn [вариант] [here] — выпустить сейчас; here — на спот, куда смотрит админ
concommand.Add("pr_patrol_spawn", function(ply, _, args)
	if not AdminOrConsole(ply) then return end

	local key = args[1] or PR_Patrol.PickType() or next(PR_PATROL_TYPES)
	local spotId
	if IsValid(ply) and args[2] == "here" then
		spotId = PR_Patrol.NearestSpot(ply:GetEyeTrace().HitPos, 600)
	end

	local patrol, err = PR_Patrol.Spawn(key, spotId)
	if patrol then
		Reply(ply, "Патруль «" .. patrol.cfg.name .. "» вышел на спот #" .. patrol.spot)
		PR_Log(ply, "выпустил патруль " .. key)
	else
		Reply(ply, "Патруль не вышел: " .. tostring(err))
	end
end, TypeComplete)

concommand.Add("pr_patrol_clear", function(ply)
	if not AdminOrConsole(ply) then return end
	local n = #PR_Patrol.Active
	PR_Patrol.ClearAll()
	Reply(ply, "Убрано патрулей: " .. n)
end)

concommand.Add("pr_patrol_info", function(ply)
	if not AdminOrConsole(ply) then return end

	local isolated = 0
	for id in pairs(PR_Patrol.Spots) do
		if not next(PR_Patrol.Links[id] or {}) then isolated = isolated + 1 end
	end
	Reply(ply, string.format("Спотов: %d, без связи: %d, патрулей: %d, следующая попытка через %d с",
		table.Count(PR_Patrol.Spots), isolated, #PR_Patrol.Active, math.max(math.Round((PR_Patrol.NextSpawn or 0) - CurTime()), 0)))

	for _, patrol in ipairs(PR_Patrol.Active) do
		Reply(ply, string.format("  #%d %s: %d NPC, спот #%s → #%s, уйдёт через %d с",
			patrol.id, patrol.cfg.name, #patrol.members, tostring(patrol.spot), tostring(patrol.dest),
			math.max(math.Round(patrol.expiresAt - CurTime()), 0)))
	end
end)

-- Выдать себе редактор спотов
concommand.Add("pr_patrol_edit", function(ply)
	if not IsValid(ply) or not PR_IsAdmin(ply) then return end
	ply:Give("pr_patrol_tool")
	ply:SelectWeapon("pr_patrol_tool")
end)
