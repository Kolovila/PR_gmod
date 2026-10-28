-- Патрули NPC: время от времени на случайном споте появляется группа (например, Решала со свитой)
-- и ходит по карте между территориями, пока не выйдет её время.
--
-- На rp_desert_conflict нет AI-узлов и навмеша, поэтому сами NPC дорогу через полкарты не находят.
-- Админ расставляет споты «Редактором патрулей» (entities/weapons/pr_patrol_tool.lua). Соседние
-- споты, между которыми можно пройти по прямой, соединяются сами, и патруль идёт от спота к споту.
-- Общие настройки — config/patrols.lua. Варианты патрулей хранятся в базе (pr_patrol_types) и
-- правятся в игре тем же редактором (cl_patrols.lua), стартовые берутся из config/patrols.lua.

include("config/patrols.lua")
include("config/arccw_migration.lua")

util.AddNetworkString("PR_PatrolSpots")
util.AddNetworkString("PR_PatrolSetZone")
util.AddNetworkString("PR_PatrolSpotZone")
util.AddNetworkString("PR_PatrolTypes")      -- админ просит / сервер присылает все варианты
util.AddNetworkString("PR_PatrolSaveType")   -- админ сохраняет вариант
util.AddNetworkString("PR_PatrolDeleteType") -- админ удаляет вариант
util.AddNetworkString("PR_PatrolSpawnType")  -- админ выпускает вариант сейчас
util.AddNetworkString("PR_PatrolTypeResult") -- итог для админа: ок/ошибка, ключ, текст
util.AddNetworkString("PR_PatrolCrewName")   -- имя бота-экипажа: клиенты прячут «вступает в игру»
util.AddNetworkString("PR_PatrolUI")         -- у админа открыто / закрыто окно редактора

PR_Patrol = PR_Patrol or {}
PR_Patrol.Spots = PR_Patrol.Spots or {}   -- [id] = {Id, Pos, Zone}
PR_Patrol.Links = PR_Patrol.Links or {}   -- [id] = {[соседний id] = расстояние}
PR_Patrol.Active = PR_Patrol.Active or {} -- патрули на карте


-- Видимость: стены и земля карты, но не решётки (сетка-рабица, CONTENTS_GRATE) — сквозь них видно,
-- и пули с снарядами пролетают. Раньше техника за забором из сетки «не видела» врага и не стреляла
local SIGHT_MASK = bit.band(MASK_SOLID_BRUSHONLY, bit.bnot(CONTENTS_GRATE))
PR_Patrol.SIGHT_MASK = SIGHT_MASK
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

