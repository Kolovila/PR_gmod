-- Патрули NPC: время от времени на случайном споте появляется группа (например, Решала со свитой)
-- и ходит по карте между территориями, пока не выйдет её время.
--
-- На rp_desert_conflict нет AI-узлов и навмеша, поэтому сами NPC дорогу через полкарты не находят.
-- Админ расставляет споты «Редактором патрулей» (entities/weapons/pr_patrol_tool.lua). Соседние
-- споты, между которыми можно пройти по прямой, соединяются сами, и патруль идёт от спота к споту.
-- Общие настройки — config/patrols.lua. Варианты патрулей хранятся в базе (pr_patrol_types) и
-- правятся в игре тем же редактором (cl_patrols.lua), стартовые берутся из config/patrols.lua.

include("config/patrols.lua")

util.AddNetworkString("PR_PatrolSpots")
util.AddNetworkString("PR_PatrolSetZone")
util.AddNetworkString("PR_PatrolSpotZone")
util.AddNetworkString("PR_PatrolTypes")      -- админ просит / сервер присылает все варианты
util.AddNetworkString("PR_PatrolSaveType")   -- админ сохраняет вариант
util.AddNetworkString("PR_PatrolDeleteType") -- админ удаляет вариант
util.AddNetworkString("PR_PatrolSpawnType")  -- админ выпускает вариант сейчас
util.AddNetworkString("PR_PatrolTypeResult") -- итог для админа: ок/ошибка, ключ, текст
util.AddNetworkString("PR_PatrolCrewName")   -- имя бота-экипажа: клиенты прячут «вступает в игру»

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

