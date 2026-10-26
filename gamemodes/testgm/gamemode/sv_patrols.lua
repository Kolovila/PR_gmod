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

----------------------------------------------------------------------------------------------------
-- Журнал патрулей: data/pr_gamemode/patrol_log.txt. Что случилось с патрулём и техникой: появился,
-- подбит (кем и чем, сколько урона не прошло как «свой»), сломан винт, сильный крен, уход от
-- препятствия, танк перевернулся, патруль застрял или долго в бою. Чтобы по жалобе «вертолёт сам
-- разбился» читать журнал, а не гадать. Больше 1 МБ — прежний уходит в patrol_log_old.txt
----------------------------------------------------------------------------------------------------
local LOG_DIR = "pr_gamemode"
local LOG_FILE = LOG_DIR .. "/patrol_log.txt"
local LOG_OLD = LOG_DIR .. "/patrol_log_old.txt"
local LOG_MAX = 1024 * 1024

function PR_Patrol.Log(text)
	MsgN("[PR] " .. text)
	if not file.IsDir(LOG_DIR, "DATA") then file.CreateDir(LOG_DIR) end
	if math.max(file.Size(LOG_FILE, "DATA") or 0, 0) > LOG_MAX then
		file.Write(LOG_OLD, file.Read(LOG_FILE, "DATA") or "")
		file.Delete(LOG_FILE)
	end
	file.Append(LOG_FILE, os.date("%Y-%m-%d %H:%M:%S") .. "  " .. text .. "\n")
end

-- То же, но не чаще раза в sec секунд для этого holder (патруля, машины) и ключа
function PR_Patrol.LogEvery(holder, key, sec, text)
	holder.logAt = holder.logAt or {}
	local now = CurTime()
	if (holder.logAt[key] or 0) > now then return end
	holder.logAt[key] = now + sec
	PR_Patrol.Log(text)
end

local function PosText(pos)
	return string.format("%d %d %d", pos.x, pos.y, pos.z)
end

-- «Ми-24» (gred_lfs_mi24a) патруля «Решала со свитой»
local function VehicleLabel(v)
	local name = (v.def and v.def.name and v.def.name ~= "") and v.def.name or "техника"
	return string.format("«%s» (%s) патруля «%s»", name, tostring(v.class), tostring(v.patrolName))
end

-- Высота над землёй или крышей под машиной
local function HeightAboveGround(ent)
	local pos = ent:WorldSpaceCenter()
	local tr = util.TraceLine({start = pos, endpos = pos - Vector(0, 0, 20000), filter = ent, mask = MASK_SOLID_BRUSHONLY})
	return math.Round(pos.z - tr.HitPos.z)
end

-- Вызвать fn без вывода print в консоль: аддоны печатают отладку (NPC из EFT-пака — таблицы своей
-- одёжки при появлении, Ми-24 — стрелка при пуске ракеты), это сотни строк «table: 0x…»
local function Quietly(fn, ...)
	local realPrint = print
	print = function() end
	local result = {pcall(fn, ...)}
	print = realPrint
	if not result[1] then error(result[2], 0) end
	return unpack(result, 2)
end
PR_Quietly = Quietly

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
		-- Экипаж всегда полный (водитель и все стрелки), его в редакторе не задают — см. CrewSeats
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
	hook.Run("PR_PatrolSpotsChanged")
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