-- v2: вариант с техникой; v3: «Решала (новая пехота)». Недостающие стартовые варианты дописываются, правки админа не трогаются
local TYPES_META = "patrol_types_v3"

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

	-- Смена оружейных паков (CW 2.0 -> ArcCW -> ArcCW без CoD-паков): оружие бойцов (NPC-копии
	-- weapon_vj_<класс>) и добыча — по таблице config/arccw_migration.lua. Ушедший ствол CW без замены
	-- убираем (боец получит ствол под роль); ствол ArcCW без замены оставляем — SpawnMember пропустит,
	-- если его нет в игре
	if PR_DB.GetMeta("patrol_types_arccw_v2") ~= "1" then
		local function Map(list, prefix)
			local out = {}
			for _, w in ipairs(istable(list) and list or {}) do
				local src = string.sub(w, #prefix + 1)
				local ours = string.StartWith(w, prefix) and (string.StartWith(src, "cw_") or string.StartWith(src, "khr_") or string.StartWith(src, "arccw_"))
				local to = ours and PR_ArcCWReplacement(src)
				if to then out[#out + 1] = prefix .. to
				elseif not ours or string.StartWith(src, "arccw_") then out[#out + 1] = w end
			end
			return out
		end
		PR_DB.Transaction(function()
			for key, data in pairs(PR_DB.GetPatrolTypes()) do
				for _, def in ipairs(data.leader and {data.leader, unpack(data.followers or {})} or (data.followers or {})) do
					def.weapons = Map(def.weapons, "weapon_vj_")
					if def.drop then def.drop = Map(def.drop, "") end
				end
				PR_DB.SavePatrolType(key, data)
			end
			PR_DB.SetMeta("patrol_types_arccw_v2", "1")
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

	-- Роль (sv_infantry.lua, этап 3) и модели «Бойца патруля» (npc_pr_soldier)
	local role = isstring(def.role) and def.role or ""
	for _, r in ipairs(PR_INF_ROLES or {}) do
		if r.key == role and role ~= "" then out.role = role end
	end
	local models = CleanList(def.models, function(m) return string.EndsWith(m, ".mdl") and file.Exists(m, "GAME") end, 16)
	if #models > 0 then out.models = models end

	if isLeader then
		out.drop = CleanList(def.drop, PR_WeaponExists, 4)
		out.dropGold = def.dropGold == true
	else
		out.count = math.floor(Num(def.count, 1, PR_PATROL_LIMITS.perGroup, 1))
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

	-- Групп свиты и людей — сколько угодно в пределах PR_PATROL_LIMITS (защита от опечатки «1000»)
	local people = out.leader and 1 or 0
	for i, group in ipairs(istable(data.followers) and data.followers or {}) do
		if i > PR_PATROL_LIMITS.groups then return nil, "групп свиты больше " .. PR_PATROL_LIMITS.groups end
		local clean = CleanNPC(group, false)
		if not clean then return nil, "в группе свиты №" .. i .. " не выбран NPC (или его нет в игре)" end
		table.insert(out.followers, clean)
		people = people + clean.count
	end
	if people > PR_PATROL_LIMITS.total then return nil, "в патруле " .. people .. " человек, можно до " .. PR_PATROL_LIMITS.total end

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
		PR_NetWriteTableZ(PR_PATROL_TYPES)
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

	-- Большой отряд — рядами: клин по 5 пар, колонна в две нитки после 8, «вокруг» — кольцами по 8
	-- (раньше 50 пар клина растягивались на 5000 ю)
	local slots = {}
	for k = 1, n do
		local pair, side = math.ceil(k / 2), (k % 2 == 1) and 1 or -1
		if formation == "column" then
			slots[k] = n > 8 and {-90 * pair, side * 45} or {-90 * k, 0}
		elseif formation == "wedge" then
			local row, inRow = math.floor((pair - 1) / 5), (pair - 1) % 5 + 1
			slots[k] = {-100 * inRow - 300 * row, side * 90 * inRow}
		elseif k <= 8 then
			-- Вокруг главного: первые двое впереди, следующие по бокам и дальше назад
			slots[k] = {110 - (pair - 1) * 120, side * (70 + (pair - 1) * 30)}
		else
			local ring, inRing = math.floor((k - 9) / 8) + 2, (k - 9) % 8
			local a = math.rad(inRing * 45 + ring * 22.5)
			slots[k] = {math.cos(a) * 140 * ring, math.sin(a) * 140 * ring}
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
			local tr = util.TraceLine({start = ply:EyePos(), endpos = pos + Vector(0, 0, 48), mask = SIGHT_MASK})
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
	-- Круг растёт с толпой: на человека ~60×60 ю (раньше 40–160 ю на всех — после ~35 человек
	-- новых ставило друг в друга)
	local maxR = math.max(160, 40 * math.sqrt(#used + 1))
	for i = 1, 20 + #used do
		local ang = math.rad(math.random(0, 359))
		local dist = i == 1 and 0 or math.random(40, maxR)
		local p = pos + Vector(math.cos(ang) * dist, math.sin(ang) * dist, 0)

		local down = util.TraceLine({start = p + Vector(0, 0, 64), endpos = p - Vector(0, 0, 128), mask = MASK_NPCSOLID_BRUSHONLY})
		local wall = dist > 160 and util.TraceLine({start = pos + Vector(0, 0, 40), endpos = p + Vector(0, 0, 40), mask = MASK_NPCSOLID_BRUSHONLY}).Hit
		if down.Hit and not down.StartSolid and not wall then
			local spot = down.HitPos + Vector(0, 0, 4)
			local hull = util.TraceHull({start = spot, endpos = spot, mins = Vector(-18, -18, 0), maxs = Vector(18, 18, 72), mask = MASK_NPCSOLID})

			local crowded = false
			for _, u in ipairs(used) do
				if u:DistToSqr(spot) < 48 * 48 then crowded = true break end
			end

			if not hull.Hit and not crowded then return spot end
		end
	end

	return pos + Vector(math.random(-maxR, maxR), math.random(-maxR, maxR), 8)
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

	-- Только стволы, что есть в игре (снятый аддон — не повод выпустить бойца без оружия)
	local pool = {}
	for _, w in ipairs(istable(def.weapons) and def.weapons or {def.weapons}) do
		if PR_WeaponExists(w) then pool[#pool + 1] = w end
	end
	-- Гранатомётчику — гранатомёт, если он есть среди стволов группы (Big Pipe выпадал с MP7)
	if def.role == "grenadier" and PR_NPCW and PR_NPCW.List then
		local launchers = {}
		for _, w in ipairs(pool) do
			local info = PR_NPCW.List[w]
			if info and info.kind == "launcher" then launchers[#launchers + 1] = w end
		end
		if #launchers > 0 then pool = launchers end
	end
	local weapon = Pick(pool)
	-- Боец патруля без заданного оружия — NPC-копия ствола ArcCW под его роль (sh_npc_weapons.lua)
	if not weapon and class == "npc_pr_soldier" and PR_NPCW and PR_NPCW.ROLE_KINDS then
		weapon = Pick(PR_NPCW.ForKind(PR_NPCW.ROLE_KINDS[def.role or ""] or PR_NPCW.ROLE_KINDS[""]))
	end
	if weapon then npc:SetKeyValue("additionalequipment", weapon) end

	local flags = bit.bor(SF_NPC_FADE_CORPSE, SF_NPC_ALWAYSTHINK)
	if npcData.SpawnFlags then flags = bit.bor(flags, npcData.SpawnFlags) end
	npc:SetKeyValue("spawnflags", flags)
	for k, v in pairs(npcData.KeyValues or {}) do
		npc:SetKeyValue(k, v)
	end

	-- Боец патруля: модель до Spawn (VJ по ней выбирает набор анимаций), роль — слою пехоты
	local model = Pick(def.models)
	if model then npc:SetModel(model) end
	npc.PR_Role = def.role

	npc:SetPos(pos)
	npc:SetAngles(Angle(0, math.random(0, 359), 0))
	Quietly(function()
		npc:Spawn()
		npc:Activate()
	end)

	-- VJ-паки в Initialize ставят свой класс и дружбу с игроками (vj_me_scav): перебиваем после спавна
	npc.VJ_NPC_Class = {patrol.cfg.npcClass or "CLASS_PR_BANDITS"}
	npc.PlayerFriendly = false
	npc.AlliedWithPlayerAllies = false
	npc.BecomeEnemyToPlayer = false
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
	if isfunction(npc.SCHEDULE_GOTO_POSITION) then
		npc:SCHEDULE_GOTO_POSITION(run and "TASK_RUN_PATH" or "TASK_WALK_PATH")
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
		-- Боец патруля держит направление или ищет врага (sv_infantry.lua) — патруль его не водит
		if npc.PR_Brain and PR_Inf and PR_Inf.Busy(npc) then return true end
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
-- Сколько башня ещё смотрит туда, где врага видели последний раз (а не разворачивается по ходу):
-- раньше через 4 с после потери цели башня уходила вперёд, и вернувшегося врага докручивала заново
local GROUND_OPT = {sight = 9000, watch = 300}

-- Префайр: враг только что скрылся (зашёл в дом, за стену) — бьём туда, где его видели последний
-- раз: экипаж — ещё PREFIRE_TIME секунд, лётчик вертолёта — ракетами (до AIR_OPT.prefireRockets на одно
-- укрытие, пока не прошло AIR_OPT.prefireTime). Снаряд и ракета рвутся у стены или в проёме двери
local PREFIRE_TIME = 5 -- дольше — экипаж слишком долго лупит в пустое место
-- prefireTime / prefireRockets — префайр лётчика вертолёта: сколько секунд и ракет на одно укрытие
local AIR_OPT = {prefireTime = 10, prefireRockets = 8}
-- Сколько авиация помнит скрывшегося врага. Было 4 с (по умолчанию) — меньше префайра (6 с): он
-- обрывался, едва начавшись
AIR_OPT.memory = 12
-- Самолёт видит и помнит дольше: заход у него начинается с 9–10 км, а уходит он после атаки на
-- 9500 и выше. С общими 9000 и 12 с он терял цель прямо в точке разворота и начинал заход заново
AIR_OPT.planeSight, AIR_OPT.planeMemory = 20000, 45
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
			start = from, endpos = to, mask = PR_Patrol.VisibleMask or SIGHT_MASK,
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

-- Цель для авиации: самолёту — дальше и дольше (AIR_OPT.planeSight / planeMemory)
local function AirVehicleTarget(entry, from)
	if entry.kind == "air" and not entry.heli then
		return PR_Patrol.VehicleTarget(entry, from, AIR_OPT.planeSight, AIR_OPT.planeMemory)
	end
	return PR_Patrol.VehicleTarget(entry, from, VEHICLE_RANGE * 1.5, AIR_OPT.memory)
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

-- Падение снаряда. Пушки бьют до 9000, а снаряд по дороге падает: у Луны своя «гравитация»
-- в снаряде, у Гредвича — физика с сопротивлением воздуха и пределом скорости движка, так что
-- формулой не посчитать. Делаем как игрок: смотрим, куда легли свои снаряды. Каждый снаряд
-- пушки машины патруля ведём в полёте и пишем, на сколько он ниже линии ствола на каждой
-- дальности (шаг DROP_STEP); целимся выше на столько же. Таблица — на каждый тип снаряда
local DROP_STEP = 250
local trackedShells = {}

hook.Add("OnEntityCreated", "PR_PatrolShellDrop", function(ent)
	local class = ent:GetClass()
	if class ~= "base_shell" and class ~= "simfphys_tankprojectile" then return end
	timer.Simple(0, function()
		if not IsValid(ent) then return end
		local owner, entry, key = ent:GetOwner(), nil, nil
		if class == "simfphys_tankprojectile" then
			entry = IsValid(owner) and owner.PR_PatrolVehicle
			key = "luna"
		else
			if istable(owner) and owner.PR_Real then owner = owner.PR_Real end
			entry = IsValid(owner) and owner:IsPlayer() and owner.PR_PatrolCrew
			-- Только пушка (водитель-наводчик), у неё и считается наведение
			if entry and owner ~= entry.crew[1] then entry = nil end
			key = tostring(ent.ShellType) .. ":" .. tostring(ent.MuzzleVelocity)
		end
		if not (istable(entry) and entry.kind == "ground") then return end
		entry.shellKey = key
		-- Куда на самом деле смотрел ствол: снаряд вылетает по нему. У части танков Гредвича ствол
		-- стоит со сдвигом от угла, который Гредвич считает «встал на цель» (Leopard 2A6: на 0,6°
		-- выше — на 7000 снаряды шли над головой). Подправляем угол наполовину ошибки за выстрел.
		-- У Луны то же делает aimFix по прицелу — там не дублируем
		if class == "base_shell" and entry.desiredAng and IsValid(entry.ent) and entry.ent:GetUp().z > 0.9 then
			local got = ent:GetForward():Angle()
			local fix = entry.shellFix or Angle(0, 0, 0)
			local dp = math.AngleDifference(entry.desiredAng.p, got.p)
			local dy = math.AngleDifference(entry.desiredAng.y, got.y)
			if math.abs(dp) < 5 and math.abs(dy) < 5 then
				entry.shellFix = Angle(math.Clamp(fix.p + dp * 0.5, -5, 5), math.Clamp(fix.y + dy * 0.5, -5, 5), 0)
			end
		end
		trackedShells[#trackedShells + 1] = {entry = entry, ent = ent, key = key, start = ent:GetPos(),
			dir = ent:GetForward(), born = CurTime()}
	end)
end)

hook.Add("Think", "PR_PatrolShellDrop", function()
	if #trackedShells == 0 then return end
	local now = CurTime()
	for i = #trackedShells, 1, -1 do
		local s = trackedShells[i]
		if not IsValid(s.ent) or now - s.born > 6 then
			table.remove(trackedShells, i)
		else
			local pos = s.ent:GetPos()
			local flat = math.sqrt((pos.x - s.start.x) ^ 2 + (pos.y - s.start.y) ^ 2)
			local dirFlat = math.sqrt(s.dir.x ^ 2 + s.dir.y ^ 2)
			if flat > DROP_STEP * 0.5 and dirFlat > 0.1 then
				local drop = s.start.z + s.dir.z / dirFlat * flat - pos.z
				local tables = s.entry.dropTables or {}
				s.entry.dropTables = tables
				local tab = tables[s.key] or {}
				tables[s.key] = tab
				local b = math.Round(flat / DROP_STEP)
				tab[b] = tab[b] and (tab[b] * 0.5 + drop * 0.5) or drop
				-- Скорость снаряда (для упреждения): у Гредвича физика движка режет её ниже паспортной
				local age = now - s.born
				if age > 0.05 then
					local speeds = s.entry.shellSpeeds or {}
					s.entry.shellSpeeds = speeds
					local sp = pos:Distance(s.start) / age
					speeds[s.key] = speeds[s.key] and (speeds[s.key] * 0.8 + sp * 0.2) or sp
				end
			end
		end
	end
end)

-- На сколько поднять точку прицела для дальности dist (0 — пока не знаем или стреляем пулями)
local function ShellDrop(entry, dist)
	local tab = entry.shellKey and entry.dropTables and entry.dropTables[entry.shellKey]
	if not tab then return 0 end
	local b = dist / DROP_STEP
	local lo = math.floor(b)
	if tab[lo] and tab[lo + 1] then
		return math.max(0, Lerp(b - lo, tab[lo], tab[lo + 1]))
	end
	-- Так далеко ещё не стреляли — по самой дальней замеренной точке, падение растёт как квадрат
	for m = math.min(lo, 60), 1, -1 do
		if tab[m] then
			local d = m * DROP_STEP
			return math.Clamp(tab[m] / (d * d) * dist * dist, 0, dist * 0.3)
		end
	end
	return 0
end

-- Сколько градусов вбок от носа достаёт турель стрелка (нет в списке — 100°). Турель Ми-24
-- Гредвича: ±30° вбок, 0–60° вниз
local GUNNER_YAW = {gred_lfs_mi24a = 30}

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
	-- Упреждение: куда цель доедет (долетит), пока летит снаряд. Раньше — только по авиации, и по
	-- едущему танку БТР-80А бил туда, где тот был (на 5000 снаряд Луны летит 0,4 с — мимо на 150–200).
	-- Скорость снаряда — замеренная (ShellDrop) или паспортная у Гредвича; у наземки без снаряда
	-- (лучевые пулемёты Луны) упреждать нечего
	-- Префайр (цели не видно) — в точку, где видели, без упреждения
	-- Скорость цели — по тому, как она на деле сместилась, и сглаженная. GetVelocity бегущего
	-- скачет от тика к тику и бывает втрое больше настоящей (упёрся, скользит вдоль стены): с ней
	-- упреждение (×0,8 с полёта) дёргало прицел, и БТР-80А мазал мимо бегущего
	local bodyPos = AimBody(target):WorldSpaceCenter()
	local vel = Vector(0, 0, 0)
	if entry.leadTarget == target and entry.leadPos then
		local dt = now - entry.leadPosAt
		if dt > 0.03 then
			local inst = (bodyPos - entry.leadPos) / dt
			-- Скачок (телепорт, возрождение) — не скорость
			if inst:LengthSqr() > 4000 * 4000 then inst = Vector(0, 0, 0) end
			vel = LerpVector(0.15, entry.leadVel or inst, inst)
			entry.leadPos, entry.leadPosAt, entry.leadVel = bodyPos, now, vel
		else
			vel = entry.leadVel or vel
		end
	else
		entry.leadPos, entry.leadPosAt, entry.leadVel = bodyPos, now, nil
	end
	entry.leadTarget = target
	local unled = to
	if vel:LengthSqr() > 40 * 40 and (visible or not prefire) then
		local speed
		if AirTarget(target, 300) then
			local weapons = GredWeapons(entry)
			speed = weapons and weapons.main and weapons.main.speed or 50000
		elseif entry.kind == "ground" and not PR_Patrol.NoGroundLead then   -- NoGroundLead: сравнение в автотесте
			local weapons = GredWeapons(entry)
			speed = entry.shellKey and entry.shellSpeeds and entry.shellSpeeds[entry.shellKey]
				or (weapons and weapons.main and weapons.main.type == "MG" and weapons.main.speed) or nil
		end
		if speed and speed > 0 then
			local aimAt = to
			for _ = 1, 2 do aimAt = to + vel * (from:Distance(aimAt) / speed) end
			entry.leadDebug = math.Round(aimAt:Distance(to))
			to = aimAt
		end
	end
	-- Точка, куда целимся: стрелки на других местах (пулемёт командира) считают угол от своего ствола.
	-- У наземки им — без упреждения под снаряд пушки (пулемёт Луны бьёт лучом, пули Гредвича быстрее)
	entry.aimPoint = entry.kind == "ground" and unled or to
	-- Пушка наземки — выше на падение снаряда (стрелки других мест бьют пулями по aimPoint)
	local aimTo = to
	if entry.kind == "ground" then
		local drop = ShellDrop(entry, math.sqrt((to.x - from.x) ^ 2 + (to.y - from.y) ^ 2))
		if drop > 0 then aimTo = to + Vector(0, 0, drop) end
		entry.shellDropNow = drop
	end
	local desired = (aimTo - from):Angle()
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
	entry.desiredAng = desired
	entry.aimAng = entry.aimFix and (desired + entry.aimFix) or desired
	if entry.shellFix then entry.aimAng = entry.aimAng + entry.shellFix end
	-- Насколько можно промахнуться углом: цель ~70 юнитов (на 1000 — 4°, на 3000 — 1.3°)
	-- На 9000 цель — меньше полуградуса: нижний предел 0.3 (было 0.6 — на 7000 «встал» с промахом в рост)
	entry.aimTolerance = math.Clamp(math.deg(math.atan(70 / math.max(from:Distance(to), 1))), 0.3, 4)

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
	-- Стрелок вертолёта: огонь, только когда цель в секторе турели (под носом, вниз до её предела,
	-- вбок до GUNNER_YAW). На заходах (отход, разворот) цель то сзади, то над вертолётом — стрелок
	-- поливал в небо. Бортовые (Ми-8) — сбоку, у них своя схема (круг), не трогаем
	if entry.fire and entry.kind == "air" and not (PR_Patrol.GunnerSide or {})[entry.class] then
		local l = ent:WorldToLocal(to)
		local yaw = math.deg(math.atan2(l.y, l.x))
		local down = math.deg(math.atan2(-l.z, math.max(math.sqrt(l.x * l.x + l.y * l.y), 1)))
		local maxDown = (PR_Patrol.GunnerDown or {})[entry.class] or 70
		local maxYaw = GUNNER_YAW[entry.class] or 100
		if math.abs(yaw) > maxYaw or down < -10 or down > maxDown + 5 then
			entry.fire = false
			entry.sectorOut = (entry.sectorOut or 0) + 1
		end
	end
	entry.aimDebug = string.format("see=%s%s%s turned=%s%s", tostring(visible ~= nil), prefire and " prefire" or "", blocker and ("(" .. blocker .. ")") or "", tostring(turned),
		(entry.shellDropNow or 0) > 0 and string.format(" drop=%d", entry.shellDropNow) or "")
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
-- Для CrewAim (объявлен выше): пределы турели стрелка — огонь, только когда цель в её секторе
PR_Patrol.GunnerDown, PR_Patrol.GunnerSide = GUNNER_DOWN, GUNNER_SIDE
-- Точка круга — на столько градусов впереди вертолёта, радиус круга — не больше ORBIT_MAX. Круг
-- в 2800 с точкой на 35° впереди вертолёт проходил на ~570: на склонах то и дело «препятствие
-- впереди — ухожу вверх», и он набирал до 3000 высоты, где бортовые стволы цель не достают
local ORBIT_STEP = 20
local ORBIT_MAX = 2000

-- Расстояния, которые пробуем для места стрелка с узкой турелью (по каждому направлению)
local STANDOFF_DISTS = {1200, 1400, 1700, 2000, 2400, 2800}

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
		return not util.TraceLine({start = c, endpos = eye, mask = SIGHT_MASK}).Hit
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

-- opts (ракетный заход): breakDist — с какого расстояния отворот (по умолчанию 450), breakAway — как
-- далеко за цель уходить (1500), extraAlt — насколько выше обычного идти (0)
local function StrafePoint(entry, ent, target, opts)
	local now = CurTime()
	if entry.breakUntil and now < entry.breakUntil then return entry.breakPos end
	opts = opts or {}

	local tpos = target:WorldSpaceCenter()
	local pos = ent:GetPos()
	local flat = Vector(tpos.x - pos.x, tpos.y - pos.y, 0)
	if flat:Length() < (opts.breakDist or 450) then
		local away = flat:LengthSqr() > 1 and flat:GetNormalized() or ent:GetForward()
		away.z = 0
		-- Ракетный заход: отворот в сторону (на 40°), чтобы следующий заход шёл с другого направления
		if opts.breakDist then away:Rotate(Angle(0, (math.random(0, 1) * 2 - 1) * 40, 0)) end
		local p = tpos + away * (opts.breakAway or 1500)
		local ceil = CeilingAt(tpos)
		p.z = math.min(math.max(tpos.z + 700 + (opts.extraAlt or 0), TopAt(p.x, p.y, ceil, tpos.z) + AirSpec(entry, ent).clear + 200 + (opts.extraAlt or 0)), ceil - 250)
		entry.breakPos = p
		entry.breakUntil = now + (opts.breakTime or 6)
		return p
	end

	local spec = AirSpec(entry, ent)
	local climb = math.Clamp(StrafeAltitude(pos, tpos, spec.clear) + (opts.extraAlt or 0) - pos.z, -400, 400)
	-- Только что уходил от препятствия — пока не снижаемся, а то нырнёт в него же
	if entry.holdAltUntil and CurTime() < entry.holdAltUntil then climb = math.max(climb, 0) end

	-- Ещё не развернулся носом к цели (после отхода смотрит в другую сторону). Ракетный заход —
	-- разворот по дуге, как у самолёта: летит вперёд и доворачивает до 45° за раз (зависание и
	-- поворот на месте — медленно и неповоротливо). Остальные (OH-6) — зависают и доворачивают,
	-- иначе точка «вперёд по носу» унесла бы их прочь от цели
	local turnOff = math.AngleDifference((tpos - pos):Angle().y, ent:GetAngles().y)
	if math.abs(turnOff) > 30 then
		if opts.arc then
			local yaw = ent:GetAngles().y + math.Clamp(turnOff, -45, 45)
			return pos + Angle(0, yaw, 0):Forward() * opts.arc + Vector(0, 0, climb), false
		end
		return pos + Vector(0, 0, climb), true
	end

	local dive = math.Clamp(math.NormalizeAngle((tpos - ent:WorldSpaceCenter()):Angle().p), 0, 40)
	local forwardSpeed = ent:WorldToLocal(pos + ent:GetVelocity()).x
	-- Разогнался — нос почти ровно, пока не сбросит скорость (из пике на 500 тяжёлый не выходит)
	if forwardSpeed > spec.diveSpeed then dive = math.min(dive, 5) end
	-- Ракетный заход без остановок: медленнее minSpeed — нос ниже (до 15° сверх угла на цель), и
	-- вертолёт разгоняется (у LFS скорость — от наклона носа); иначе он полз к цели почти на месте
	local push = opts.minSpeed and math.Clamp(5 * (math.min(opts.minSpeed, spec.diveSpeed) - forwardSpeed), 0, 750) or 0
	-- true: заход на цель (нос на неё), а не отход
	return ent:LocalToWorld(Vector(50 * dive + 5 * forwardSpeed + push, 0, climb)), true
end

-- Ракетный заход вертолёта «бум-зум» — по записи полёта игрока на полигоне (Ка-50, 76 с, 6 заходов):
-- с горки ~3000 над целью пике носом на цель (30–48°), разгон до 2000+, огонь с ~8000 до ~2000;
-- у цели выход и проскок, горка (нос вверх, полный газ) с уходом на ~4500, на вершине — скорость
-- маленькая — разворот с креном, каждый раз в другую сторону (восьмёрка), и снова пике.
--   dive — пике на цель (огонь);  zoom — горка после проскока;  turn — разворот на вершине
-- Раньше заход шёл низко (~900) и не быстрее ~520 (diveSpeed), отход — к точке, у которой LFS
-- тормозит: вертолёт зависал у цели и разворачивался на месте. Возвращает точку и «пикирует ли»
local function RocketRunPoint(entry, ent, target, o)
	local now = CurTime()
	local pos = ent:GetPos()
	local tpos = target:WorldSpaceCenter()
	entry.rrTargetPos = tpos
	local flat = Vector(tpos.x - pos.x, tpos.y - pos.y, 0)
	local dist = flat:Length()
	local lvel = ent:WorldToLocal(pos + ent:GetVelocity())
	local fwd = lvel.x
	local vel = ent:GetVelocity()
	local heading = Vector(vel.x, vel.y, 0)
	if heading:LengthSqr() < 200 * 200 then heading = ent:GetForward() heading.z = 0 end
	heading:Normalize()
	local ceil = CeilingAt(tpos)
	local apexZ = math.min(tpos.z + o.apexHeight, ceil - 600)
	local ground = util.TraceLine({start = pos, endpos = pos - Vector(0, 0, 8000), mask = MASK_SOLID_BRUSHONLY})
	local agl = pos.z - ground.HitPos.z
	local below = math.deg(math.atan2(pos.z - tpos.z, math.max(dist, 1)))
	local noseYawOff = math.abs(math.AngleDifference(flat:Angle().y, ent:GetAngles().y))
	-- Куда на самом деле летит (а не куда смотрит нос): разворот кончается, когда на цель смотрит траектория
	local pathYawOff = math.abs(math.AngleDifference(flat:Angle().y, heading:Angle().y))
	-- На малой скорости направление полёта шумит: «траектория смотрит на цель» срабатывало ложно, и
	-- пике доворачивало нос на месте — до 400 считаем, что не смотрит
	if vel:Length2D() < 400 then pathYawOff = 180 end

	-- Начало: рядом с целью — сперва отойти для разгона, далеко — развернуться на неё
	local mode = entry.rrMode or (dist < o.extend and "zoom" or "turn")
	if mode == "dive" then
		-- Выход: близко к цели, низко, до земли меньше 2,5 с или цель уже круто под брюхом
		local impact = vel.z < -50 and agl / -vel.z or math.huge
		-- «Проскочил» (летит уже прочь) — только вблизи: сразу после разворота скорость ещё смотрит
		-- от цели, и выход срабатывал мгновенно (пике ↔ отход дёргались, 23 «захода» за минуту)
		-- Высота выхода — с учётом скорости: на ~1400 Ми-24 выходил на 750 над землёй и проседал до неё
		local minAGL = math.max(o.minAGL, vel:Length() * 0.8)
		if dist < o.pullDist or agl < minAGL or impact < 3.5 or below > 65 or (dist < 3000 and heading:Dot(flat:GetNormalized()) < 0) then
			mode = "zoom"
		end
	elseif mode == "zoom" then
		-- Отход: прочь от цели с разгоном, пока не уйдёт на extend (только по расстоянию: раньше
		-- отход кончался, едва набрав высоту вершины, — у самой цели, и вертолёт крутился над ней)
		-- Отход «завис» (скорость < 300 дольше 3 с: у Ка-50 у потолка неба) — разворачиваемся
		if fwd < 300 then entry.rrSlowSince = entry.rrSlowSince or now else entry.rrSlowSince = nil end
		local stalled = entry.rrSlowSince and now - entry.rrSlowSince > 3 and dist > 3000
		-- Край карты по ходу ближе ~5 с полёта — разворот сейчас и к центру (уходил в стену неба на западе)
		local mapCfg = PR_MINIMAPS and PR_MINIMAPS[string.lower(game.GetMap())]
		local ahead = pos + heading * math.max(vel:Length2D() * 5, 3000)
		local nearEdge = mapCfg and (ahead.x < mapCfg.minX or ahead.x > mapCfg.maxX or ahead.y < mapCfg.minY or ahead.y > mapCfg.maxY)
		if dist > o.extend or stalled or (nearEdge and dist > 3000) then
			entry.rrSlowSince = nil
			mode = "turn"
			entry.rrTurnSign = -(entry.rrTurnSign or 1)   -- каждый раз в другую сторону: восьмёрка
			if nearEdge then
				local c = Vector((mapCfg.minX + mapCfg.maxX) / 2, (mapCfg.minY + mapCfg.maxY) / 2, 0)
				entry.rrTurnSign = math.AngleDifference((c - pos):Angle().y, heading:Angle().y) >= 0 and 1 or -1
			end
		end
	elseif mode == "turn" then
		if pathYawOff < 25 and noseYawOff < 30 and dist > o.pullDist + 500 then
			mode = "approach"
		elseif vel:Length2D() < 400 and noseYawOff < 20 and dist > o.pullDist + 500 then
			-- Медленно, но нос уже на цели — подход (разгон к цели), а не кружение до таймера
			mode = "approach"
		elseif pathYawOff < 25 then
			-- Развернулся, а цель совсем рядом — ещё горка (уйти подальше для пике)
			mode = "zoom"
		end
	end
	-- Подход: после разворота — к цели на высоте вершины, пике — когда цель под углом diveAngle и круче
	-- (как у игрока: 30–48°). Раньше пике начиналось сразу после разворота в 11–13 тыс. от цели —
	-- полого (16–28°), к цели подходил низко и цеплял краны и крыши
	if mode == "approach" then
		if below >= o.diveAngle or dist < o.pullDist + 1500 then
			mode = "dive"
			entry.rrNewRun = true
		elseif pathYawOff > 60 and vel:Length2D() >= 400 then
			mode = "turn"
		end
	end
	if mode ~= entry.rrMode then entry.rrModeAt = now end
	-- Застрял: отход дольше 35 с (медленный AH-64) — разворот; разворот или подход дольше 20 с — пике.
	-- Раньше по 20 с отхода сразу пике — нос доворачивался на месте
	local stuckFor = now - (entry.rrModeAt or now)
	if mode == "zoom" and stuckFor > 35 then
		mode, entry.rrModeAt = "turn", now
		entry.rrTurnSign = -(entry.rrTurnSign or 1)
	elseif mode == "turn" and stuckFor > 8 and dist > o.fireFrom then
		-- Разворот затянулся вдали — к цели подходом (пике отсюда шло с 12–15 тысяч, стрелок не доставал)
		mode, entry.rrModeAt = "approach", now
	elseif ((mode == "turn" and stuckFor > 8) or (mode == "approach" and stuckFor > 20)) and dist > o.pullDist then
		mode, entry.rrNewRun, entry.rrModeAt = "dive", true, now
	end
	entry.rrMode = mode

	-- Точки для ИИ вертолёта LFS (в осях вертолёта): тангаж P = x·0.02 − скорость·0.1, крен
	-- R = −y·0.02 + скорость_вбок·0.1, тяга — по z. Курс — UpdateFacing (faceYaw)
	if mode == "approach" then
		-- К цели на высоте вершины, нос ровно-чуть вниз (разгон), курс на цель
		entry.faceYaw = flat:Angle().y
		return ent:LocalToWorld(Vector(500 + 5 * fwd, 0, math.Clamp(apexZ - pos.z, -300, 3000))), false
	end
	if mode == "dive" then
		entry.faceYaw = nil
		local d = math.Clamp(math.NormalizeAngle((tpos - ent:WorldSpaceCenter()):Angle().p), 0, 45)
		return ent:LocalToWorld(Vector(50 * d + 5 * fwd, 0, 0)), true
	elseif mode == "zoom" then
		-- Отход с разгоном: нос чуть вниз (10°) и газ на подъём — вертолёт и разгоняется, и набирает
		-- высоту (раньше нос вверх на 15° — на отходе он полз на 250–550). Курс — прямо по ходу: из
		-- пике, вышедшего до цели, он пролетает над ней и уходит на другую сторону (восьмёрка). Раньше
		-- курс был «прочь от цели» — он разворачивался назад, не долетев, и кружил овалом с одной стороны
		entry.faceYaw = heading:Angle().y
		local climb = pos.z < apexZ and 3000 or 0
		-- Разгон до zoomSpeed, дальше нос ровнее (P = 0.02·x − 0.1·fwd)
		return ent:LocalToWorld(Vector(5 * fwd + math.Clamp(5 * ((o.zoomSpeed or 9999) - fwd), -500, 750), 0, climb)), false
	end
	-- Разворот по дуге: нос — на 35° впереди направления полёта (не от носа: раньше нос крутился на
	-- месте быстрее, чем поворачивала траектория, — пируэт с потерей скорости). Крен не задаём: ИИ LFS
	-- сам кренит против бокового скольжения (скорость_вбок·0.1) — в сторону разворота. Нос вниз на 15°
	-- держит скорость (медленнее 600 — без набора высоты: сначала разгон); высота — к вершине
	local sign = entry.rrTurnSign or 1
	-- Нос впереди траектории — тем больше, чем быстрее: на малой скорости (< 300) не ведём вовсе,
	-- сперва разгон по прямой (иначе нос и скорость вращались вместе — вертолёт кружил на месте)
	local lead = 55 * math.Clamp((vel:Length2D() - 300) / 400, 0, 1)
	entry.faceYaw = heading:Angle().y + sign * lead
	-- Скорость в развороте — не выше turnSpeed (радиус ∝ скорости²)
	-- Крен в сторону разворота (~30°: R = −0.02·y + 0.1·скорость_вбок): без него ИИ LFS поворачивал
	-- одним носом, траектория еле загибалась — разворот уводил на 4–8 тысяч вбок
	local side = vel:Length2D() > 400 and sign * 1500 or 0
	return ent:LocalToWorld(Vector(5 * fwd + math.Clamp(5 * ((o.turnSpeed or 9999) - fwd), -500, 750), side, fwd < 600 and 0 or math.Clamp(apexZ - pos.z, -300, 3000))), false
end
-- «Доебался» — лёгкие вертолёты (Little Bird и подобные): кружат вокруг цели носом на неё и бьют
-- почти непрерывно, всё время в движении, чтобы их было трудно сбить. По записи игрока на полигоне
-- (OH-6, 64 с): ~20°/с вокруг цели, боком (боковая ~600, вперёд ~0), нос на цели 72% времени, огонь
-- 71%; расстояние «дышит» 500–3500 (в среднем ~1700), ~1200 над землёй. Здесь: точка на круге на
-- lead градусов впереди, радиус качается между rMin и rMax, высота — ±200, сторона кружения
-- меняется раз в 8–15 с (не идёт по ровному кругу, в который легко прицелиться)
local DOEBALSYA = {
	-- OH-6 — по циклу «круг → заход → проскок → отход» (phased, см. DoebalsyaPhased)
	-- OH-6 — «устрашитель» (ring): быстро по ровному кругу носом на цель и почти непрерывный огонь
	-- (пушка при носе до suppress° от цели). Поля phased-цикла оставлены — ring = false вернёт заходы
	gred_lfs_oh6 = {phased = true, ring = true, ringR = 1900, ringVt = 860, flip = false, suppress = 14, height = 1200,
		rOrbit = 2000, rMin = 550, wMax = 24, k = 1, minAGL = 1100, orbitTime = {6, 10}, runVt = 400, yawLead = 0.3, noseUpMax = 5},
	lfs_grdn_md500tow = {rMin = 3500, rMax = 6000, height = 2200, vt = 800, vr = 250},   -- с ПТУР — шире (по записи ~4700)
	lfs_grdn_bo105pah1 = {rMin = 1800, rMax = 3400, height = 1400},
	lfs_grdn_hkp9a = {rMin = 1800, rMax = 3400, height = 1400},
	lfs_grdn_sa316b = {rMin = 900, rMax = 2500, height = 1250, vt = 450, vr = 350},
}
PR_Patrol.DOEBALSYA = DOEBALSYA
-- lead — на сколько градусов вперёд по кругу точка (30 — полз маятником); breath — период «дыхания»
-- радиуса, с; assist — доводка пуль по курсу, ° (по высоте — до 50: нос, кружа боком, вниз не смотрит)
local DB_OPT = {lead = 70, breath = 11, assist = 15}

-- OH-6 «доебался» по циклу (совет эксперта по реальной тактике: «колесо» с заходами). Нос — в центр
-- круга, значит «вперёд» = к цели: чтобы держать круг, нужен постоянный наклон носа вниз
-- atan(vt²/(R·g)), и при vt ≈ √(g·h) он сам равен углу на цель — нос лежит на цели без «нырков».
-- ORBIT (6–10 с, ≤ wMax°/с) → RUN-IN (разгон к цели носом на неё, огонь) → PASS (проскок мимо, без
-- огня) → EXTEND (накат, затем торможение носом на цель — огонь на отходе) → ORBIT. Тангаж в точке:
-- pitch = 0.02·x − 0.1·v_fwd ⇒ x = 5·v_нужная + 50·pitch
local function DoebalsyaPhased(entry, ent, target, cfg)
	local now = CurTime()
	local pos, vel = ent:GetPos(), ent:GetVelocity()
	local tpos = target:WorldSpaceCenter()
	local rel = Vector(pos.x - tpos.x, pos.y - tpos.y, 0)
	local dist = math.max(rel:Length(), 1)
	local inward = -rel / dist
	if not entry.dbDir then
		entry.dbDir = math.random(0, 1) * 2 - 1
		entry.dbPhase = math.Rand(0, math.pi * 2)
	end
	local tangent = Vector(-inward.y, inward.x, 0) * entry.dbDir
	local vIn = vel:Dot(inward)                                   -- к цели (+) / от цели (−)
	local fwd = ent:WorldToLocal(pos + vel).x
	local hRel = math.max(pos.z - tpos.z, 200)
	local delta = math.deg(math.atan2(hRel, dist))               -- угол на цель вниз
	local G = 600
	local w = math.min(cfg.wMax, math.deg(math.sqrt(cfg.k * G * hRel) / dist))
	local vt = math.rad(w) * dist
	local thC = math.deg(math.atan(vt * vt / (dist * G)))
	-- Упреждение курса на угловую скорость облёта: нос отставал от цели > 6° — огня не было
	local omega = math.deg((rel.x * vel.y - rel.y * vel.x) / (dist * dist))
	entry.dbYawLead = math.Clamp(omega * (cfg.yawLead or 0.3), -12, 12)
	entry.rrTargetPos = tpos

	if cfg.ring then
		-- Только круг (по совету эксперта): при vt ≈ √(g·h) центростремительный наклон = углу на цель,
		-- нос сам лежит на цели. R 1900 / 830 → ~25°/с (быстрее нос LFS не успевает). Против прицела
		-- «дышит» скорость (±8%, 6 с), радиус — медленно (±150, 25 с); направление — раз в 30–45 с,
		-- плавно за ~3 с (нос на это время поднимается — огня нет, честно)
		local dt = math.Clamp(now - (entry.dbLastT or now), 0, 0.5)
		entry.dbLastT = now
		local t0 = Vector(-inward.y, inward.x, 0)                    -- против часовой
		if not entry.dbK then entry.dbK, entry.dbKWant, entry.dbFlipAt = entry.dbDir, entry.dbDir, now + math.Rand(30, 45) end
		if cfg.flip and now > entry.dbFlipAt then entry.dbKWant, entry.dbFlipAt = -entry.dbKWant, now + math.Rand(30, 45) end
		entry.dbK = math.Approach(entry.dbK, entry.dbKWant, dt * 2 / 3)
		local flipping = entry.dbK ~= entry.dbKWant
		-- Без «дыхания» скорости: с периодом 6 с оно раскачивало радиус (собственный период ~6–7 с).
		-- Тангаж — не в упор в предел 40°: в насыщении круг не держался, вертолёт выносило наружу
		local R = cfg.ringR + 100 * math.sin(now * 2 * math.pi / 25 + entry.dbPhase)
		local v2 = vel:Length2D()
		-- Нос — ТОЧНО на цель (вблизи он был на 9–12° выше — пули за цель, вдали на 13–17° ниже).
		-- Тогда наклон к центру = углу на цель, и круг держится при v = √(g·h) на любом радиусе;
		-- радиус держим скоростью: дальше R — медленнее (затягивает внутрь), ближе — быстрее
		local vt0 = math.sqrt(G * hRel) * math.Clamp(1 - 0.6 * (dist - R) / R, 0.75, 1.2)
		local vtW = vt0 - 0.6 * math.max(0, v2 - vt0)
		local vtA = vel:Dot(t0)
		local thA = math.min(math.deg(math.atan(vtA * vtA / (dist * G))), 34)
		entry.dbRI = math.Clamp((entry.dbRI or 0) + 0.004 * (dist - R) * dt, -4, 4)
		local vRad = math.Clamp(0.6 * (dist - R), -150, 150)
		if flipping then vRad = math.min(vRad, 0) end
		local dAim = math.deg(math.atan2(ent:WorldSpaceCenter().z - target:WorldSpaceCenter().z, dist))
		local pitchCmd = math.Clamp(dAim + (cfg.aimOff or 0) + math.Clamp(-0.02 * vIn, -4, 4), -5, 37)   -- −0,02·vIn: гасит качание радиуса
		-- На смене направления касательная проходит через ноль — круг держать нечем, и нос «на цель»
		-- тянул к ней (проваливался до ~360, потом подъём выносил на 6000): наклон — только для круга
		if flipping then pitchCmd = math.Clamp(thA + math.Clamp(0.1 * (vRad - vIn), -8, 8), -5, 37) end
		-- Вынесло далеко (подъём от препятствия на скорости) — вернуться к кругу носом вниз, а не дрейфом
		if dist > 1.4 * R and vIn < 400 then pitchCmd = math.max(pitchCmd, 28) end
		-- Низко над землёй (или цель почти под нами) — нос вниз не больше 15°: иначе пикирует в землю
		local gtr = util.TraceLine({start = pos, endpos = pos - Vector(0, 0, 8000), mask = MASK_SOLID_BRUSHONLY})
		if pos.z - gtr.HitPos.z < 900 then pitchCmd = math.min(pitchCmd, 15) end
		local x = 5 * fwd + 50 * pitchCmd
		if cfg.noseUpMax then x = math.max(x, 5 * fwd - 50 * cfg.noseUpMax) end
		local yawAng = Angle(0, ent:GetAngles().y, 0)
		local y = 5 * (t0 * vtW * entry.dbK):Dot(yawAng:Right() * -1)
		local ceil = CeilingAt(tpos)
		local spec = AirSpec(entry, ent)
		local z = tpos.z + cfg.height + 100 * math.sin(now * 2 * math.pi / 9 + entry.dbPhase)
		for _, f in ipairs({0, 0.3, 0.6}) do
			z = math.max(z, TopAt(pos.x - rel.x * f, pos.y - rel.y * f, ceil, tpos.z) + math.max(spec.clear + 450, cfg.minAGL or 0))
		end
		z = math.min(z, ceil - 300)
		-- Нос LFS отстаёт от заданного курса на ~10° при 25°/с — упреждения ω·0,3 мало: интегратор по
		-- фактической ошибке курса на цель доводит её до нуля (в обе стороны облёта)
		local yawErr = math.AngleDifference(ent:GetAngles().y, (tpos - pos):Angle().y)
		if flipping then
			entry.dbYawI, entry.dbYawLead = 0, 0
		else
			entry.dbYawI = math.Clamp((entry.dbYawI or 0) - 1.2 * yawErr * dt, -15, 15)
			entry.dbYawLead = math.Clamp(entry.dbYawLead + entry.dbYawI, -25, 25)
		end
		entry.dbState, entry.dbNoFire = flipping and "flip" or "ring", false
		entry.dbRadius, entry.dbClosing = dist, false
		return ent:LocalToWorld(Vector(x, y, math.Clamp(z - pos.z, -400, 600)))
	end

	-- Наклон и скорость — по ФАКТИЧЕСКОЙ касательной (по заданной лишний наклон утягивал к цели);
	-- радиус круга — от высоты над целью: δ на круге ≈ 32°
	local vtAct = vel:Dot(tangent)
	local thA = math.deg(math.atan(vtAct * vtAct / (dist * G)))
	local rEff = math.Clamp(1.6 * hRel, 1600, 3200)
	local vtWant = math.min(math.sqrt(dist * G * math.tan(math.rad(math.max(delta, 15)))), math.rad(cfg.wMax) * dist)

	local st = entry.dbState
	if not st or not entry.dbStateAt then
		st, entry.dbStateAt, entry.dbOrbitFor = dist < 600 and "extend" or "orbit", now, math.Rand(cfg.orbitTime[1], cfg.orbitTime[2])
	end
	local since = now - entry.dbStateAt
	local function go(s) st, entry.dbStateAt, since = s, now, 0 end
	if st == "orbit" and since > entry.dbOrbitFor and delta <= 34 and vtAct >= 500 and vIn > -80 and math.abs(dist - rEff) <= 300 then
		-- Хорда захода чиста (заход + проскок + 900 на накат)? Иначе ещё полкруга
		local beyond = tpos + inward * 900 + Vector(0, 0, hRel * 0.4)
		local tr = util.TraceLine({start = pos, endpos = beyond, mask = MASK_SOLID_BRUSHONLY})
		if tr.Fraction > 0.97 then
			go("runin")
			-- Точка захода замораживается: иначе она ехала вместе с вертолётом и заход шёл по дуге
			entry.dbAim = tpos + tangent * 400
		else entry.dbOrbitFor = since + 3 end
	elseif st == "runin" and (dist < 900 or delta > 46 or since > 3.5) then
		go("pass")
		local c = Vector(entry.dbAim.x - pos.x, entry.dbAim.y - pos.y, 0)
		entry.dbChord = c:LengthSqr() > 100 and c:GetNormalized() or inward
	elseif st == "pass" and ((vIn < -200 and dist > 700) or since > 2.5) then go("extend")
	elseif st == "extend" and (dist > 0.75 * rEff or since > 8) then
		go("orbit"); entry.dbOrbitFor = math.Rand(cfg.orbitTime[1], cfg.orbitTime[2])
		if math.random(0, 2) == 0 then entry.dbDir = -entry.dbDir; tangent = -tangent; vtAct = -vtAct end   -- иногда — в другую сторону
	end
	entry.dbState = st

	local yawAng = Angle(0, ent:GetAngles().y, 0)
	local fwd2, left2 = yawAng:Forward(), yawAng:Right() * -1
	local x, y, side
	local noseUp, noFire = cfg.noseUpMax, false
	if st == "orbit" then
		-- Входит с отхода (vIn ≈ −400): радиальная связь тормозит отход носом вниз на цель — огонь,
		-- пока крен набирает касательную. Внутрь — не быстрее 150 (меньше утягивания к цели)
		x = 5 * math.Clamp(0.6 * (dist - rEff), -250, 150) + 50 * thA
		side = math.min(math.rad(cfg.wMax) * math.max(dist, rEff), 850)
	elseif st == "runin" then
		local want = Vector(entry.dbAim.x - pos.x, entry.dbAim.y - pos.y, 0):GetNormalized() * 900
		x, side = 5 * fwd + 50 * math.min(delta, 40), want:Dot(tangent)
	elseif st == "pass" then
		-- Проскок по хорде на скорости ≥ 650: сам выносит наружу, без зависания у цели
		local want = entry.dbChord * math.max(vel:Length2D(), 650)
		x, y = 5 * want:Dot(fwd2), 5 * want:Dot(left2)
		noFire = true
	else
		-- Отход — накат по инерции; медленный проскок — честный задний ход (нос вверх до 12°, без огня)
		x, side = 5 * fwd, vtAct
		if vIn > -150 and dist < 0.6 * rEff then
			x, noseUp, noFire = 5 * -350, 12, true
		end
	end
	entry.dbNoFire = noFire
	if noseUp then x = math.max(x, 5 * fwd - 50 * noseUp) end
	y = y or 5 * (tangent * side):Dot(left2)

	-- Высота: над целью, выше крыш под вертолётом и по пути к цели (в заходе — чуть ниже, на проскоке выше)
	local ceil = CeilingAt(tpos)
	local spec = AirSpec(entry, ent)
	local low = st == "runin" or st == "pass"
	local z = tpos.z + (low and 0.8 or 1) * cfg.height + (st == "pass" and 200 or 0)
	local agl = math.max(spec.clear + 450, low and 850 or (cfg.minAGL or 0))
	for _, f in ipairs({0, 0.3, 0.6}) do
		z = math.max(z, TopAt(pos.x - rel.x * f, pos.y - rel.y * f, ceil, tpos.z) + agl)
	end
	z = math.min(z, ceil - 300)
	entry.dbRadius, entry.dbClosing = dist, st == "runin"
	return ent:LocalToWorld(Vector(x, y, math.Clamp(z - pos.z, -400, 600)))
end

local function DoebalsyaPoint(entry, ent, target, cfg)
	if cfg.phased then return DoebalsyaPhased(entry, ent, target, cfg) end
	local now = CurTime()
	local pos = ent:GetPos()
	local tpos = target:WorldSpaceCenter()
	-- Сторона кружения: меняется только после полного круга (и то с вероятностью 1/2): раньше смена
	-- раз в 8–15 с давала маятник по дуге в 60–80° с одной стороны цели
	local bearingNow = math.deg(math.atan2(pos.y - tpos.y, pos.x - tpos.x))
	if entry.dbLastBearing then
		entry.dbAccum = (entry.dbAccum or 0) + math.abs(math.AngleDifference(bearingNow, entry.dbLastBearing))
	end
	entry.dbLastBearing = bearingNow
	if not entry.dbDir then
		entry.dbDir = math.random(0, 1) * 2 - 1
		entry.dbPhase = math.Rand(0, math.pi * 2)
	elseif (entry.dbAccum or 0) >= 360 then
		entry.dbAccum = 0
		if math.random(0, 1) == 1 then entry.dbDir = -entry.dbDir end
	end
	-- Управление скоростью, а не точками (ИИ LFS: в равновесии скорость по оси ≈ 0,2 × точка по этой
	-- оси): вокруг цели — постоянная скорость vt, по радиусу — к «дышащему» радиусу (не быстрее vr).
	-- Раньше фазы «атака/отход» давали йо-йо по радиусу: отход по инерции на 5500 (MD-500 — на 17600),
	-- проскоки у цели на 80°/с, кружения почти не было. Нос (курс) — на цель; на сближении нос ниже —
	-- стреляет, только когда действительно навёлся (честно: игрок видел подкрутку пуль)
	local flat = Vector(tpos.x - pos.x, tpos.y - pos.y, 0)
	local dist = flat:Length()
	local inward = dist > 1 and flat / dist or ent:GetForward()
	local tangent = Vector(-inward.y, inward.x, 0) * entry.dbDir   -- +dbDir — против часовой
	local mid, amp = (cfg.rMin + cfg.rMax) / 2, (cfg.rMax - cfg.rMin) / 2
	local rWant = mid + amp * math.sin(now * 2 * math.pi / 14 + entry.dbPhase)
	local closing = math.cos(now * 2 * math.pi / 14 + entry.dbPhase) < 0   -- радиус сейчас уменьшается
	local vr = cfg.vr or 350
	local vOut = math.Clamp((rWant - dist) * 0.8, -vr, vr)
	if dist < (cfg.minDist or 800) then vOut = vr end
	-- На сближении и на ближней стороне круга — медленнее: нос успевает за целью (вблизи на 18–23°/с не успевал)
	local vt = (cfg.vt or 450) * (closing and 0.7 or 1) * ((cfg.nearSlow and dist < (cfg.rMin + cfg.rMax) / 2) and cfg.nearSlow or 1)
	local want = tangent * vt + (-inward) * vOut
	-- Высота: над целью ± качание, выше крыш и склонов под вертолётом и по пути к цели (с запасом)
	local ceil = CeilingAt(tpos)
	local spec = AirSpec(entry, ent)
	local z = tpos.z + cfg.height + math.sin(now * 2 * math.pi / 7 + entry.dbPhase) * 200
	for _, f in ipairs({0, 0.3, 0.6}) do
		z = math.max(z, TopAt(pos.x + flat.x * f, pos.y + flat.y * f, ceil, tpos.z) + math.max(spec.clear + 450, cfg.minAGL or 0))
	end
	z = math.min(z, ceil - 300)
	-- В осях вертолёта по курсу (без тангажа и крена)
	local fwd = ent:WorldToLocal(pos + ent:GetVelocity()).x
	local yawAng = Angle(0, ent:GetAngles().y, 0)
	local fwd2, left2 = yawAng:Forward(), yawAng:Right() * -1
	local x = 5 * want:Dot(fwd2)
	local y = 5 * want:Dot(left2)
	-- Нос вниз к цели (сверх нужного для скорости), чтобы навестись по высоте: «нырки» раз в 3 с
	-- на 2,5 с — очередь (как у игрока), плюс слегка на сближении. Кружа боком, нос сам вниз не смотрит
	-- (период и длина нырка — свои у каждого класса; по умолчанию 4 с / 1,6 с; nearSlow — нырки только
	-- на дальней стороне круга, где нос успевает за целью)
	local dip = (now + entry.dbPhase) % (cfg.dipEvery or 4) < (cfg.dipLen or 1.6)
	if cfg.dipFarOnly and dist < (cfg.rMin + cfg.rMax) / 2 then dip = false end
	if (dip or closing) and dist > (cfg.minDist or 800) then
		local d = math.Clamp(math.NormalizeAngle((tpos - ent:WorldSpaceCenter()):Angle().p), 0, 45)
		x = x + (dip and 50 or 25) * math.min(d, cfg.dipMax or 45)
	end
	-- Нос вверх не больше noseUpMax° (тангаж = x·0.02 − скорость·0.1): после нырка OH-6 задирал нос на
	-- 25° — «кивал» на месте. Тормозит пусть дольше, зато ровно
	if cfg.noseUpMax then x = math.max(x, 5 * fwd - 50 * cfg.noseUpMax) end
	entry.dbRadius, entry.dbClosing = dist, closing
	return ent:LocalToWorld(Vector(x, y, math.Clamp(z - pos.z, -400, 600)))
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
	-- Пике ракетного захода: «препятствие» по ходу — земля у самой цели (пикируем на неё же), выход
	-- из пике считает сам заход (RocketRunPoint: высота, время до земли). Иначе на 2000 юнитов в
	-- секунду взгляд на 2–3 с вперёд упирался в землю, и пике срывалось сразу
	local frontHit = front.Hit and not front.HitSky
	if frontHit and (entry.rrMode == "dive" or (entry.airMode == "doebalsya" and entry.dbState == "runin")) and entry.rrTargetPos and front.HitPos:Distance(entry.rrTargetPos) < 4000 then frontHit = false end
	-- Сколько до препятствия впереди (с какой скоростью можно уходить вверх, не тормозя)
	entry.pullFront = frontHit and front.Fraction * ahead:Length() or nil
	if frontHit or below.Hit or ent.RotorHit then
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
	lfs_grdn_ec665uht = {1, 2, 3, 4, 5}, lfs_grdn_hkp9a = {1, 2}, lfs_grdn_ka50 = {2}, lfs_grdn_md500tow = {1, 2},
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
-- Ракетный заход вертолёта (RunAI): огонь с fireFrom, отворот в breakDist, уход на breakAway за цель
-- arc — разворот по дуге: точка на столько впереди по ходу (вертолёт не зависает)
-- minSpeed — не медленнее (разгон наклоном носа), assist — пуск ракет при носе до стольких градусов от цели
local ROCKET_RUN = {apexHeight = 4500, diveAngle = 28, fireFrom = 8000, fireTo = 1800, pullDist = 2000, minAGL = 900, extend = 4500, assist = 20, tilt = 38,
	zoomSpeed = 1300, turnSpeed = 1000}   -- потолки скорости: на 1800 разворот уводил на 12–15 тысяч

-- Чем бить цель такого вида (по порядку): технику — ракетами и пушкой, самолёт — пушкой,
-- пехоту — пушкой, а ракетами, только если пушки нет (Ми-24 с одними ракетами)
local function PilotWeapons(entry, ent, kind)
	local weapons = WeaponsOf(entry)
	if not weapons then return {} end
	local broken = entry.brokenWeapons or {}
	local gun = weapons.gun and not broken.gun and weapons.gun.ammo(ent) and weapons.gun or nil
	-- Префайр: ракеты (сколько осталось на это укрытие) и пушка — очередью в дверь и окна
	if kind == "prefire" then
		local rockets = weapons.rockets and not broken.rockets and weapons.rockets.ammo(ent) and (entry.prefireLeft or 0) > 0 and weapons.rockets or nil
		return {rockets, gun}
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
	return off, not util.TraceLine({start = from, endpos = to, filter = ent, mask = SIGHT_MASK}).Hit
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
	if a.maxYaw then
		-- Раздельно по курсу и по высоте («доебался»: нос по курсу на цели, но вниз почти не смотрит)
		local want = dir:Angle()
		if math.abs(math.AngleDifference(want.y, ang.y)) > a.maxYaw or math.abs(math.AngleDifference(want.p, ang.p)) > a.maxPitch then return ang end
	elseif ang:Forward():Dot(dir) < math.cos(math.rad(a.max)) then
		return ang
	end
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
	-- На ракетном заходе (ипподром) — пуск при носе до ROCKET_RUN.assist от цели: нос на цель
	-- встаёт поздно, уже вблизи, и залп не успевал выйти целиком (3–5 ракет вместо 8)
	local assist = hover and HOVER_ASSIST or (entry.rrMode == "dive" and ROCKET_RUN.assist) or ROCKET_AIM_ASSIST
	if not aimed then
		off, clear = NoseOff(ent, target)
		if not clear then return 0 end
		if hover then
			local l = ent:WorldToLocal(target:WorldSpaceCenter())
			local yaw = math.deg(math.atan2(l.y, l.x))
			local down = math.deg(math.atan2(-l.z, math.max(l.x, 1)))
			-- «Доебался» кружит боком, нос LFS вниз не смотрит: по курсу до 12°, ниже носа до 60°, пушку и
			-- ракеты доводим (иначе OH-6 за минуту не выстрелил ни разу)
			local loose = entry.airMode == "doebalsya"
			if l.x <= 0 or math.abs(yaw) > (loose and 10 or 8) or down < -5 or down > (loose and 60 or 40) then return 0 end
			-- Пушку — по курсу; ракеты и ПТУР — только когда нос на цели целиком (≤ 15°): в третьем прогоне
			-- MD-500 выпускал все ПТУР на развороте мимо
			if loose then entry.dbRocketsOK, off = off <= 15, 0 end
		elseif off > (kind == "vehicle" and assist or (entry.airMode == "doebalsya" and entry.dbSuppress or 6)) then
			return 0
		end
	end
	entry.pilotNose = (entry.pilotNose or 0) + 1

	local weapons = WeaponsOf(entry)
	if not weapons then
		-- Остальные (OH-6): обычное «нажать огонь»
		if isfunction(ent.HandleWeapons) then
			-- Обычная поправка пуль (4°), как у остальных вертолётов; с места — шире
			if not aimed then PilotAssist = {to = TargetPoint(target), max = hover and HOVER_ASSIST or BULLET_AIM_ASSIST} end
			local ok, err = pcall(ent.HandleWeapons, ent, true)
			PilotAssist = nil
			if not ok then error(err, 0) end
		end
		return 0
	end
	local list = {}
	for _, w in pairs(PilotWeapons(entry, ent, kind)) do
		local rocketsOK = w ~= weapons.rockets or not (hover and entry.airMode == "doebalsya") or entry.dbRocketsOK
		if (off <= (entry.airMode == "doebalsya" and entry.dbSuppress or 6) or w == weapons.rockets) and rocketsOK then list[#list + 1] = w end
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
	if not aimed then PilotAssist = (hover and entry.airMode == "doebalsya") and {to = TargetPoint(target), maxYaw = DB_OPT.assist, maxPitch = 50} or {to = TargetPoint(target), max = BULLET_AIM_ASSIST} end
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
			-- Ракета в полёте падает: точку поднимаем на замеренное падение для этой дальности (ShellDrop —
			-- по своим же ракетам этого вида; с 4000–8000 по прямой Ка-50 не попадал ни одной)
			local key = rocket:GetClass()
			entry.shellKey, entry.rocketKey = key, key
			if not aimed then
				local tp = TargetPoint(target)
				local rpos = rocket:GetPos()
				tp = tp + Vector(0, 0, ShellDrop(entry, math.sqrt((tp.x - rpos.x) ^ 2 + (tp.y - rpos.y) ^ 2)))
				local want = (tp - rpos):GetNormalized()
				local rphys = rocket:GetPhysicsObject()
				if rocket:GetForward():Dot(want) > math.cos(math.rad(assist + 3)) then
					rocket:SetAngles(want:Angle())
					if IsValid(rphys) then rphys:SetVelocity(want * rphys:GetVelocity():Length()) end
				end
			end
			-- ПТУР (TOW, Hellfire, 9М…) без своего наведения летели как НУР — в «доебался» MD-500 мазал
			-- всеми. Ведём их на цель в полёте (как проводное наведение)
			local cls = string.lower(key)
			if not rocket.JDAM and not target.PR_Point and (cls:find("bgm71", 1, true) or cls:find("tow", 1, true) or cls:find("hellfire", 1, true)
				or cls:find("agm", 1, true) or cls:find("9m1", 1, true)) then
				local aimBody = AimBody(target)
				-- На пуске — сразу на цель (как TOW по линии прицела): вертолёт, кружа боком, держит нос
				-- почти горизонтально, и ракета уходила на 60–70° мимо, а потом разгонялась до 7000 и уже
				-- не доворачивала
				if IsValid(aimBody) then
					local w = (aimBody:WorldSpaceCenter() - rocket:GetPos()):GetNormalized()
					if w:Dot(ent:GetForward()) > 0 then
						rocket:SetAngles(w:Angle())
						local rp0 = rocket:GetPhysicsObject()
						if IsValid(rp0) then rp0:SetVelocity(w * rp0:GetVelocity():Length()) end
					end
				end
				rocket.PR_ATGM = true
				local id = "PR_ATGM" .. rocket:EntIndex()
				timer.Create(id, 0.05, 200, function()
					local rp = IsValid(rocket) and rocket:GetPhysicsObject()
					if not (IsValid(rp) and IsValid(aimBody)) then timer.Remove(id) return end
					local v = rp:GetVelocity()
					local speed = v:Length()
					if speed < 50 then return end
					local dir, want = v / speed, (aimBody:WorldSpaceCenter() - rocket:GetPos()):GetNormalized()
					local ang = math.deg(math.acos(math.Clamp(dir:Dot(want), -1, 1)))
					-- Прямо на цель (проводное наведение): постепенный доворот не успевал — ракета разгонялась
					-- до 7000 и проскакивала. Скорость постоянная 3500: с переустановкой скорости каждый тик
					-- двигатель её не разгонял, и TOW ползли на ~700 («слоумо»)
					-- Физика ракеты Гредвича съедала скорость (ставили 3500 — сближалась на ~450/с, топливо
					-- кончалось раньше, «слоумо» и промахи). Ведём её сами: шаг по линии на цель, перед шагом
					-- луч — задела что-то (цель, землю, стену) — подрыв там
					local newDir = want
					speed = 3200
					local from = rocket:GetPos()
					local step = newDir * speed * 0.05
					local hit = util.TraceLine({start = from, endpos = from + step, filter = function(e2)
						return e2 ~= rocket and not PartOf(e2, ent) end, mask = MASK_SHOT})
					if hit.Hit then
						rocket:SetPos(hit.HitPos - newDir * 10)
						timer.Remove(id)
						if isfunction(rocket.Explode) then rocket:Explode(hit.HitPos) end
						return
					end
					rocket:SetPos(from + step)
					rp:SetVelocityInstantaneous(newDir * speed)
					rocket:SetAngles(newDir:Angle())
					if PR_Patrol.DebugATGM and (rocket.PR_DbgAt or 0) < CurTime() then
						rocket.PR_DbgAt = CurTime() + 0.25
						MsgN(string.format("[PR] ATGM %d dist %d ang %.0f speed %d vz %d", rocket:EntIndex(), rocket:GetPos():Distance(aimBody:WorldSpaceCenter()), ang, speed, v.z))
					end
				end)
			end
			trackedShells[#trackedShells + 1] = {entry = entry, ent = rocket, key = key, start = rocket:GetPos(),
				dir = rocket:GetForward(), born = CurTime()}
			for _, part in ipairs(parts) do
				if IsValid(part) and part ~= rocket then constraint.NoCollide(rocket, part, 0, 0) end
			end
			local phys = rocket:GetPhysicsObject()
			-- ПТУР — без скорости вертолёта: при кружении боком она сбивала ракету с линии на цель
			if IsValid(phys) and not rocket.PR_ATGM then phys:AddVelocity(vel) end
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
			entry.prefireLeft, entry.prefireHidden = AIR_OPT.prefireRockets, false
		else
			entry.prefireHidden = true
		end
	end
	if not (entry.prefireHidden and entry.pilotSeenTarget == target and entry.pilotSeenAt) then return false end
	if now - entry.pilotSeenAt > AIR_OPT.prefireTime then return false end
	-- Ракеты на это укрытие кончились — дальше одной пушкой; ни того ни другого — не префайрим
	local weapons = WeaponsOf(entry)
	local broken = entry.brokenWeapons or {}
	local rockets = weapons and weapons.rockets and not broken.rockets and weapons.rockets.ammo(ent) and (entry.prefireLeft or 0) > 0
	local gun = weapons and weapons.gun and not broken.gun and weapons.gun.ammo(ent)
	if not (rockets or gun) then return false end

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
	-- Ракетный заход (горка, разворот): курс задан прямо
	if entry.faceYaw and not IsValid(entry.faceTarget) then
		want = entry.faceYaw
	elseif look then
		local flat = Vector(look.x - pos.x, look.y - pos.y, 0)
		if flat:LengthSqr() > 100 * 100 then want = flat:Angle().y end
		-- «Доебался»: курс с упреждением на угловую скорость облёта (иначе нос отстаёт от цели)
		if entry.airMode == "doebalsya" and entry.dbYawLead then want = want + entry.dbYawLead end
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

-- Карта (границы — из config/minimap.lua) и запас до ближайшей стены неба от точки
local Edge = {} -- край карты и виражи у него (одной таблицей: у файла предел 200 локальных)

function Edge.Cfg()
	return PR_MINIMAPS and PR_MINIMAPS[string.lower(game.GetMap())]
end

function Edge.Room(p)
	local cfg = Edge.Cfg()
	if not cfg then return math.huge end
	return math.min(p.x - cfg.minX, cfg.maxX - p.x, p.y - cfg.minY, cfg.maxY - p.y)
end

-- Радиус виража по записям (A-10 ≈ 1,35·скорость: 2200–2600 на 1750–1850)
function Edge.Radius(ent)
	return math.max(ent:GetVelocity():Length(), 1200) * 1.35
end

-- В какую сторону разворачиваться, чтобы круг виража остался в карте: +1 — влево, −1 — вправо;
-- nil — помещаются оба. Раньше сторона бралась из случайного знака разницы курса, и самолёт у края
-- разворачивался через стену неба (скорость 1600 → 800)
function Edge.Side(ent, heading)
	local pos = ent:GetPos()
	local r = Edge.Radius(ent)
	local right = Angle(0, heading or PlaneHeading(ent), 0):Right()
	local roomL = Edge.Room(pos - right * r) - r
	local roomR = Edge.Room(pos + right * r) - r
	if roomL >= 1000 and roomR >= 1000 then return nil end
	return roomL >= roomR and 1 or -1
end

-- Видит ли цель кто-то из патруля прямо сейчас (боец, у которого она враг и на виду, или другая машина
-- патруля): тогда он «по рации» наводит самолёт — с задержкой и ошибкой (см. PlaneAttack)
function Edge.Contact(patrol, target, self)
	if not (patrol and IsValid(target)) then return false end
	for _, npc in ipairs(patrol.members or {}) do
		if IsValid(npc) and npc:Health() > 0 and npc:GetEnemy() == target and npc:Visible(target) then return true end
	end
	for _, v in ipairs(patrol.vehicles or {}) do
		if v ~= self and not v.dead and v.target == target and CurTime() - (v.targetSeen or 0) < 1 then return true end
	end
	return false
end

-- Враг, с которым патруль в бою и которого кто-то из бойцов видит: самолёт идёт на него, даже если
-- сам его ещё не видел (после возрождения игрока он 40 с кружил над патрулём, пока по нему стреляли)
function Edge.PatrolEnemy(patrol, from, range)
	if not patrol then return nil end
	for _, npc in ipairs(patrol.members or {}) do
		local e = IsValid(npc) and npc:Health() > 0 and npc:GetEnemy()
		if IsValid(e) and npc:Visible(e) and e:WorldSpaceCenter():DistToSqr(from) < range * range
			and ((e:IsPlayer() and e:Alive() and RealPlayer(e) and not IgnorePlayers() and not e:IsFlagSet(FL_NOTARGET))
				or (e.PR_GuardPoint and e:Health() > 0)) then
			return e
		end
	end
end

-- Сектор захода, откуда цель была закрыта (пике с 6000+ без линии огня): ±30° на 60 с
function Edge.Blocked(ent, tpos, yaw)
	for _, b in ipairs(ent.prBlocked or {}) do
		if CurTime() < b.till and b.pos:Distance(tpos) < 1500 and math.abs(math.AngleDifference(yaw, b.yaw)) < 30 then return true end
	end
	return false
end

function Edge.Block(ent, tpos, yaw)
	local list = {}
	for _, b in ipairs(ent.prBlocked or {}) do
		if CurTime() < b.till then list[#list + 1] = b end
	end
	list[#list + 1] = {pos = tpos, yaw = yaw, till = CurTime() + 60}
	ent.prBlocked = list
end

-- Годится ли ось захода с курса yaw (yaw — направление от цели к точке входа): точка входа и уход за
-- цель с виражом вбок — в карте; сектор не закрыт; с линии пике (far, 0,65·far, 3500 под углом angle)
-- цель видна — к середине или к верху — хотя бы с двух точек из трёх
function Edge.AxisOk(ent, target, tpos, yaw, angle, far)
	local dir = Angle(0, yaw, 0):Forward()
	local exit = tpos - dir * 4000
	local side = Vector(dir.y, -dir.x, 0) * 5000
	if not (Edge.Room(tpos + dir * (far + 2500)) > 2000 and Edge.Room(exit) > 1500
		and (Edge.Room(exit + side) > 1000 or Edge.Room(exit - side) > 1000)) then return false, false end
	if Edge.Blocked(ent, tpos, yaw) then return false, true end
	local filter = function(e) return e ~= target and not PartOf(e, ent) end
	local slope = math.tan(math.rad(angle or 20))
	local open = 0
	for _, d in ipairs({far, far * 0.65, 3500}) do
		local from = tpos + dir * d + Vector(0, 0, d * slope)
		if not util.TraceLine({start = from, endpos = tpos, filter = filter, mask = SIGHT_MASK}).Hit
			or not util.TraceLine({start = from, endpos = tpos + Vector(0, 0, 50), filter = filter, mask = SIGHT_MASK}).Hit then
			open = open + 1
		end
	end
	return open >= 2, true
end

-- Углы для ИИ LFS: курс wantYaw не дальше 45° от нынешнего, тангаж (плюс — нос вниз).
-- На крутую команду курса LFS кренит самолёт почти на бок и перестаёт выравнивать крылья — без
-- подъёмной силы вираж шёл спиралью к земле. Поэтому в вираже нос задираем: на треть угла поворота.
-- how = "level" — без этого подъёма и не круче 12° вверх на скорости ниже 1800 (на заходах каждый
-- вираж с подъёмом носа стоил 250–300 скорости); how = "dive" — защита от края смотрит лишь на 1,5 с
local function PlaneSteer(ent, wantYaw, pitch, how)
	local cur = PlaneHeading(ent)
	local pos, vel = ent:GetPos(), ent:GetVelocity()
	-- Край карты: скоро будем у стены неба — курс к центру карты, разворот в ту сторону, где вираж
	-- помещается. В пике — только совсем близко: иначе срывал заходы на цель у края
	local cfg = Edge.Cfg()
	if cfg then
		local ahead = pos + Vector(vel.x, vel.y, 0) * (how == "dive" and 1.5 or 4)
		-- Команда и так уводит от стены и вираж в её сторону помещается — не перебиваем: раньше на
		-- развороте к цели вдоль стены охранник гнал «к центру» (от цели), и выходила петля на 360°
		-- Вираж в сторону s помещается, если его круг (центр в R вбок) в карте с запасом R + 1000; не
		-- помещается — пробуем другую сторону (если разворот больше 120°, сторона всё равно наша)
		local keep = false
		if not ent.prEdgeTurn and Edge.Room(ahead) < 1000
			and Edge.Room(pos + Angle(0, wantYaw, 0):Forward() * math.max(vel:Length(), 1200) * 4) >= 1000 then
			local raw0 = math.AngleDifference(wantYaw, cur)
			local sign = ent.prTurnSign or (raw0 >= 0 and 1 or -1)
			local r = Edge.Radius(ent)
			local right = Angle(0, cur, 0):Right()
			if Edge.Room(pos - right * r * sign) - r >= 1000 then
				keep = true
			elseif math.abs(raw0) > 120 and Edge.Room(pos + right * r * sign) - r >= 1000 then
				ent.prTurnSign, keep = -sign, true
			end
		end
		if Edge.Room(ahead) < 1000 and not keep then
			local center = Vector((cfg.minX + cfg.maxX) / 2, (cfg.minY + cfg.maxY) / 2, 0)
			wantYaw = (center - Vector(pos.x, pos.y, 0)):Angle().y
			if not ent.prEdgeTurn then
				ent.prTurnSign = Edge.Side(ent, cur) or (math.AngleDifference(wantYaw, cur) >= 0 and 1 or -1)
			end
			ent.prEdgeTurn = true
		else
			ent.prEdgeTurn = nil
		end
	end
	local raw = math.AngleDifference(wantYaw, cur)
	local diff = raw
	-- Цель почти за спиной: знак разницы скачет (179° ↔ −179°), вираж то влево, то вправо — и самолёт
	-- летел прямо, пока не врезался в край карты. Сторону разворота держим, пока не довернёт; выбираем
	-- её так, чтобы вираж поместился в карту
	if math.abs(raw) > 120 or ent.prEdgeTurn then
		ent.prTurnSign = ent.prTurnSign or Edge.Side(ent, cur) or (raw >= 0 and 1 or -1)
		diff = ent.prTurnSign * raw >= 0 and raw or ent.prTurnSign * (360 - math.abs(raw))
	else
		ent.prTurnSign = nil
	end
	diff = math.Clamp(diff, -45, 45)
	local p = pitch
	if how == "level" then
		if vel:Length() < 1800 then p = math.max(p, -12) end
		-- В крутом вираже не снижаться: нос вниз на боку у LFS — широкий разворот (у края влетал в стену)
		if math.abs(diff) >= 30 then p = math.min(p, 2) end
	else
		p = p - math.abs(diff) / 3
	end
	return Angle(p, cur + diff, 0)
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
	if ahead.Hit and not ahead.HitSky and not (ignoreNear and Vector(ahead.HitPos.x - ignoreNear.x, ahead.HitPos.y - ignoreNear.y, 0):Length() < 2500) then
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

-- Точка разворота перед заходом (точка входа + 2500) должна быть внутри карты с запасом: цель у
-- края, точка входа за ним — самолёт летел к ней прямо в стену неба, терял скорость и валился

local function PlaneRunYaw(ent, target, tpos, baseYaw, offsets, angle, far)
	local sign = math.random(0, 1) * 2 - 1
	far = far or 5000
	local fallback
	for _, off in ipairs(offsets) do
		local yaw = baseYaw + off * sign
		local ok, inside = Edge.AxisOk(ent, target, tpos, yaw, angle, far)
		if inside and not fallback then fallback = yaw end
		if ok then return yaw, true end
	end
	return fallback or (baseYaw + offsets[1] * sign), false
end

-- Заход по наземной цели. Пехота — пушкой, полого (20°); техника — круче (25°), залп ракет и
-- пушка, с упреждением на её скорость. Заход через точку входа: сначала выйти туда, откуда цель
-- видна под нужным углом на нужной высоте, развернуться на неё и только потом пике. Раньше
-- самолёт шёл прямо на цель слишком высоко, к развороту она оказывалась круче 35° под ним, и он
-- раз за разом уходил на новый круг (у игрока — 20 уходов на 6 пике за 3 минуты)
-- Заход длинный и пологий (как у настоящего A-10): огонь с FIRE_FROM, очередь ведётся вдоль линии
-- захода через цель (sweep — от недолёта до перелёта) и накрывает полосу, а не точку. Раньше пике
-- 20–25° с огнём только с ≤ 5° на цель — стрелял он уже в 3000–4000, одной точкой
local PLANE_RUNS = {
	-- Выше и дальше (по записи игрока: пике с 9–10 км, на 3500–4600 выше цели, очередь всю дорогу)
	infantry = {angle = 21, height = 3500, rockets = 0, sweep = 0},
	vehicle = {angle = 30, height = 4000, rockets = 6, sweep = 0},   -- круче: ракеты под 22° рвались о крыши у цели   -- по технике — точно (ракетам нос на цель)
}
-- from — с какой дальности пушка; off — на сколько градусов нос может смотреть мимо точки очереди;
-- prefire — цель скрылась: столько секунд заход и огонь туда, где её видели
local PLANE_FIRE = {from = 9500, off = 4, prefire = 10, ipMax = 9500, pullDist = 2500, extend = 10000, extendHeight = 3500, floor = 800, rocketPitch = 2}
local ROCKET_SPEED = 5000 -- примерно, для упреждения (у Hydra разгон ~700 за тик, сопротивление воздуха)

local function PlaneAttack(entry, ent, target, kind)
	local run = PLANE_RUNS[kind] or PLANE_RUNS.infantry
	local now = CurTime()
	-- Прошлое пике упёрлось в укрытие (бруствер в 450–750 перед целью на 150–250 выше прицела) — минуту
	-- заходим круче, 30°: с пологих 21° линию огня закрывало
	if (ent.prSteepUntil or 0) > now and run.angle < 30 then
		run = {angle = 30, height = run.height, rockets = run.rockets, sweep = run.sweep}
	end
	local pos = ent:GetPos()
	local body = AimBody(target)
	local tpos = PR_Patrol.AimPoint(target)
	-- Префайр: видим ли цель (раз в 0,25 с); скрылась (в доме, за стеной) — заход и огонь туда, где
	-- видели, ещё PLANE_FIRE.prefire секунд. Раньше самолёт по скрывшейся цели не стрелял вовсе
	if now >= (entry.planeSeenCheck or 0) then
		entry.planeSeenCheck = now + 0.25
		local seen = VisiblePoint(ent:WorldSpaceCenter(), target, ent)
		if seen then
			entry.planeSeenAt, entry.planeSeenPos, entry.planeSeenTarget, entry.planeHidden = now, seen, target, false
		else
			entry.planeHidden = true
		end
	end
	-- Цель скрылась (дом, навес, гребень): заходы «по площади» — очередь и залп ракет. Куда: если её
	-- видит кто-то из патруля, он наводит «по рации» — её место раз в 2,5 с с ошибкой до 400; не видит
	-- никто — туда, где самолёт видел её сам. Ждать в зоне ожидания — только если скрыта дольше 20 с и
	-- никто не видит (раньше ждал уже через 5 с и 17 с кружил ровным кругом — и не страшно, и мишень)
	local hiddenFor = entry.planeHidden and (entry.planeSeenTarget == target and entry.planeSeenAt and now - entry.planeSeenAt or 0) or nil
	-- Цель, назначенная извне (forceTarget — автотест), считается наведённой: «наводчик» есть
	local contact = hiddenFor and (IsValid(entry.forceTarget) or Edge.Contact(ent.PR_Patrol, target, entry)) or false
	if contact and now >= (entry.planeFacAt or 0) then
		if not entry.planeFacOff then
			local a = math.Rand(0, 2 * math.pi)
			entry.planeFacOff = Vector(math.cos(a), math.sin(a), 0) * math.Rand(0, 400)
		end
		entry.planeFacAt, entry.planeFacPos = now + 2.5, PR_Patrol.AimPoint(target) + entry.planeFacOff
	end
	local reported = entry.planeFacPos and now - (entry.planeFacAt or 0) < 6 and entry.planeFacPos or nil
	local seenPos = entry.planeSeenTarget == target and entry.planeSeenPos or nil
	local prefire = hiddenFor ~= nil and (hiddenFor < 20 or contact) and (reported or seenPos) and true or false
	if prefire then tpos = reported or seenPos end
	local holding = hiddenFor ~= nil and not prefire and seenPos and true or false
	if holding then tpos = seenPos end
	local ceil = CeilingAt(pos)
	local flat = Vector(tpos.x - pos.x, tpos.y - pos.y, 0)
	local dist = flat:Length()
	local toTarget = flat:Angle().y
	local below = math.deg(math.atan2(pos.z - tpos.z, math.max(dist, 1)))

	-- Высота захода над целью: по профилю, но не ниже 1000 над рельефом по ходу и под небом
	local h = math.max(run.height, TerrainAhead(ent, ceil) + 1000 - tpos.z)
	h = math.Clamp(h, 1200, math.max(ceil - 500 - tpos.z, 1200))
	-- Точка входа не дальше PLANE_FIRE.ipMax: если рельеф заставляет идти выше, пике круче (до 35°), а
	-- не длиннее (с 11 км самолёт к цели не доворачивал)
	local ipDist = math.min(h / math.tan(math.rad(run.angle)), PLANE_FIRE.ipMax)
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
	-- Крутой заход: точка разворота ещё на радиус виража дальше — иначе вираж туда не помещался
	local outer = ip + runDir * (2500 + (run.angle >= 30 and Edge.Radius(ent) or 0))
	local toOuter = Vector(outer.x - pos.x, outer.y - pos.y, 0)

	local was = entry.planeMode or "approach"
	local mode = was
	if holding and mode ~= "dive" and mode ~= "pull up" then mode = "hold" end
	if mode == "hold" and not holding then
		-- Снова видна — заход с оси зоны ожидания (точка разворота рядом с ней)
		mode, entry.planeRunYaw = "approach", entry.planeHoldYaw or entry.planeRunYaw
	end
	if mode ~= "hold" then entry.planeHoldC, entry.planeHoldYaw = nil, nil end
	local danger, why
	if mode == "dive" then danger, why = PlaneDanger(ent, 2, 700, tpos) else danger, why = PlaneDanger(ent) end
	if danger and mode ~= "pull up" then
		-- Из пике — не на новый заход (он уводил к стене и мимо цели), а уходом по оси атаки
		entry.planeAfter = mode == "dive" and "extend" or mode
		if mode == "dive" then entry.planeEgressYaw = PlaneHeading(ent) end
		mode, entry.planeUntil = "pull up", now + 2.5
	elseif danger and mode == "pull up" then
		entry.planeUntil = math.max(entry.planeUntil or 0, now + 1)
	end
	if mode == "pull up" and now > (entry.planeUntil or 0) then mode = entry.planeAfter or "approach" end

	local headingOff = math.abs(math.AngleDifference(toTarget, PlaneHeading(ent)))
	if mode == "approach" then
		-- Дальше точки разворота — разворот на цель; уже летит на цель издалека — тоже: дальше
		-- по прямой, пока цель не окажется под нужным углом
		-- Точку разворота засчитываем ближе радиуса виража (+500) или когда она уже сбоку/сзади рядом:
		-- с порогом 1500 при вираже ~2150 самолёт, проскочив её, кружил вокруг неё минутами
		local r = Edge.Radius(ent)
		local outerOff = math.abs(math.AngleDifference(toOuter:Angle().y, PlaneHeading(ent)))
		if toOuter:Length() < r + 500 or (toOuter:Length() < 1.6 * r and outerOff > 100)
			or (headingOff < 20 and dist > ipDist * 0.9 and below <= angle + 2) then
			mode, entry.planeTurnSince = "turn in", now
		end
	end
	if mode == "turn in" then
		if headingOff < 20 and below >= angle - 4 and below <= 40 and dist > 2500 then
			mode = "dive"
		-- «Проскочил» — только когда уже почти довернул (или 3 с разворота): сразу после прохода цель
		-- позади, это обычный разворот, а не проскок
		-- Бросаем, только если уже не довернуть до выхода из пике (~30°/с): раньше бросал по «ближе
		-- 0,45 точки входа» — в 2800–4400 от цели с носом в 27° от неё, вместо того чтобы дать очередь
		else
			-- Успеем ли довернуть: круг виража в сторону цели (центр в R вбок), касательная от него до цели
			-- L — с неё и пике; L ≥ PLANE_FIRE.pullDist и угол на цель с неё не круче 30° (крутой заход —
			-- угол захода + 8°: с лимитом 30° крутые 30-градусные заходы сами себя отменяли, минута без пике)
			local r = Edge.Radius(ent)
			local turnSide = math.AngleDifference(toTarget, PlaneHeading(ent)) >= 0 and 1 or -1
			local c = pos - Angle(0, PlaneHeading(ent), 0):Right() * r * turnSide
			local d = Vector(tpos.x - c.x, tpos.y - c.y, 0):Length()
			local L = math.sqrt(math.max(d * d - r * r, 0))
			local late = (headingOff < 60 or now - (entry.planeTurnSince or now) > 3)
				and (L < PLANE_FIRE.pullDist or math.deg(math.atan2(pos.z - tpos.z, math.max(L, 1))) > math.max(30, angle + 4))
			if below > 40 or late or now - (entry.planeTurnSince or now) > 15 then
				-- Не успевает — проходит насквозь и обычный уход с разворотом (а не далёкий новый заход:
				-- это 14 с без огня)
				mode = "extend"
				entry.planeEgressYaw, entry.planeEgressSide = PlaneHeading(ent), nil
			end
		end
	end
	-- Пике до PLANE_FIRE.floor над целью (в крутом — раньше: на 50 за каждый градус круче 25°) или PLANE_FIRE.pullDist
	-- до неё (очередь — как можно дольше на подлёте)
	-- Нижний предел — от самых высоких крыш и рельефа на 2 с полёта вперёд (+600), а не от цели: на
	-- 800 над целью самолёт задевал дома вокруг неё (300–800)
	local roof = -math.huge
	if mode == "dive" then
		local v = ent:GetVelocity()
		for t = 0, 3, 0.5 do roof = math.max(roof, TopAt(pos.x + v.x * t, pos.y + v.y * t, ceil, pos.z - 8000)) end
	end
	-- Запас на скорость — небольшой (+150 на 2000): без него на 2030 выходил в 890 над целью и задевал рельеф,
	-- с прежним (+300) очередь кончалась в 3300–3500; рельеф по ходу смотрим на 3 с
	local diveFloor = math.max(PLANE_FIRE.floor, roof + 600 - tpos.z) + math.max(0, math.NormalizeAngle(ent:GetVelocity():Angle().p) - 25) * 50
		+ math.max(0, ent:GetVelocity():Length() - 1500) * 0.3

	if mode == "dive" and (pos.z - tpos.z < diveFloor or pos:Distance(tpos) < PLANE_FIRE.pullDist) then
		mode, entry.planeUntil, entry.planeAfter = "pull up", now + 3, "approach"
		-- Выход как у игрока: 1,5 с нос вверх по прямой (проход над целью, скорость не теряем — отворот на
		-- 80° держал самолёт 3 с у цели), дальше уход прямо от цели (extend) и разворот уже вдали
		entry.planeUntil, entry.planeAfter = now + 1.5, "extend"
		-- Отворот на 25° в сторону, где больше места: проход в стороне от цели, а не над головой (там
		-- его и сбивали из РПГ), уход дальше — тем же курсом (+15° в extend)
		local right = Angle(0, PlaneHeading(ent), 0):Right()
		entry.planeEgressSide = Edge.Room(pos - right * 4000) >= Edge.Room(pos + right * 4000) and 1 or -1
		entry.planeBreakYaw = PlaneHeading(ent) + 25 * entry.planeEgressSide
		entry.planeEgressYaw = entry.planeBreakYaw
	end
	-- Уход как у игрока: прямо по оси атаки (отворот 15° внутрь карты) 3–5 с, потом один разворот на
	-- новый заход — на PLANE_FIRE.extend от цели или раньше, если до стены по курсу меньше двух радиусов
	-- виража. Раньше уходил «прочь от цели» (курс на цель + 180°): в 2000 до цели это разворот над ней с
	-- креном 70–95° (скорость 2000 → 800, мишень для РПГ), а у цели возле края — прямо в стену
	if mode == "extend" then
		entry.planeExtendAt = entry.planeExtendAt or now
		entry.planeEgressYaw = entry.planeEgressYaw or PlaneHeading(ent)
		if not entry.planeEgressSide then
			local right = Angle(0, entry.planeEgressYaw, 0):Right()
			entry.planeEgressSide = Edge.Room(pos - right * 4000) >= Edge.Room(pos + right * 4000) and 1 or -1
		end
	end
	-- Стена по курсу ухода (а не по нынешней скорости: отворот внутрь карты ещё не начался) и не в
	-- первые 2 с — иначе сразу после прохода бросал уход и шёл на новый далёкий заход (цикл 20+ с)
	local wallAhead = mode == "extend" and now - entry.planeExtendAt > 2
		and Edge.Room(pos + Angle(0, entry.planeEgressYaw + 15 * (entry.planeEgressSide or 1), 0):Forward() * (2 * Edge.Radius(ent) + 1000)) < 1000
	if mode == "extend" and (dist >= PLANE_FIRE.extend or wallAhead) then
		mode, entry.planeTurnSince = "turn in", now
		local hereYaw = (pos - tpos):Angle().y
		if Edge.AxisOk(ent, target, tpos, hereYaw, angle, ipDist) then
			entry.planeRunYaw = hereYaw
		else
			-- Отсюда цель закрыта (дом, гребень) — к точке входа на открытой оси
			local yaw, found = PlaneRunYaw(ent, target, tpos, hereYaw, PLANE_SIDES_NEXT, angle, ipDist)
			entry.planeRunYaw = yaw
			if found then mode = "approach" end
		end
		-- Разворот на цель — туда, где вираж помещается в карту, а помещается всюду — к центру карты
		ent.prTurnSign = Edge.Side(ent)
		local cfg = Edge.Cfg()
		if not ent.prTurnSign and cfg then
			local c = Vector((cfg.minX + cfg.maxX) / 2, (cfg.minY + cfg.maxY) / 2, 0)
			ent.prTurnSign = math.AngleDifference((c - pos):Angle().y, PlaneHeading(ent)) >= 0 and 1 or -1
		end
	end
	if mode ~= "extend" and mode ~= "pull up" then entry.planeEgressYaw, entry.planeEgressSide = nil, nil end
	if mode ~= "extend" then entry.planeExtendAt = nil end
	if mode ~= "pull up" then entry.planeBreakYaw = nil end
	-- Вышел из пике — следующий заход с другой стороны
	if mode == "pull up" and was == "dive" then
		entry.planeRunYaw = PlaneRunYaw(ent, target, tpos, (pos - tpos):Angle().y, PLANE_SIDES_NEXT, angle, ipDist)
	end
	if mode == "dive" and was ~= "dive" then
		-- По укрытию — залп 4 ракет (по зданию A-10 бьёт ракетами), ошибка наводки — новая на каждый заход
		entry.salvo, entry.salvoCap = 0, (prefire and kind ~= "vehicle") and 4 or run.rockets
		entry.planeFacOff = nil
		entry.planeDiveYaw, entry.planeMaskedFar = (pos - tpos):Angle().y, nil
	end
	-- Пике, где с 6000+ цель была закрыта, — эту ось захода на 60 с не берём
	if was == "dive" and mode ~= "dive" and entry.planeMaskedFar and entry.planeDiveYaw then
		Edge.Block(ent, tpos, entry.planeDiveYaw)
		ent.prSteepUntil = now + 60
	end

	-- Пуск РПГ/ракеты впереди (±60° от носа): через 0,5 с резкий отворот на 60° от пуска, нос чуть вниз,
	-- потом — дальше своим режимом. Пуск за спиной не видит
	local evading = entry.planeEvadeAt and now >= entry.planeEvadeAt and now < (entry.planeEvadeUntil or 0)
	-- В пике и на выводе пуск не срывает атаку: это честное окно для РПГ, лоб в лоб (иначе каждый пуск
	-- отменял заход, и самолёт за весь бой ни разу не стрелял)
	if evading and not entry.planeEvadeYaw and (mode == "dive" or mode == "pull up") then
		evading, entry.planeEvadeAt, entry.planeEvadeUntil = false, nil, nil
	end
	if evading then
		if not entry.planeEvadeYaw then
			entry.planeEvadeYaw = PlaneHeading(ent) + 60 * (entry.planeEvadeSide or 1)
			PR_Patrol.Log(string.format("%s: пуск по нему у %s — отворот (до цели %d, выше %d, скорость %d)", VehicleLabel(entry),
				PosText(entry.planeEvadeFrom or pos), dist, pos.z - tpos.z, ent:GetVelocity():Length()))
		end
	elseif entry.planeEvadeYaw then
		entry.planeEvadeAt, entry.planeEvadeUntil, entry.planeEvadeYaw = nil, nil, nil
	end

	entry.planeMode = mode
	entry.airMode = "plane " .. mode
	if mode ~= was then
		local aimed = was == "dive" and entry.planeBestAim and string.format(", нос до цели не ближе %.1f°%s%s", entry.planeBestAim,
			entry.planeFired and (entry.planeCoverFire and ", стрелял (и по укрытию)" or ", стрелял") or entry.planeNoFire and ", " .. entry.planeNoFire or "",
			(entry.salvo or 0) > 0 and ", ракет " .. entry.salvo .. (entry.planeDropUsed and string.format(" (поправка на падение %d)", entry.planeDropUsed) or "") or "") or ""
		PR_Patrol.Log(string.format("%s: заход по %s %s → %s (до цели %d, выше цели %d, скорость %d%s%s)", VehicleLabel(entry),
			kind == "vehicle" and "технике" or "пехоте", was, mode, pos:Distance(tpos), pos.z - tpos.z, ent:GetVelocity():Length(),
			danger and ", " .. why or "", aimed))
		entry.planeBestAim, entry.planeFired, entry.planeNoFire, entry.planeCoverFire = nil, nil, nil, nil
	end

	-- Вне атаки — низко и быстро (~900 над рельефом по ходу), высота — только дальше 7000 от цели:
	-- средняя высота, медленно и рядом — мишень для РПГ (сбивали на 2600–3100 в 4000 от игрока)
	local low = math.min(TerrainAhead(ent, ceil) + 900, ceil - 500)
	if evading then
		PlaneThrottle(ent, 1)
		local agl = pos.z - TerrainAhead(ent, ceil)
		return PlaneSteer(ent, entry.planeEvadeYaw, agl < 700 and -5 or 5, "level")
	end
	if mode == "hold" then
		if not entry.planeHoldC then
			local base = (pos - tpos):Angle().y
			for _, off in ipairs(PLANE_SIDES_FIRST) do
				for _, far in ipairs({11000, 9500, 8000}) do
					local c = tpos + Angle(0, base + off, 0):Forward() * far
					if Edge.Room(c) >= 4300 and Edge.AxisOk(ent, target, tpos, base + off, angle, ipDist) then
						entry.planeHoldC, entry.planeHoldYaw = c, base + off
						break
					end
				end
				if entry.planeHoldC then break end
			end
			if not entry.planeHoldC then
				local cfg = Edge.Cfg()
				local mid = cfg and Vector((cfg.minX + cfg.maxX) / 2, (cfg.minY + cfg.maxY) / 2, 0) or pos
				entry.planeHoldYaw = (Vector(mid.x, mid.y, tpos.z) - tpos):Angle().y
				entry.planeHoldC = tpos + Angle(0, entry.planeHoldYaw, 0):Forward() * 8000
			end
		end
		PlaneThrottle(ent, 1)
		local c = entry.planeHoldC
		local a = math.atan2(pos.y - c.y, pos.x - c.x) + math.rad(30)
		local point = Vector(c.x + math.cos(a) * 3000, c.y + math.sin(a) * 3000, 0)
		local z = low
		return PlaneSteer(ent, (point - Vector(pos.x, pos.y, 0)):Angle().y, math.Clamp(AltitudePitch(pos, z), -12, 8), "level")
	end
	if mode == "extend" then
		PlaneThrottle(ent, 1)
		local jink = 10 * math.sin(now * 2 * math.pi / 3)
		local z = dist < 7000 and low or math.max(low, tpos.z + h)
		return PlaneSteer(ent, entry.planeEgressYaw + 15 * (entry.planeEgressSide or 1) + jink,
			math.Clamp(AltitudePitch(pos, z), -12, 8), "level")
	end
	if mode == "pull up" then
		PlaneThrottle(ent, 1)
		-- Выход из пике — тем круче, чем круче летим вниз (из 40° на −12° самолёт не успевал выйти); выровнялся —
		-- почти горизонтально (−4°), а не дальше вверх: набор до 1500–2000 над целью на 1700 — мишень для РПГ
		local down = math.NormalizeAngle(ent:GetVelocity():Angle().p)
		-- Отворот вбок — только когда уже не снижаемся: вираж на выводе отнимал подъёмную силу, и у холмов
		-- самолёт просаживало в склон
		if entry.planeBreakYaw then
			return PlaneSteer(ent, down > 3 and PlaneHeading(ent) or entry.planeBreakYaw, -math.Clamp(4 + down * 1.0, 4, 30), "level")
		end
		return PlaneSteer(ent, PlaneHeading(ent), -35)
	elseif mode == "dive" then
		-- Полный газ (игрок пикирует на 1900–2100; на 50% «полз» на 1400), притормаживаем выше 2050
		PlaneThrottle(ent, ent:GetVelocity():Length() > 2050 and 0.7 or 1)
		local muzzle = ent:WorldSpaceCenter()
		local range = pos:Distance(tpos)
		-- Упреждение на скорость цели (по технике — под ракеты; в префайр — точка неподвижна)
		local aimPos = tpos
		if kind == "vehicle" and not prefire then
			aimPos = tpos + body:GetVelocity() * (muzzle:Distance(tpos) / ROCKET_SPEED)
			-- Ракеты с 2000–6000 падают: нос выше на замеренное падение своих же ракет (без этого 24 ракеты
			-- при носе на цели до 0,6° — ни одного попадания)
			if entry.rocketKey then
				local saved = entry.shellKey
				entry.shellKey = entry.rocketKey
				entry.planeDropUsed = ShellDrop(entry, Vector(tpos.x - pos.x, tpos.y - pos.y, 0):Length())
				aimPos = aimPos + Vector(0, 0, entry.planeDropUsed)
				entry.shellKey = saved
			end
			-- A-10 Гредвича пускает ракеты на PLANE_FIRE.rocketPitch° выше носа (Angle(-2, ±1, 0)): нос ниже
			-- на столько же, иначе с 30° пике перелёт 400–1000 (ракеты рвались за машиной)
			aimPos = aimPos - Vector(0, 0, muzzle:Distance(tpos) * math.tan(math.rad(PLANE_FIRE.rocketPitch)))
		end
		-- Очередь ведём вдоль захода: издали — с недолётом, ближе к выходу — с перелётом
		local sweepK = math.Clamp((range - 3000) / (PLANE_FIRE.from - 3000), 0, 1) * 2 - 1
		local runFlat = Vector(pos.x - tpos.x, pos.y - tpos.y, 0):GetNormalized()
		local gunPos = aimPos + runFlat * (prefire and 300 or (run.sweep or 0)) * sweepK
		local aim = (gunPos - muzzle):Angle()
		local off = math.deg(math.acos(math.Clamp(ent:GetForward():Dot(aim:Forward()), -1, 1)))
		local offTarget = math.deg(math.acos(math.Clamp(ent:GetForward():Dot((aimPos - muzzle):GetNormalized()), -1, 1)))
		if not entry.planeBestAim or off < entry.planeBestAim then entry.planeBestAim = off end
		if off <= PLANE_FIRE.off and range < PLANE_FIRE.from then
			-- Видно ли точку очереди: в префайр — стена дома у самого места тоже годится (снаряд там и рванёт)
			local los = util.TraceLine({start = muzzle, endpos = gunPos, filter = function(e) return e ~= target and not PartOf(e, ent) and not PartOf(e, body) end, mask = SIGHT_MASK})
			local masked = los.Hit and los.HitPos:Distance(gunPos) > 150
			if masked and range >= 6000 then entry.planeMaskedFar = true end
			-- Укрытие у самой цели (до max(400, 0,1·дальности)) — огонь по нему: подавление
			if masked then entry.planeCoverFire = true end
			if los.Hit and los.HitPos:Distance(gunPos) > math.max(400, 0.1 * range) then
				entry.planeNoFire = string.format("цель закрыта (%s в %d от цели)", los.HitSky and "небо" or "стена/земля", los.HitPos:Distance(tpos))
			else
				-- Ракеты — только точно (≤ 2.5° на саму цель) и с 2000–6000; пушка — с PLANE_FIRE.off
				local useRockets = (kind == "vehicle" and offTarget <= 2.5 and range > 2500 and range < 5000)
					or (prefire and offTarget <= 4 and range > 2500 and range < 6000)
				local before = ent.NextPrimary
				FirePilot(ent, entry, prefire and PointTarget(gunPos) or target, useRockets and "vehicle" or "infantry", true)
				if ent.NextPrimary ~= before or (entry.salvo or 0) > 0 then entry.planeFired = true end
				if prefire then
					entry.planePrefireShots = (entry.planePrefireShots or 0) + 1
					PR_Patrol.LogEvery(entry, "planePrefire", 10, string.format("%s: цель скрылась у %s — заход и огонь туда", VehicleLabel(entry), PosText(tpos)))
				end
			end
		end
		-- Не круче 40°: из более крутого самолёт не успевал выйти
		return PlaneSteer(ent, aim.y, math.Clamp(math.NormalizeAngle(aim.p), 0, 40), "dive")
	elseif mode == "turn in" then
		-- Полный газ и без набора (не круче 5° вверх): разворот на 1450 разносил до 13 тыс.
		PlaneThrottle(ent, 1)
		-- PlaneSteer в крутом развороте сам поднимает нос на |Δкурса|/3 (до 15°) — тут гасим это: иначе
		-- разворот на цель задирал нос, скорость падала до ~800 и он лез на 5700 над целью
		local turnUp = math.min(math.abs(math.AngleDifference(toTarget, PlaneHeading(ent))), 45) / 3
		-- Высота — от дальности (линия пике под углом захода, не ниже 900): разворот в 6000–7000 от цели на
		-- 3500 давал угол 31–40°, и заход отменялся — минута без пике. Почти довернул — подскок до линии
		local zRun = math.max(tpos.z + math.Clamp(dist * math.tan(math.rad(angle)), 900, h), low - 300)
		return PlaneSteer(ent, toTarget, math.Clamp(AltitudePitch(pos, zRun), headingOff < 60 and -18 or -5, 15) + turnUp)
	end
	-- К точке разворота снижаемся не круче 15°: круче — земля по ходу, и уход вверх. Ближе 7000 к цели —
	-- низко, змейкой и в обход: путь к точке разворота шёл прямо над целью (сбили на таком пролёте)
	PlaneThrottle(ent, 1)
	local wantYaw = toOuter:Angle().y
	local z = ip.z
	if dist < 7000 then
		z = low
		wantYaw = wantYaw + 8 * math.sin(now * 2 * math.pi / 3)
		local offT = math.AngleDifference(toTarget, wantYaw)
		local miss = dist * math.sin(math.rad(math.min(math.abs(offT), 90)))
		if math.abs(offT) < 90 and miss < 3500 then
			-- Цель по пути: курс по касательной к кругу 3500 вокруг неё, с той стороны, куда и так уводит
			local side = offT >= 0 and -1 or 1
			wantYaw = toTarget + side * (math.deg(math.asin(math.min(3500 / math.max(dist, 1), 1))) + 10)
		end
	end
	-- Вниз к малой высоте — не круче 8°: круче проверка «земля по ходу через 3 с» поднимала его зря
	return PlaneSteer(ent, wantYaw, math.Clamp(AltitudePitch(pos, z), -12, z == low and 8 or 15), "level")
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
	if off <= 4 and dist < 7000 and not util.TraceLine({start = muzzle, endpos = lead, mask = SIGHT_MASK}).Hit then
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

-- Пуск по самолёту патруля: РПГ, ракета, граната из подствольника — от игрока (не экипажа). Самолёт
-- видит вспышку, если пуск впереди (±60° от носа) и ближе 9000, и через 0,5 с отворачивает (PlaneAttack)
hook.Add("OnEntityCreated", "PR_PlaneSeesLaunch", function(e)
	timer.Simple(0, function()
		if not IsValid(e) then return end
		local class = e:GetClass()
		if not (string.find(class, "rpg", 1, true) or string.find(class, "projectile", 1, true)
			or string.find(class, "rocket", 1, true) or string.find(class, "missile", 1, true)) then return end
		local owner = e:GetOwner()
		if not (IsValid(owner) and owner:IsPlayer()) then owner = e.Owner end
		if not (IsValid(owner) and owner:IsPlayer()) or owner.PR_PatrolCrew then return end
		local from = e:GetPos()
		for _, patrol in ipairs(PR_Patrol.Active or {}) do
			for _, v in ipairs(patrol.vehicles or {}) do
				local plane = v.ent
				if v.kind == "air" and not v.heli and not v.dead and IsValid(plane) and CurTime() > (v.planeEvadeUntil or 0)
					and plane:GetPos():DistToSqr(from) < 9000 * 9000 then
					local fwd = Vector(plane:GetVelocity().x, plane:GetVelocity().y, 0)
					local to = Vector(from.x - plane:GetPos().x, from.y - plane:GetPos().y, 0)
					local ahead = fwd:LengthSqr() > 1 and math.deg(math.acos(math.Clamp(fwd:GetNormalized():Dot(to:GetNormalized()), -1, 1))) or 180
					if ahead <= 60 then
						local left = math.AngleDifference(to:Angle().y, fwd:Angle().y) >= 0
						v.planeEvadeAt, v.planeEvadeUntil = CurTime() + 0.5, CurTime() + 2.2
						v.planeEvadeSide, v.planeEvadeFrom, v.planeEvadeYaw = left and -1 or 1, from, nil
					end
				end
			end
		end
	end)
end)

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
		return AirVehicleTarget(entry, self:WorldSpaceCenter())
	end

	local baseRunAI = ent.RunAI
	if isfunction(baseRunAI) then
		ent.RunAI = function(self, ...)
			-- Сбитый самолёт падает сам: не рулим и не пишем в журнал заходы обломков
			if not entry.heli and isfunction(self.IsDestroyed) and self:IsDestroyed() then return self:GetAngles() end

			local target = AirVehicleTarget(entry, self:WorldSpaceCenter())
			if not IsValid(target) and not entry.heli and not entry.ignoreTargets then
				target = Edge.PatrolEnemy(patrol, self:WorldSpaceCenter(), AIR_OPT.planeSight)
			end

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
				entry.planeFired, entry.planeEvadeAt, entry.planeEvadeYaw = nil, nil, nil
				entry.airMode = "escort"
				return PlaneEscort(patrol, entry, self)
			end

			-- Вертолёт: сначала — не врезаться
			if NeedsPullUp(entry, self) then
				entry.airMode = "pull up"
				if IsValid(target) then FirePilot(self, entry, target) end
				-- На заходе — вверх с сохранением скорости (нос ровно, полный газ), а не торможение на месте:
				-- раньше подъём срывал заход и гасил скорость над целью
				-- Препятствие близко (меньше 1,2 с полёта) или лопасти уже задевают — тормозить, а не
				-- «вверх на скорости»: так Ми-24 и OH-6 влетали в дома у цели
				-- (только не на снижении: в пике «близко» — это земля впереди, и торможение носом вверх
				-- без скорости просаживало Ми-24 до земли; там лучше вверх на скорости)
				local close = self.RotorHit or (entry.pullFront and self:GetVelocity().z > -200
					and entry.pullFront < math.max(self:GetVelocity():Length(), 300) * 1.2)
				if entry.rrMode and not close then
					local f = self:WorldToLocal(self:GetPos() + self:GetVelocity()).x
					-- Нос вверх на 10° (на 20°, если до земли меньше 3 с): ровным носом на 1800 одна тяга
					-- не успевала поднять над растущим рельефом — Ми-24 врезался на подъёме
					local vz = self:GetVelocity().z
					local gtr = util.TraceLine({start = self:GetPos(), endpos = self:GetPos() - Vector(0, 0, 8000), mask = MASK_SOLID_BRUSHONLY})
					local impact = vz < -50 and (self:GetPos().z - gtr.HitPos.z) / -vz or math.huge
					local up = (impact < 3 or f > 1400) and 20 or 10
					return LimitTilt(entry, self, self:LocalToWorld(Vector(5 * f - 50 * up, 0, 3000)), ROCKET_RUN.tilt, true)
				end
				-- «Устрашитель» — тоже вверх на той же скорости (вперёд и вбок), иначе торможение до висения
				-- срывало круг: после смены направления скорость падала до 200–500 на 20 с
				local db = DOEBALSYA[entry.class]
				-- (только с запасом высоты и креном до 30°: низко, на 380, OH-6 кружа задел винтом и разбился)
				local gtr = util.TraceLine({start = self:GetPos(), endpos = self:GetPos() - Vector(0, 0, 8000), mask = MASK_SOLID_BRUSHONLY})
				if db and db.ring and entry.dbState and IsValid(target) and not close and self:GetPos().z - gtr.HitPos.z > 800 then
					-- вбок — с той же скоростью (не тормозить до висения), вперёд — гасим, нос чуть вверх, вверх —
					-- полный газ. Точкой круга нельзя: цель почти под вертолётом — нос вниз на 37°, пике в землю
					local l = self:WorldToLocal(self:GetPos() + self:GetVelocity())
					return LimitTilt(entry, self, self:LocalToWorld(Vector(5 * l.x - 50 * 8, 5 * l.y, 3000)), 30, true)
				end
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
				-- На ракетных заходах (бум-зум) не зависаем: цель на отходе за рельефом теряется всегда,
				-- и префайр с места держал вертолёт, пуская ракеты в склон, — до пике он не доходил
				if not entry.rrMode and not DOEBALSYA[entry.class] and HeliPrefire(entry, self, target) then
					entry.runActive = false
					return LimitTilt(entry, self, entry.prefireHold or self:GetPos())
				end
				entry.prefireHold = nil

				-- Вертолёт со стрелком держится сбоку, чтобы турель доставала; время от времени — заход
				-- (по технике — чаще и с ракетами)
				local gunner = isfunction(self.GetGunnerSeat) and IsValid(self:GetGunnerSeat()) and GunnerArmed(entry, self)
				local weapons = WeaponsOf(entry)
				-- Бортовые пулемёты (Ми-8) — только круги, без заходов: заход срывал вертолёт с круга
				local circler = gunner and IsValid(entry.crew[1]) and GUNNER_SIDE[entry.class]

				-- Лёгкий вертолёт (Little Bird и подобные) — «доебался»: кружит вокруг цели носом на неё и бьёт
				local db = DOEBALSYA[entry.class]
				if db then
					entry.runActive, entry.rrMode, entry.faceYaw = false, nil, nil
					entry.airMode = "doebalsya"
					entry.faceTarget = target
					-- Подавляющий огонь (по просьбе игрока — «устрашитель»): пушка — при носе до suppress° от
					-- цели; пули идут строго по носу (подкрутка — обычные 4°), промахи ложатся рядом с целью
					entry.dbSuppress = db.suppress
					-- Ракеты — по 2 раз в 2,5 с: не весь подвес за 12 с, и поправка на падение успевает замериться
					if not entry.salvoCap or CurTime() > (entry.salvoResetAt or 0) then
						entry.salvo, entry.salvoCap, entry.salvoResetAt = 0, 2, CurTime() + 2.5
					end
					-- Огонь — по-честному: нос на цели (пушка ≤ 6°, обычная поправка пуль 4°)
					if not entry.dbNoFire then FirePilot(self, entry, target, kind) end
					return LimitTilt(entry, self, DoebalsyaPoint(entry, self, target, db), db.ring and 44 or 50)   -- круг: с запасом до 50° (команда 50 — по факту 51–52°)
				end

				-- Ракеты есть — заходы на цель (и по технике, и по пехоте): издали нос на цель, залп
				-- ракет и пушка, отворот в ROCKET_RUN.breakDist и новый заход с другой стороны. Идёт
				-- выше обычного (extraAlt): раньше заходы у холмов и домов срывались в уход вверх, и
				-- вертолёты били с места (по просьбе игрока вернули заходы). Стрелок бьёт и на заходе
				local broken = entry.brokenWeapons or {}
				-- Заходы — у всех ударных: с ракетами или с курсовой пушкой (Ка-50 с подвесом без ракет
				-- летал по-старому — зависал у цели и разворачивался на месте)
				-- Кончилось курсовое, но есть стрелок — заходы продолжаются, стрелок бьёт на пике (раньше Ми-24
				-- без ракет зависал в 1300 от цели на 30+ с)
				local rocketRun = not circler and ((weapons and ((weapons.rockets and not broken.rockets and weapons.rockets.ammo(self))
					or (weapons.gun and not broken.gun and weapons.gun.ammo(self)))) or (gunner and IsValid(entry.crew[1])))
				if rocketRun then
					entry.runActive = false
					if entry.rrNewRun or not entry.salvoCap then
						entry.salvo, entry.salvoCap, entry.rrNewRun = 0, SALVO, nil
						entry.runs = (entry.runs or 0) + 1
					end
					local point, diving = RocketRunPoint(entry, self, target, ROCKET_RUN)
					local tpos = target:WorldSpaceCenter()
					local flatDist = Vector(tpos.x - self:GetPos().x, tpos.y - self:GetPos().y, 0):Length()
					if diving and flatDist < ROCKET_RUN.fireFrom and flatDist > ROCKET_RUN.fireTo then FirePilot(self, entry, target, "vehicle") end
					entry.airMode = "rocket " .. (entry.rrMode or "dive")
					entry.faceTarget = diving and target or nil
					-- Наклоны быстрые и глубже обычного (до 45°, без плавности): пике, горка, разворот с креном
					return LimitTilt(entry, self, point, ROCKET_RUN.tilt, true)
				end
				entry.rrMode, entry.faceYaw = nil, nil
				local hoverRockets = false
				if (gunner and IsValid(entry.crew[1]) or hoverRockets) and (hoverRockets or circler or not PilotRun(entry, self)) then
					-- Бортовые пулемёты — круги вокруг цели бортом к ней (UpdateFacing)
					local side = not hoverRockets and GUNNER_SIDE[entry.class]
					entry.airMode = hoverRockets and "rocket attack" or (side and "circle" or "stand off")
					entry.faceTarget = target
					-- Дальше, чем было (1800 и 900): вертолёт бил, только подлетев почти вплотную
					local point = StandOffPoint(entry, target, self:GetPos(), hoverRockets and 2800 or 1500,
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
			-- Подвес — всегда рабочий (у Ми-24 без подвеса оставался один стрелок, а заходы на цель шли
			-- как с ракетами — и без оружия вертолёт пикировал до земли)
			local pw = PILOT_WEAPONS[entry.class]
			if pw and pw.loadouts and isfunction(self.GetLoadout) and not table.HasValue(pw.loadouts, self:GetLoadout()) then
				self:SetLoadout(pw.loadouts[math.random(#pw.loadouts)])
			end
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
	-- Управляемые стрелка Ми-24 аддон включает при появлении с вероятностью 1/2 — у патруля всегда
	if weapons and weapons.loadouts and isfunction(ent.SetMissiles) then ent:SetMissiles(true) end
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
	-- PR_Patrol.ForceLoadout[класс] — подвес для автотеста (у MD-500: 1 — НУР FFAR, 2 — ПТУР TOW)
	local forced = PR_Patrol.ForceLoadout and PR_Patrol.ForceLoadout[entry.class]
	if forced and isfunction(ent.SetLoadout) then
		ent:SetLoadout(forced)
	elseif lfsLoadouts and isfunction(ent.SetLoadout) and not table.HasValue(lfsLoadouts, ent:GetLoadout()) then
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
	elseif crew and crew.kind == "ground" then
		-- Экипаж брони сидит за бронёй: урон идёт только по машине, где Гредвич считает пробитие.
		-- Раньше осколки зенитного снаряда задевали невидимого бота сквозь лобовую броню — бот
		-- погибал, и танк «без экипажа» взрывался от 50–100 урона
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
			-- Пушка перешла на пулемёт/автопушку (пули летят прямо): поправка на падение снаряда не нужна
			if crew and crew.kind == "ground" and ply == crew.crew[1] then crew.shellKey = nil end
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

-- Докуда машина бьёт: всё, что видит (GROUND_OPT.sight). По исходникам оружие всех паков летит
-- дальше: пули Гредвича — по прямой без предела, пулемёты Луны — луч на 50000, снаряды Луны
-- живут 12 с (~160000), снаряды Гредвича — физика без срока. Падение снаряда на такой дальности
-- выбирает ShellDrop. Если появится оружие с пределом дальности — ограничить здесь
local function GroundRange(v)
	return GROUND_OPT.sight
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

	local target = PR_Patrol.VehicleTarget(v, veh:WorldSpaceCenter() + Vector(0, 0, 60), GROUND_OPT.sight, PREFIRE_TIME + 2)
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
		if v.seenPos and v.seenAt and CurTime() - v.seenAt < GROUND_OPT.watch then
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
	-- Рулим на следующую точку пути по navmesh (sv_nav.lua): в обход тесных проулков, куда прошла
	-- пехота. Нет сетки или пути — прямо на цель
	local steerTo, navState, navHold = goal, nil, false
	if PR_Nav then steerTo, navState, navHold = PR_Nav.NextPoint(v, veh, goal) end
	v.navState = navState
	-- Ближе к цели корпус не пролезает — ждём у входа
	if navHold then
		v.driveState = label .. ": " .. navState
		Halt(veh)
		v.stuckSince = nil
		return
	end
	-- Куда смотрит машина (у simfphys «вперёд» модели бывает повёрнуто — берём его собственный)
	local forward = veh.Forward or veh:GetForward()
	local yaw = math.AngleDifference((steerTo - pos):Angle().y, forward:Angle().y)
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
		local steer = AvoidHeading(v, veh, (steerTo - pos):Angle().y, speed)
		yaw = math.AngleDifference(steer, forward:Angle().y)
	end
	local turnLeft, turnRight = yaw > 8, yaw < -8
	v.driveState = string.format("%s %s, goal %d, turn %d%s%s", reverse and "reverse" or "forward", label, dist, yaw,
		(not reverse and (v.avoidOffset or 0) ~= 0) and (", avoid " .. v.avoidOffset) or "",
		navState and navState ~= "direct" and (", " .. navState) or "")
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
	-- Всё состояние захода — заново: залипшая сторона разворота переживала перенос и снова вела к стене
	v.planeMode, v.planeRunYaw, v.planeAfter, v.planeUntil, v.planeTurnSince = nil, nil, nil, nil, nil
	v.planeBreakYaw, v.planeEgressYaw, v.planeEgressSide, v.planeHoldC, v.planeHoldYaw = nil, nil, nil, nil, nil
	ent.prTurnSign, ent.prEdgeTurn = nil, nil
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
	-- Аддон пускает, только если луч из глаз стрелка (util.QuickTrace на 10000) во что-то упёрся, не в
	-- небо, а глаза бота смотрят куда попало — пуска не было. На время пуска такой луч «упирается» в цель
	-- (саму ракету потом всё равно наводим мы)
	local aimBody = AimBody(target)
	local quickTrace = util.QuickTrace
	util.QuickTrace = function(from, to, filter)
		local tr = quickTrace(from, to, filter)
		if (not tr.Hit or tr.HitSky) and IsValid(aimBody) then
			tr = {Hit = true, HitSky = false, Entity = aimBody, HitPos = aimBody:WorldSpaceCenter(), StartPos = from}
		end
		return tr
	end
	local created = {}
	hook.Add("OnEntityCreated", "PR_PatrolGunnerMissile", function(e) created[#created + 1] = e end)
	-- В AltSecondaryAttack у аддона отладочный print(Driver) — на каждый пуск строка в консоль
	local ok, err = pcall(Quietly, ent.AltSecondaryAttack, ent, gunner, seat)
	util.QuickTrace = quickTrace
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
	local target = AirVehicleTarget(v, v.ent:WorldSpaceCenter())
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

-- Окно редактора открыто или закрылось только что (UI_GRACE с): ЛКМ редактора спот не ставит
PR_Patrol.UI_GRACE = 0.6

net.Receive("PR_PatrolUI", function(len, ply)
	ply.PR_PatrolUIOpen = net.ReadBool()
	ply.PR_PatrolUIAt = CurTime()
end)

function PR_Patrol.UIBusy(ply)
	return ply.PR_PatrolUIOpen == true or CurTime() - (ply.PR_PatrolUIAt or -100) < PR_Patrol.UI_GRACE
end

net.Receive("PR_PatrolSaveType", function(len, ply)
	if not PR_IsAdmin(ply) or not PR_NetThrottle(ply, "PR_PatrolSaveType", 0.5) then return end

	local key = net.ReadString()
	local data = PR_NetReadTableZ()
	if not istable(data) then return TypeResult(ply, false, key, "Не сохранено: данные не дошли") end

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

----------------------------------------------------------------------------------------------------
-- Диагностика: машину или живого бойца патруля убрал не наш код (2026-10-26 вся техника и пехота
-- патруля «Техника» разом пропали без урона, игрок ничего не удалял). EntityRemoved приходит позже
-- Remove, поэтому кто удаляет — записываем в самом Entity:Remove (стек Lua на момент вызова). Нет
-- записи — Remove из Lua не вызывали: убрал движок (вылет за карту и т. п.). Взорванная машина и
-- убитый боец — не «извне»
local removingOurs = false
local function OwnRemove(fn, ...)
	removingOurs = true
	local ok, err = pcall(fn, ...)
	removingOurs = false
	if not ok then error(err, 0) end
end
local ownRemove, ownRemoveVehicles = PR_Patrol.Remove, PR_Patrol.RemoveVehicles
PR_Patrol.Remove = function(...) return OwnRemove(ownRemove, ...) end
PR_Patrol.RemoveVehicles = function(...) return OwnRemove(ownRemoveVehicles, ...) end

local ENTITY = FindMetaTable("Entity")
local entityRemove = ENTITY.PR_OrigRemove or ENTITY.Remove
ENTITY.PR_OrigRemove = entityRemove
function ENTITY:Remove(...)
	if (self.PR_PatrolVehicle or self.PR_Patrol) and not self.PR_RemovedBy then
		self.PR_RemovedBy = removingOurs and "ours" or debug.traceback("", 2)
	end
	return entityRemove(self, ...)
end

hook.Add("EntityRemoved", "PR_PatrolForeignRemove", function(ent)
	local by = ent.PR_RemovedBy
	if by == "ours" then return end
	local v = ent.PR_PatrolVehicle
	local what
	if v and not v.dead and not Destroyed(ent) then
		what = VehicleLabel(v)
	elseif not v and ent.PR_Patrol and ent:IsNPC() and ent:Health() > 0 then
		what = string.format("боец %s патруля «%s»", ent:GetClass(), tostring(ent.PR_Patrol.cfg and ent.PR_Patrol.cfg.name))
	end
	if not what then return end
	local stack = by and by:gsub("\n%s*%[C%]:[^\n]*", ""):gsub("%s+", " ")
	PR_Patrol.Log(string.format("%s убран(а) извне у %s%s", what, PosText(ent:GetPos()),
		stack and (": " .. stack:sub(1, 400)) or " — Remove из Lua не вызывали: убрал движок"))
end)

hook.Add("PreCleanupMap", "PR_PatrolCleanupLog", function()
	PR_Patrol.Log("очистка карты (game.CleanUpMap): патрули и техника будут убраны;" ..
		debug.traceback("", 2):gsub("%s+", " "):sub(1, 300))
end)