-- Случайное из списка (или само значение, если это не список). Пустой список — nil
local function Pick(value)
	if istable(value) then
		if #value == 0 then return nil end
		return value[math.random(#value)]
	end
	return value
end

----------------------------------------------------------------------------------------------------
-- Варианты патрулей: база + стартовые из конфига
----------------------------------------------------------------------------------------------------

-- v2: добавился вариант с техникой. Недостающие стартовые варианты дописываются, правки админа не трогаются
local TYPES_META = "patrol_types_v2"

-- Стартовые варианты попадают в базу один раз; дальше база — единственный источник
local function LoadTypes()
	if PR_DB.GetMeta(TYPES_META) ~= "1" then
		PR_DB.Transaction(function()
			local existing = PR_DB.GetPatrolTypes()
			for key, data in pairs(PR_PATROL_DEFAULTS or {}) do
				if not existing[key] then PR_DB.SavePatrolType(key, data) end
			end
			PR_DB.SetMeta(TYPES_META, "1")
		end)
	end

	PR_PATROL_TYPES = PR_DB.GetPatrolTypes()
end

LoadTypes()

local function NPCExists(class)
	return isstring(class) and (list.Get("NPC")[class] ~= nil or scripted_ents.GetStored(class) ~= nil)
end

local function Num(value, lo, hi, default)
	value = tonumber(value)
	if not value or value ~= value then return default end
	return math.Clamp(value, lo, hi)
end

-- Строка из редактора: без пробелов по краям, не длиннее max символов
local function CleanText(value, max)
	if not isstring(value) then return "" end
	value = string.Trim(value)
	local len = utf8.len(value)
	if not len then return "" end
	if len > max then value = string.sub(value, 1, utf8.offset(value, max + 1) - 1) end
	return value
end

-- Список строк, которые есть в игре, без повторов
local function CleanList(values, exists, max)
	local out, seen = {}, {}
	for _, v in ipairs(istable(values) and values or {values}) do
		if isstring(v) and not seen[v] and exists(v) then
			seen[v] = true
			table.insert(out, v)
			if #out >= max then break end
		end
	end
	return out
end

local function CleanNPC(def, isLeader)
	if not istable(def) then return end

	local classes = CleanList(def.class, NPCExists, 8)
	if #classes == 0 then return end

	local reward = istable(def.reward) and def.reward or {}
	local out = {
		name = CleanText(def.name, 48),
		class = classes,
		weapons = CleanList(def.weapons, PR_WeaponExists, 12),
		health = math.floor(Num(def.health, 1, 100000, 100)),
		reward = {
			money = math.floor(Num(reward.money, 0, 1000000, 0)),
			exp = math.floor(Num(reward.exp, 0, 1000, 0))
		}
	}

	if isLeader then
		out.drop = CleanList(def.drop, PR_WeaponExists, 4)
		out.dropGold = def.dropGold == true
	else
		out.count = math.floor(Num(def.count, 1, 10, 1))
	end

	return out
end

local function VehicleExists(class)
	return PR_PatrolVehicleKind(class) ~= nil
end

-- Группа техники: машина(ы), сколько, здоровье (0 — как у машины), награда за уничтожение
local function CleanVehicle(def)
	if not istable(def) then return end

	local classes = CleanList(def.class, VehicleExists, 8)
	if #classes == 0 then return end

	local reward = istable(def.reward) and def.reward or {}
	return {
		name = CleanText(def.name, 48),
		class = classes,
		count = math.floor(Num(def.count, 1, 3, 1)),
		-- Ботов в машине: водитель/стрелок, у кого есть место. 0 — без экипажа (только для авиации)
		crew = math.floor(Num(def.crew, 0, 4, 1)),
		health = math.floor(Num(def.health, 0, 1000000, 0)),
		reward = {
			money = math.floor(Num(reward.money, 0, 1000000, 0)),
			exp = math.floor(Num(reward.exp, 0, 1000, 0))
		}
	}
end

PR_PATROL_FORMATIONS = {"around", "wedge", "column"}

-- Вариант из редактора: всё проверить и обрезать. Возвращает чистую таблицу или nil и причину
function PR_Patrol.CleanType(data)
	if not istable(data) then return nil, "пустые данные" end

	local out = {
		name = CleanText(data.name, 48),
		weight = Num(data.weight, 0, 100, 1),
		chance = Num(data.chance, 0, 1, 1),
		maxAlive = math.floor(Num(data.maxAlive, 1, 5, 1)),
		npcClass = isstring(data.npcClass) and string.match(data.npcClass, "^CLASS_[%w_]+$") and data.npcClass or "CLASS_PR_BANDITS",
		formation = table.HasValue(PR_PATROL_FORMATIONS, data.formation) and data.formation or "around",
		followers = {},
		vehicles = {}
	}
	if out.name == "" then return nil, "нужно название" end

	local announce = CleanText(data.announce, 120)
	if announce ~= "" then out.announce = announce end

	-- В тексте о смерти главного допустим только %s (ник убийцы), остальные % экранируем
	local killed = CleanText(data.leaderKilled, 120)
	if killed ~= "" then
		killed = string.gsub(killed, "%%", "%%%%")
		killed = string.gsub(killed, "%%%%s", "%%s", 1)
		out.leaderKilled = killed
	end

	if istable(data.leader) then
		out.leader = CleanNPC(data.leader, true)
		if not out.leader then return nil, "у главного не выбран NPC (или его нет в игре)" end
	end

	for i, group in ipairs(istable(data.followers) and data.followers or {}) do
		if i > 6 then break end
		local clean = CleanNPC(group, false)
		if not clean then return nil, "в группе свиты №" .. i .. " не выбран NPC (или его нет в игре)" end
		table.insert(out.followers, clean)
	end

	for i, group in ipairs(istable(data.vehicles) and data.vehicles or {}) do
		if i > 4 then break end
		local clean = CleanVehicle(group)
		if not clean then return nil, "в технике №" .. i .. " не выбрана машина (или её нет в игре)" end
		table.insert(out.vehicles, clean)
	end

	if not out.leader and #out.followers == 0 then return nil, "в патруле нет ни одного NPC" end

	return out
end

-- Все варианты — админам (или одному игроку)
function PR_Patrol.SendTypes(target)
	local recipients = {}
	if IsValid(target) then
		recipients = {target}
	else
		for _, ply in ipairs(player.GetHumans()) do
			if PR_IsAdmin(ply) then table.insert(recipients, ply) end
		end
	end
	if #recipients == 0 then return end

	net.Start("PR_PatrolTypes")
		net.WriteTable(PR_PATROL_TYPES)
	net.Send(recipients)
end

local function NewTypeKey()
	local n = 1
	while PR_PATROL_TYPES["patrol_" .. n] do n = n + 1 end
	return "patrol_" .. n
end

-- Сохранить вариант (key пустой — новый). Возвращает ключ или nil и причину
function PR_Patrol.SaveType(key, data)
	local clean, err = PR_Patrol.CleanType(data)
	if not clean then return nil, err end

	if not isstring(key) or #key > 32 or not string.match(key, "^[%w_]+$") then
		key = NewTypeKey()
	end

	PR_DB.SavePatrolType(key, clean)
	PR_PATROL_TYPES[key] = clean
	PR_Patrol.SendTypes()
	return key
end

function PR_Patrol.DeleteType(key)
	if not PR_PATROL_TYPES[key] then return false end

	PR_DB.DeletePatrolType(key)
	PR_PATROL_TYPES[key] = nil
	PR_Patrol.SendTypes()
	return true
end

-- Места свиты относительно главного {вперёд, вправо} для n человек
local function FormationSlots(formation, n)
	if istable(formation) and #formation > 0 then return formation end

	local slots = {}
	for k = 1, n do
		local pair, side = math.ceil(k / 2), (k % 2 == 1) and 1 or -1
		if formation == "column" then
			slots[k] = {-90 * k, 0}
		elseif formation == "wedge" then
			slots[k] = {-100 * pair, side * 90 * pair}
		else
			-- Вокруг главного: первые двое впереди, следующие по бокам и дальше назад
			slots[k] = {110 - (pair - 1) * 120, side * (70 + (pair - 1) * 30)}
		end
	end
	return slots
end

----------------------------------------------------------------------------------------------------
-- Игроки рядом
----------------------------------------------------------------------------------------------------

-- Живой игрок, а не бот-экипаж техники патруля
local function RealPlayer(ply)
	return ply:Alive() and not ply:GetNWBool("PR_PatrolCrew")
end

local function PlayersNear(pos, dist)
	for _, ply in ipairs(player.GetAll()) do
		if RealPlayer(ply) and ply:GetPos():DistToSqr(pos) < dist * dist then return true end
	end
	return false
end

local function SeenByPlayer(pos)
	for _, ply in ipairs(player.GetAll()) do
		if RealPlayer(ply) then
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

	-- Коробка размером с NPC (HULL_HUMAN 32×72), от высоты ступеньки (18) до макушки:
	-- ящики и узкие щели, куда NPC не пролезет, связь рвут
	local up = Vector(0, 0, WALK_HEIGHT)
	local wall = util.TraceHull({
		start = a + up,
		endpos = b + up,
		mins = Vector(-16, -16, -18),
		maxs = Vector(16, 16, 36),
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
		lastCombat = 0,
		vehicles = {}
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

	-- VJ не даёт NPC тронуться с места, если в него упёрся другой NPC не из EntitiesToNoCollide:
	-- охранник в строю вплотную к главному — и приказ идти отклоняется раз за разом.
	-- Свои друг другу не помеха (VJ заодно отключает между ними столкновения)
	local classes = {}
	for _, npc in ipairs(patrol.members) do classes[npc:GetClass()] = true end
	for _, npc in ipairs(patrol.members) do
		if npc.IsVJBaseSNPC then
			-- Таблица по умолчанию общая на весь класс NPC: правим копию
			local list = istable(npc.EntitiesToNoCollide) and table.Copy(npc.EntitiesToNoCollide) or {}
			for class in pairs(classes) do
				if not table.HasValue(list, class) then table.insert(list, class) end
			end
			npc.EntitiesToNoCollide = list
			npc.HasEntitiesToNoCollide = true
		end
	end

	-- Технику ставим подальше от пеших (used — где они появились)
	PR_Patrol.SpawnVehicles(patrol, spot, used)

	table.insert(PR_Patrol.Active, patrol)

	if cfg.announce then PrintMessage(HUD_PRINTTALK, cfg.announce) end
	MsgN("[PR] патруль «" .. cfg.name .. "» вышел на спот #" .. spotId .. " (" .. #patrol.members .. " NPC, техники " .. #patrol.vehicles .. ")")

	return patrol
end

-- Убрать патруль с карты целиком: NPC, технику и её ботов-экипаж
function PR_Patrol.Remove(patrol)
	for _, npc in ipairs(patrol.members) do
		if IsValid(npc) then npc:Remove() end
	end
	PR_Patrol.RemoveVehicles(patrol)
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

	-- pr_patrol_debug: в NPC упёрся другой NPC (не из своих VJ с места бы не тронулся)
	local debug = GetConVar("pr_patrol_debug")
	if debug and debug:GetBool() then
		local lift = Vector(0, 0, 2)
		local tr = util.TraceHull({start = from, endpos = from, mins = npc:OBBMins() + lift, maxs = npc:OBBMaxs() + lift, filter = npc})
		if IsValid(tr.Entity) and tr.Entity:IsNPC() then
			MsgN("[PR] " .. npc:GetClass() .. ": вплотную " .. tr.Entity:GetClass() .. ", свой=" .. tostring(table.HasValue(npc.EntitiesToNoCollide or {}, tr.Entity:GetClass())))
		end
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

	local slots = FormationSlots(patrol.cfg.formation, math.max(#patrol.members - 1, 1))
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

----------------------------------------------------------------------------------------------------
-- Техника
----------------------------------------------------------------------------------------------------
-- Своего «ИИ со стрельбой» у этой техники нет, поэтому в машину садится бот-экипаж: занимает слот
-- игрока, в таблице игроков не виден, не сохраняется. Мы каждый тик решаем за него, куда смотреть
-- и когда жать огонь (StartCommand) — техника думает, что за пультом игрок, и сама наводит пушки.
--   ground   (simfphys, танки Луны и Гредвича): бот за рулём; едем за главным патруля сами
--            (газ и руль через PressedKeys), водитель же наводит главную пушку; второй бот —
--            на первом месте пассажира (пулемёт у танков).
--   air      (LFS/LVS вертолёты и самолёты): летит их ИИ; подменяем ему «кто враг» и, пока врагов
--            нет, держим кругами над патрулём. Бот садится стрелком (Ми-24, AH-1G).
--   aiground (LVS наземная): едет своим ИИ за патрулём, бот — стрелком.

local VEHICLE_RANGE = 6000 -- дальше врагов не ищем
local AIR_ALTITUDE = 1400  -- высота над патрулём, пока врагов нет
local AIR_ORBIT = 1200     -- радиус круга над патрулём

local function IgnorePlayers()
	local cvar = GetConVar("ai_ignoreplayers")
	return cvar and cvar:GetBool()
end

-- Где сейчас патруль: главный, а если пеших не осталось — первая живая машина
function PR_Patrol.Center(patrol)
	if Alive(patrol.leader) then return patrol.leader:GetPos() end
	for _, npc in ipairs(patrol.members) do
		if Alive(npc) then return npc:GetPos() end
	end
	for _, v in ipairs(patrol.vehicles or {}) do
		if not v.dead and IsValid(v.ent) then return v.ent:GetPos() end
	end
end

-- Враг для техники: ближайший видимый игрок (не экипаж, не notarget) или защитник точки
function PR_Patrol.VehicleTarget(entry, from, range)
	if IsValid(entry.forceTarget) then return entry.forceTarget end
	if (entry.targetAt or 0) > CurTime() then
		if IsValid(entry.target) then return entry.target end
		return nil
	end
	entry.targetAt = CurTime() + 1

	local best, bestD = nil, range * range
	local function Consider(ent, pos)
		local d = pos:DistToSqr(from)
		if d >= bestD then return end
		local tr = util.TraceLine({start = from, endpos = pos, mask = MASK_SOLID_BRUSHONLY})
		if tr.Hit then return end
		best, bestD = ent, d
	end

	if not IgnorePlayers() then
		for _, ply in ipairs(player.GetAll()) do
			if RealPlayer(ply) and not ply:IsFlagSet(FL_NOTARGET) then
				Consider(ply, ply:WorldSpaceCenter())
			end
		end
	end

	-- Защитники точек любых группировок — тоже враги бандитов
	for _, npc in ipairs(ents.FindByClass("npc_*")) do
		if npc.PR_GuardPoint and npc:Health() > 0 then
			Consider(npc, npc:WorldSpaceCenter())
		end
	end

	entry.target = best
	return best
end

----------------------------------------------------------------------------------------------------
-- Экипаж

local function KickCrew(entry)
	for _, bot in pairs(entry.crew or {}) do
		if IsValid(bot) then bot:Kick("Экипаж патруля") end
	end
	entry.crew = {}
end

-- Места для экипажа по порядку: наземной — водитель и пассажиры, авиации — стрелок и пассажиры
local function CrewSeats(entry)
	local ent, seats = entry.ent, {}
	local function Add(seat)
		if IsValid(seat) and not table.HasValue(seats, seat) then table.insert(seats, seat) end
	end

	if entry.kind == "ground" then
		Add(isfunction(ent.GetDriverSeat) and ent:GetDriverSeat() or ent.DriverSeat)
		for _, seat in ipairs(ent.pSeat or {}) do Add(seat) end
	else
		if isfunction(ent.GetGunnerSeat) then Add(ent:GetGunnerSeat()) end
		if isfunction(ent.GetPassengerSeats) then
			for _, seat in ipairs(ent:GetPassengerSeats() or {}) do Add(seat) end
		end
	end

	return seats
end

local function CreateBot(entry, index)
	if player.GetCount() >= game.MaxPlayers() then
		MsgN("[PR] патруль: нет свободных слотов игроков для экипажа")
		return
	end

	-- Имя бота видно в килфиде: «Танк охраны», «Танк охраны · стрелок»
	local name = (entry.def.name and entry.def.name ~= "") and entry.def.name or "Экипаж"
	if index > 1 then name = name .. " · стрелок" end

	-- Клиенты прячут системное «вступает в игру» для этого имени (cl_patrols.lua)
	net.Start("PR_PatrolCrewName")
		net.WriteString(name)
	net.Broadcast()

	local bot = player.CreateNextBot(name)
	if not IsValid(bot) then return end

	bot:SetNWBool("PR_PatrolCrew", true)
	bot.PR_PatrolCrew = entry
	bot:AddFlags(FL_NOTARGET)
	entry.crew[index] = bot
	return bot
end

-- Экипаж создаётся по местам, которые у машины действительно есть (сиденья появляются не сразу,
-- поэтому проверяем каждый тик), и садится. На каждое место бот создаётся один раз: погиб — не заменяем
local function SeatCrew(entry)
	local seats = CrewSeats(entry)
	entry.crewTried = entry.crewTried or {}

	-- Наземной без водителя не поехать: хотя бы один
	local wanted = entry.def.crew or 1
	if entry.kind == "ground" then wanted = math.max(wanted, 1) end

	for i = 1, math.min(wanted, #seats) do
		local seat, bot = seats[i], entry.crew[i]

		if not bot and not entry.crewTried[i] then
			entry.crewTried[i] = true
			bot = CreateBot(entry, i)
		end

		if IsValid(bot) and bot:Alive() and bot:GetVehicle() ~= seat and not IsValid(seat:GetDriver()) then
			bot:EnterVehicle(seat)
		end
	end
end

-- Куда смотреть боту: на врага. Огонь — когда враг виден и башня успела довернуться
local function CrewAim(entry, target)
	if not IsValid(target) then
		entry.aimAng, entry.fire, entry.aimSince = nil, false, nil
		return
	end

	-- От центра машины вверх по миру (а не по машине: перевёрнутая смотрела бы в землю)
	local from = entry.ent:WorldSpaceCenter() + Vector(0, 0, 60)
	local to = target:WorldSpaceCenter()
	entry.aimAng = (to - from):Angle()

	if entry.aimTarget ~= target then
		entry.aimTarget = target
		entry.aimSince = CurTime()
	end

	-- Огонь, когда враг виден и прошло время довернуть пушку (у simfphys-танков точнее — по углу башни)
	local clear = not util.TraceLine({start = from, endpos = to, mask = MASK_SOLID_BRUSHONLY}).Hit
	local turned = CurTime() - (entry.aimSince or CurTime()) > 3 or entry.ent.sm_pp_yaw ~= nil
	entry.fire = clear and turned
end

hook.Add("StartCommand", "PR_PatrolCrew", function(ply, cmd)
	local entry = ply.PR_PatrolCrew
	if not entry then return end

	cmd:ClearMovement()
	cmd:ClearButtons()

	local seat = ply:GetVehicle()
	if not entry.aimAng or not IsValid(seat) then
		ply.PR_View = nil
		return
	end

	-- simfphys: башню наводим в обход взгляда (WrapSimfphysAim), здесь только огонь
	if entry.kind == "ground" then
		cmd:SetViewAngles(seat:WorldToLocalAngles(entry.aimAng))
		if entry.fire then cmd:SetButtons(IN_ATTACK) end
		return
	end

	-- LFS/LVS: стрелок смотрит туда же, куда целится. Как движок из углов cmd делает взгляд
	-- в машине, зависит от сиденья. Не гадаем: смотрим, куда бот реально смотрит, и доворачиваем
	local want = entry.aimAng
	local view = ply.PR_View
	if not view then
		view = seat:WorldToLocalAngles(want)
	else
		local eye = ply:EyeAngles()
		view = Angle(
			math.Clamp(view.p + math.AngleDifference(want.p, eye.p) * 0.8, -89, 89),
			math.NormalizeAngle(view.y + math.AngleDifference(want.y, eye.y) * 0.8),
			0
		)
	end
	ply.PR_View = view

	cmd:SetViewAngles(view)
	if entry.fire then cmd:SetButtons(IN_ATTACK) end
end)

-- Экипаж погиб (машину подбили) — бота убираем с сервера
hook.Add("PlayerDeath", "PR_PatrolCrewDeath", function(ply)
	if not ply:GetNWBool("PR_PatrolCrew") then return end
	timer.Simple(0.5, function()
		if IsValid(ply) then ply:Kick("Экипаж патруля") end
	end)
end)

----------------------------------------------------------------------------------------------------
-- Появление

-- Влезет ли машина в точку p: ровный пол, простор вокруг, не вплотную к другим машинам
-- Встанет ли машина в p носом по yaw: ровная земля и свободно вокруг.
-- full — на весь корпус танка (~500×220): коробки трассировки не поворачиваются, поэтому три
-- коробки вдоль корпуса (иначе пальма или столб оказывались внутри длинного танка, и он упирался
-- в них с места). Без full — только середина 200×200, на случай, когда целиком места нет
local function VehicleFits(p, used, yaw, full)
	local down = util.TraceLine({start = p + Vector(0, 0, 120), endpos = p - Vector(0, 0, 300), mask = MASK_SOLID_BRUSHONLY})
	if not down.Hit or down.StartSolid or down.HitNormal.z < 0.8 then return end

	local spot = down.HitPos
	local along = Angle(0, yaw or 0, 0):Forward()
	local half = full and 110 or 100
	for _, offset in ipairs(full and {0, -140, 140} or {0}) do
		local c = spot + along * offset + Vector(0, 0, 30)
		local hull = util.TraceHull({
			start = c, endpos = c,
			mins = Vector(-half, -half, 0), maxs = Vector(half, half, full and 130 or 120),
			mask = MASK_SOLID
		})
		if hull.Hit or hull.StartSolid then return end
	end

	for _, u in ipairs(used) do
		if u:DistToSqr(spot) < 320 * 320 then return end
	end
	return spot
end

-- Место для машины: сперва на линиях к соседним спотам (это проверенные проходимые улицы,
-- машина встаёт вдоль улицы; пробуем и чуть в сторону — к середине улицы), потом — где
-- получится вокруг спота. Сначала ищем место на весь корпус, и только если его нет — потеснее
local function VehicleSpotNear(spot, used)
	for _, full in ipairs({true, false}) do
		for other in pairs(PR_Patrol.Links[spot.Id] or {}) do
			local o = PR_Patrol.Spots[other]
			if o then
				local dir = o.Pos - spot.Pos
				local len = dir:Length()
				dir:Normalize()
				local yaw = dir:Angle().y
				local side = Vector(-dir.y, dir.x, 0)
				for _, d in ipairs({300, 450, 600, 200, 750}) do
					if d < len - 80 then
						for _, shift in ipairs({0, 90, -90}) do
							local p = VehicleFits(spot.Pos + dir * d + side * shift, used, yaw, full)
							if p then return p, yaw end
						end
					end
				end
			end
		end

		for _ = 1, 30 do
			local ang = math.rad(math.random(0, 359))
			local dist = math.random(220, 600)
			local yaw = math.random(0, 359)
			local p = VehicleFits(spot.Pos + Vector(math.cos(ang) * dist, math.sin(ang) * dist, 0), used, yaw, full)
			if p then return p, yaw end
		end
	end
end

-- Небо (или потолок) над точкой
local function CeilingAt(pos)
	local tr = util.TraceLine({start = pos + Vector(0, 0, 64), endpos = pos + Vector(0, 0, 16000), mask = MASK_SOLID_BRUSHONLY})
	return tr.HitPos.z, tr.StartSolid
end

-- Верх того, что стоит в точке x, y (крыша или земля): ищем сверху вниз от потолка
local function TopAt(x, y, ceilZ, floorZ)
	local tr = util.TraceLine({start = Vector(x, y, ceilZ - 16), endpos = Vector(x, y, floorZ - 2000), mask = MASK_SOLID_BRUSHONLY})
	return tr.Hit and tr.HitPos.z or floorZ
end

-- Где лететь над x, y возле center: выше крыш на 900, не ниже AIR_ALTITUDE над патрулём, под небом.
-- nil — над патрулём низкий потолок (идут под навесом), лететь там некуда
local function FlyPoint(center, x, y)
	local ceil = CeilingAt(center)
	if ceil - center.z < 800 then return end

	local top = TopAt(x, y, ceil, center.z)
	return Vector(x, y, math.min(math.max(center.z + AIR_ALTITUDE, top + 900), ceil - 250))
end

-- Место появления авиации: рядом со спотом, где над головой открытое небо. Обходим кольца
-- от 300 до 2700 по 12 направлений; небо меряем над самой точкой, а не над спотом
-- (спот может быть под навесом, а в двух шагах — открытое небо)
local function AirSpawnPos(pos)
	local turn = math.random(0, 359)
	for dist = 300, 2700, 400 do
		for i = 0, 11 do
			local ang = math.rad(turn + i * 30 + dist * 0.1)
			local x, y = pos.x + math.cos(ang) * dist, pos.y + math.sin(ang) * dist

			local ceil, inside = CeilingAt(Vector(x, y, pos.z))
			if not inside and ceil - pos.z > AIR_ALTITUDE + 400 then
				local top = TopAt(x, y, ceil, pos.z)
				return Vector(x, y, math.min(math.max(pos.z + AIR_ALTITUDE, top + 900), ceil - 250))
			end
		end
	end
end

local function ApplyVehicleHealth(ent, health)
	if not health or health <= 0 then return end

	if isfunction(ent.GetCurHealth) then
		-- simfphys
		ent:SetMaxHealth(health)
		ent:SetCurHealth(health)
	elseif isfunction(ent.SetHP) then
		-- LFS/LVS
		ent.MaxHealth = health
		ent:SetHP(health)
	end
end

-- Точка, куда держаться технике со своим ИИ, пока врагов нет
local function EscortPoint(patrol, entry, ent)
	local center = PR_Patrol.Center(patrol) or ent:GetPos()
	if entry.kind == "aiground" then
		local back = Vector(patrol.dir.x, patrol.dir.y, 0):GetNormalized()
		return center - back * 400
	end

	local t = CurTime() * 0.12 + entry.phase
	local p = FlyPoint(center, center.x + math.cos(t) * AIR_ORBIT, center.y + math.sin(t) * AIR_ORBIT)
	if p then entry.lastFly = p end
	return entry.lastFly or ent:GetPos()
end

-- Наследуется ли класс сущности от base (по цепочке ENT.Base)
local function InheritsFrom(class, base)
	for _ = 1, 10 do
		if class == base then return true end
		local stored = scripted_ents.GetStored(class)
		class = stored and stored.t and stored.t.Base
		if not class then return false end
	end
	return false
end

-- Вертолёт атакует со стороны: в 900 по горизонтали и на 600 выше цели (~34° вниз).
-- Свой ИИ LFS зависает почти над целью, а турели стрелка (Ми-24: до 60° вниз) оттуда не достать
local function StandOffPoint(target, from)
	local tpos = target:GetPos()
	local flat = from - tpos
	flat.z = 0
	if flat:LengthSqr() < 1 then flat = Vector(1, 0, 0) end
	flat:Normalize()

	local p = tpos + flat * 900
	local ceil = CeilingAt(tpos)
	local top = TopAt(p.x, p.y, ceil, tpos.z)
	p.z = math.min(math.max(tpos.z + 600, top + 400), ceil - 250)
	return p
end

-- Вертолёт без стрелка (OH-6) бьёт курсовым оружием, а свой ИИ LFS у вертолётов огонь не жмёт
-- (только у самолётов). Поэтому заход на цель носом, проскочив — уход на 1500 за цель и новый заход.
-- Нос ИИ вертолёта LFS наклоняет по формуле P = LPos.x·0.02 − скорость_вперёд·0.1 (до 40°),
-- где LPos — наша точка в системе вертолёта (курс он сам держит на цель). Подбираем LPos.x так,
-- чтобы наклон носа совпал с углом на цель: тогда курсовой пулемёт смотрит прямо в неё
local function StrafePoint(entry, ent, target)
	local now = CurTime()
	if entry.breakUntil and now < entry.breakUntil then return entry.breakPos end

	local tpos = target:WorldSpaceCenter()
	local pos = ent:GetPos()
	local flat = Vector(tpos.x - pos.x, tpos.y - pos.y, 0)
	if flat:Length() < 450 then
		local away = flat:LengthSqr() > 1 and flat:GetNormalized() or ent:GetForward()
		away.z = 0
		local p = tpos + away * 1500
		p.z = math.min(tpos.z + 700, CeilingAt(tpos) - 250)
		entry.breakPos = p
		entry.breakUntil = now + 6
		return p
	end

	local dive = math.Clamp(math.NormalizeAngle((tpos - ent:WorldSpaceCenter()):Angle().p), 0, 40)
	local forwardSpeed = ent:WorldToLocal(pos + ent:GetVelocity()).x
	local climb = math.Clamp(tpos.z + 350 - pos.z, -400, 400)
	return ent:LocalToWorld(Vector(50 * dive + 5 * forwardSpeed, 0, climb))
end

-- Нос смотрит на цель (≤ 6°) и её видно — жмём огонь, как ИИ самолётов LFS
local function FireForward(ent, target)
	local from = ent:WorldSpaceCenter()
	local to = target:WorldSpaceCenter()
	local dir = (to - from):GetNormalized()
	if ent:GetForward():Dot(dir) < math.cos(math.rad(6)) then return end
	if util.TraceLine({start = from, endpos = to, filter = ent, mask = MASK_SOLID_BRUSHONLY}).Hit then return end
	if isfunction(ent.HandleWeapons) then ent:HandleWeapons(true) end
end

-- LFS/LVS: свой ИИ летает, мы подменяем ему цели и точку, пока врагов нет
local function SetupAI(patrol, entry)
	local ent = entry.ent
	entry.phase = math.Rand(0, math.pi * 2)
	entry.heli = InheritsFrom(entry.class, "lunasflightschool_basescript_heli") or InheritsFrom(entry.class, "lvs_base_helicopter")

	-- По умолчанию LVS не трогает игроков (их ИИ-команда 0), поэтому «кто враг» решаем сами
	ent.AIGetTarget = function(self)
		return PR_Patrol.VehicleTarget(entry, self:WorldSpaceCenter(), VEHICLE_RANGE * 1.5)
	end

	local baseRunAI = ent.RunAI
	if isfunction(baseRunAI) then
		ent.RunAI = function(self, ...)
			local target = self:AIGetTarget()
			if IsValid(target) then
				-- Самолёты заходят и стреляют своим ИИ
				if not entry.heli then return baseRunAI(self, ...) end

				-- Вертолёт со стрелком держится сбоку, чтобы турель доставала
				local gunner = isfunction(self.GetGunnerSeat) and IsValid(self:GetGunnerSeat())
				if gunner and IsValid(entry.crew[1]) then return StandOffPoint(target, self:GetPos()) end

				-- Без стрелка — заходы курсовым оружием
				FireForward(self, target)
				return StrafePoint(entry, self, target)
			end
			entry.breakUntil = nil
			return EscortPoint(patrol, entry, self)
		end
	end

	if isfunction(ent.SetAITEAM) then ent:SetAITEAM(2) end
	if isfunction(ent.SetAI) then ent:SetAI(true) end

	-- Вертолёт появляется в воздухе, а мотор раскручивается несколько секунд — без этого он
	-- успевает рухнуть. Держим на месте (каждый тик, LFS сам будит физику), пока мотор не заработает
	if entry.kind == "air" then
		entry.holdPos = ent:GetPos()
		entry.holdUntil = CurTime() + 15
	end
end

-- Держать авиацию на месте, пока не раскрутится мотор (не меньше 3 и не больше 15 секунд)
local function HoldUntilEngine(entry)
	if not entry.holdUntil then return end

	local ent = entry.ent
	local phys = ent:GetPhysicsObject()
	local running = isfunction(ent.GetEngineActive) and ent:GetEngineActive()
	local held = CurTime() - (entry.spawnedAt or 0)

	if CurTime() < entry.holdUntil and not (running and held > 3) then
		if IsValid(phys) then phys:EnableMotion(false) end
		ent:SetPos(entry.holdPos)
		return
	end

	entry.holdUntil = nil
	if IsValid(phys) then
		phys:EnableMotion(true)
		phys:Wake()
	end
end

function PR_Patrol.SpawnVehicles(patrol, spot, infantry)
	patrol.vehicles = {}
	local used = {}
	for _, p in ipairs(infantry or {}) do table.insert(used, p) end

	for _, def in ipairs(patrol.cfg.vehicles or {}) do
		for _ = 1, def.count or 1 do
			local class = Pick(def.class)
			local kind = PR_PatrolVehicleKind(class)
			local entry = {def = def, kind = kind, class = class, crew = {}}

			if kind == "ground" and simfphys and isfunction(simfphys.SpawnVehicleSimple) then
				local pos, yaw = VehicleSpotNear(spot, used)
				if pos then
					table.insert(used, pos)
					local veh = simfphys.SpawnVehicleSimple(class, pos + Vector(0, 0, 20), Angle(0, yaw, 0))
					if IsValid(veh) then entry.ent = veh end
				end
			elseif kind == "air" or kind == "aiground" then
				local pos, yaw
				if kind == "air" then
					pos, yaw = AirSpawnPos(spot.Pos), math.random(0, 359)
				else
					pos, yaw = VehicleSpotNear(spot, used)
				end
				if pos then
					table.insert(used, pos)
					local ent = ents.Create(class)
					if IsValid(ent) then
						ent:SetPos(pos + Vector(0, 0, 20))
						ent:SetAngles(Angle(0, yaw, 0))
						ent:Spawn()
						ent:Activate()
						entry.ent = ent
					end
				end
			end

			if IsValid(entry.ent) then
				local ent = entry.ent
				ent.PR_Patrol = patrol
				ent.PR_PatrolVehicle = entry
				ApplyVehicleHealth(ent, def.health)

				if kind == "ground" then
					-- Танки simfphys armed по умолчанию держат башню на замке
					ent:SetNWBool("TurretSafeMode", false)
					-- У бота нет клиентских настроек, и simfphys включил бы ему механику: ставим автомат
					ent.ForceTransmission = 1
				else
					SetupAI(patrol, entry)
				end

				entry.spawnedAt = CurTime()
				table.insert(patrol.vehicles, entry)
			else
				MsgN("[PR] патруль: не удалось выпустить технику " .. tostring(class))
			end
		end
	end
end

function PR_Patrol.RemoveVehicles(patrol)
	for _, v in ipairs(patrol.vehicles or {}) do
		v.dead = true
		KickCrew(v)
		if IsValid(v.ent) then v.ent:Remove() end
	end
end

----------------------------------------------------------------------------------------------------
-- Езда, стрельба, гибель

local function Destroyed(ent)
	if not IsValid(ent) then return true end
	-- simfphys: пока машина не собралась, здоровье ещё не выставлено — это не «подбита»
	if isfunction(ent.GetCurHealth) then
		return isfunction(ent.IsInitialized) and ent:IsInitialized() and ent:GetCurHealth() <= 0
	end
	if isfunction(ent.IsDestroyed) and ent:IsDestroyed() then return true end
	if isfunction(ent.GetDestroyed) and ent:GetDestroyed() then return true end
	return false
end

-- Машина патруля по любой её части: корпус, колесо simfphys (знает свою машину), сиденье
local function PatrolVehicleOf(ent)
	if not IsValid(ent) then return end
	if ent.PR_PatrolVehicle then return ent.PR_PatrolVehicle end
	if isfunction(ent.GetBaseEnt) then
		local base = ent:GetBaseEnt()
		if IsValid(base) and base.PR_PatrolVehicle then return base.PR_PatrolVehicle end
	end
	local parent = ent:GetParent()
	if IsValid(parent) and parent.PR_PatrolVehicle then return parent.PR_PatrolVehicle end
end

-- Своя техника не давит и не бьёт своих пеших (тяжёлый танк иначе давит свиту насмерть)
hook.Add("EntityTakeDamage", "PR_PatrolNoFriendlyCrush", function(victim, dmg)
	local patrol = victim.PR_Patrol
	if not patrol then return end

	local entry = PatrolVehicleOf(dmg:GetInflictor()) or PatrolVehicleOf(dmg:GetAttacker())
	if entry and table.HasValue(patrol.vehicles or {}, entry) then return true end
end)

-- Кто последним ранил технику — тому и награда
hook.Add("EntityTakeDamage", "PR_PatrolVehicleDamage", function(ent, dmg)
	local entry = ent.PR_PatrolVehicle
	if not entry then return end
	local ply = PR_KillerPlayer and PR_KillerPlayer(dmg:GetAttacker())
	if ply and not ply:GetNWBool("PR_PatrolCrew") then entry.lastAttacker = ply end
end)

-- Раз в секунду: подбитая техника — награда и долой экипаж
local function CheckVehicles(patrol)
	local alive = 0
	for _, v in ipairs(patrol.vehicles) do
		if not v.dead then
			-- Экипаж танка перебили — танк взрывается (иначе бесхозный танк заберёт любой игрок)
			local crewLost = v.kind == "ground" and v.hadDriver and not IsValid(v.crew[1])
			if crewLost and IsValid(v.ent) and not Destroyed(v.ent) then
				if isfunction(v.ent.ExplodeVehicle) then v.ent:ExplodeVehicle() else v.ent:Remove() end
			end

			if crewLost or Destroyed(v.ent) then
				v.dead = true
				KickCrew(v)
				if IsValid(v.lastAttacker) and PR_GiveReward then
					PR_GiveReward(v.lastAttacker, v.def.reward)
					local name = (v.def.name and v.def.name ~= "") and v.def.name or "техника"
					PrintMessage(HUD_PRINTTALK, "Подбит «" .. name .. "» патруля «" .. patrol.cfg.name .. "»! Отличился " .. v.lastAttacker:Nick())
				end
			else
				alive = alive + 1
			end
		end
	end
	return alive
end

local function SetKeys(veh, w, s, a, d, brake)
	veh.PressedKeys = veh.PressedKeys or {}
	veh.PressedKeys["W"] = w
	veh.PressedKeys["S"] = s
	veh.PressedKeys["A"] = a
	veh.PressedKeys["D"] = d
	veh.PressedKeys["Space"] = brake
end

-- simfphys armed наводит пушки по взгляду водителя/стрелка (ply:EyeAngles()), но в машине
-- движок не передаёт боту наклон взгляда — ствол не поднять и не опустить. Поэтому подменяем
-- взгляд там, где танк его читает: в функциях наведения (AimCannon, AimMachinegun...) для наших
-- ботов отдаём такой «взгляд», при котором по формуле simfphys ствол смотрит на цель.
-- Таблица функций общая для всех танков этой модели; для живых игроков всё как было.
-- Подставной «игрок» для чужого кода, который читает взгляд стрелка: EyeAngles отдаёт eye,
-- остальное — от настоящего бота. PR_Real — сам бот (для мест, где нужен настоящий игрок)
local function AimProxy(ply, eye)
	return setmetatable({
		PR_Real = ply,
		EyeAngles = function() return eye end,
		GetAimVector = function() return eye:Forward() end
	}, {__index = function(_, key)
		local value = ply[key]
		if isfunction(value) then
			return function(_, ...) return value(ply, ...) end
		end
		return value
	end})
end

local function WrapAimFunctions(func)
	if not istable(func) or func.PR_AimWrapped then return end
	func.PR_AimWrapped = true

	for name, original in pairs(func) do
		if isfunction(original) and string.StartWith(name, "Aim") then
			func[name] = function(self, ply, vehicle, pod, ...)
				local entry = IsValid(ply) and ply:IsPlayer() and ply.PR_PatrolCrew
				if entry and entry.aimAng and IsValid(pod) then
					-- simfphys считает ствол как машина:WorldToLocal(сиденье:WorldToLocal(взгляд))
					return original(self, AimProxy(ply, pod:LocalToWorldAngles(entry.aimAng)), vehicle, pod, ...)
				end
				return original(self, ply, vehicle, pod, ...)
			end
		end
	end
end

-- Gredwitch's Base: танки и пули. Ставится один раз, когда база загружена
local function WrapGredwitch()
	if not istable(gred) or gred.PR_Wrapped then return end
	gred.PR_Wrapped = true

	-- Башни танков Гредвича считает gred.TankGetDriverLocalAngles по взгляду игрока в кресле
	-- (локальная копия EyeAngles, подставной объект не пройдёт). Но у неё есть штатная ветка
	-- SeatTab.CustomEyeAngles: на время вызова отдаём через неё угол на цель в системе танка —
	-- скорость поворота башни, пределы и звуки Гредвич считает сам
	local getAngles = gred.TankGetDriverLocalAngles
	if isfunction(getAngles) then
		gred.TankGetDriverLocalAngles = function(vehicle, seat, SeatTab, ply, ...)
			local entry = IsValid(ply) and ply:IsPlayer() and ply.PR_PatrolCrew
			if not (entry and entry.aimAng and istable(SeatTab)) then
				return getAngles(vehicle, seat, SeatTab, ply, ...)
			end

			local custom, aim = SeatTab.CustomEyeAngles, entry.aimAng
			local want = vehicle:WorldToLocalAngles(aim)
			SeatTab.CustomEyeAngles = function() return Angle(want.p, want.y, want.r) end
			local ok, result = pcall(getAngles, vehicle, seat, SeatTab, ply, ...)
			SeatTab.CustomEyeAngles = custom
			if not ok then error(result, 0) end

			-- result — где башня сейчас (Гредвич доворачивает со скоростью танка): стрелять, когда встала
			if isangle(result) then
				entry.gredAligned = math.abs(math.AngleDifference(want.y + (SeatTab.TraverseOffset or 0), result.y)) < 4
			end
			return result
		end
	end

	-- Пули Гредвича: если стрелял наш подставной объект, стрелявшим считаем настоящего бота.
	-- У вертолёта без пилота (OH-6 на ИИ) стрелявший пустой, и урон шёл бы от «мира» — тогда
	-- стрелявшим считаем саму машину патруля (она первая в фильтре пули): так её пули
	-- не бьют свою свиту, а убийство засчитывается ей
	local createBullet = gred.CreateBullet
	if isfunction(createBullet) then
		gred.CreateBullet = function(ply, pos, ang, cal, filter, ...)
			if istable(ply) and ply.PR_Real then ply = ply.PR_Real end
			if not IsValid(ply) and istable(filter) and IsValid(filter[1]) and filter[1].PR_PatrolVehicle then
				ply = filter[1]
			end
			return createBullet(ply, pos, ang, cal, filter, ...)
		end
	end
end

-- LFS/LVS со стрелком (Ми-24, AH-1G): турель стреляет в Alt*Attack по взгляду стрелка —
-- подменяем ему взгляд на этой конкретной машине
local function WrapLFSGunner(entry)
	local ent = entry.ent
	if ent.PR_GunnerWrapped then return end
	ent.PR_GunnerWrapped = true

	for _, name in ipairs({"AltPrimaryAttack", "AltSecondaryAttack"}) do
		local original = ent[name]
		if isfunction(original) then
			ent[name] = function(self, driver, pod, ...)
				local crew = IsValid(driver) and driver:IsPlayer() and driver.PR_PatrolCrew
				local seat = IsValid(pod) and pod or (isfunction(self.GetGunnerSeat) and self:GetGunnerSeat())
				if crew and crew.aimAng and IsValid(seat) then
					-- Гредвич считает очередь как сиденье:WorldToLocal(взгляд)
					return original(self, AimProxy(driver, seat:LocalToWorldAngles(crew.aimAng)), pod, ...)
				end
				return original(self, driver, pod, ...)
			end
		end
	end
end

local function WrapSimfphysAim(veh)
	if veh.PR_AimWrapped or not simfphys or not istable(simfphys.ManagedVehicles) then return end

	for _, data in pairs(simfphys.ManagedVehicles) do
		if data.entity == veh then
			WrapAimFunctions(data.func)
			veh.PR_AimWrapped = true
			return
		end
	end
end

-- Наземная: едем за главным патруля, при враге стоим и бьём
local function DriveGround(patrol, v)
	local veh = v.ent
	SeatCrew(v)
	WrapSimfphysAim(veh)
	WrapGredwitch()

	if IsValid(v.crew[1]) then v.hadDriver = true end

	-- Водителя так и не нашлось (нет слотов игроков) — машину убираем, иначе стоит пустой мишенью
	if not v.hadDriver and CurTime() - v.spawnedAt > 5 then
		MsgN("[PR] патруль: «" .. v.class .. "» без водителя — убрана")
		v.dead = true
		KickCrew(v)
		veh:Remove()
		return
	end

	-- Опрокинулась (на боку или крыше дольше 3 секунд) — ставим на гусеницы физикой:
	-- колёса simfphys — отдельные тела на связках, телепорт корпуса их оторвал бы
	local up = veh:GetUp()
	if up.z < 0.3 then
		v.flippedSince = v.flippedSince or CurTime()
		if CurTime() - v.flippedSince > 3 then
			local axis = up:Cross(Vector(0, 0, 1))
			if axis:LengthSqr() < 0.01 then axis = veh:GetForward() end
			axis:Normalize()
			local phys = veh:GetPhysicsObject()
			if IsValid(phys) then
				phys:AddAngleVelocity(phys:WorldToLocalVector(axis) * 90)
				phys:ApplyForceCenter(Vector(0, 0, phys:GetMass() * 150))
			end
		end
	else
		v.flippedSince = nil
	end

	local target = PR_Patrol.VehicleTarget(v, veh:WorldSpaceCenter() + Vector(0, 0, 60), VEHICLE_RANGE)
	CrewAim(v, target)

	if not target then
		-- Врагов нет: башня смотрит по ходу
		v.aimAng = (veh.Forward or veh:GetForward()):Angle()
	elseif v.fire and veh.sm_pp_yaw then
		-- Танки simfphys armed помнят, куда повёрнута башня: стреляем, только когда она довернулась
		local want = veh:WorldToLocalAngles(v.aimAng)
		local dy = math.AngleDifference(want.y, veh.sm_pp_yaw)
		local dp = math.AngleDifference(want.p, veh.sm_pp_pitch or want.p)
		v.fire = math.abs(dy) < 4 and math.abs(dp) < 4
	elseif v.fire and v.gredAligned ~= nil then
		-- Танки Гредвича: перехват наведения знает, встала ли башня на цель
		v.fire = v.gredAligned
	end

	if not IsValid(veh:GetDriver()) then return end
	if isfunction(veh.EngineActive) and not veh:EngineActive() and isfunction(veh.StartEngine) then
		veh:StartEngine()
	end

	if target then
		v.driveState = "fight"
		SetKeys(veh, false, false, false, false, true)
		return
	end

	local center = PR_Patrol.Center(patrol)
	if not center then
		v.driveState = "no patrol"
		SetKeys(veh, false, false, false, false, true)
		return
	end

	-- Держимся у колонны: если танк уже впереди по ходу — ведёт её спереди, иначе идёт сзади.
	-- Так он не лезет сквозь свою пехоту, чтобы занять место позади
	local heading = Vector(patrol.dir.x, patrol.dir.y, 0)
	heading = heading:LengthSqr() > 0.01 and heading:GetNormalized() or Vector(1, 0, 0)

	local pos = veh:GetPos()
	local ahead = (pos - center):Dot(heading) > 100
	local goal = ahead and (center + heading * 450) or (center - heading * 420)
	local dist = FlatDist(pos, goal)
	if dist < 220 then
		v.driveState = ahead and "in place ahead" or "in place behind"
		SetKeys(veh, false, false, false, false, true)
		v.stuckSince = nil
		return
	end

	-- Куда смотрит машина (у simfphys «вперёд» модели бывает повёрнуто — берём его собственный)
	local forward = veh.Forward or veh:GetForward()
	local yaw = math.AngleDifference((goal - pos):Angle().y, forward:Angle().y)
	local speed = veh:GetVelocity():Length()
	local now = CurTime()

	-- Застряли: 4 секунды почти на месте — сдаём назад с обратным рулём
	if v.reverseUntil and now < v.reverseUntil then
		v.driveState = "unstuck"
		SetKeys(veh, false, true, yaw < 0, yaw > 0, false)
		return
	end
	if speed < 25 then
		v.stuckSince = v.stuckSince or now
		if now - v.stuckSince > 4 then
			v.stuckSince = nil
			v.reverseUntil = now + 2.5
		end
	else
		v.stuckSince = nil
	end

	-- Свои пешие на пути (300 юнитов по ходу) — ждём, а не едем по ним
	local reverse = math.abs(yaw) > 120
	local heading = reverse and -forward or forward
	for _, npc in ipairs(patrol.members) do
		if IsValid(npc) then
			local d = npc:GetPos() - pos
			d.z = 0
			if d:LengthSqr() < 300 * 300 and heading:Dot(d:GetNormalized()) > 0.3 then
				v.driveState = "infantry in the way"
				SetKeys(veh, false, false, false, false, true)
				v.stuckSince = nil
				return
			end
		end
	end

	local turnLeft, turnRight = yaw > 8, yaw < -8
	v.driveState = string.format("%s %s, goal %d, turn %d", reverse and "reverse" or "forward", ahead and "lead" or "follow", dist, yaw)
	if reverse then
		-- Цель позади: разворачиваемся задним ходом
		SetKeys(veh, false, true, turnRight, turnLeft, false)
	else
		SetKeys(veh, true, false, turnLeft, turnRight, false)
	end
end

-- Авиация и LVS: летит/едет своим ИИ, бот-стрелок бьёт по той же цели
local function CrewForAI(patrol, v)
	HoldUntilEngine(v)
	SeatCrew(v)
	WrapGredwitch()
	WrapLFSGunner(v)
	CrewAim(v, PR_Patrol.VehicleTarget(v, v.ent:WorldSpaceCenter(), VEHICLE_RANGE * 1.5))
end

local nextVehicleThink = 0
hook.Add("Think", "PR_PatrolVehicles", function()
	if CurTime() < nextVehicleThink then return end
	nextVehicleThink = CurTime() + 0.1

	for _, patrol in ipairs(PR_Patrol.Active) do
		for _, v in ipairs(patrol.vehicles or {}) do
			if not v.dead and IsValid(v.ent) and not Destroyed(v.ent) then
				local ok, err = pcall(v.kind == "ground" and DriveGround or CrewForAI, patrol, v)
				if not ok and v.lastError ~= tostring(err) then
					v.lastError = tostring(err)
					MsgN("[PR] техника патруля «" .. tostring(v.class) .. "»: ошибка: " .. v.lastError)
				end
			end
		end
	end
end)

-- Для pr_patrol_info и автотеста: что с машиной
function PR_Patrol.VehicleInfo(v)
	if not v then return "нет" end
	local ent = v.ent
	local crew = 0
	for _, bot in pairs(v.crew or {}) do
		if IsValid(bot) then crew = crew + 1 end
	end
	local heading = "-"
	if IsValid(ent) then
		-- Куда машина едет (у simfphys свой «перёд» по колёсам) и куда повёрнута модель
		heading = string.format("%d/%d", (ent.Forward or ent:GetForward()):Angle().y, ent:GetAngles().y)
	end
	return string.format("%s %s: valid=%s dead=%s destroyed=%s seats=%d crew=%d driver=%s hp=%s pos=%s up=%.2f speed=%d heading=%s state=%s fire=%s fly=%s wrapped=%s target=%s turret=%s/%s err=%s",
		tostring(v.kind), tostring(v.class), tostring(IsValid(ent)), tostring(v.dead), tostring(Destroyed(ent)),
		IsValid(ent) and #CrewSeats(v) or -1, crew, IsValid(ent) and isfunction(ent.GetDriver) and tostring(ent:GetDriver()) or "-",
		IsValid(ent) and isfunction(ent.GetCurHealth) and tostring(ent:GetCurHealth()) or "-",
		IsValid(ent) and tostring(ent:GetPos()) or "-", IsValid(ent) and ent:GetUp().z or -9, IsValid(ent) and math.Round(ent:GetVelocity():Length()) or -1,
		heading, tostring(v.driveState), tostring(v.fire), tostring(v.lastFly), IsValid(ent) and tostring(ent.PR_AimWrapped) or "-", tostring(v.aimTarget),
		IsValid(ent) and tostring(ent.sm_pp_yaw) or "-", IsValid(ent) and tostring(ent.sm_pp_pitch) or "-", tostring(v.lastError))
end

-- pr_patrol_debug 1 — раз в секунду писать в консоль, что с техникой патрулей
local DEBUG = CreateConVar("pr_patrol_debug", "0", 0, "Писать в консоль состояние техники патрулей")
timer.Create("PR_PatrolVehicleDebug", 1, 0, function()
	if not DEBUG:GetBool() then return end
	for _, patrol in ipairs(PR_Patrol.Active) do
		for _, v in ipairs(patrol.vehicles or {}) do
			if not v.dead then MsgN("[PR] " .. PR_Patrol.VehicleInfo(v)) end
		end
	end
end)

local function ThinkPatrol(patrol)
	local vehiclesAlive = CheckVehicles(patrol)

	local alive = {}
	for _, npc in ipairs(patrol.members) do
		if Alive(npc) then table.insert(alive, npc) end
	end
	patrol.members = alive

	if #alive == 0 then
		if vehiclesAlive == 0 then
			PR_Patrol.RemoveVehicles(patrol)
			table.RemoveByValue(PR_Patrol.Active, patrol)
			MsgN("[PR] патруль «" .. patrol.cfg.name .. "» перебит")
			return
		end

		-- Пеших перебили, техника жива: стоит, пока не выйдет время, и уходит без свидетелей
		local center = PR_Patrol.Center(patrol)
		if CurTime() > patrol.expiresAt and (not center or not PlayersNear(center, Settings().safeDistance)) then
			MsgN("[PR] техника патруля «" .. patrol.cfg.name .. "» ушла с карты")
			PR_Patrol.Remove(patrol)
		end
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

-- Окно вариантов в редакторе: список, сохранить, удалить, выпустить сейчас
local function TypeResult(ply, ok, key, text)
	net.Start("PR_PatrolTypeResult")
		net.WriteBool(ok)
		net.WriteString(key or "")
		net.WriteString(text or "")
	net.Send(ply)
end

net.Receive("PR_PatrolTypes", function(len, ply)
	if PR_IsAdmin(ply) then PR_Patrol.SendTypes(ply) end
end)

net.Receive("PR_PatrolSaveType", function(len, ply)
	if not PR_IsAdmin(ply) or not PR_NetThrottle(ply, "PR_PatrolSaveType", 0.5) then return end

	local key = net.ReadString()
	local data = net.ReadTable()

	local saved, err = PR_Patrol.SaveType(key ~= "" and key or nil, data)
	if saved then
		local name = PR_PATROL_TYPES[saved].name
		PR_Log(ply, "сохранил патруль " .. saved .. " «" .. name .. "»")
		TypeResult(ply, true, saved, "Патруль «" .. name .. "» сохранён")
	else
		TypeResult(ply, false, key, "Не сохранено: " .. tostring(err))
	end
end)

net.Receive("PR_PatrolDeleteType", function(len, ply)
	if not PR_IsAdmin(ply) or not PR_NetThrottle(ply, "PR_PatrolDeleteType", 0.5) then return end

	local key = net.ReadString()
	local name = PR_PATROL_TYPES[key] and PR_PATROL_TYPES[key].name or key
	if PR_Patrol.DeleteType(key) then
		PR_Log(ply, "удалил патруль " .. key .. " «" .. name .. "»")
		TypeResult(ply, true, "", "Патруль «" .. name .. "» удалён")
	end
end)

-- Выпустить сейчас: на спот, куда смотрит админ, иначе на случайный подходящий
net.Receive("PR_PatrolSpawnType", function(len, ply)
	if not PR_IsAdmin(ply) or not PR_NetThrottle(ply, "PR_PatrolSpawnType", 1) then return end

	local key = net.ReadString()
	local spotId = PR_Patrol.NearestSpot(ply:GetEyeTrace().HitPos, 3000)
	local patrol, err = PR_Patrol.Spawn(key, spotId)

	if patrol then
		PR_Log(ply, "выпустил патруль " .. key)
		TypeResult(ply, true, key, "«" .. patrol.cfg.name .. "» вышел на спот #" .. patrol.spot)
	else
		TypeResult(ply, false, key, "Не вышел: " .. tostring(err))
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
		for _, v in ipairs(patrol.vehicles or {}) do
			Reply(ply, "    " .. PR_Patrol.VehicleInfo(v))
		end
	end
end)

-- Выдать себе редактор спотов
concommand.Add("pr_patrol_edit", function(ply)
	if not IsValid(ply) or not PR_IsAdmin(ply) then return end
	ply:Give("pr_patrol_tool")
	ply:SelectWeapon("pr_patrol_tool")
end)