-- Споты или их территории изменились: связи, редактор у админов, территории на мини-карте
local function SpotsChanged()
	PR_Patrol.RebuildLinks()
	PR_Patrol.SendSpots()
	hook.Run("PR_PatrolSpotsChanged")
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
	hook.Run("PR_PatrolSpotsChanged")
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
		PR_Patrol.Log("патруль: нет NPC " .. tostring(class) .. " (не установлен аддон?)")
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
	Quietly(function()
		npc:Spawn()
		npc:Activate()
	end)

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
	local vehicles = {}
	for _, v in ipairs(patrol.vehicles) do
		local loadout = IsValid(v.ent) and isfunction(v.ent.GetLoadout) and (", подвес " .. v.ent:GetLoadout()) or ""
		table.insert(vehicles, tostring(v.class) .. loadout)
	end
	PR_Patrol.Log(string.format("патруль «%s» вышел на спот #%s: %d NPC, техника: %s", cfg.name, tostring(spotId), #patrol.members,
		#vehicles > 0 and table.concat(vehicles, "; ") or "нет"))

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
	local from = IsValid(patrol.leader) and PosText(patrol.leader:GetPos()) or "?"
	if TeleportIfUnseen(patrol.leader, target.Pos) then
		PR_Patrol.Log(string.format("патруль «%s» застрял у %s по пути к споту #%s — никто не видит, перенесён", patrol.cfg.name, from, tostring(target.Id)))
		for _, npc in ipairs(patrol.members) do
			if npc ~= patrol.leader then TeleportIfUnseen(npc, target.Pos) end
		end
		return
	end

	patrol.route = nil
	patrol.spot = PR_Patrol.NearestSpot(patrol.leader:GetPos()) or patrol.spot
	patrol.lingerUntil = CurTime() + 3
	PR_Patrol.Log(string.format("патруль «%s» застрял у %s по пути к споту #%s — новый маршрут", patrol.cfg.name, from, tostring(target.Id)))
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
-- Наземка видит дальше: карта 30000 в поперечнике, и на 6000 танк не замечал врага, который уже
-- бил по нему. Огонь всё равно ведут только по видимому, а подъезжают на свою дальность (GroundRange)
local GROUND_SIGHT = 9000
-- Сколько башня ещё смотрит туда, где врага видели последний раз (а не разворачивается по ходу):
-- раньше через 4 с после потери цели башня уходила вперёд, и вернувшегося врага докручивала заново
local GROUND_WATCH_TIME = 300

-- Префайр: враг только что скрылся (зашёл в дом, за стену) — бьём туда, где его видели последний
-- раз: экипаж — ещё PREFIRE_TIME секунд, лётчик вертолёта — ракетами (до PREFIRE_ROCKETS на одно
-- укрытие, пока не прошло PREFIRE_AIR_TIME). Снаряд и ракета рвутся у стены или в проёме двери
local PREFIRE_TIME = 5 -- дольше — экипаж слишком долго лупит в пустое место
local PREFIRE_AIR_TIME = 6
local PREFIRE_ROCKETS = 4
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
-- Во что стрелять: в игрока, а если он в технике — в саму машину. Иначе целились в игрока,
-- который сидит в люке на крыше, и снаряд с малейшим завышением уходил поверх
local function AimBody(target)
	if target:IsPlayer() then
		local seat = target:GetVehicle()
		if IsValid(seat) then
			local base = seat:GetParent()
			local body = IsValid(base) and base or seat
			return body, body
		end
	end
	return target
end

-- Цель в воздухе: под ней (или под её машиной) нет земли на h
local function AirTarget(target, h)
	local pos = AimBody(target):WorldSpaceCenter()
	return not util.TraceLine({start = pos, endpos = pos - Vector(0, 0, h), mask = MASK_SOLID_BRUSHONLY}).Hit
end

-- Кто враг для техники: "air" — в воздухе (самолёт, вертолёт), "vehicle" — техника на земле,
-- "infantry" — пеший. От этого зависит, чем и как бьют самолёты и вертолёты
local function TargetKind(target, airHeight)
	local _, vehicle = AimBody(target)
	-- Игрок пешком — пехота, даже если его подбросило взрывом или он падает с крыши: раньше вертолёт
	-- от этого переходил на «воздушную цель» и уходил вверх до 4000. NPC и прочее — по высоте
	-- (летающие NPC вроде вертолёта Альянса — воздух)
	if target:IsPlayer() and not IsValid(vehicle) then return "infantry" end
	if AirTarget(target, airHeight or 500) then return "air" end
	if IsValid(vehicle) or target:IsVehicle() or target.IsSimfphyscar or target.LFS or target.LVS then return "vehicle" end
	return "infantry"
end
PR_Patrol.TargetKind = TargetKind

-- Куда целиться: середина, а если её закрывает низкое укрытие — верх (крыша машины, голова)
function PR_Patrol.AimPoints(target)
	local body, vehicle = AimBody(target)
	local mins, maxs = body:OBBMins(), body:OBBMaxs()
	local top = body:LocalToWorld(Vector((mins.x + maxs.x) / 2, (mins.y + maxs.y) / 2, mins.z + (maxs.z - mins.z) * 0.8))
	return {body:WorldSpaceCenter(), top}, vehicle
end

function PR_Patrol.AimPoint(target)
	return PR_Patrol.AimPoints(target)[1]
end

-- Видно ли цель (стены, дома и прочее). Не мешают сама цель, стреляющий и обе машины целиком —
-- с колёсами и башнями (у simfphys это отдельные сущности на машине)
local function PartOf(e, vehicle)
	if not IsValid(vehicle) then return false end
	if e == vehicle or e:GetParent() == vehicle then return true end
	return isfunction(e.GetBaseEnt) and e:GetBaseEnt() == vehicle
end

-- Видимая точка цели (середина или верх) или nil. Заслоняет только сама карта (дома, скалы);
-- автотест префайра ставит PR_Patrol.VisibleMask = MASK_SOLID, чтобы «домом» служил проп
local function VisiblePoint(from, target, shooter)
	local points, vehicle = PR_Patrol.AimPoints(target)
	local tr
	for _, to in ipairs(points) do
		tr = util.TraceLine({
			start = from, endpos = to, mask = PR_Patrol.VisibleMask or MASK_SOLID_BRUSHONLY,
			filter = function(e) return e ~= target and not PartOf(e, shooter) and not PartOf(e, vehicle) end
		})
		if not tr.Hit then return to end
	end
	-- Что заслоняет (для pr_patrol_debug)
	return nil, tr and string.format("%s@%d", tostring(tr.Entity), from:Distance(tr.HitPos))
end

-- memory — сколько секунд помнить скрывшегося врага (по умолчанию 4)
function PR_Patrol.VehicleTarget(entry, from, range, memory)
	-- Для автотеста: forceTarget — бить только его, ignoreTargets — никого не искать
	if IsValid(entry.forceTarget) then return entry.forceTarget end
	if entry.ignoreTargets then return nil end
	if (entry.targetAt or 0) > CurTime() then
		if IsValid(entry.target) then return entry.target end
		return nil
	end

	local best, bestD = nil, range * range
	local function Consider(ent)
		local d = PR_Patrol.AimPoint(ent):DistToSqr(from)
		if d >= bestD or not VisiblePoint(from, ent, entry.ent) then return end
		best, bestD = ent, d
	end

	local function Enemy(ent)
		if not IsValid(ent) then return false end
		if ent:IsPlayer() then return not IgnorePlayers() and RealPlayer(ent) and not ent:IsFlagSet(FL_NOTARGET) end
		return ent.PR_GuardPoint and ent:Health() > 0
	end

	for _, ply in ipairs(player.GetAll()) do
		if Enemy(ply) then Consider(ply) end
	end

	-- Защитники точек любых группировок — тоже враги бандитов
	for _, npc in ipairs(ents.FindByClass("npc_*")) do
		if Enemy(npc) then Consider(npc) end
	end

	-- Враг на миг скрылся (за домом, за краном) — помним его ещё 4 секунды, а не мечемся
	-- между ним и патрулём. Стреляют всё равно, только когда его видно (CrewAim)
	local now = CurTime()
	local seen = best ~= nil
	if best then
		entry.targetSeen = now
	elseif Enemy(entry.target) and now - (entry.targetSeen or 0) < (memory or 4)
		and entry.target:WorldSpaceCenter():DistToSqr(from) < range * range then
		best = entry.target
	end

	-- Видим врага — переискиваем раз в секунду (вдруг ближе); не видим никого — каждые 0.3 с,
	-- чтобы вышедшего из-за угла заметить сразу, а не через секунду
	entry.targetAt = now + (seen and 1 or 0.3)
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

-- Есть ли у стрелка вертолёта оружие. У пака Гордона (Helicopter Pack #3) место стрелка есть и у
-- машин без турели (BO-105, Hkp 9, EC665, MD-500, SA-316) — бот там сидел без дела, а вертолёт
-- из-за «стрелка» висел на месте, и лётчик не стрелял вовсе
local function GunnerArmed(entry, ent)
	if string.StartWith(entry.class or "", "lfs_grdn_") then return isfunction(ent.TurretAttack) end
	-- Ми-24П GD: у стрелка только тепловизор, пушка — у лётчика
	if entry.class == "gd_lfs_mi24p" then return false end
	return true
end

-- Оружие машины Гредвича (gred.simfphys): на каком месте пушка, как называется дуло и с какой
-- скоростью летит снаряд. Дуло у новых машин не всегда «cannon_muzzle»/«muzzle» (у «Тунгуски» —
-- cannon_muzzle_l_1): целились от середины корпуса, и очередь одного левого автомата шла мимо.
-- nil — не Гредвич или машина ещё не собралась (режим аркада/реализм не выбран)
local function GredWeapons(entry)
	if entry.gredWeapons ~= nil then return entry.gredWeapons or nil end
	local list = istable(gred) and istable(gred.simfphys) and gred.simfphys
	local def = list and (list[entry.class] or (IsValid(entry.ent) and entry.ent.CachedSpawnList and list[entry.ent.CachedSpawnList]))
	if not (istable(def) and istable(def.Seats)) then
		entry.gredWeapons = false
		return nil
	end
	local mode = IsValid(entry.ent) and entry.ent.Mode
	if not mode then return nil end

	local info = {seats = {}}
	for k = 0, 8 do
		local seatDef = def.Seats[k]
		local tab = istable(seatDef) and seatDef[mode]
		local weapon = istable(tab) and istable(tab.Primary) and tab.Primary[1]
		if weapon then
			info.seats[k] = true
			if not info.main then
				local speed = 50000
				local cal = istable(gred.CalTable) and gred.CalTable[weapon.Caliber]
				if weapon.Type == "MG" and cal and cal.Speed then
					speed = cal.Speed / engine.TickInterval()
				elseif istable(weapon.ShellTypes) and istable(weapon.ShellTypes[1]) and weapon.ShellTypes[1].MuzzleVelocity then
					speed = weapon.ShellTypes[1].MuzzleVelocity / 0.01905
				end
				info.main = {seat = k, muzzle = tab.MuzzleAttachment or (istable(weapon.Muzzles) and weapon.Muzzles[1]) or nil, speed = speed,
					type = weapon.Type, caliber = weapon.Caliber}
			end
		end
	end
	entry.gredWeapons = info
	return info
end

-- Места экипажа: водитель (у наземной) и все стрелки. Экипаж всегда полный — машина воюет всем
-- своим оружием. Пассажиров без оружия не сажаем: там бот ничего не делает, а слот игрока занимает
local function CrewSeats(entry)
	local ent, seats = entry.ent, {}
	local function Add(seat)
		if IsValid(seat) and not table.HasValue(seats, seat) then table.insert(seats, seat) end
	end

	if entry.kind == "ground" then
		Add(isfunction(ent.GetDriverSeat) and ent:GetDriverSeat() or ent.DriverSeat)
		-- Стрелки. Гредвич: места, у которых в описании машины есть оружие (у ГАЗ-АА пулемёт только
		-- на третьем месте; в аркадном режиме у танков всё оружие у водителя). Пока машина не
		-- собралась (режим не выбран), стрелков не сажаем — места добавятся, когда соберётся.
		-- Танки Луны и паки на их основе: у места стрелка есть прицел (HasCrosshair)
		local weapons = GredWeapons(entry)
		for k, seat in ipairs(ent.pSeat or {}) do
			if (weapons and weapons.seats[k]) or (entry.gredWeapons == false and IsValid(seat) and seat:GetNWBool("HasCrosshair")) then
				Add(seat)
			end
		end
	else
		-- Стрелки LFS: основной, у Ми-8 GD ещё дверные и кормовые
		for _, getter in ipairs({"GetGunnerSeat", "GetGunner2Seat", "GetGunner3Seat", "GetGunner4Seat"}) do
			if isfunction(ent[getter]) and GunnerArmed(entry, ent) then Add(ent[getter](ent)) end
		end
		-- LVS: места, у которых есть своё оружие (WEAPONS[номер места])
		if ent.LVS and istable(ent.WEAPONS) and isfunction(ent.GetPassengerSeats) then
			for _, seat in ipairs(ent:GetPassengerSeats() or {}) do
				local list = IsValid(seat) and ent.WEAPONS[seat:GetNWInt("pPodIndex", -1)]
				if istable(list) and #list > 0 then Add(seat) end
			end
		end
	end

	return seats
end

local function CreateBot(entry, index)
	if player.GetCount() >= game.MaxPlayers() then
		PR_Patrol.Log("патруль: нет свободных слотов игроков для экипажа")
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

	for i = 1, #seats do
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
		-- Забываем и саму цель: иначе, вернувшись к тому же врагу, отсчёт «довернуть пушку»
		-- не начинался заново и экипаж больше никогда не стрелял по нему
		entry.aimAng, entry.fire, entry.aimSince, entry.aimTarget = nil, false, nil, nil
		return
	end

	-- Целимся от дула пушки (танк), иначе от центра машины вверх по миру (а не по машине:
	-- перевёрнутая смотрела бы в землю). От центра корпуса на 500 юнитов ошибка была в градусы
	local ent = entry.ent
	local from = ent:WorldSpaceCenter() + Vector(0, 0, 60)
	if entry.kind == "ground" then
		local weapons = GredWeapons(entry)
		-- Машина Гредвича ещё не собралась — дуло выберем, когда соберётся
		if entry.muzzleId == nil and (weapons or entry.gredWeapons == false) then
			local named = weapons and weapons.main and weapons.main.muzzle
			-- Танки Луны и паки на их основе: прицел водителя привязан к стволу (у БТР-80 —
			-- muzzle_KPVT, у БТР-80А — muzzle_2A72)
			local driverSeat = not named and isfunction(ent.GetDriverSeat) and ent:GetDriverSeat()
			if IsValid(driverSeat) and driverSeat:GetNWBool("HasCrosshair") then
				local att = driverSeat:GetNWString("Attachment", "")
				if att ~= "" then
					named = att
					-- Куда у этого прицела смотрит ствол (в осях точки крепления; у «Дзика» — вверх)
					entry.crossDir = driverSeat:GetNWVector("Direction", Vector(1, 0, 0))
				end
			end
			local id = named and ent:LookupAttachment(named)
			if not id or id <= 0 then id = ent:LookupAttachment("cannon_muzzle") end
			if not id or id <= 0 then id = ent:LookupAttachment("muzzle") end
			-- Не нашли — первые 10 с ищем снова: прицел (а с ним и имя ствола) аддон вешает на место
			-- водителя позже, чем бот впервые целится (у БТР-80 ствол так и оставался ненайденным)
			entry.muzzleId = (id and id > 0) and id or ((CurTime() - (entry.spawnedAt or 0) > 10) and false or nil)
		end
		local att = entry.muzzleId and ent:GetAttachment(entry.muzzleId)
		if att then from = att.Pos end
	end
	local visible, blocker = VisiblePoint(from, target, ent)
	local to = visible or PR_Patrol.AimPoint(target)
	-- Префайр экипажа: враг только что скрылся — ещё PREFIRE_TIME секунд бьём, где его видели
	local now = CurTime()
	local prefire = false
	if visible then
		entry.seenAt, entry.seenPos, entry.seenTarget = now, visible, target
	elseif entry.seenTarget == target and entry.seenAt and now - entry.seenAt < PREFIRE_TIME then
		to, prefire = entry.seenPos, true
	end
	-- По самолёту и вертолёту — с упреждением: куда он долетит, пока летит снаряд (зенитки,
	-- стрелки вертолётов)
	if AirTarget(target, 300) then
		local weapons = GredWeapons(entry)
		local speed = weapons and weapons.main and weapons.main.speed or 50000
		local vel = AimBody(target):GetVelocity()
		local aimAt = to
		for _ = 1, 2 do aimAt = to + vel * (from:Distance(aimAt) / speed) end
		to = aimAt
	end
	-- Точка, куда целимся: стрелки на других местах (пулемёт командира) считают угол от своего ствола
	entry.aimPoint = to
	local desired = (to - from):Angle()
	-- Танки Луны и паки на её основе стреляют туда, куда смотрит точка крепления прицела, а она у
	-- некоторых моделей стоит со сдвигом от того, куда башню поворачивают (БТР-80: 9–11°, одно
	-- попадание из 182). Игрок видит прицел и поправляется сам; бот — так же: когда башня
	-- довернулась до прошлого угла, меряем, куда ствол смотрит на самом деле, и сдвигаем угол
	-- Мерить только когда машина стоит ровно и почти на месте: в тесте переворота поправка набралась
	-- вверх ногами (до 18°), и потом «Тигр» бил мимо
	local steady = ent:GetUp().z > 0.9 and ent:GetVelocity():LengthSqr() < 60 * 60 and from:DistToSqr(to) > 300 * 300
	local att = steady and entry.crossDir and entry.muzzleId and ent:GetAttachment(entry.muzzleId)
	if att and ent.sm_pp_yaw and entry.aimAng then
		local asked = ent:WorldToLocalAngles(entry.aimAng)
		local settled = math.abs(math.AngleDifference(asked.y, ent.sm_pp_yaw)) < 1 and math.abs(math.AngleDifference(asked.p, ent.sm_pp_pitch or asked.p)) < 1
		entry.settledSince = settled and (entry.settledSince or CurTime()) or nil
		-- Положение ствола на сервере обновляется с запаздыванием: мерить, только когда башня уже
		-- полсекунды стоит, и подправлять понемногу — с поправкой «на половину ошибки каждый тик»
		-- петля раскачивалась, и у «Тигра» уходила на 16–18° мимо
		if entry.settledSince and CurTime() - entry.settledSince > 0.5 then
			local dir = Vector(entry.crossDir)
			dir:Rotate(att.Ang)
			local real = dir:Angle()
			local fix = entry.aimFix or Angle(0, 0, 0)
			entry.aimFix = Angle(
				math.Clamp(fix.p + math.AngleDifference(desired.p, real.p) * 0.1, -12, 12),
				math.Clamp(fix.y + math.AngleDifference(desired.y, real.y) * 0.1, -12, 12),
				0)
		end
	end
	entry.aimAng = entry.aimFix and (desired + entry.aimFix) or desired
	-- Насколько можно промахнуться углом: цель ~70 юнитов (на 1000 — 4°, на 3000 — 1.3°)
	entry.aimTolerance = math.Clamp(math.deg(math.atan(70 / math.max(from:Distance(to), 1))), 0.6, 4)

	if entry.aimTarget ~= target then
		entry.aimTarget = target
		entry.aimSince = CurTime()
		-- «Встал на цель» был про прежнюю цель: ждём, пока перехват Гредвича пересчитает его для новой
		entry.gredAligned = nil
		for _, bot in pairs(entry.crew or {}) do
			if IsValid(bot) then bot.PR_GredAligned = nil end
		end
	end

	-- Огонь, когда враг виден (или префайр) и пушка довернулась. У simfphys-танков и Гредвича это
	-- известно точно (угол башни, gredAligned — проверка в DriveGround), там не ждём; у остальных —
	-- пауза на доворот. Раньше Гредвич тоже ждал 3 с, даже когда башня уже смотрела на врага
	local clear = visible ~= nil or prefire
	local turned = CurTime() - (entry.aimSince or CurTime()) > (entry.kind == "ground" and 2 or 3) or entry.ent.sm_pp_yaw ~= nil
		or (entry.kind == "ground" and entry.gredAligned ~= nil)
	entry.fire = clear and turned
	entry.aimDebug = string.format("see=%s%s%s turned=%s", tostring(visible ~= nil), prefire and " prefire" or "", blocker and ("(" .. blocker .. ")") or "", tostring(turned))
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
		local fire = entry.fire
		-- Пулемёт командира и прочие места Гредвича — по своему наведению, а не по пушке
		if ply ~= entry.crew[1] and ply.PR_GredAligned ~= nil then fire = entry.fireClear and ply.PR_GredAligned end
		if ply.PR_HoldFire then fire = false end
		if fire then cmd:SetButtons(IN_ATTACK) end
		return
	end

	-- Турели паков GD и Гордона наводятся подменой взгляда (WithCrewEyes); здесь — только огонь
	-- (и взгляд туда же, чтобы бот хотя бы смотрел на цель)
	if entry.ent.LFS and not string.StartWith(entry.class or "", "gred_lfs_") then
		local view = Angle(math.Clamp(entry.aimAng.p, -89, 89), entry.aimAng.y, 0)
		cmd:SetViewAngles(view)
		ply.PR_View = view
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
hook.Add("PlayerDeath", "PR_PatrolCrewDeath", function(ply, inflictor, attacker)
	if not ply:GetNWBool("PR_PatrolCrew") then return end
	local function Name(e)
		if e == game.GetWorld() then return "мир" end
		if not IsValid(e) then return "?" end
		return e:IsPlayer() and e:Nick() or e:GetClass()
	end
	PR_Patrol.Log(string.format("погиб бот экипажа %s: %s / %s", ply:Nick(), Name(attacker), Name(inflictor)))
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

-- На какой высоте над землёй ставить машину simfphys. Меню спавна ставит на 25 + SpawnOffset из
-- описания машины, а патруль ставил на 20: у Sd.Kfz.221 колёса на 15 ниже центра и радиусом 18 —
-- появлялись в земле и проваливались, корпус ложился на дорогу (колёс не видно) и машина не ехала
local function SimfphysSpawnHeight(class)
	local data = list.Get("simfphys_vehicles")[class]
	if not istable(data) then return 25 end
	local height = 25 + (isvector(data.SpawnOffset) and data.SpawnOffset.z or 0)
	local m = istable(data.Members) and data.Members or {}
	local radius = math.max(tonumber(m.FrontWheelRadius) or 0, tonumber(m.RearWheelRadius) or 0)
	for _, key in ipairs({"CustomWheelPosFL", "CustomWheelPosFR", "CustomWheelPosRL", "CustomWheelPosRR", "CustomWheelPosML", "CustomWheelPosMR"}) do
		if isvector(m[key]) then height = math.max(height, radius - m[key].z + 10) end
	end
	return math.min(height, 120)
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

-- Точка внутри карты с запасом (границы — config/minimap.lua). За краем — горы и стена неба:
-- вертолёт, уходя вверх от препятствия, вылетал за край и ломал там винт
local function ClampToMap(pos, margin)
	local cfg = PR_MINIMAPS and PR_MINIMAPS[string.lower(game.GetMap())]
	if not cfg then return pos end
	return Vector(math.Clamp(pos.x, cfg.minX + margin, cfg.maxX - margin), math.Clamp(pos.y, cfg.minY + margin, cfg.maxY - margin), pos.z)
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
-- Где появиться летающей машине: под открытым небом, не ближе 1500 к другим (taken) — иначе
-- отпущенный на скорости самолёт влетал в вертолёт рядом. Второе — курс «от патруля наружу»
local function AirSpawnPos(pos, taken, from)
	local turn = math.random(0, 359)
	for dist = from or 300, (from or 300) + 2400, 400 do
		for i = 0, 11 do
			local deg = turn + i * 30 + dist * 0.1
			local ang = math.rad(deg)
			local x, y = pos.x + math.cos(ang) * dist, pos.y + math.sin(ang) * dist

			local ceil, inside = CeilingAt(Vector(x, y, pos.z))
			if not inside and ceil - pos.z > AIR_ALTITUDE + 400 then
				local top = TopAt(x, y, ceil, pos.z)
				local candidate = Vector(x, y, math.min(math.max(pos.z + AIR_ALTITUDE, top + 900), ceil - 250))
				local free = true
				for _, other in ipairs(taken or {}) do
					if other:Distance(candidate) < 1500 then free = false break end
				end
				if free then return candidate, deg end
			end
		end
	end
end

-- Курс самолёта на старте: его отпускают сразу на скорости, и носом в склон он разбивался или
-- садился на брюхо и больше не взлетал (у игрока A-10 так простоял на земле 5 минут). Берём первый
-- из курсов, на котором ближайшие 5000 по носу (и чуть вниз) пусто; иначе — где пусто дольше всего
local function ClearHeading(pos, yaws)
	local best, bestFree = yaws[1], -1
	for _, yaw in ipairs(yaws) do
		local fwd = Angle(0, yaw, 0):Forward()
		local free = 1
		for _, drop in ipairs({0, 700}) do
			local tr = util.TraceLine({start = pos, endpos = pos + fwd * 5000 - Vector(0, 0, drop), mask = MASK_SOLID_BRUSHONLY})
			if tr.Hit and not tr.HitSky then free = math.min(free, tr.Fraction) end
		end
		if free >= 1 then return yaw end
		if free > bestFree then best, bestFree = yaw, free end
	end
	return best
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
-- Каков вертолёт: размах винта и тяга. Запасы высоты, упреждение и скорость захода — по ним:
-- Ми-24 (винт 395, слабая тяга 0.6) не OH-6 (винт 173, тяга 2) — с запасами OH-6 он цеплял склон
-- концом винта и не успевал вывернуть из пике
local function AirSpec(entry, ent)
	if entry.spec then return entry.spec end
	local rotor = math.Clamp(isfunction(ent.GetRotorRadius) and ent:GetRotorRadius() or 150, 80, 500)
	local thrust = isfunction(ent.GetThrustEfficiency) and ent:GetThrustEfficiency() or ent.ThrustEfficiencyHeli or 1
	local heavy = thrust < 1
	entry.spec = {
		rotor = rotor,
		clear = 250 + rotor * 0.6,          -- под винтом не меньше
		lookahead = heavy and 3 or 2,       -- на сколько секунд полёта смотреть вперёд
		diveSpeed = heavy and 380 or 520    -- быстрее на заходе не разгоняться
	}
	return entry.spec
end

-- На сколько градусов ниже корпуса турель стрелка достаёт (из кода аддонов, с запасом). С места
-- в 900 от цели и на 600 выше она под ~34° — у этих турелей вне угла, и стрелок бил мимо, в упор
-- предела. Таким вертолётам стоять дальше и ниже. Нет в списке — турель достаёт (Гредвич, AH-64)
local GUNNER_DOWN = {
	gd_lfs_mi24a = 32, gd_lfs_mi24v = 32, gd_lfs_mi24vm = 32, gd_lfs_mi28 = 32, gd_lfs_mi28n = 32,
	gd_lfs_mi8amtsh = 32, gd_lfs_mi8mtv = 15, gd_lfs_mi8t1 = 15, gd_lfs_mi8t2 = 15,
	lfs_grdn_ah1g = 20, lfs_grdn_ah1z = 30, lfs_grdn_mi24d = 8, lfs_grdn_mi28nm = 16, lfs_grdn_uh1c_xm30 = 16,
}

-- Бортовые пулемёты (Ми-8 GD): стрелки сидят в дверях, ствол ходит на ±23–30° от борта — носом к
-- цели ни один не достаёт. Такие вертолёты кружат вокруг цели против часовой, левым бортом к ней
-- (левая дверь берёт цель на +90° от носа). Значение — на сколько градусов от носа держать цель
-- (Транспортные Ми-8 пробовали водить заходами, как вертолёт без стрелка: в городе заход упирался
-- в дома, НУРы не шли — попаданий не больше, чем с круга, 0–13 за вылет. Оставили круг.)
local GUNNER_SIDE = {gd_lfs_mi8amtsh = 90, gd_lfs_mi8mtv = 90, gd_lfs_mi8t1 = 90, gd_lfs_mi8t2 = 90}
-- Точка круга — на столько градусов впереди вертолёта, радиус круга — не больше ORBIT_MAX. Круг
-- в 2800 с точкой на 35° впереди вертолёт проходил на ~570: на склонах то и дело «препятствие
-- впереди — ухожу вверх», и он набирал до 3000 высоты, где бортовые стволы цель не достают
local ORBIT_STEP = 20
local ORBIT_MAX = 2000

-- Расстояния, которые пробуем для места стрелка с узкой турелью (по каждому направлению)
local STANDOFF_DISTS = {700, 900, 1100, 1400, 1700, 2000, 2400, 2800}

-- Сторону берём ближайшую к вертолёту, откуда цель видно (не за домом или краном); пересчёт раз в секунду
-- dist — как далеко от цели (стрелку — 900, ракетам с места — 1800: оттуда цель под ~20–25° ниже
-- носа; с 900 на холме она оказывалась на 40–60° под ним, и ракеты не шли)
-- maxDown — турель стрелка достаёт только на столько градусов вниз: место ниже (на 350 над целью, а
-- не на 600), а расстояние — для каждого направления своё: самое близкое, откуда цель не круче
-- этого угла. В низине ближнее место ниже (склоны дальше), на ровном — дальнее; одно расстояние на
-- все стороны (как раньше) в низине уводило Ми-8 на 1000–1400 над целью, и пулемёты не доставали
-- orbit — кружить: место на круге на orbit градусов впереди (против часовой), и обходим закрытые
-- места только вперёд по кругу
local function StandOffPoint(entry, target, from, dist, maxDown, orbit)
	local now = CurTime()
	dist = dist or 900
	if entry.standTarget == target and entry.standDist == dist and entry.standAt and now < entry.standAt and entry.standPos then
		return entry.standPos
	end
	local asked = dist

	local tpos = target:GetPos()
	local eye = target:WorldSpaceCenter()
	local base = (from - tpos):Angle().y + (orbit or 0)
	local ceil = CeilingAt(tpos)

	-- Высота: на 600 выше цели и на 450 выше крыш и склонов вокруг места и на пути от него к цели
	-- (считать только землю под самим местом мало: у холма вертолёт цеплял склон винтом)
	local function Candidate(yaw, d)
		local p = tpos + Angle(0, yaw, 0):Forward() * d
		local top = -math.huge
		for _, f in ipairs({0, 0.25, 0.5, 0.75}) do
			top = math.max(top, TopAt(p.x + (tpos.x - p.x) * f, p.y + (tpos.y - p.y) * f, ceil, tpos.z))
		end
		for _, off in ipairs({Vector(250, 0, 0), Vector(-250, 0, 0), Vector(0, 250, 0), Vector(0, -250, 0)}) do
			top = math.max(top, TopAt(p.x + off.x, p.y + off.y, ceil, tpos.z))
		end
		-- Низкое место (стрелку с узкой турелью, круг) — с запасом над склонами больше: иначе
		-- вертолёт, снижаясь к нему, упирался «взглядом вперёд» в землю и уходил вверх
		p.z = math.min(math.max(tpos.z + (maxDown and 350 or 600), top + (entry.spec and entry.spec.clear or 350) + (maxDown and 250 or 100)), ceil - 250)
		return p
	end

	local function Clear(c)
		return not util.TraceLine({start = c, endpos = eye, mask = MASK_SOLID_BRUSHONLY}).Hit
	end
	local turns = orbit and {0, 20, 40, 60, 90} or {0, 40, -40, 80, -80, 120, -120, 180}

	local p
	if maxDown then
		-- Первое направление (по кругу — вперёд), где нашлось расстояние под угол турели; не нашлось
		-- нигде — место, откуда цель круче всего не выходит (наименьший угол)
		local tanMax, far = math.tan(math.rad(maxDown)), orbit and ORBIT_MAX or 2800
		local best, bestSlope
		for _, turn in ipairs(turns) do
			for _, d in ipairs(STANDOFF_DISTS) do
				if d > far then break end
				local c = Candidate(base + turn, d)
				if Clear(c) then
					local slope = (c.z - eye.z) / d
					if slope <= tanMax then
						p = c
						break
					end
					if not best or slope < bestSlope then best, bestSlope = c, slope end
				end
			end
			if p then break end
		end
		p = p or best or Candidate(base, dist)
	else
		p = Candidate(base, dist)
		for _, turn in ipairs(turns) do
			local c = Candidate(base + turn, dist)
			if Clear(c) then
				p = c
				break
			end
		end
	end

	entry.standTarget, entry.standDist, entry.standAt, entry.standPos = target, asked, now + 1, p
	return p
end

-- Вертолёт без стрелка (OH-6) бьёт курсовым оружием, а свой ИИ LFS у вертолётов огонь не жмёт
-- (только у самолётов). Поэтому заход на цель носом, проскочив — уход на 1500 за цель и новый заход.
-- Нос ИИ вертолёта LFS наклоняет по формуле P = LPos.x·0.02 − скорость_вперёд·0.1 (до 40°),
-- где LPos — наша точка в системе вертолёта (курс он сам держит на цель). Подбираем LPos.x так,
-- чтобы наклон носа совпал с углом на цель: тогда курсовой пулемёт смотрит прямо в неё
-- Высота захода: на 450 выше цели и на 400 выше крыш и склонов на пути к ней. С запасом над
-- порогом «мало места снизу» (250): иначе над крышами он то и дело срывался в уход вверх и
-- тут же снова нырял, так и не доходя до цели
local function StrafeAltitude(pos, tpos, clear)
	local ceil = CeilingAt(tpos)
	local z = tpos.z + clear + 200
	for _, f in ipairs({0, 0.25, 0.5, 0.75}) do
		local x, y = pos.x + (tpos.x - pos.x) * f, pos.y + (tpos.y - pos.y) * f
		z = math.max(z, TopAt(x, y, ceil, tpos.z) + clear + 150)
	end
	return math.min(z, ceil - 250)
end

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
		local ceil = CeilingAt(tpos)
		p.z = math.min(math.max(tpos.z + 700, TopAt(p.x, p.y, ceil, tpos.z) + AirSpec(entry, ent).clear + 200), ceil - 250)
		entry.breakPos = p
		entry.breakUntil = now + 6
		return p
	end

	local spec = AirSpec(entry, ent)
	local climb = math.Clamp(StrafeAltitude(pos, tpos, spec.clear) - pos.z, -400, 400)
	-- Только что уходил от препятствия — пока не снижаемся, а то нырнёт в него же
	if entry.holdAltUntil and CurTime() < entry.holdAltUntil then climb = math.max(climb, 0) end

	-- Ещё не развернулся носом к цели (после отхода смотрит в другую сторону): зависаем и
	-- доворачиваем, иначе точка «вперёд по носу» унесла бы его прочь от цели
	if math.abs(math.AngleDifference((tpos - pos):Angle().y, ent:GetAngles().y)) > 30 then
		return pos + Vector(0, 0, climb), true
	end

	local dive = math.Clamp(math.NormalizeAngle((tpos - ent:WorldSpaceCenter()):Angle().p), 0, 40)
	local forwardSpeed = ent:WorldToLocal(pos + ent:GetVelocity()).x
	-- Разогнался — нос почти ровно, пока не сбросит скорость (из пике на 500 тяжёлый не выходит)
	if forwardSpeed > spec.diveSpeed then dive = math.min(dive, 5) end
	-- true: заход на цель (нос на неё), а не отход
	return ent:LocalToWorld(Vector(50 * dive + 5 * forwardSpeed, 0, climb)), true
end

-- Свой ИИ LFS облетает препятствия, но мы его точки подменяем — значит, и смотреть вперёд нам.
-- Если за 2–3 секунды полёта по ходу что-то есть, под винтом меньше запаса (AirSpec) или лопасти
-- уже чиркают (LFS ломает винт после ~20 касаний) — тормозим и набираем высоту, пока не станет чисто

local function AirTraceFilter(ent)
	if isfunction(ent.GetCrosshairFilterEnts) then
		local ok, list = pcall(ent.GetCrosshairFilterEnts, ent)
		if ok and istable(list) then return list end
	end
	return ent
end

local function NeedsPullUp(entry, ent)
	local now = CurTime()
	if entry.pullUntil and now < entry.pullUntil then return true end

	local pos = ent:WorldSpaceCenter()
	local filter = AirTraceFilter(ent)
	local spec = AirSpec(entry, ent)
	local r = spec.rotor
	local ahead = ent:GetVelocity() * spec.lookahead
	if ahead:Length() < 300 then ahead = ahead:GetNormalized() * 300 end

	local front = util.TraceHull({start = pos, endpos = pos + ahead, mins = Vector(-r, -r, -40), maxs = Vector(r, r, 40), filter = filter, mask = MASK_SOLID_BRUSHONLY})
	-- Под всем винтом, а не одной точкой: склон сбоку винт заденет раньше, чем брюхо
	local rb = r * 0.7
	local below = util.TraceHull({start = pos, endpos = pos - Vector(0, 0, spec.clear), mins = Vector(-rb, -rb, 0), maxs = Vector(rb, rb, 10), filter = filter, mask = MASK_SOLID_BRUSHONLY})
	if (front.Hit and not front.HitSky) or below.Hit or ent.RotorHit then
		entry.pullUntil = now + 1.5
		entry.holdAltUntil = now + 4.5
		entry.pullUps = (entry.pullUps or 0) + 1
		if ent.RotorHit then
			PR_Patrol.LogEvery(entry, "rotorhit", 3, string.format("%s: лопасти задевают у %s — ухожу вверх", VehicleLabel(entry), PosText(ent:GetPos())))
		else
			PR_Patrol.LogEvery(entry, "pull", 30, string.format("%s: %s у %s (скорость %d) — ухожу вверх; за вылет таких %d",
				VehicleLabel(entry), (front.Hit and not front.HitSky) and "препятствие впереди" or "мало места снизу",
				PosText(ent:GetPos()), ent:GetVelocity():Length(), entry.pullUps))
		end
		return true
	end
	return false
end

-- Точка «тормозить и вверх»: для ИИ вертолёта LFS это нос вверх (гасит скорость) и полный газ
local function PullUpPoint(ent)
	return ent:GetPos() + Vector(0, 0, 700)
end

-- ИИ вертолёта LFS наклоняет корпус по тангажу и крену отдельно, каждый до 40°:
-- P = LPos.x·0.02 − скорость_вперёд·0.1, R = −LPos.y·0.02 + скорость_вбок·0.1.
-- Далёкая точка сбоку (разворот к цели, точка атаки за спиной) даёт 40° + 40° — вертолёт
-- ложится на бок под ~57°, теряет подъёмную силу и переворачивается. Подменяем точку так,
-- чтобы общий наклон был не больше 30°: направление то же, скорость почти та же
local AIR_MAX_TILT = 30
-- И менять наклон не быстрее 90°/с: резкий переход из пике (+40°) в торможение (−30°)
-- раскачивал лёгкий OH-6 до 50–60°
local AIR_TILT_RATE = 90

local function LimitTilt(entry, ent, point, maxTilt, urgent)
	maxTilt = maxTilt or AIR_MAX_TILT
	point = ClampToMap(point, 1500)
	local lpos = ent:WorldToLocal(point)
	local lvel = ent:WorldToLocal(ent:GetPos() + ent:GetVelocity())
	local p = lpos.x * 0.02 - lvel.x * 0.1
	local r = -lpos.y * 0.02 + lvel.y * 0.1

	if p * p + r * r > maxTilt * maxTilt then
		-- Тангаж (разгон, нос на цель на заходе) важнее крена: урезаем сперва крен
		if math.abs(p) >= maxTilt then
			p, r = p > 0 and maxTilt or -maxTilt, 0
		else
			local rmax = math.sqrt(maxTilt * maxTilt - p * p)
			r = math.Clamp(r, -rmax, rmax)
		end
	end

	local now = CurTime()
	-- Уход от препятствия — сразу, без плавности
	if entry.tiltP and not urgent then
		local step = AIR_TILT_RATE * math.Clamp(now - (entry.tiltAt or now), 0, 0.2)
		p = entry.tiltP + math.Clamp(p - entry.tiltP, -step, step)
		r = entry.tiltR + math.Clamp(r - entry.tiltR, -step, step)
	end
	entry.tiltP, entry.tiltR, entry.tiltAt = p, r, now

	return ent:LocalToWorld(Vector((p + lvel.x * 0.1) / 0.02, -(r - lvel.y * 0.1) / 0.02, lpos.z))
end

-- Курсовое оружие пилота у вертолётов Гредвича. Свой ИИ LFS у вертолётов огонь не жмёт, а Ми-24
-- и ракеты AH-1G при включённом ИИ ещё и сами отказываются стрелять (if self:GetAI() then return).
--   loadouts — подвесы, с которыми патруль выпускает машину (у Ми-24 подвес случайный, есть и
--              пустой, и бомбы; берём только курсовые: ракеты 1, 4, 5, пушки 6–9, на 8 ещё ракеты)
--   ammo     — есть ли чем стрелять вперёд;  fire — нажать огонь
local PILOT_WEAPONS = {
	-- Подвесы Ми-24: 1 — ракеты; 4, 5 — ракеты и бомбы; 6, 7, 9 — пушечные контейнеры;
	-- 8 — контейнеры и ракеты; 2, 3 — одни бомбы (их ИИ бросать не умеет, такие не ставим)
	gred_lfs_mi24a = {
		loadouts = {1, 4, 5, 6, 7, 8, 9},
		gun = {
			ammo = function(ent) return ent:GetLoadout() >= 6 and ent:GetAmmoPrimary() > 0 end,
			fire = function(ent) ent:PrimaryAttack(ent:GetLoadout(), ent:GetAmmoPrimary()) end
		},
		rockets = {
			ammo = function(ent)
				local l = ent:GetLoadout()
				return ((l == 1 or l == 4 or l == 5) and ent:GetAmmoPrimary() > 0) or (l == 8 and ent:GetAmmoSecondary() > 0)
			end,
			fire = function(ent)
				local l = ent:GetLoadout()
				if l == 8 then ent:SecondaryAttack(ent:GetAmmoSecondary(), l) else ent:PrimaryAttack(l, ent:GetAmmoPrimary()) end
			end
		}
	},
	gred_lfs_ah1g = {
		gun = {ammo = function(ent) return ent:GetAmmoPrimary() > 0 end, fire = function(ent) ent:PrimaryAttack() end},
		rockets = {ammo = function(ent) return ent:GetAmmoSecondary() > 0 end, fire = function(ent) ent:SecondaryAttack() end}
	},
	-- Ракеты A-10 своему ИИ LFS не даёт (SecondaryAttack: if self:GetAI() then return end) —
	-- стреляем ими сами, «без ИИ», как и остальным курсовым оружием
	gred_lfs_a10 = {
		gun = {ammo = function(ent) return ent:GetAmmoPrimary() > 0 end, fire = function(ent) ent:PrimaryAttack() end},
		rockets = {ammo = function(ent) return ent:GetAmmoSecondary() > 0 end, fire = function(ent) ent:SecondaryAttack() end}
	},
	-- Ми-24П (GD): неподвижная ГШ-30 — у лётчика (AltPrimaryAttack, патроны — Tertiary), ракеты —
	-- PrimaryAttack; у стрелка только тепловизор (GunnerArmed)
	gd_lfs_mi24p = {
		gun = {ammo = function(ent) return ent:GetAmmoTertiary() > 0 end, fire = function(ent) ent:AltPrimaryAttack(ent:GetLoadout()) end},
		rockets = {ammo = function(ent) return ent:GetAmmoPrimary() > 0 end, fire = function(ent) ent:PrimaryAttack(ent:GetLoadout()) end}
	}
}

-- Новые вертолёты (паки GD — Ми-24/28/8 — и Гордона — Helicopter Pack #3): курсовое оружие у них
-- обычное для LFS — PrimaryAttack/SecondaryAttack (что из них пушка, а что ракеты, по классам
-- разное: бьём из обоих, ракеты доворачиваем), подвесы — с номерами. Пустой подвес у них бывает по
-- умолчанию (у Гордона — всегда 0: вертолёт взлетал без оружия), на некоторых сам аддон падает с
-- ошибкой (Ка-50 и Ми-24Д — 4, пушка Ми-24Д — 3, Ми-28Н — 4; ПТУР 9М17 у GD — «NULL physics
-- object» при пуске: Ми-24А — 3, Ми-24В — 1, Ми-8Т2 — 1) — ставим только рабочие
local LFS_LOADOUTS = {
	gd_lfs_mi24a = {0, 1}, gd_lfs_mi24p = {0, 1, 2, 3}, gd_lfs_mi24v = {0, 2}, gd_lfs_mi24vm = {0, 1, 2, 3, 4},
	gd_lfs_mi28 = {0, 1, 2}, gd_lfs_mi28n = {0, 1, 2, 3}, gd_lfs_mi8amtsh = {0, 1, 2, 3}, gd_lfs_mi8mtv = {0, 1, 2},
	gd_lfs_mi8t1 = {0, 1}, gd_lfs_mi8t2 = {0},
	lfs_grdn_ah1g = {1, 2, 3}, lfs_grdn_ah1z = {1, 2, 3, 4}, lfs_grdn_ah64d = {1, 2, 3}, lfs_grdn_bo105pah1 = {2, 3},
	lfs_grdn_ec665uht = {1, 2, 3, 4, 5}, lfs_grdn_hkp9a = {1, 2}, lfs_grdn_ka50 = {1, 2}, lfs_grdn_md500tow = {1, 2},
	lfs_grdn_mi24d = {1}, lfs_grdn_mi28nm = {1, 2, 3}, lfs_grdn_sa316b = {1}, lfs_grdn_uh1c_xm30 = {1, 2, 3, 4, 5, 6},
}

-- Пушка лётчика: курсовая (PrimaryAttack) или турель без стрелка (Ка-50 Гордона: 30-мм пушка —
-- TurretAttack, и смотрит она по носу, пока лётчик-человек её не поворачивает)
local function PilotTurret(ent)
	return isfunction(ent.TurretAttack) and not (isfunction(ent.GetGunnerSeat) and IsValid(ent:GetGunnerSeat()))
		and isfunction(ent.GetTurretAmmo) and ent:GetTurretAmmo() > 0
end

local GENERIC_LFS_WEAPONS = {
	gun = {
		ammo = function(ent) return (isfunction(ent.GetAmmoPrimary) and ent:GetAmmoPrimary() > 0) or PilotTurret(ent) end,
		fire = function(ent)
			if isfunction(ent.GetAmmoPrimary) and ent:GetAmmoPrimary() > 0 then ent:PrimaryAttack() end
			if PilotTurret(ent) then ent:TurretAttack() end
		end
	},
	rockets = {
		ammo = function(ent) return isfunction(ent.GetAmmoSecondary) and ent:GetAmmoSecondary() > 0 end,
		fire = function(ent) ent:SecondaryAttack() end
	}
}

-- Оружие лётчика этой машины: своё описание (Ми-24, AH-1G, A-10 Гредвича) или общее для LFS
local function WeaponsOf(entry)
	return PILOT_WEAPONS[entry.class] or (entry.genericWeapons and GENERIC_LFS_WEAPONS) or nil
end

-- Ракеты, которым мы дали хозяина (бот экипажа или сама машина). Взрыв пишет урон на Owner, и если
-- хозяина уберут раньше (вертолёт сбит, бот выкинут), SetAttacker(NULL) падал с ошибкой
-- (base_rocket:741) — тогда ракета снова «сама своя», как было у аддона
local ownedRockets = {}
local function GiveRocketOwner(rocket, owner)
	rocket.Owner = owner
	ownedRockets[rocket] = owner
end
PR_Patrol.GiveRocketOwner = GiveRocketOwner
hook.Add("EntityRemoved", "PR_PatrolRocketOwners", function(ent)
	if not next(ownedRockets) then return end
	for rocket, owner in pairs(ownedRockets) do
		if not IsValid(rocket) or rocket == ent then
			ownedRockets[rocket] = nil
		elseif owner == ent then
			rocket.Owner = rocket
			ownedRockets[rocket] = nil
		end
	end
end)

-- Ракет за один заход, дальше — только пушка (иначе Ми-24 высыпал бы все 64 в первый же)
local SALVO = 8

-- Чем бить цель такого вида (по порядку): технику — ракетами и пушкой, самолёт — пушкой,
-- пехоту — пушкой, а ракетами, только если пушки нет (Ми-24 с одними ракетами)
local function PilotWeapons(entry, ent, kind)
	local weapons = WeaponsOf(entry)
	if not weapons then return {} end
	local broken = entry.brokenWeapons or {}
	local gun = weapons.gun and not broken.gun and weapons.gun.ammo(ent) and weapons.gun or nil
	if kind == "prefire" then
		return {weapons.rockets and not broken.rockets and weapons.rockets.ammo(ent) and weapons.rockets or nil}
	end
	local rockets = weapons.rockets and not broken.rockets and weapons.rockets.ammo(ent) and (entry.salvo or 0) < (entry.salvoCap or SALVO) and weapons.rockets or nil
	if kind == "vehicle" then return {rockets, gun} end
	if kind == "air" then return {gun} end
	return {gun or rockets}
end

-- Нос смотрит на цель (≤ 6°) и её видно
-- На сколько градусов нос отклонён от цели и видно ли её
local function NoseOff(ent, target)
	local from = ent:WorldSpaceCenter()
	local to = target:WorldSpaceCenter()
	local off = math.deg(math.acos(math.Clamp(ent:GetForward():Dot((to - from):GetNormalized()), -1, 1)))
	return off, not util.TraceLine({start = from, endpos = to, filter = ent, mask = MASK_SOLID_BRUSHONLY}).Hit
end

local function NoseOnTarget(ent, target)
	local off, clear = NoseOff(ent, target)
	return clear and off <= 6
end

-- Ракеты при пуске доворачиваем на цель (до 10°) — как лётчик доводит нос на последнем метре.
-- Вертолёт LFS наклоняет нос только движением: чтобы смотреть на технику в 2500 на 13° вниз, ему
-- надо пикировать, а у холмов он уходит вверх — без доводки ракеты по технике почти не шли
local ROCKET_AIM_ASSIST = 10

-- Пули лётчика вертолёта (Гредвич и паки на нём) доводим на цель, если ствол уже смотрит на неё
-- с точностью до 4°: точнее нос вертолёта ИИ LFS не держит, и с 1000+ очередь шла в 2–3° мимо
-- бойца (BO-105: 204 пули, ни одного попадания). Пока лётчик стреляет — {to, max}, иначе nil
local BULLET_AIM_ASSIST = 4
local PilotAssist
PR_Patrol.AssistStats = PR_Patrol.AssistStats or {tries = 0, done = 0}

local function AssistBullet(pos, ang)
	local a = PilotAssist
	if not (a and isvector(pos) and isangle(ang)) then return ang end
	local stats = PR_Patrol.AssistStats
	stats.tries = stats.tries + 1
	local dir = (a.to - pos):GetNormalized()
	if ang:Forward():Dot(dir) < math.cos(math.rad(a.max)) then return ang end
	stats.done = stats.done + 1
	local want = dir:Angle()
	return Angle(want.p + math.Rand(-0.5, 0.5), want.y + math.Rand(-0.5, 0.5), 0)
end

-- Цель-точка (где видели врага) для огня лётчика: у неё есть всё, что спрашивает FirePilot
local function PointTarget(pos)
	return {
		PR_Point = pos,
		IsValid = function() return true end,
		IsPlayer = function() return false end,
		WorldSpaceCenter = function() return pos end,
		GetPos = function() return pos end,
		GetVelocity = function() return vector_origin end
	}
end

local function TargetPoint(target)
	return target.PR_Point or PR_Patrol.AimPoint(target)
end

-- Огонь курсовым оружием. На время выстрела машина «без ИИ» и стреляет за неё бот экипажа
-- (а без экипажа — сама машина): ракетам и пулям нужен хозяин, иначе урон шёл бы от «мира»
-- мимо правила «свои своих не бьют» и без счёта убийств
-- kind — вид цели (TargetKind): от него зависит, чем бить; aimed — наведение уже проверено
-- вызывающим (у самолёта — своё, с упреждением). Возвращает, сколько ракет ушло
-- hover — вертолёт бьёт с места (по технике): ракеты, когда цель прямо по курсу (±8°) и ниже носа
-- не больше чем на 40° (место у цели — в 900 и на 600 выше, это ~34°) — зависший вертолёт смотрит
-- носом почти ровно, ракету доворачиваем вниз, как если бы он клюнул носом
local HOVER_ASSIST = 45

local function FirePilot(ent, entry, target, kind, aimed, hover)
	entry.pilotTries = (entry.pilotTries or 0) + 1
	kind = kind or entry.targetKind or "infantry"
	-- По технике ракеты — когда нос в пределах доводки (10°), пушка — только когда на цели (6°)
	local off, clear = 0, true
	local assist = hover and HOVER_ASSIST or ROCKET_AIM_ASSIST
	if not aimed then
		off, clear = NoseOff(ent, target)
		if not clear then return 0 end
		if hover then
			local l = ent:WorldToLocal(target:WorldSpaceCenter())
			local yaw = math.deg(math.atan2(l.y, l.x))
			local down = math.deg(math.atan2(-l.z, math.max(l.x, 1)))
			if l.x <= 0 or math.abs(yaw) > 8 or down < -5 or down > 40 then return 0 end
		elseif off > (kind == "vehicle" and ROCKET_AIM_ASSIST or 6) then
			return 0
		end
	end
	entry.pilotNose = (entry.pilotNose or 0) + 1

	local weapons = WeaponsOf(entry)
	if not weapons then
		-- Остальные (OH-6): обычное «нажать огонь»
		if isfunction(ent.HandleWeapons) then ent:HandleWeapons(true) end
		return 0
	end
	local list = {}
	for _, w in pairs(PilotWeapons(entry, ent, kind)) do
		if off <= 6 or w == weapons.rockets then list[#list + 1] = w end
	end
	entry.pilotDebug = string.format("pilot %s: tries %d, nose on %d, weapons %d", kind, entry.pilotTries, entry.pilotNose, #list)
	if #list == 0 then return 0 end

	local shooter = IsValid(entry.crew[1]) and entry.crew[1] or ent
	local tab = ent:GetTable()
	local ownAI, ownDriver = rawget(tab, "GetAI"), rawget(tab, "GetDriver")
	tab.GetAI = function() return false end
	tab.GetDriver = function() return shooter end
	local created = {}
	hook.Add("OnEntityCreated", "PR_PatrolPilotFire", function(e) created[#created + 1] = e end)
	-- (хозяина пуль у пака Гордона подставляет обёртка его оружия — см. SetupAI)
	-- У самолёта наведение своё, с упреждением (aimed) — его пули не трогаем
	if not aimed then PilotAssist = {to = TargetPoint(target), max = BULLET_AIM_ASSIST} end
	-- Каждое оружие отдельно: у некоторых аддонов оно падает всегда (у MD-500 и SA-316 Гордона
	-- PrimaryAttack — ipairs(nil)) — такое выключаем, а не сыплем ошибками каждый тик
	for _, w in ipairs(list) do
		local ok, err = pcall(w.fire, ent)
		if not ok then
			local slot = w == weapons.gun and "gun" or "rockets"
			entry.brokenWeapons = entry.brokenWeapons or {}
			entry.brokenWeapons[slot] = true
			PR_Patrol.Log(string.format("%s: оружие %s падает с ошибкой — больше не стреляем им: %s", VehicleLabel(entry), slot, tostring(err)))
		end
	end
	hook.Remove("OnEntityCreated", "PR_PatrolPilotFire")
	tab.GetAI, tab.GetDriver = ownAI, ownDriver
	PilotAssist = nil

	-- Ракеты Гредвича не сталкиваются только с корпусом и стартуют с места, а вертолёт на заходе
	-- летит быстрее: он догонял свои ракеты, и они рвались на нём. Даём им скорость вертолёта
	-- и не даём задеть ни одну его часть. Взрыв ракета записывает на поле Owner (не SetOwner),
	-- а без него — на себя: убийства не засчитывались, и правило «свои своих не бьют» её не узнавало
	if #created == 0 then return 0 end
	local parts = AirTraceFilter(ent)
	parts = istable(parts) and parts or {ent}
	local vel = ent:GetVelocity()
	local rockets = 0
	for _, rocket in ipairs(created) do
		-- Только сами ракеты (у снарядов Гредвича есть Launch), не служебные сущности запрета столкновений
		if IsValid(rocket) and isfunction(rocket.Launch) then
			rockets = rockets + 1
			GiveRocketOwner(rocket, shooter)
			-- Управляемые (9М114, 9М17 у Ми-24/28/8 GD): аддон через 0,75 с наводит их на то, что было
			-- по носу в момент пуска (у нас — чаще земля рядом) — перенаводим на саму цель
			-- Префайр по точке: цель ракеты — мир, смещение — сама точка
			local point = target.PR_Point
			local body = not point and AimBody(target)
			timer.Simple(0.85, function()
				if not (IsValid(rocket) and rocket.JDAM) then return end
				if point then
					rocket.target, rocket.targetOffset = game.GetWorld(), point
				elseif IsValid(body) then
					rocket.target = body
					rocket.targetOffset = body:WorldToLocal(body:WorldSpaceCenter())
				end
			end)
			-- Доводка на цель (у самолёта наведение своё, с упреждением — его не трогаем)
			if not aimed then
				local want = (TargetPoint(target) - rocket:GetPos()):GetNormalized()
				local rphys = rocket:GetPhysicsObject()
				if rocket:GetForward():Dot(want) > math.cos(math.rad(assist + 3)) then
					rocket:SetAngles(want:Angle())
					if IsValid(rphys) then rphys:SetVelocity(want * rphys:GetVelocity():Length()) end
				end
			end
			for _, part in ipairs(parts) do
				if IsValid(part) and part ~= rocket then constraint.NoCollide(rocket, part, 0, 0) end
			end
			local phys = rocket:GetPhysicsObject()
			if IsValid(phys) then phys:AddVelocity(vel) end
		end
	end
	entry.salvo = (entry.salvo or 0) + rockets
	entry.rocketsFired = (entry.rocketsFired or 0) + rockets
	return rockets
end

-- Префайр лётчика вертолёта: видим ли врага (раз в 0,25 с), а если он только что скрылся и
-- есть ракеты — висим, доворачиваем нос на место, где его видели, и пускаем ракеты туда.
-- true — вертолёт занят префайром (RunAI держит его на месте)
local function HeliPrefire(entry, ent, target)
	local now = CurTime()
	if now >= (entry.seenCheckAt or 0) then
		entry.seenCheckAt = now + 0.25
		local seen = VisiblePoint(ent:WorldSpaceCenter(), target, ent)
		if seen then
			entry.pilotSeenAt, entry.pilotSeenPos, entry.pilotSeenTarget = now, seen, target
			entry.prefireLeft, entry.prefireHidden = PREFIRE_ROCKETS, false
		else
			entry.prefireHidden = true
		end
	end
	if not (entry.prefireHidden and entry.pilotSeenTarget == target and entry.pilotSeenAt) then return false end
	if now - entry.pilotSeenAt > PREFIRE_AIR_TIME or (entry.prefireLeft or 0) <= 0 then return false end
	local weapons = WeaponsOf(entry)
	local rockets = weapons and weapons.rockets
	if not (rockets and not (entry.brokenWeapons or {}).rockets and rockets.ammo(ent)) then return false end

	if entry.airMode ~= "prefire" then
		entry.prefireHold = ent:GetPos()
		PR_Patrol.LogEvery(entry, "prefire", 10, string.format("%s: цель скрылась у %s — префайр ракетами", VehicleLabel(entry), PosText(entry.pilotSeenPos)))
	end
	entry.airMode = "prefire"
	entry.prefirePoint = entry.prefirePoint and entry.prefirePoint.PR_Point == entry.pilotSeenPos and entry.prefirePoint
		or PointTarget(entry.pilotSeenPos)
	entry.faceTarget = entry.prefirePoint
	local fired = FirePilot(ent, entry, entry.prefirePoint, "prefire", false, true)
	if fired > 0 then
		entry.prefireLeft = entry.prefireLeft - fired
		entry.prefireShots = (entry.prefireShots or 0) + fired
	end
	return true
end

local function HasPilotAmmo(ent, entry)
	local weapons = WeaponsOf(entry)
	return weapons ~= nil and ((weapons.gun and weapons.gun.ammo(ent)) or (weapons.rockets and weapons.rockets.ammo(ent))) and true or false
end

-- Вертолёт со стрелком: стрелок работает с места сбоку от цели, а время от времени, пока есть
-- ракеты или пушки, — заход на цель носом (как у OH-6) с огнём пилота, проскок, отход и назад
-- на место: по технике раз в 4–7 с (ракеты — главное против неё), по пехоте раз в 18–26 с (заход
-- занимает до 25 с, и при 8–14 стрелок паков GD почти всё время был не на месте). true — сейчас заход
local function PilotRun(entry, ent)
	local now = CurTime()
	if entry.runActive then
		local breaking = entry.breakUntil and now < entry.breakUntil
		if breaking then entry.runBroke = true end
		if (entry.runBroke and not breaking) or now - entry.runStarted > 25 then
			entry.runActive, entry.runBroke = false, false
			-- По технике заходы чаще: ракеты — его главное оружие против неё
			entry.nextRun = now + (entry.targetKind == "vehicle" and math.Rand(4, 7) or math.Rand(18, 26))
			return false
		end
		return true
	end

	entry.nextRun = entry.nextRun or now + (entry.targetKind == "vehicle" and 3 or 10)
	if now < entry.nextRun or not HasPilotAmmo(ent, entry) then return false end
	entry.salvo, entry.salvoCap = 0, SALVO
	entry.runActive, entry.runBroke, entry.runStarted, entry.breakUntil = true, false, now, nil
	entry.runs = (entry.runs or 0) + 1
	return true
end

-- Куда вертолёту смотреть носом: на врага (заход, работа стрелка), иначе — куда летит (отход
-- после захода, сопровождение). ИИ LFS строит нужное положение из углов и переводит его в оси
-- вертолёта; при развороте больше чем на ~150° этот перевод ломается и даёт бешеные тангаж и
-- крен (вертолёт ложился до 70°). Поэтому точка, куда смотреть, всегда не дальше 40° от
-- нынешнего курса: разворачивается он так же до конца, только без скачка
local AIR_FACE_STEP = 40

local function UpdateFacing(entry, ent, point)
	local pos = ent:GetPos()
	local cur = ent:GetAngles().y
	local want = cur
	local look = IsValid(entry.faceTarget) and entry.faceTarget:GetPos() or point
	if look then
		local flat = Vector(look.x - pos.x, look.y - pos.y, 0)
		if flat:LengthSqr() > 100 * 100 then want = flat:Angle().y end
		-- Кружит с бортовыми пулемётами: цель — сбоку (Ми-8: слева), нос — по кругу
		if entry.airMode == "circle" and IsValid(entry.faceTarget) then
			want = want - (GUNNER_SIDE[entry.class] or 0)
		end
	end

	local yaw = cur + math.Clamp(math.AngleDifference(want, cur), -AIR_FACE_STEP, AIR_FACE_STEP)
	entry.facePos = pos + Angle(0, yaw, 0):Forward() * 2000
	entry.facer = entry.facer or {
		IsValid = function() return true end,
		GetPos = function() return entry.facePos end
	}
end

----------------------------------------------------------------------------------------------------
-- Самолёты (LFS). Их ИИ ждёт от RunAI не точку (как у вертолётов), а направление полёта — углы,
-- и по ним рулит. Свой ИИ LFS атакует только с высоты не меньше 600 + 2·скорость (на 1600 —
-- 3800 над землёй), а небо на rp_desert_conflict ~6000 — он лишь набирал высоту и улетал. Поэтому
-- водим сами: сопровождение — широкий круг над патрулём, по врагу — заходы: подлёт выше цели →
-- пике носом на цель с огнём пушкой → выход → отход → снова подлёт.
-- Цель за спиной LFS берёт петлёй (самолёт переворачивался вверх брюхом и бился): курс даём не
-- дальше 45° от нынешнего — разворот выходит виражом; набор и снижение — не круче 25°
----------------------------------------------------------------------------------------------------
local PLANE_ORBIT = 6000         -- круг над патрулём
local PLANE_ALTITUDE = 3000      -- выше патруля

local function PlaneHeading(ent)
	local vel = ent:GetVelocity()
	return vel:LengthSqr() > 100 * 100 and vel:Angle().y or ent:GetAngles().y
end

-- Углы для ИИ LFS: курс wantYaw не дальше 45° от нынешнего, тангаж (плюс — нос вниз).
-- На крутую команду курса LFS кренит самолёт почти на бок и перестаёт выравнивать крылья — без
-- подъёмной силы вираж шёл спиралью к земле. Поэтому в вираже нос задираем: на треть угла поворота
local function PlaneSteer(ent, wantYaw, pitch)
	local cur = PlaneHeading(ent)
	local diff = math.AngleDifference(wantYaw, cur)
	-- Цель почти за спиной: знак разницы скачет (179° ↔ −179°), вираж то влево, то вправо — и самолёт
	-- летел прямо, пока не врезался в край карты. Сторону разворота держим, пока не довернёт
	if math.abs(diff) > 120 then
		ent.prTurnSign = ent.prTurnSign or (diff >= 0 and 1 or -1)
		diff = ent.prTurnSign * math.abs(diff)
	else
		ent.prTurnSign = nil
	end
	diff = math.Clamp(diff, -45, 45)
	return Angle(pitch - math.abs(diff) / 3, cur + diff, 0)
end

-- Тангаж, чтобы выйти на высоту z: 1500 выше — пикировать на 25°, ниже — набирать
local function AltitudePitch(pos, z)
	return math.Clamp((pos.z - z) / 60, -25, 25)
end

-- Земля или препятствие по ходу за sec секунд, или ниже low над землёй; второе — что именно (для
-- журнала). В пике нос смотрит в землю у самой цели: её (ignoreNear) не считаем, выход из пике
-- там задаёт высота над целью
local function PlaneDanger(ent, sec, low, ignoreNear)
	local pos, vel = ent:GetPos(), ent:GetVelocity()
	local filter = AirTraceFilter(ent)
	sec = sec or 3
	local ahead = util.TraceLine({start = pos, endpos = pos + vel * sec, filter = filter, mask = MASK_SOLID_BRUSHONLY})
	if ahead.Hit and not ahead.HitSky and not (ignoreNear and Vector(ahead.HitPos.x - ignoreNear.x, ahead.HitPos.y - ignoreNear.y, 0):Length() < 900) then
		return true, string.format("впереди через %.1f с, на %d %s", ahead.Fraction * sec, math.abs(ahead.HitPos.z - pos.z), ahead.HitPos.z > pos.z and "выше" or "ниже")
	end
	local below = util.TraceLine({start = pos, endpos = pos - Vector(0, 0, low or 800), filter = filter, mask = MASK_SOLID_BRUSHONLY})
	if below.Hit then return true, string.format("земля в %d под брюхом", pos.z - below.HitPos.z) end
	return false
end

-- Самая высокая земля или крыша под самолётом и по ходу на 6 с вперёд: держаться выше неё, а не
-- только выше цели — патрули стоят в низинах, и на подлёте самолёт то и дело упирался в холмы
local function TerrainAhead(ent, ceil)
	local pos, vel = ent:GetPos(), ent:GetVelocity()
	local flat = Vector(vel.x, vel.y, 0)
	local top = -math.huge
	for t = 0, 6, 1.5 do
		local p = pos + flat * t
		top = math.max(top, TopAt(p.x, p.y, ceil, pos.z - 8000))
	end
	return top
end

local function PlaneThrottle(ent, k)
	if isfunction(ent.GetMaxRPM) then ent.TargetRPM = ent:GetMaxRPM() * k end
	if isfunction(ent.RaiseLandingGear) then ent:RaiseLandingGear() end
end

-- Центр круга так, чтобы круг не выходил за карту (границы — из config/minimap.lua)
local function OrbitCenter(center)
	local cfg = PR_MINIMAPS and PR_MINIMAPS[string.lower(game.GetMap())]
	if not cfg then return center end
	local m = PLANE_ORBIT + 1500
	return Vector(math.Clamp(center.x, cfg.minX + m, cfg.maxX - m), math.Clamp(center.y, cfg.minY + m, cfg.maxY - m), center.z)
end

-- Без врагов: круг над патрулём (против часовой, точка на 30° впереди по кругу)
local function PlaneEscort(patrol, entry, ent)
	local pos = ent:GetPos()
	local center = PR_Patrol.Center(patrol) or pos
	local orbit = OrbitCenter(center)
	local ceil = CeilingAt(pos)
	local z = math.min(math.max(center.z + PLANE_ALTITUDE, TerrainAhead(ent, ceil) + 1500), ceil - 500)
	PlaneThrottle(ent, 0.8)

	if PlaneDanger(ent) then
		entry.airMode = "escort pull up"
		return PlaneSteer(ent, PlaneHeading(ent), -25)
	end
	local a = math.atan2(pos.y - orbit.y, pos.x - orbit.x) + math.rad(30)
	local point = Vector(orbit.x + math.cos(a) * PLANE_ORBIT, orbit.y + math.sin(a) * PLANE_ORBIT, 0)
	return PlaneSteer(ent, (point - pos):Angle().y, AltitudePitch(pos, z))
end

-- С какой стороны заходить: откуда цель видно на всём пике — с точки входа (far), с середины и с
-- 2500, под углом пике angle. baseYaw — направление от цели, offsets — какие отклонения от него
-- пробовать по порядку (сторона случайная); никуда не видно — первое из них
local PLANE_SIDES_FIRST = {0, 30, -30, 60, -60, 100, -100, 140, -140, 180}
local PLANE_SIDES_NEXT = {60, -60, 100, -100, 30, -30, 140, -140, 0, 180}

local function PlaneRunYaw(ent, target, tpos, baseYaw, offsets, angle, far)
	local filter = function(e) return e ~= target and not PartOf(e, ent) end
	local sign = math.random(0, 1) * 2 - 1
	local slope = math.tan(math.rad(angle or 25))
	far = far or 5000
	for _, off in ipairs(offsets) do
		local yaw = baseYaw + off * sign
		local dir = Angle(0, yaw, 0):Forward()
		local clear = true
		for _, d in ipairs({far, far * 0.65, 2500}) do
			local from = tpos + dir * d + Vector(0, 0, d * slope)
			if util.TraceLine({start = from, endpos = tpos, filter = filter, mask = MASK_SOLID_BRUSHONLY}).Hit then clear = false break end
		end
		if clear then return yaw, true end
	end
	return baseYaw + offsets[1] * sign, false
end

-- Заход по наземной цели. Пехота — пушкой, полого (20°); техника — круче (25°), залп ракет и
-- пушка, с упреждением на её скорость. Заход через точку входа: сначала выйти туда, откуда цель
-- видна под нужным углом на нужной высоте, развернуться на неё и только потом пике. Раньше
-- самолёт шёл прямо на цель слишком высоко, к развороту она оказывалась круче 35° под ним, и он
-- раз за разом уходил на новый круг (у игрока — 20 уходов на 6 пике за 3 минуты)
local PLANE_RUNS = {
	infantry = {angle = 20, height = 1700, rockets = 0},
	vehicle = {angle = 25, height = 2100, rockets = 6},
}
local ROCKET_SPEED = 5000 -- примерно, для упреждения (у Hydra разгон ~700 за тик, сопротивление воздуха)

local function PlaneAttack(entry, ent, target, kind)
	local run = PLANE_RUNS[kind] or PLANE_RUNS.infantry
	local now = CurTime()
	local pos = ent:GetPos()
	local body = AimBody(target)
	local tpos = PR_Patrol.AimPoint(target)
	local ceil = CeilingAt(pos)
	local flat = Vector(tpos.x - pos.x, tpos.y - pos.y, 0)
	local dist = flat:Length()
	local toTarget = flat:Angle().y
	local below = math.deg(math.atan2(pos.z - tpos.z, math.max(dist, 1)))

	-- Высота захода над целью: по профилю, но не ниже 1000 над рельефом по ходу и под небом
	local h = math.max(run.height, TerrainAhead(ent, ceil) + 1000 - tpos.z)
	h = math.Clamp(h, 1200, math.max(ceil - 500 - tpos.z, 1200))
	-- Точка входа не дальше 6000: если рельеф заставляет идти выше, пике круче (до 35°), а не длиннее —
	-- с 9–11 км самолёт к цели не доворачивал
	local ipDist = math.min(h / math.tan(math.rad(run.angle)), 6000)
	local angle = math.min(math.deg(math.atan2(h, ipDist)), 35)

	-- Сторона захода; первый раз — со стороны самолёта, потом каждый раз другая
	if not entry.planeRunYaw then
		entry.planeRunYaw = PlaneRunYaw(ent, target, tpos, (pos - tpos):Angle().y, PLANE_SIDES_FIRST, run.angle, ipDist)
	end
	local runDir = Angle(0, entry.planeRunYaw, 0):Forward()
	local ip = tpos + runDir * ipDist
	ip.z = tpos.z + h
	-- Разворот на цель — за 2500 до точки входа: к ней самолёт обычно летит от цели, и если
	-- разворачиваться у самой точки, за разворот он подходит слишком близко (цель уже круче 30°)
	local outer = ip + runDir * 2500
	local toOuter = Vector(outer.x - pos.x, outer.y - pos.y, 0)

	local was = entry.planeMode or "approach"
	local mode = was
	local danger, why
	if mode == "dive" then danger, why = PlaneDanger(ent, 2, 700, tpos) else danger, why = PlaneDanger(ent) end
	if danger and mode ~= "pull up" then
		entry.planeAfter = mode == "dive" and "approach" or mode
		mode, entry.planeUntil = "pull up", now + 2.5
	elseif danger and mode == "pull up" then
		entry.planeUntil = math.max(entry.planeUntil or 0, now + 1)
	end
	if mode == "pull up" and now > (entry.planeUntil or 0) then mode = entry.planeAfter or "approach" end

	local headingOff = math.abs(math.AngleDifference(toTarget, PlaneHeading(ent)))
	if mode == "approach" then
		-- Дальше точки разворота — разворот на цель; уже летит на цель издалека — тоже: дальше
		-- по прямой, пока цель не окажется под нужным углом
		if toOuter:Length() < 1500 or (headingOff < 20 and dist > ipDist * 0.9 and below <= angle + 2) then
			mode, entry.planeTurnSince = "turn in", now
		end
	end
	if mode == "turn in" then
		if headingOff < 20 and below >= angle - 4 and below <= 40 and dist > 2500 then
			mode = "dive"
		elseif below > 40 or dist < ipDist * 0.45 or now - (entry.planeTurnSince or now) > 15 then
			-- Проскочил или слишком круто — новый заход с другой стороны
			mode = "approach"
			entry.planeRunYaw = PlaneRunYaw(ent, target, tpos, (pos - tpos):Angle().y, PLANE_SIDES_NEXT, angle, ipDist)
		end
	end
	-- Пике до 1100 над целью (в крутом — раньше: на 50 за каждый градус круче 25°) или 2000 до неё
	local diveFloor = 1100 + math.max(0, math.NormalizeAngle(ent:GetVelocity():Angle().p) - 25) * 50
	if mode == "dive" and (pos.z - tpos.z < diveFloor or pos:Distance(tpos) < 2000) then
		mode, entry.planeUntil, entry.planeAfter = "pull up", now + 3, "approach"
	end
	-- Вышел из пике — следующий заход с другой стороны
	if mode == "pull up" and was == "dive" then
		entry.planeRunYaw = PlaneRunYaw(ent, target, tpos, (pos - tpos):Angle().y, PLANE_SIDES_NEXT, angle, ipDist)
	end
	if mode == "dive" and was ~= "dive" then entry.salvo, entry.salvoCap = 0, run.rockets end

	entry.planeMode = mode
	entry.airMode = "plane " .. mode
	if mode ~= was then
		local aimed = was == "dive" and entry.planeBestAim and string.format(", нос до цели не ближе %.1f°%s%s", entry.planeBestAim,
			entry.planeFired and ", стрелял" or entry.planeNoFire and ", " .. entry.planeNoFire or "",
			(entry.salvo or 0) > 0 and ", ракет " .. entry.salvo or "") or ""
		PR_Patrol.Log(string.format("%s: заход по %s %s → %s (до цели %d, выше цели %d, скорость %d%s%s)", VehicleLabel(entry),
			kind == "vehicle" and "технике" or "пехоте", was, mode, pos:Distance(tpos), pos.z - tpos.z, ent:GetVelocity():Length(),
			danger and ", " .. why or "", aimed))
		entry.planeBestAim, entry.planeFired, entry.planeNoFire = nil, nil, nil
	end

	if mode == "pull up" then
		PlaneThrottle(ent, 1)
		return PlaneSteer(ent, PlaneHeading(ent), -35)
	elseif mode == "dive" then
		PlaneThrottle(ent, 0.5)
		local muzzle = ent:WorldSpaceCenter()
		-- Упреждение на скорость цели (по технике — под ракеты)
		local aimPos = tpos
		if kind == "vehicle" then aimPos = tpos + body:GetVelocity() * (muzzle:Distance(tpos) / ROCKET_SPEED) end
		local aim = (aimPos - muzzle):Angle()
		local off = math.deg(math.acos(math.Clamp(ent:GetForward():Dot(aim:Forward()), -1, 1)))
		if not entry.planeBestAim or off < entry.planeBestAim then entry.planeBestAim = off end
		local range = pos:Distance(tpos)
		if off <= 5 and range < 6000 then
			local los = util.TraceLine({start = muzzle, endpos = tpos, filter = function(e) return e ~= target and not PartOf(e, ent) and not PartOf(e, body) end, mask = MASK_SOLID_BRUSHONLY})
			if los.Hit then
				entry.planeNoFire = string.format("цель закрыта (%s в %d от цели)", los.HitSky and "небо" or "стена/земля", los.HitPos:Distance(tpos))
			else
				-- Ракеты — только точно (≤ 2.5°) и с 2000–5500; пушка — с 5°
				local useRockets = kind == "vehicle" and off <= 2.5 and range > 2000 and range < 5500
				local before = ent.NextPrimary
				FirePilot(ent, entry, target, useRockets and "vehicle" or "infantry", true)
				if ent.NextPrimary ~= before or (entry.salvo or 0) > 0 then entry.planeFired = true end
			end
		end
		-- Не круче 40°: из более крутого самолёт не успевал выйти
		return PlaneSteer(ent, aim.y, math.Clamp(math.NormalizeAngle(aim.p), 0, 40))
	elseif mode == "turn in" then
		PlaneThrottle(ent, 0.8)
		return PlaneSteer(ent, toTarget, math.min(AltitudePitch(pos, ip.z), 15))
	end
	-- К точке разворота снижаемся не круче 15°: круче — земля по ходу, и уход вверх
	PlaneThrottle(ent, 1)
	return PlaneSteer(ent, toOuter:Angle().y, math.min(AltitudePitch(pos, ip.z), 15))
end

----------------------------------------------------------------------------------------------------
-- Воздушный бой: враг в воздухе (игрок в самолёте или вертолёте). Заходы с пике по земле тут не
-- годятся — цель двигается и бывает выше: нос промахивался на 5–22°, и штурмовики почти не
-- стреляли. Гонимся за упреждённой точкой (где цель будет, когда долетит снаряд), огонь — когда
-- нос на ней; совсем близко — отворот, чтобы не столкнуться; земля по ходу — вверх
----------------------------------------------------------------------------------------------------
local PLANE_BREAK_DIST = 700 -- ближе — отворот

local function PlaneDogfight(entry, ent, target)
	local now = CurTime()
	local pos = ent:GetPos()
	local body = AimBody(target)
	local tpos = body:WorldSpaceCenter()
	local tvel = body:GetVelocity()
	local ceil = CeilingAt(pos)
	local muzzle = ent:WorldSpaceCenter()

	-- Упреждение под пушку (снаряд 30 мм Гредвича — 830 за тик)
	local speed = ((istable(gred) and gred.CalTable and gred.CalTable.wac_base_30mm and gred.CalTable.wac_base_30mm.Speed) or 830) / engine.TickInterval()
	local lead = tpos
	for _ = 1, 2 do lead = tpos + tvel * (muzzle:Distance(lead) / speed) end
	local toLead = (lead - muzzle):Angle()
	local dist = pos:Distance(tpos)

	-- Сближение: на встречных курсах ~3000 в секунду — отворот за 700 опаздывал, самолёт таранил цель.
	-- Отворот, когда до столкновения меньше 1,6 с (но не дальше 2500 — на встречных успеть выстрелить);
	-- с 1 с самолёт не успевал отвернуть от почти неподвижной цели (зависший вертолёт) и таранил
	local closing = (ent:GetVelocity() - tvel):Dot((tpos - pos):GetNormalized())
	local tooClose = dist < PLANE_BREAK_DIST or (closing > 0 and dist < math.min(closing * 1.6, 2500))

	local was = entry.planeMode
	-- Отворот держим 2 с и дальше, пока цель ближе 1500 или мы ещё сближаемся (до 5 с): после
	-- ровно 2 с самолёт бывал в 700 от цели, снова брал её на нос и таранил
	local breaking = was == "break" and (now < (entry.planeUntil or 0)
		or (now < (entry.planeUntil or 0) + 3 and (dist < 1500 or (closing > 0 and dist < closing * 1.5))))
	local mode = breaking and "break" or "dogfight"
	if mode == "dogfight" and tooClose then
		-- Отворот вбок — в сторону, куда цель НЕ движется, и по высоте — от неё (выше нас — уходим
		-- вниз, ниже — вверх). Со случайной стороной самолёт поворачивал ей наперерез и таранил
		local r = tpos - pos
		local side = Vector(-r.y, r.x, 0):GetNormalized()
		if (tvel - ent:GetVelocity()):Dot(side) > 0 then side = -side end
		mode, entry.planeUntil = "break", now + 2
		entry.planeBreakYaw = side:Angle().y
		entry.planeBreakPitch = tpos.z > pos.z and 15 or -20
	end
	entry.planeMode = mode
	entry.airMode = "plane " .. mode
	if mode ~= was then
		local name = IsValid(target) and target:IsPlayer() and target:Nick() or tostring(target)
		PR_Patrol.Log(string.format("%s: %s (цель %s, до неё %d, выше неё %d, скорость %d%s)", VehicleLabel(entry),
			mode == "break" and "воздушный бой — отворот, чтобы не столкнуться" or "воздушный бой", name, dist, pos.z - tpos.z,
			ent:GetVelocity():Length(), was == "dogfight" and (entry.planeFired and ", стрелял" or ", не стрелял") or ""))
		entry.planeFired = nil
	end

	-- Земля или препятствие по ходу — сначала вверх
	if PlaneDanger(ent, 2.5, 600) then
		PlaneThrottle(ent, 1)
		return PlaneSteer(ent, PlaneHeading(ent), -35)
	end
	if mode == "break" then
		PlaneThrottle(ent, 1)
		return PlaneSteer(ent, entry.planeBreakYaw, entry.planeBreakPitch or -15)
	end

	-- Огонь: нос на упреждённой точке (≤ 4°), ближе 7000 и её видно
	local off = math.deg(math.acos(math.Clamp(ent:GetForward():Dot(toLead:Forward()), -1, 1)))
	if off <= 4 and dist < 7000 and not util.TraceLine({start = muzzle, endpos = lead, mask = MASK_SOLID_BRUSHONLY}).Hit then
		FirePilot(ent, entry, target, "air", true)
		entry.planeFired = true
	end

	-- Догнали и цель впереди — сбросить газ, чтобы не проскочить; под небо не лезть
	local ahead = ent:GetForward():Dot((tpos - pos):GetNormalized()) > 0.7
	PlaneThrottle(ent, (ahead and dist < 2500) and 0.7 or 1)
	local pitch = math.Clamp(math.NormalizeAngle(toLead.p), -35, 35)
	if pos.z > ceil - 700 then pitch = math.max(pitch, 0) end
	return PlaneSteer(ent, toLead.y, pitch)
end

-- LFS/LVS: свой ИИ летает, мы подменяем ему цели и точку, пока врагов нет
local function SetupAI(patrol, entry)
	local ent = entry.ent
	entry.phase = math.Rand(0, math.pi * 2)
	entry.heli = InheritsFrom(entry.class, "lunasflightschool_basescript_heli") or InheritsFrom(entry.class, "lvs_base_helicopter")

	-- По умолчанию LVS не трогает игроков (их ИИ-команда 0), поэтому «кто враг» решаем сами.
	-- Вертолёту ИИ LFS только разворачивает нос на эту «цель», поэтому ему отдаём точку, куда
	-- смотреть (UpdateFacing)
	ent.AIGetTarget = function(self)
		if entry.heli then return entry.facer end
		return PR_Patrol.VehicleTarget(entry, self:WorldSpaceCenter(), VEHICLE_RANGE * 1.5)
	end

	local baseRunAI = ent.RunAI
	if isfunction(baseRunAI) then
		ent.RunAI = function(self, ...)
			-- Сбитый самолёт падает сам: не рулим и не пишем в журнал заходы обломков
			if not entry.heli and isfunction(self.IsDestroyed) and self:IsDestroyed() then return self:GetAngles() end

			local target = PR_Patrol.VehicleTarget(entry, self:WorldSpaceCenter(), VEHICLE_RANGE * 1.5)

			-- Самолёт по врагу — своими заходами (у ИИ LFS на этой карте не хватает высоты)
			if IsValid(target) and not entry.heli and entry.class and string.StartWith(entry.class, "lvs_") then return baseRunAI(self, ...) end
			if IsValid(target) and not entry.heli then
				-- Враг в воздухе — воздушный бой (уже в бою — пока цель хоть немного над землёй),
				-- на земле — заходы: по технике с ракетами, по пехоте пушкой
				local fighting = entry.planeMode == "dogfight" or entry.planeMode == "break"
				local kind = TargetKind(target, fighting and 250 or 500)
				if kind ~= entry.targetKind then entry.planeRunYaw = nil end
				entry.targetKind = kind
				if kind == "air" then return PlaneDogfight(entry, self, target) end
				if fighting then entry.planeMode = nil end
				return PlaneAttack(entry, self, target, kind)
			end

			-- Самолёт без врагов кружит над патрулём
			if not entry.heli then
				entry.breakUntil, entry.planeMode, entry.planeRunYaw, entry.targetKind = nil, nil, nil, nil
				entry.airMode = "escort"
				return PlaneEscort(patrol, entry, self)
			end

			-- Вертолёт: сначала — не врезаться
			if NeedsPullUp(entry, self) then
				entry.airMode = "pull up"
				if IsValid(target) then FirePilot(self, entry, target) end
				return LimitTilt(entry, self, PullUpPoint(self), nil, true)
			end

			if IsValid(target) then
				local kind = TargetKind(target, 500)
				if kind ~= entry.targetKind then entry.nextRun = nil end
				entry.targetKind = kind

				-- Враг в воздухе: не гонимся (самолёт быстрее, а погоня уводит в горы и за край карты).
				-- Держимся у патруля, нос — на цель: бьют стрелок и пилот, когда нос на ней
				-- Турель Ми-24 бьёт только вниз (0–60° под горизонт, ±30° вбок), поэтому держимся чуть выше
				-- цели (но не выше 3000 над патрулём и под небом)
				if kind == "air" then
					entry.runActive, entry.breakUntil = false, nil
					entry.airMode = "air defense"
					entry.faceTarget = target
					FirePilot(self, entry, target, "air")
					local point = EscortPoint(patrol, entry, self)
					local center = PR_Patrol.Center(patrol) or self:GetPos()
					local want = math.min(target:WorldSpaceCenter().z + 300, center.z + 3000, CeilingAt(point) - 300)
					if want > point.z then point = Vector(point.x, point.y, want) end
					return LimitTilt(entry, self, point)
				end

				-- Враг только что скрылся (в доме, за стеной) — ракеты туда, где его видели; висим на месте
				if HeliPrefire(entry, self, target) then
					entry.runActive = false
					return LimitTilt(entry, self, entry.prefireHold or self:GetPos())
				end
				entry.prefireHold = nil

				-- Вертолёт со стрелком держится сбоку, чтобы турель доставала; время от времени — заход
				-- (по технике — чаще и с ракетами)
				local gunner = isfunction(self.GetGunnerSeat) and IsValid(self:GetGunnerSeat()) and GunnerArmed(entry, self)
				local weapons = WeaponsOf(entry)
				-- По технике с ракетами — бить с места, а не заходами: на заходе у холмов и домов
				-- вертолёт то и дело уходил вверх и нос на цель не наводился (0 ракет за 9 заходов)
				local hoverRockets = kind == "vehicle" and weapons and weapons.rockets and weapons.rockets.ammo(self)
				if hoverRockets then
					entry.runActive = false
					if CurTime() > (entry.salvoResetAt or 0) then
						entry.salvo, entry.salvoCap, entry.salvoResetAt = 0, SALVO, CurTime() + 8
					end
					FirePilot(self, entry, target, "vehicle", false, true)
				end
				-- Бортовые пулемёты (Ми-8) — только круги, без заходов: заход срывал вертолёт с круга
				local circler = gunner and IsValid(entry.crew[1]) and GUNNER_SIDE[entry.class]
				if (gunner and IsValid(entry.crew[1]) or hoverRockets) and (hoverRockets or circler or not PilotRun(entry, self)) then
					-- Бортовые пулемёты — круги вокруг цели бортом к ней (UpdateFacing)
					local side = not hoverRockets and GUNNER_SIDE[entry.class]
					entry.airMode = hoverRockets and "rocket attack" or (side and "circle" or "stand off")
					entry.faceTarget = target
					local point = StandOffPoint(entry, target, self:GetPos(), hoverRockets and 1800 or 900,
						not hoverRockets and GUNNER_DOWN[entry.class] or nil, side and ORBIT_STEP or nil)
					-- Только что уходил от препятствия — пока не снижаемся
					if entry.holdAltUntil and CurTime() < entry.holdAltUntil and point.z < self:GetPos().z then
						point = Vector(point.x, point.y, self:GetPos().z)
					end
					-- Снижаемся к месту плавно: быстрый спуск «взглядом вперёд» (3 с полёта) упирался в землю —
					-- уход вверх и снова вниз (Ми-8 на круге — до 2000 над целью, Ми-24 — 450 ↔ 1000), и
					-- стволы цель то и дело не доставали
					point = Vector(point.x, point.y, math.max(point.z, self:GetPos().z - 120))
					return LimitTilt(entry, self, point)
				end

				-- Стрелять лётчику нечем (транспортный Ми-8, UH-60, кончились патроны и ракеты) — на врага
				-- не заходит, держится у патруля. OH-6 Гредвича своего описания оружия не имеет — он бьёт
				-- через HandleWeapons, его не трогаем
				if WeaponsOf(entry) and not HasPilotAmmo(self, entry) then
					entry.runActive, entry.faceTarget = false, nil
					entry.airMode = "escort"
					return LimitTilt(entry, self, EscortPoint(patrol, entry, self))
				end

				-- Заход курсовым оружием (вертолёт без стрелка — только так); чем бить — по виду цели
				if not entry.salvoCap then entry.salvo, entry.salvoCap = 0, SALVO end
				FirePilot(self, entry, target, kind)
				local point, diving = StrafePoint(entry, self, target)
				entry.airMode = diving and "dive" or "break off"
				entry.faceTarget = diving and target or nil
				return LimitTilt(entry, self, point, diving and 40 or nil)
			end
			entry.runActive = false
			entry.faceTarget = nil
			entry.airMode = "escort"
			entry.breakUntil = nil
			return LimitTilt(entry, self, EscortPoint(patrol, entry, self))
		end

		local decide = ent.RunAI
		ent.RunAI = function(self, ...)
			local point = decide(self, ...)
			if entry.heli then UpdateFacing(entry, self, point) end
			return point
		end
	end

	if isfunction(ent.SetAITEAM) then ent:SetAITEAM(2) end
	if isfunction(ent.SetAI) then ent:SetAI(true) end

	-- Подвес с курсовым оружием (а не пустой или бомбы, которыми ИИ бить не умеет)
	local weapons = PILOT_WEAPONS[entry.class]
	if weapons and weapons.loadouts and isfunction(ent.GetLoadout) and not table.HasValue(weapons.loadouts, ent:GetLoadout()) then
		ent:SetLoadout(weapons.loadouts[math.random(#weapons.loadouts)])
	end
	-- Пак Гордона пишет пули на лётчика: курсовое оружие — на глобальную Driver, которой нет (баг
	-- аддона), турель — на GetDriver, а у вертолёта с ИИ лётчика нет. Пули были ничьи: урон «от мира»,
	-- без счёта убийств и мимо «свои своих не бьют». Огонь жмёт и наш лётчик (FirePilot), и сам ИИ
	-- LFS, поэтому на время любого выстрела лётчик — стрелок (бот экипажа или сама машина)
	if string.StartWith(entry.class or "", "lfs_grdn_") and not ent.PR_GordonOwner then
		ent.PR_GordonOwner = true
		for _, name in ipairs({"PrimaryAttack", "SecondaryAttack", "TurretAttack"}) do
			local original = ent[name]
			if isfunction(original) then
				ent[name] = function(self, ...)
					-- Ка-50: 30-мм пушку лётчик-человек водит взглядом (OnTick ставит позы), а у ИИ
					-- лётчика нет — пушка стояла на 10–13° от носа и била мимо. Ставим позы сами, на цель,
					-- по формуле аддона
					if name == "TurretAttack" and entry.class == "lfs_grdn_ka50" and IsValid(entry.faceTarget) then
						local att = self:GetAttachment(1)
						if att then
							local t = self:WorldToLocalAngles((TargetPoint(entry.faceTarget) - att.Pos):Angle())
							self:SetPoseParameter("turret_yaw", math.Clamp(-math.NormalizeAngle(t.y), -5, 15))
							self:SetPoseParameter("turret_pitch", math.Clamp(math.NormalizeAngle(t.p) - 12, -24, 11))
						end
					end
					local shooter = IsValid(entry.crew[1]) and entry.crew[1] or self
					local tab = self:GetTable()
					local own, oldDriver = rawget(tab, "GetDriver"), rawget(_G, "Driver")
					tab.GetDriver = function() return shooter end
					rawset(_G, "Driver", shooter)
					-- Огонь ИИ LFS (нос на цели): пули доводим так же, как у нашего лётчика
					local assist = not PilotAssist and name ~= "SecondaryAttack" and IsValid(entry.faceTarget)
					if assist then PilotAssist = {to = TargetPoint(entry.faceTarget), max = BULLET_AIM_ASSIST} end
					local ok, err = pcall(original, self, ...)
					if assist then PilotAssist = nil end
					tab.GetDriver = own
					rawset(_G, "Driver", oldDriver)
					if not ok then error(err, 0) end
				end
			end
		end
	end
	-- Новые вертолёты LFS (не Гредвича): огонь лётчика — общим способом, подвес — рабочий
	-- ent.LFS сам LFS ставит только через секунду после появления (таймер «от Гредвича») — сейчас его
	-- ещё нет, поэтому смотрим на базовый класс. Без этого лётчики паков GD и Гордона не стреляли вовсе
	local lfs = ent.LFS or scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript")
	entry.genericWeapons = lfs and not PILOT_WEAPONS[entry.class] and not string.StartWith(entry.class or "", "gred_lfs_") or nil
	local lfsLoadouts = LFS_LOADOUTS[entry.class]
	if lfsLoadouts and isfunction(ent.SetLoadout) and not table.HasValue(lfsLoadouts, ent:GetLoadout()) then
		ent:SetLoadout(lfsLoadouts[math.random(#lfsLoadouts)])
	end
	-- Управляемые ракеты стрелка (Ми-24)
	if isfunction(ent.SetMissiles) then ent:SetMissiles(true) end

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
		-- Самолёт отпускаем уже на скорости: с нуля в воздухе он сваливается. Берём крейсерскую
		-- (у A-10 MaxPerfVelocity 2000, а «теоретический предел» 10000 — с половины его он вылетал рывком)
		if not entry.heli then
			local speed = math.Clamp((tonumber(ent.MaxPerfVelocity) or 1600) * 0.8, 800, 1800)
			phys:SetVelocity(ent:GetForward() * speed)
		end
	end
end

function PR_Patrol.SpawnVehicles(patrol, spot, infantry)
	patrol.vehicles = {}
	-- Занятые места на земле и отдельно — в небе: висящие над спотом вертолёты не должны
	-- «занимать» землю (из-за этого второй танк не находил места и не появлялся)
	local used, airUsed = {}, {}
	for _, p in ipairs(infantry or {}) do table.insert(used, p) end

	for _, def in ipairs(patrol.cfg.vehicles or {}) do
		for _ = 1, def.count or 1 do
			local class = Pick(def.class)
			local kind = PR_PatrolVehicleKind(class)
			local entry = {def = def, kind = kind, class = class, crew = {}, patrolName = patrol.cfg.name}

			if kind == "ground" and simfphys and isfunction(simfphys.SpawnVehicleSimple) then
				local pos, yaw = VehicleSpotNear(spot, used)
				if pos then
					table.insert(used, pos)
					local veh = simfphys.SpawnVehicleSimple(class, pos + Vector(0, 0, SimfphysSpawnHeight(class)), Angle(0, yaw, 0))
					if IsValid(veh) then entry.ent = veh end
				end
			elseif kind == "air" or kind == "aiground" then
				local pos, yaw
				if kind == "air" then
					-- Самолёт — подальше от вертолётов и носом туда, где пусто (по кругу вокруг патруля,
					-- а не наружу: снаружи у долины склоны)
					local heli = InheritsFrom(class, "lunasflightschool_basescript_heli") or InheritsFrom(class, "lvs_base_helicopter")
					local outward
					pos, outward = AirSpawnPos(spot.Pos, airUsed, heli and 300 or 1500)
					if pos then
						table.insert(airUsed, pos)
						yaw = heli and math.random(0, 359) or ClearHeading(pos + Vector(0, 0, 20), {outward + 90, outward - 90, outward + 180, outward})
					end
				else
					pos, yaw = VehicleSpotNear(spot, used)
					if pos then table.insert(used, pos) end
				end
				if pos then
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

			if not IsValid(entry.ent) then
				PR_Patrol.Log(string.format("патруль «%s»: не нашлось места для %s (%s) у спота #%s", patrol.cfg.name, class, kind, tostring(spot.Id)))
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
				PR_Patrol.Log("патруль «" .. patrol.cfg.name .. "»: не удалось выпустить технику " .. tostring(class)
					.. (kind and " (не нашлось места у спота #" .. tostring(spot.Id) .. ")" or " (не simfphys/LFS/LVS или аддон не установлен)"))
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
	-- simfphys: пока машина не собралась, здоровье ещё не выставлено — это не «подбита».
	-- destroyed — взрыв начался, но не дошёл до конца (см. sv_simfphys_compat.lua)
	if isfunction(ent.GetCurHealth) then
		if ent.destroyed then return true end
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

-- Чей это: NPC патруля, его машина (или её часть) или бот из экипажа
local function PatrolOf(ent)
	if not IsValid(ent) then return end
	if ent.PR_Patrol then return ent.PR_Patrol end
	local crew = ent:IsPlayer() and ent.PR_PatrolCrew
	if crew and IsValid(crew.ent) then return crew.ent.PR_Patrol end
	local entry = PatrolVehicleOf(ent)
	if entry and IsValid(entry.ent) then return entry.ent.PR_Patrol end
end

-- Свои своих не ранят: танк не давит свиту, охрана не сбивает свой вертолёт, когда он заходит
-- на того же врага, стрелок вертолёта не задевает своих. Урон машины самой себе (удар о землю)
-- не трогаем
-- Кто и чем бил: «Kolovila / gb_rocket_hydra», «мир»
local function DamageSource(dmg)
	local function Name(e)
		if e == game.GetWorld() then return "мир" end
		if not IsValid(e) then return "?" end
		if e:IsPlayer() then return e:Nick() end
		return e:GetClass()
	end
	local a, i = Name(dmg:GetAttacker()), Name(dmg:GetInflictor())
	if a == i or i == "?" then return a end
	return a .. " / " .. i
end

hook.Add("EntityTakeDamage", "PR_PatrolNoFriendlyCrush", function(victim, dmg)
	local patrol = PatrolOf(victim)
	if not patrol then return end

	local attacker, inflictor = dmg:GetAttacker(), dmg:GetInflictor()
	local blocked = false

	-- Экипаж — невидимые боты: удары и падения машины (урон от «мира» или от неё самой)
	-- их не убивают, иначе перевернувшийся танк взрывался из-за погибшего водителя.
	-- Подбить машину можно только по её прочности, а пуля игрока по экипажу проходит
	local crew = victim:IsPlayer() and victim.PR_PatrolCrew
	if crew and (not IsValid(attacker) or attacker:IsWorld() or PatrolVehicleOf(attacker) == crew) then
		blocked = true
	else
		local own = PatrolVehicleOf(victim)
		local selfDamage = own and (PatrolVehicleOf(attacker) == own or PatrolVehicleOf(inflictor) == own)
		if not selfDamage and (PatrolOf(attacker) == patrol or PatrolOf(inflictor) == patrol) then blocked = true end
	end

	-- По корпусу машины: кто сколько урона нанёс (для журнала), кто последним ранил — тому награда
	local entry = victim.PR_PatrolVehicle
	if entry then
		local key = (blocked and "свои, не прошло: " or "") .. DamageSource(dmg)
		entry.damageBy = entry.damageBy or {}
		entry.damageBy[key] = (entry.damageBy[key] or 0) + dmg:GetDamage()
		if not blocked then
			local ply = PR_KillerPlayer and PR_KillerPlayer(attacker)
			if ply and not ply:GetNWBool("PR_PatrolCrew") then entry.lastAttacker = ply end
		end
	end

	if blocked then return true end
end)

-- Самые большие источники урона по машине: «мир 1200, Kolovila / gb_rocket_hydra 900»
local function DamageSummary(v)
	local list = {}
	for key, amount in pairs(v.damageBy or {}) do table.insert(list, {key, amount}) end
	if #list == 0 then return "не было" end
	table.sort(list, function(a, b) return a[2] > b[2] end)
	local out = {}
	for i = 1, math.min(#list, 4) do table.insert(out, list[i][1] .. " " .. math.Round(list[i][2])) end
	return table.concat(out, ", ")
end

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
				local ent = v.ent
				local state = "?"
				if IsValid(ent) then
					local hp = isfunction(ent.GetHP) and ent:GetHP() or (isfunction(ent.GetCurHealth) and ent:GetCurHealth())
					local rotor = isfunction(ent.GetRotorDestroyed) and ent:GetRotorDestroyed() and ", винт сломан" or ""
					state = string.format("у %s, прочность %s%s", PosText(ent:GetPos()), tostring(hp and math.Round(hp)), rotor)
				end
				PR_Patrol.Log(string.format("%s %s %s; урон: %s; награда: %s", VehicleLabel(v),
					crewLost and "без экипажа — взорвана" or "уничтожена", state, DamageSummary(v),
					IsValid(v.lastAttacker) and v.lastAttacker:Nick() or "никому"))
				KickCrew(v)
				-- Взрыв simfphys оборвался на полпути: машина стоит «уничтоженной» и горит. Взрываем
				-- заново, а не вышло — просто убираем
				if IsValid(ent) and ent.destroyed then
					PR_Patrol.Log(VehicleLabel(v) .. ": взрыв не завершился — довзрываем")
					ent.destroyed = nil
					if isfunction(ent.ExplodeVehicle) then pcall(ent.ExplodeVehicle, ent) end
					if IsValid(ent) then ent:Remove() end
				end
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

-- Встать на месте: ручник, а на скорости больше 80 — ещё и тормоз (S; медленнее simfphys с
-- автоматом тормоз сам сбрасывает и ставит нейтраль). Раньше только ручник: M-ATV на 600 юзом
-- прокатывался мимо цели на 1500.
-- Силу ручника simfphys считает, когда в машину садится водитель, и только если машина к этому
-- времени готова (OnActiveChanged). Боты патруля садятся сразу после появления — раньше, и у машин
-- Луны (M-ATV, БТР-80, «Тигр») ручник оставался нулевым: встав на 2100, M-ATV катился на 70 ещё
-- 1200 к цели. У машин Гредвича сила своя (CachedHandBrakePower), их не трогаем
local function Halt(veh)
	if (veh.HandBrakePower or 0) <= 0 and not veh.CachedHandBrakePower and isfunction(veh.IsInitialized) and veh:IsInitialized()
		and isfunction(veh.GetMaxTraction) and isfunction(veh.GetTractionBias) then
		veh.HandBrakePower = veh:GetMaxTraction() + 20 - veh:GetTractionBias() * veh:GetMaxTraction()
	end
	SetKeys(veh, false, (veh.ForwardSpeed or 0) > 80, false, false, true)
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
					-- Стрелок не за пушкой (пулемёт на крыше) — угол от его ствола (прицел места)
					local aim = entry.aimAng
					local attName = entry.aimPoint and IsValid(vehicle) and pod ~= vehicle:GetDriverSeat() and pod:GetNWString("Attachment", "") or ""
					if attName ~= "" then
						local id = vehicle:LookupAttachment(attName)
						local att = id and id > 0 and vehicle:GetAttachment(id)
						if att then aim = (entry.aimPoint - att.Pos):Angle() end
					end
					-- simfphys считает ствол как машина:WorldToLocal(сиденье:WorldToLocal(взгляд))
					return original(self, AimProxy(ply, pod:LocalToWorldAngles(aim)), vehicle, pod, ...)
				end
				return original(self, ply, vehicle, pod, ...)
			end
		end
	end

	-- Отдача: пушка БТР-80 (и танков Луны) толкает корпус ApplyForceOffset на каждый выстрел. Машину
	-- патруля это за бой уносило назад на тысячи юнитов (БТР-80: 3400 за 30 с), и она стреляла на
	-- ходу мимо. У машин патруля скорость корпуса после выстрела возвращаем как была; у игроков —
	-- как задумал аддон
	for _, name in ipairs({"PrimaryAttack", "SecondaryAttack"}) do
		local original = func[name]
		if isfunction(original) then
			func[name] = function(self, vehicle, ...)
				local phys = IsValid(vehicle) and vehicle.PR_PatrolVehicle and vehicle:GetPhysicsObject()
				if not IsValid(phys) then return original(self, vehicle, ...) end
				local vel, angVel = phys:GetVelocity(), phys:GetAngleVelocity()
				local result = {original(self, vehicle, ...)}
				phys:SetVelocity(vel)
				phys:SetAngleVelocity(angVel)
				return unpack(result)
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
			-- Пулемёт командира стоит в стороне от пушки: угол — от его ствола. С углом от пушки он
			-- бил параллельно ей, на 1200 — в 3° мимо бойца (T-80У: 150 пуль, ни одного попадания)
			if entry.aimPoint and seat ~= vehicle:GetDriverSeat() then
				local weapon = istable(SeatTab.Primary) and SeatTab.Primary[1]
				local name = SeatTab.MuzzleAttachment or (istable(weapon) and istable(weapon.Muzzles) and weapon.Muzzles[1])
				local id = isstring(name) and vehicle:LookupAttachment(name)
				local att = id and id > 0 and vehicle:GetAttachment(id)
				if att then aim = (entry.aimPoint - att.Pos):Angle() end
			end
			-- Поправка на сдвиг ствола этого места (меряется по вылетевшим пулям, см. gred.CreateBullet)
			if ply.PR_BulletFix then aim = aim + ply.PR_BulletFix end
			local want
			if isfunction(custom) then
				-- У места своя функция прицела (пулемёты командира в новых паках: угол от башни, а не
				-- от корпуса) — зовём её с подставным стрелком, смотрящим на цель (взгляд в мере
				-- сиденья, как у самого Гредвича). Раньше её затирали, и такие пулемёты били мимо на
				-- угол поворота башни
				local hatch, poseTab = ...
				local ok, a = pcall(custom, vehicle, seat, SeatTab, AimProxy(ply, seat:LocalToWorldAngles(aim)), hatch, poseTab)
				want = ok and isangle(a) and a or vehicle:WorldToLocalAngles(aim)
			else
				want = vehicle:WorldToLocalAngles(aim)
			end
			SeatTab.CustomEyeAngles = function() return Angle(want.p, want.y, want.r) end
			local ok, result = pcall(getAngles, vehicle, seat, SeatTab, ply, ...)
			SeatTab.CustomEyeAngles = custom
			if not ok then error(result, 0) end

			-- result — где башня сейчас (Гредвич доворачивает со скоростью танка): стрелять, когда встала
			if isangle(result) then
				-- Гредвич сперва доворачивает башню, а ствол поднимает/опускает уже потом: стрелять,
				-- только когда сошлись и курс, и наклон (раньше смотрели лишь курс — стрелял мимо)
				local tol = entry.aimTolerance or 4
				local dy = math.AngleDifference(want.y + (SeatTab.TraverseOffset or 0), result.y)
				local dp = math.AngleDifference(want.p, result.p)
				-- У каждого места своё «встал на цель»: раньше общий признак перезаписывали и пушка, и
				-- пулемёт командира, и пулемёт жал огонь по пушке (у T-72Б3 не выстрелил ни разу)
				ply.PR_GredAligned = math.abs(dy) < tol and math.abs(dp) < tol
				if ply == entry.crew[1] then
					entry.gredAligned = ply.PR_GredAligned
					entry.gredDebug = string.format("dy=%.1f dp=%.1f tol=%.1f", dy, dp, tol)
				end
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
			-- Пулемёт/автопушка экипажа наземки: у части машин ствол смотрит со сдвигом от того, куда
			-- его повернули («Мардер»: на 0,7° ниже — очередь ложилась в землю перед целью, ни одного
			-- попадания). Когда место встало на угол, меряем, куда ушла пуля, и подправляем угол места
			local crew = IsValid(ply) and ply:IsPlayer() and ply.PR_PatrolCrew
			local body = crew and crew.kind == "ground" and IsValid(crew.ent) and crew.ent
			local steady = body and body:GetUp().z > 0.9 and body:GetVelocity():LengthSqr() < 60 * 60
			if steady and crew.aimPoint and ply.PR_GredAligned and isvector(pos) and isangle(ang) and pos:DistToSqr(crew.aimPoint) > 300 * 300 then
				local want = (crew.aimPoint - pos):Angle()
				local fix = ply.PR_BulletFix or Angle(0, 0, 0)
				ply.PR_BulletFix = Angle(
					math.Clamp(fix.p + math.AngleDifference(want.p, ang.p) * 0.2, -10, 10),
					math.Clamp(fix.y + math.AngleDifference(want.y, ang.y) * 0.2, -10, 10), 0)
			end
			if PilotAssist then ang = AssistBullet(pos, ang) end
			return createBullet(ply, pos, ang, cal, filter, ...)
		end
	end
end

-- Паки GD (Ми-24/28/8) и Гордона (Helicopter Pack #3) ставят турель стрелка (кости, позы) по
-- взгляду бота: вертолёт:WorldToLocal(сиденье:WorldToLocal(EyeAngles)) — в своих HandleWeapons и
-- OnTick. Взгляд бота в кресле от углов его команды почти не зависит (по замеру — смотрит туда же,
-- куда кресло), и турель стояла на упоре: стрелок бил мимо в 100% очередей. Поэтому на время этих
-- функций EyeAngles ботов экипажа этой машины отдаёт взгляд на цель. Подмена — в таблице Player:
-- GMod ищет метод игрока сначала там (потом Entity, потом таблица самой сущности)
local PLAYER_META = FindMetaTable("Player")
local ENTITY_META = FindMetaTable("Entity")

local function WithCrewEyes(entry, fn, ...)
	local own = rawget(PLAYER_META, "EyeAngles")
	local base = own or ENTITY_META.EyeAngles
	PLAYER_META.EyeAngles = function(ply)
		if ply.PR_PatrolCrew == entry and entry.aimAng then
			local seat = ply:GetVehicle()
			if IsValid(seat) then return seat:LocalToWorldAngles(entry.aimAng) end
		end
		return base(ply)
	end
	local result = {pcall(fn, ...)}
	PLAYER_META.EyeAngles = own
	if not result[1] then error(result[2], 0) end
	return unpack(result, 2)
end

-- LFS/LVS со стрелком (Ми-24, AH-1G): турель стреляет в Alt*Attack по взгляду стрелка —
-- подменяем ему взгляд на этой конкретной машине
local function WrapLFSGunner(entry)
	local ent = entry.ent
	if ent.PR_GunnerWrapped then return end
	ent.PR_GunnerWrapped = true
	-- Не Гредвич: турель смотрит, куда настоящий взгляд стрелка (WithCrewEyes выше). Driver тут —
	-- хозяин пуль и снарядов: подставной объект туда нельзя (gred.CreateShell падал бы на SetOwner)
	if not string.StartWith(entry.class or "", "gred_lfs_") then
		for _, name in ipairs({"HandleWeapons", "OnTick"}) do
			local original = ent[name]
			if isfunction(original) then
				ent[name] = function(self, ...) return WithCrewEyes(entry, original, self, ...) end
			end
		end
		return
	end

	-- Гредвич: турель считает очередь от Driver:EyeAngles() внутри AltPrimaryAttack
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

local DriveTo

-- Наземная техника в бою. Раньше при любом видимом враге (а ищем его до 6000) машина вставала
-- и стояла, пока враг виден, — даже если пулемёт до него не достаёт; скрылся — ждала с патрулём
local GROUND_HUNT_TIME = 25  -- сколько секунд ищем скрывшегося врага там, где видели последним
local GROUND_LEASH = 3000    -- дальше от своего патруля не уезжаем

-- Докуда машина бьёт прицельно: пушка — 6000, автопушка (20–40 мм) — 4500, пулемёт — 3000
local function GroundRange(v)
	local weapons = GredWeapons(v)
	local main = weapons and weapons.main
	if not main then return 3500 end
	if main.type == "Cannon" or main.type == "Custom" then return 6000 end
	local cal = tostring(main.caliber or "")
	if cal:find("20mm", 1, true) or cal:find("30mm", 1, true) or cal:find("40mm", 1, true) then return 4500 end
	return 3000
end

-- Есть ли у машины чем стрелять (грузовик и УАЗ — нечем: в бою не встают, идут с патрулём)
local function GroundArmed(v)
	local weapons = GredWeapons(v)
	if weapons then return weapons.main ~= nil end
	if v.gredWeapons == nil and istable(gred) and istable(gred.simfphys) and gred.simfphys[v.class] then return true end
	local ent = v.ent
	local driverSeat = isfunction(ent.GetDriverSeat) and ent:GetDriverSeat()
	if IsValid(driverSeat) and driverSeat:GetNWBool("HasCrosshair") then return true end
	for _, seat in ipairs(ent.pSeat or {}) do
		if IsValid(seat) and seat:GetNWBool("HasCrosshair") then return true end
	end
	return false
end

-- Не дальше поводка от патруля
local function Leash(goal, center)
	local d = Vector(goal.x - center.x, goal.y - center.y, 0)
	if d:Length() <= GROUND_LEASH then return goal end
	d:Normalize()
	return Vector(center.x + d.x * GROUND_LEASH, center.y + d.y * GROUND_LEASH, goal.z)
end

-- true — стоять и бить; вектор — куда ехать (и подпись для журнала); nil — боя нет, едем с патрулём
local function GroundFightGoal(patrol, v, veh, target)
	if not GroundArmed(v) then return nil end
	local now, pos = CurTime(), veh:GetPos()
	local center = PR_Patrol.Center(patrol) or pos
	if IsValid(target) and v.seenTarget == target and v.seenAt and now - v.seenAt < 1.5 then
		local tpos = target:GetPos()
		v.huntPos, v.huntUntil = tpos, now + GROUND_HUNT_TIME
		local range = GroundRange(v)
		-- По самолёту и вертолёту не гоняемся — бьём, пока достаём
		if FlatDist(pos, tpos) <= range or TargetKind(target) == "air" then return true end
		-- Далеко: подъезжаем на дальность огня (стрелки бьют на ходу)
		local back = Vector(pos.x - tpos.x, pos.y - tpos.y, 0):GetNormalized()
		return Leash(tpos + back * range * 0.7, center), "close in"
	end
	-- Враг скрылся: едем к месту, где видели последний раз, пока не увидим снова или не доедем
	if v.huntUntil and now < v.huntUntil and v.huntPos then
		if FlatDist(pos, v.huntPos) < 400 then
			v.huntUntil = nil
			return nil
		end
		return Leash(v.huntPos, center), "hunt"
	end
	return nil
end

-- Оружие и снаряд под цель (машины Гредвича). Раньше стреляли тем, что заряжено с завода: БМП-2
-- пускала ПТУР «Конкурс» по пехотинцу, БМП-3 била по нему из 100-мм, танк — бронебойными.
-- Пехота — пулемёт/автопушка, из пушки фугас; техника — пушка бронебойным или ПТУР; воздух —
-- скорострельное. Порядок — по предпочтению; дымовые не берём
local SHELLS_VS = {
	infantry = {"HE", "HEF-T", "HEF-I", "HEFI-T", "HESH", "HEATFS", "HEAT", "APHE", "APHEBC", "APCBC", "APC", "AP", "AP-T", "APBC", "API-T", "APCR", "APDS", "APFSDS"},
	vehicle = {"APFSDS", "APDS", "APCR", "APCBC", "APHEBC", "APHE", "APBC", "APC", "AP-T", "API-T", "AP", "HEATFS", "HEAT", "HESH", "HE", "HEF-T", "HEF-I", "HEFI-T"},
}
SHELLS_VS.air = SHELLS_VS.infantry

local function Rank(list, value)
	for i, v in ipairs(list) do
		if v == value then return i end
	end
	return math.huge
end

-- Насколько оружие подходит против цели такого вида (больше — лучше). Технику — ПТУР, пушка,
-- автопушка; пехоту — автопушка, фугас из пушки, пулемёт; воздух — скорострельное
local function WeaponScore(weapon, kind)
	local big = (tonumber(tostring(weapon.Caliber or ""):match("(%d+)mm")) or 0) >= 20
	if weapon.Type == "Custom" then return kind == "vehicle" and 5 or 0 end
	if weapon.Type == "Cannon" then return kind == "vehicle" and 4 or (kind == "air" and 1 or 3) end
	if weapon.Type == "MG" then
		if kind == "vehicle" then return big and 3 or 1 end
		return big and 4 or 2
	end
	return 1
end

local function SelectGredAmmo(v, kind)
	local def = istable(gred) and istable(gred.simfphys) and gred.simfphys[v.class]
	local ent = v.ent
	if not (istable(def) and istable(def.Seats) and ent.Mode and kind) then return end
	local now = CurTime()
	for _, bot in pairs(v.crew or {}) do
		local seat = IsValid(bot) and bot:GetVehicle()
		if IsValid(seat) then
			local seatId = seat == ent:GetDriverSeat() and 0 or table.KeyFromValue(ent.pSeat or {}, seat)
			local tab = seatId and istable(def.Seats[seatId]) and def.Seats[seatId][ent.Mode]
			local primary = istable(tab) and tab.Primary
			-- Пулемёт командира у части танков стреляет только из открытого люка (RequiresHatch): бот
			-- открывает его сам, как игрок клавишей (у T-72Б3 пулемёт иначе молчал весь бой)
			if istable(tab) and istable(tab.RequiresHatch) and seat:GetNWInt("HatchID", 0) == 0 and isfunction(gred.TankToggleHatch) then
				for hatchId in pairs(tab.RequiresHatch) do
					if isnumber(hatchId) and hatchId > 0 then
						pcall(gred.TankToggleHatch, seat, seatId, ent, bot, hatchId, 0, tab)
						break
					end
				end
			end
			if istable(primary) and istable(seat.Primary) then
				-- Слот: лучшее оружие против цели (сменить можно, только если слотов больше одного)
				local slot = seat:GetNWInt("SlotID", 1)
				-- Менять только в паузе между очередями: иначе у прежнего оружия залипал звук стрельбы
				if #primary > 1 and not seat.PrimaryAttacking then
					local best, bestScore = slot, -1
					for i, weapon in ipairs(primary) do
						local score = WeaponScore(weapon, kind)
						if score > bestScore then best, bestScore = i, score end
					end
					if best ~= slot then
						seat:SetNWInt("SlotID", best)
						slot = best
					end
				end
				-- Снаряд пушки: первый по предпочтению, который ещё есть
				local weapon, slotTab = primary[slot], seat.Primary[slot]
				-- ПТУР (особое оружие) — только по технике (и по воздуху — зенитная ракета): у места, где
				-- кроме него ничего нет, по пехоте молчим (БМП-2 пускала «Конкурс» по пехотинцу)
				bot.PR_HoldFire = istable(weapon) and weapon.Type == "Custom" and kind == "infantry" or nil
				if istable(weapon) and weapon.Type == "Cannon" and istable(weapon.ShellTypes) and istable(slotTab) and istable(slotTab.ShellTypes) then
					local order = SHELLS_VS[kind] or SHELLS_VS.infantry
					local best, bestRank = nil, math.huge
					for i, shell in ipairs(weapon.ShellTypes) do
						local rank = Rank(order, shell.ShellType)
						if (slotTab.ShellTypes[i] or 0) > 0 and rank < bestRank then best, bestRank = i, rank end
					end
					if best and best ~= slotTab.CurShellID then
						-- Как при смене снаряда игроком: перезарядка
						slotTab.CurShellID = best
						slotTab.NextShot = math.max(slotTab.NextShot or 0, now + (slotTab.ReloadTime or 0))
						seat:SetNWInt(slot .. "ShellType", best)
						seat:SetNWFloat(slot .. "NextShot", slotTab.NextShot)
					end
				end
			end
		end
	end
end

-- Наземная: едем за главным патруля, в бою — по GroundFightGoal
local function DriveGround(patrol, v)
	local veh = v.ent
	SeatCrew(v)
	WrapSimfphysAim(veh)
	WrapGredwitch()

	if IsValid(v.crew[1]) then v.hadDriver = true end

	-- Водителя так и не нашлось (нет слотов игроков) — машину убираем, иначе стоит пустой мишенью
	if not v.hadDriver and CurTime() - v.spawnedAt > 5 then
		PR_Patrol.Log(VehicleLabel(v) .. ": без водителя (нет слотов для бота) — убрана")
		v.dead = true
		KickCrew(v)
		veh:Remove()
		return
	end

	-- Опрокинулась (на боку или крыше дольше 3 секунд) — ставим на гусеницы физикой:
	-- колёса simfphys — отдельные тела на связках, телепорт корпуса их оторвал бы
	-- Попытка раз в 3 секунды: небольшой подскок и 1.5 секунды ровного поворота на гусеницы,
	-- скорость поворота — по оставшемуся углу (так не перелетает на другой бок). Один толчок
	-- не докручивал (колёса на связках и трение о землю гасят поворот), а толчки каждый тик
	-- копились — танк швыряло и переворачивало обратно
	local up = veh:GetUp()
	local now = CurTime()
	if up.z < 0.3 then
		v.flippedSince = v.flippedSince or now
		if now - v.flippedSince > 3 and now > (v.rightNext or 0) then
			v.rightNext = now + 3
			v.rightTries = (v.rightTries or 0) + 1
			PR_Patrol.Log(string.format("%s перевернулся у %s — встаёт, попытка %d", VehicleLabel(v), PosText(veh:GetPos()), v.rightTries))
			local phys = veh:GetPhysicsObject()
			if IsValid(phys) then phys:SetVelocity(phys:GetVelocity() + Vector(0, 0, 250)) end

			local id = "PR_PatrolRighting" .. veh:EntIndex()
			timer.Create(id, 0.05, 30, function()
				local body = IsValid(veh) and veh:GetPhysicsObject()
				if not IsValid(body) or veh:GetUp().z > 0.6 then
					timer.Remove(id)
					return
				end
				local u = veh:GetUp()
				local axis = u:Cross(Vector(0, 0, 1))
				if axis:LengthSqr() < 0.01 then axis = veh:GetForward() end
				axis:Normalize()
				local angle = math.deg(math.acos(math.Clamp(u.z, -1, 1)))
				body:SetAngleVelocity(body:WorldToLocalVector(axis) * math.Clamp(angle * 2, 60, 360))
			end)
		end
	else
		v.flippedSince = nil
		-- Счёт попыток — пока не встал как следует (иначе качнулся и упал обратно — опять с начала)
		if up.z > 0.8 and v.rightTries then
			PR_Patrol.Log(string.format("%s снова на гусеницах (попыток: %d)", VehicleLabel(v), v.rightTries))
			v.rightTries = nil
		end
	end

	local target = PR_Patrol.VehicleTarget(v, veh:WorldSpaceCenter() + Vector(0, 0, 60), GROUND_SIGHT, PREFIRE_TIME + 2)
	CrewAim(v, target)
	-- «Видно и пора» — до проверки, встала ли пушка: стрелки других мест жмут огонь по своему стволу
	v.fireClear = v.fire
	-- Оружие и снаряд под цель (раз в секунду хватает)
	if IsValid(target) and CurTime() >= (v.ammoCheckAt or 0) then
		v.ammoCheckAt = CurTime() + 1
		SelectGredAmmo(v, TargetKind(target))
	end

	if not target then
		-- Врага потеряли недавно — башня ждёт его там, где видели последний раз (и пулемёт
		-- командира туда же, через aimPoint); давно никого — смотрит по ходу
		-- Убили его — ждать и искать некого
		local seen = v.seenTarget
		if IsValid(seen) and (seen:IsPlayer() and not seen:Alive() or not seen:IsPlayer() and seen:Health() <= 0) then
			v.seenPos, v.seenTarget, v.huntUntil = nil, nil, nil
		end
		if v.seenPos and v.seenAt and CurTime() - v.seenAt < GROUND_WATCH_TIME then
			v.aimPoint = v.seenPos
			v.aimAng = (v.seenPos - (veh:WorldSpaceCenter() + Vector(0, 0, 60))):Angle()
			if v.aimFix then v.aimAng = v.aimAng + v.aimFix end
		else
			v.aimAng = (veh.Forward or veh:GetForward()):Angle()
		end
	elseif v.fire and veh.sm_pp_yaw then
		-- Танки simfphys armed помнят, куда повёрнута башня: стреляем, только когда она довернулась
		local want = veh:WorldToLocalAngles(v.aimAng)
		local dy = math.AngleDifference(want.y, veh.sm_pp_yaw)
		local dp = math.AngleDifference(want.p, veh.sm_pp_pitch or want.p)
		local tol = v.aimTolerance or 4
		v.fire = math.abs(dy) < tol and math.abs(dp) < tol
	elseif v.fire and v.gredAligned ~= nil then
		-- Танки Гредвича: перехват наведения знает, встала ли башня на цель
		v.fire = v.gredAligned
	end

	if not IsValid(veh:GetDriver()) then return end
	if isfunction(veh.EngineActive) and not veh:EngineActive() and isfunction(veh.StartEngine) then
		veh:StartEngine()
	end

	-- Бой: враг виден и достаём — стоим и бьём; виден, но далеко — подъезжаем; скрылся — едем
	-- туда, где видели последний раз (GroundFightGoal)
	local fightGoal, fightLabel = GroundFightGoal(patrol, v, veh, target)
	if fightGoal == true then
		v.driveState = "fight"
		Halt(veh)
		v.stuckSince = nil
		return
	elseif fightGoal then
		if FlatDist(veh:GetPos(), fightGoal) < 250 then
			v.driveState = fightLabel .. ": on place"
			Halt(veh)
			v.stuckSince = nil
			return
		end
		DriveTo(patrol, v, veh, fightGoal, fightLabel)
		return
	end

	local center = PR_Patrol.Center(patrol)
	if not center then
		v.driveState = "no patrol"
		Halt(veh)
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
		Halt(veh)
		v.stuckSince = nil
		return
	end

	DriveTo(patrol, v, veh, goal, ahead and "lead" or "follow")
end

-- Объезд препятствий: карта без навигации, а ехали строго на точку — в городе машина упиралась в
-- стену и только через 4 с сдавала назад (M-ATV по пути к цели накатал 7500). Четыре раза в
-- секунду пробуем полосу шириной с машину на 250–900 вперёд: прямо на цель, затем ±25…100°, и
-- рулим в ближайшую свободную. Склон (поверхность смотрит вверх) — не препятствие
local AVOID_OFFSETS = {25, -25, 50, -50, 75, -75, 100, -100}

local function AvoidHeading(v, veh, wantYaw, speed)
	local now = CurTime()
	if v.avoidAt and now < v.avoidAt and v.avoidGoalYaw and math.abs(math.AngleDifference(v.avoidGoalYaw, wantYaw)) < 20 then
		return wantYaw + (v.avoidOffset or 0)
	end
	v.avoidAt, v.avoidGoalYaw = now + 0.25, wantYaw

	local mins, maxs = veh:OBBMins(), veh:OBBMaxs()
	local half = math.Clamp(math.min(maxs.x - mins.x, maxs.y - mins.y) * 0.4, 30, 90)
	local origin = veh:WorldSpaceCenter() + Vector(0, 0, 20)
	local length = math.Clamp(250 + speed * 1.5, 350, 900)
	local function filter(e)
		if e == veh or e:GetParent() == veh or e:IsPlayer() or e:IsNPC() then return false end
		return e:GetClass() ~= "gmod_sent_vehicle_fphysics_wheel"
	end
	local function Free(off)
		local dir = Angle(0, wantYaw + off, 0):Forward()
		local tr = util.TraceHull({start = origin, endpos = origin + dir * length, mins = Vector(-half, -half, -10), maxs = Vector(half, half, 30), filter = filter, mask = MASK_SOLID})
		if tr.StartSolid then return 0 end
		if tr.Hit and tr.HitNormal.z > 0.6 then return 1 end
		return tr.Fraction
	end

	-- Прямо на цель свободно — едем прямо; иначе прежний объезд, если всё ещё свободен; иначе ищем
	local best, bestFree = 0, Free(0)
	if bestFree < 0.95 then
		local order = {}
		if v.avoidOffset and v.avoidOffset ~= 0 then order[1] = v.avoidOffset end
		for _, off in ipairs(AVOID_OFFSETS) do order[#order + 1] = off end
		for _, off in ipairs(order) do
			local free = Free(off)
			if free > 0.95 then
				best, bestFree = off, free
				break
			end
			if free > bestFree + 0.05 then best, bestFree = off, free end
		end
	end
	v.avoidOffset = best
	return wantYaw + best
end

-- Ехать к goal: застряли — сдаём назад, свои пешие на пути — ждём, иначе рулим. label — в журнал
function DriveTo(patrol, v, veh, goal, label)
	local pos = veh:GetPos()
	local dist = FlatDist(pos, goal)
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
	-- Задним ходом — только к близкой точке: к дальней (подъезд к врагу, поиск) разворачиваемся
	-- и едем вперёд, иначе машина катилась задом через полкарты и металась (БТР-80: 7400 за 25 с)
	local reverse = math.abs(yaw) > 120 and dist < 800
	local heading = reverse and -forward or forward
	for _, npc in ipairs(patrol.members) do
		if IsValid(npc) then
			local d = npc:GetPos() - pos
			d.z = 0
			if d:LengthSqr() < 300 * 300 and heading:Dot(d:GetNormalized()) > 0.3 then
				v.driveState = "infantry in the way"
				Halt(veh)
				v.stuckSince = nil
				return
			end
		end
	end

	-- Вперёд — с объездом стен и домов (задним ходом едем только к близкой точке, там без него)
	if not reverse then
		local steer = AvoidHeading(v, veh, (goal - pos):Angle().y, speed)
		yaw = math.AngleDifference(steer, forward:Angle().y)
	end
	local turnLeft, turnRight = yaw > 8, yaw < -8
	v.driveState = string.format("%s %s, goal %d, turn %d%s", reverse and "reverse" or "forward", label, dist, yaw,
		(not reverse and (v.avoidOffset or 0) ~= 0) and (", avoid " .. v.avoidOffset) or "")
	if reverse then
		-- Цель позади: разворачиваемся задним ходом
		SetKeys(veh, false, true, turnRight, turnLeft, false)
	else
		-- К точке на большой скорости — тормозим заранее, а не проскакиваем её
		local fwd = veh.ForwardSpeed or 0
		local slow = fwd > 300 and dist < fwd * 0.8
		if slow then v.driveState = v.driveState .. ", slowing" end
		SetKeys(veh, not slow, slow, turnLeft, turnRight, false)
	end
end

-- Авиация и LVS: летит/едет своим ИИ, бот-стрелок бьёт по той же цели
-- Для журнала: сломан винт, сильный крен
local function WatchAir(v)
	local ent = v.ent
	if not v.heli then return end
	if not v.rotorLogged and isfunction(ent.GetRotorDestroyed) and ent:GetRotorDestroyed() then
		v.rotorLogged = true
		PR_Patrol.Log(string.format("%s: сломан винт у %s, %d над землёй, скорость %d, делал: %s; урон до этого: %s",
			VehicleLabel(v), PosText(ent:GetPos()), HeightAboveGround(ent), ent:GetVelocity():Length(), tostring(v.airMode), DamageSummary(v)))
	end
	local up = ent:GetUp().z
	if up < 0.64 then
		PR_Patrol.LogEvery(v, "tilt", 5, string.format("%s: крен %d° у %s, %d над землёй, делал: %s",
			VehicleLabel(v), math.deg(math.acos(math.Clamp(up, -1, 1))), PosText(ent:GetPos()), HeightAboveGround(ent), tostring(v.airMode)))
	end
end

-- Самолёт сел (разбился о склон, но цел) и стоит: сам LFS-ИИ с земли не взлетает. Если 8 с
-- скорость меньше 150 (летящий самолёт так медленно не летает; высоту не смотрим — на склоне
-- под серединой самолёта бывает обрыв), а рядом никого из игроков и не видно — снова в небо
-- над патрулём (держим, пока мотор не раскрутится, и отпускаем на скорости, как при появлении)
local function RecoverGroundedPlane(patrol, v)
	local ent = v.ent
	if v.kind ~= "air" or v.heli then return end
	local speed, height = ent:GetVelocity():Length(), HeightAboveGround(ent)
	if v.holdUntil or speed > 150 then
		v.groundedSince = nil
		return
	end
	v.groundedSince = v.groundedSince or CurTime()
	v.groundDebug = string.format("grounded %.0f s, speed %d, height %d", CurTime() - v.groundedSince, speed, height)
	if CurTime() - v.groundedSince < 8 then return end
	if not v.recoverAnyway and (PlayersNear(ent:GetPos(), Settings().safeDistance) or SeenByPlayer(ent:GetPos())) then
		v.groundDebug = v.groundDebug .. ", players see it"
		return
	end

	local taken = {}
	for _, other in ipairs(patrol.vehicles or {}) do
		if other ~= v and other.kind == "air" and IsValid(other.ent) then table.insert(taken, other.ent:GetPos()) end
	end
	local center = PR_Patrol.Center(patrol) or ent:GetPos()
	local pos, outward = AirSpawnPos(center, taken, 1500)
	if not pos then
		v.groundDebug = v.groundDebug .. ", no place in the sky"
		return
	end
	local from = ent:GetPos()
	local yaw = ClearHeading(pos + Vector(0, 0, 20), {outward + 90, outward - 90, outward + 180, outward})
	ent:SetPos(pos + Vector(0, 0, 20))
	ent:SetAngles(Angle(0, yaw, 0))
	v.holdPos, v.holdUntil, v.spawnedAt, v.groundedSince = ent:GetPos(), CurTime() + 15, CurTime(), nil
	v.planeMode, v.planeRunYaw = nil, nil
	PR_Patrol.Log(string.format("%s: сел у %s и не взлетает — снова в небе у %s", VehicleLabel(v), PosText(from), PosText(pos)))
end

-- Стрелок Ми-24 по технике — управляемыми ракетами (4 на вылет, раз в 6 с, когда наведён).
-- Пуск в аддоне отключён (закомментирован в HandleWeapons); сама ракета ведётся на то, во что
-- стрелок смотрел при пуске. Хозяин — стрелок: убийство засчитывается, своих не бьёт
local function GunnerMissiles(entry, target)
	local ent = entry.ent
	if not (entry.heli and entry.fire and IsValid(target) and entry.targetKind == "vehicle") then return end
	if not (isfunction(ent.AltSecondaryAttack) and isfunction(ent.GetMissiles) and ent:GetMissiles()) then return end
	entry.missilesLeft = entry.missilesLeft or (tonumber(ent.MaxMissiles) or 0)
	if entry.missilesLeft <= 0 or CurTime() < (entry.nextMissile or 0) then return end
	local gunner = entry.crew[1]
	local seat = isfunction(ent.GetGunnerSeat) and ent:GetGunnerSeat()
	if not (IsValid(gunner) and IsValid(seat) and gunner:GetVehicle() == seat) then return end
	entry.nextMissile = CurTime() + 6

	local tab = ent:GetTable()
	local ownDriver = rawget(tab, "GetDriver")
	tab.GetDriver = function() return gunner end
	local created = {}
	hook.Add("OnEntityCreated", "PR_PatrolGunnerMissile", function(e) created[#created + 1] = e end)
	-- В AltSecondaryAttack у аддона отладочный print(Driver) — на каждый пуск строка в консоль
	local ok, err = pcall(Quietly, ent.AltSecondaryAttack, ent, gunner, seat)
	hook.Remove("OnEntityCreated", "PR_PatrolGunnerMissile")
	tab.GetDriver = ownDriver
	if not ok then error(err, 0) end
	-- Ракета ведётся на то, что попалось на луч взгляда стрелка, а луч не пропускает только корпус
	-- вертолёта — цеплял винт или колёса, и ракеты ложились за 700–1900 от цели. Наводим на саму
	-- цель (машину), в её середину
	local body = AimBody(target)
	local launched = 0
	for _, e in ipairs(created) do
		if IsValid(e) and isfunction(e.Launch) then
			launched = launched + 1
			GiveRocketOwner(e, gunner)
			e.target = body
			e.targetOffset = body:WorldToLocal(body:WorldSpaceCenter())
			-- Цель уничтожили, пока ракета летит, — наведение не падает (sv_rocket_compat.lua)
			if PR_GuardMissileGuidance then PR_GuardMissileGuidance(e) end
		end
	end
	if launched > 0 then
		entry.missilesLeft = entry.missilesLeft - 1
		entry.missilesFired = (entry.missilesFired or 0) + 1
		PR_Patrol.Log(string.format("%s: стрелок пустил управляемую ракету по технике (осталось %d)", VehicleLabel(entry), entry.missilesLeft))
	end
end

local function CrewForAI(patrol, v)
	WatchAir(v)
	RecoverGroundedPlane(patrol, v)
	HoldUntilEngine(v)
	SeatCrew(v)
	WrapGredwitch()
	WrapLFSGunner(v)
	local target = PR_Patrol.VehicleTarget(v, v.ent:WorldSpaceCenter(), VEHICLE_RANGE * 1.5)
	CrewAim(v, target)
	GunnerMissiles(v, target)
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
					PR_Patrol.Log(VehicleLabel(v) .. ": ошибка: " .. v.lastError)
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
		heading, tostring(v.driveState or v.airMode), tostring(v.fire) .. " " .. tostring(v.aimDebug) .. " " .. tostring(v.gredDebug) .. (v.pilotDebug and " " .. v.pilotDebug or "") .. (v.groundDebug and " " .. v.groundDebug or ""), tostring(v.lastFly), IsValid(ent) and tostring(ent.PR_AimWrapped) or "-", tostring(v.aimTarget),
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
			PR_Patrol.Log("патруль «" .. patrol.cfg.name .. "» перебит")
			return
		end

		-- Пеших перебили, техника жива: стоит, пока не выйдет время, и уходит без свидетелей
		local center = PR_Patrol.Center(patrol)
		if CurTime() > patrol.expiresAt and (not center or not PlayersNear(center, Settings().safeDistance)) then
			PR_Patrol.Log("техника патруля «" .. patrol.cfg.name .. "» ушла с карты")
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
		patrol.combatSince = patrol.combatSince or now
		patrol.lastCombat = now
		patrol.orderAt = nil
		-- Долгий бой (враг недосягаем — патруль так и стоит): кто с кем
		if now - patrol.combatSince > 30 then
			local pairs_ = {}
			for _, npc in ipairs(patrol.members) do
				local e = IsValid(npc) and npc:GetEnemy()
				if IsValid(e) then
					table.insert(pairs_, string.format("%s → %s (%d)", npc:GetClass(), e:IsPlayer() and e:Nick() or e:GetClass(), npc:GetPos():Distance(e:GetPos())))
				end
			end
			PR_Patrol.LogEvery(patrol, "combat", 30, string.format("патруль «%s» в бою уже %d с у %s: %s", patrol.cfg.name,
				now - patrol.combatSince, PosText(leader:GetPos()), table.concat(pairs_, ", ")))
		end
		return
	end
	patrol.combatSince = nil

	-- Время вышло и игроков рядом нет — уходят
	if now > patrol.expiresAt and not PlayersNear(leader:GetPos(), Settings().safeDistance) then
		PR_Patrol.Log("патруль «" .. patrol.cfg.name .. "» ушёл с карты")
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
