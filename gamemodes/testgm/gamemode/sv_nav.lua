-- Пути для техники. Navmesh движка строится под человека (клетки по 25) и на карте 30000×30000
-- генерируется часами, а ширину машины не знает. Поэтому своя сетка: клетки по CELL, земля в
-- клетке — луч сверху, проход между соседними клетками — коробка шириной с машину по прямой и
-- перепад высоты не круче MAX_SLOPE. Всё считается лениво (только клетки, до которых дошёл поиск)
-- и кэшируется до смены карты. Так танк не лезет в проулок, куда прошла пехота.
-- Пути нет — PR_Nav.NextPoint возвращает саму цель, машина едет напрямик, как раньше
PR_Nav = PR_Nav or {}

local CELL = 200
local CLEAR_LOW, CLEAR_HIGH = 35, 95   -- высота коробки над землёй: бордюры и кочки ниже, стены выше
local MAX_SLOPE = math.tan(math.rad(35))
local MAX_NODES = 30000                -- предел поиска: вся карта — ~24 тыс. клеток
local REPATH_TIME = 4                  -- путь пересчитываем не чаще
local REPATH_GOAL = 400                -- ...или когда цель уехала дальше этого
local WAYPOINT_REACHED = 220
PR_Nav.TIME_BUDGET = 0.2               -- секунд на один поиск (тест ставит больше)

local mask = MASK_SOLID_BRUSHONLY
local bounds          -- {minX, minY, maxX, maxY, top, bottom}
local ground = {}     -- [ключ клетки] = z земли или false
local linkCache = {}  -- [полуширина] = {[a:b] = true/false}

local function Bounds()
	if bounds then return bounds end
	local w = game.GetWorld()
	local mins, maxs = w:GetInternalVariable("m_WorldMins"), w:GetInternalVariable("m_WorldMaxs")
	if not (isvector(mins) and isvector(maxs)) then return nil end
	bounds = {minX = mins.x, minY = mins.y, maxX = maxs.x, maxY = maxs.y, top = maxs.z - 2, bottom = mins.z}
	bounds.nx = math.floor((bounds.maxX - bounds.minX) / CELL)
	bounds.ny = math.floor((bounds.maxY - bounds.minY) / CELL)
	return bounds
end

function PR_Nav.Ready()
	return Bounds() ~= nil
end

local function CellOf(pos)
	local b = Bounds()
	return math.Clamp(math.floor((pos.x - b.minX) / CELL), 0, b.nx - 1), math.Clamp(math.floor((pos.y - b.minY) / CELL), 0, b.ny - 1)
end

local function Key(cx, cy) return cx * 65536 + cy end

-- Земля в клетке (центр). Луч сверху: крыша тоже «земля», но с улицей её не свяжет перепад высот
-- (если хотим именно улицу — ищем под точкой, с которой едем: GroundNear)
local function Ground(cx, cy)
	local k = Key(cx, cy)
	local z = ground[k]
	if z ~= nil then return z end
	local b = Bounds()
	local x, y = b.minX + (cx + 0.5) * CELL, b.minY + (cy + 0.5) * CELL
	local tr = util.TraceLine({start = Vector(x, y, b.top), endpos = Vector(x, y, b.bottom), mask = mask})
	z = false
	if tr.Hit and not tr.StartSolid and not tr.HitSky and tr.HitNormal.z > 0.7
		and bit.band(util.PointContents(tr.HitPos + Vector(0, 0, 8)), CONTENTS_WATER) == 0 then
		z = tr.HitPos.z
	end
	ground[k] = z
	return z
end

local function CellPos(cx, cy)
	local z = Ground(cx, cy)
	if not z then return nil end
	local b = Bounds()
	return Vector(b.minX + (cx + 0.5) * CELL, b.minY + (cy + 0.5) * CELL, z)
end

-- Проходит ли корпус по прямой между точками (над землёй на CLEAR_LOW)
local function HullClear(a, b, half)
	local tr = util.TraceHull({start = a + Vector(0, 0, CLEAR_LOW), endpos = b + Vector(0, 0, CLEAR_LOW),
		mins = Vector(-half, -half, 0), maxs = Vector(half, half, CLEAR_HIGH - CLEAR_LOW), mask = mask})
	return not tr.Hit and not tr.StartSolid
end
PR_Nav.HullClear = HullClear

-- Ширина класса для кэша — полуширина, округлённая вверх до 20
local function WidthKey(half) return math.ceil(half / 20) * 20 end

local function LinkOK(ka, pa, kb, pb, half)
	local cache = linkCache[half] or {}
	linkCache[half] = cache
	local id = ka < kb and (ka .. ":" .. kb) or (kb .. ":" .. ka)
	local ok = cache[id]
	if ok ~= nil then return ok end
	local flat = math.sqrt((pa.x - pb.x) ^ 2 + (pa.y - pb.y) ^ 2)
	ok = math.abs(pa.z - pb.z) <= flat * MAX_SLOPE and HullClear(pa, pb, half)
	cache[id] = ok
	return ok
end

-- Клетка, с которой машина стартует (или куда едет): своя, а если в ней земля не та (крыша над
-- машиной, стена) — ближайшая соседняя с землёй на той же высоте
local function NearestCell(pos, half)
	local cx, cy = CellOf(pos)
	local best, bestD
	for r = 0, 2 do
		for dx = -r, r do
			for dy = -r, r do
				if math.max(math.abs(dx), math.abs(dy)) == r then
					local p = CellPos(cx + dx, cy + dy)
					if p and math.abs(p.z - pos.z) < 120 then
						local d = p:DistToSqr(pos)
						if not bestD or d < bestD then best, bestD = {cx + dx, cy + dy}, d end
					end
				end
			end
		end
		if best then return best[1], best[2] end
	end
end

-- Куча для A*
local function HeapPush(h, key, f)
	h.n = h.n + 1
	local i = h.n
	h[i] = {key, f}
	while i > 1 do
		local p = math.floor(i / 2)
		if h[p][2] <= h[i][2] then break end
		h[p], h[i] = h[i], h[p]
		i = p
	end
end

local function HeapPop(h)
	if h.n == 0 then return nil end
	local top = h[1]
	h[1] = h[h.n]
	h[h.n] = nil
	h.n = h.n - 1
	local i = 1
	while true do
		local l, r, m = i * 2, i * 2 + 1, i
		if l <= h.n and h[l][2] < h[m][2] then m = l end
		if r <= h.n and h[r][2] < h[m][2] then m = r end
		if m == i then break end
		h[m], h[i] = h[i], h[m]
		i = m
	end
	return top[1]
end

local DIRS = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}, {1, 1}, {1, -1}, {-1, 1}, {-1, -1}}

-- Путь от from к to для машины полуширины half: список точек (середины клеток и сама цель) или nil.
-- Подъём дороже, клетка у стены (корпус с запасом 40 не проходит) — тоже: машина держится
-- открытых мест и широких улиц
function PR_Nav.FindPath(from, to, half)
	if not PR_Nav.Ready() then return nil end
	half = WidthKey(half)
	local sx, sy = NearestCell(from, half)
	local gx, gy = NearestCell(to, half)
	if not (sx and gx) then return nil end
	if sx == gx and sy == gy then return {to} end

	local b = Bounds()
	local goalPos = CellPos(gx, gy)
	local startKey, goalKey = Key(sx, sy), Key(gx, gy)
	local open = {n = 0}
	local g, came, closed = {[startKey] = 0}, {}, {}
	HeapPush(open, startKey, CellPos(sx, sy):Distance(goalPos))
	local expanded, found = 0, false
	-- Не дольше TIME_BUDGET за вызов (первые поиски на карте без кэша — сотни тысяч лучей): не
	-- успели — путь до клетки, ближайшей к цели из пройденных; кэш остаётся, следующий поиск быстрее
	local deadline = SysTime() + PR_Nav.TIME_BUDGET
	local bestKey, bestH = startKey, math.huge
	while true do
		local k = HeapPop(open)
		if not k then break end
		if not closed[k] then
			closed[k] = true
			if k == goalKey then found = true break end
			expanded = expanded + 1
			if expanded > MAX_NODES or (expanded % 50 == 0 and SysTime() > deadline) then break end
			local cx, cy = math.floor(k / 65536), k % 65536
			-- Первый шаг — от самой машины, а не от середины её клетки (та бывает у стены или на крыше)
			local fromStart = k == startKey
			local p = fromStart and from or CellPos(cx, cy)
			local h = p:Distance(goalPos)
			if h < bestH then bestKey, bestH = k, h end
			for _, d in ipairs(DIRS) do
				local nx, ny = cx + d[1], cy + d[2]
				if nx >= 0 and ny >= 0 and nx < b.nx and ny < b.ny then
					local nk = Key(nx, ny)
					local np = not closed[nk] and CellPos(nx, ny)
					-- Со старта — корпус вдвое уже и без кэша (точка своя у каждой машины): машина там уже
					-- стоит (у стены, в проезде), значит помещается; иначе её не выпускало с места
					local linkOK
					if fromStart then
						local flat = math.sqrt((p.x - np.x) ^ 2 + (p.y - np.y) ^ 2)
						linkOK = np and math.abs(p.z - np.z) <= math.max(flat, 60) * MAX_SLOPE + 20
							and HullClear(p, np, WidthKey(math.max(40, half * 0.5)))
					else
						linkOK = np and LinkOK(k, p, nk, np, half)
					end
					if linkOK then
						local step = p:Distance(np) + math.max(0, np.z - p.z) * 2
						-- У стены: с запасом 40 по бокам корпус не проходит — дороже
						if not fromStart and not LinkOK(k, p, nk, np, half + 40) then step = step * 1.6 end
						local cost = g[k] + step
						if not g[nk] or cost < g[nk] then
							g[nk] = cost
							came[nk] = k
							HeapPush(open, nk, cost + np:Distance(goalPos))
						end
					end
				end
			end
		end
	end
	-- Цель недостижима (тесно: командир патруля зашёл в проулок) или не успели — путь до ближайшей
	-- к ней клетки из пройденных: машина встанет у входа, а не полезет в проулок напрямик
	local partial = not found
	if partial and bestKey == startKey then return nil, expanded end

	local points = partial and {} or {to}
	local cur = partial and bestKey or came[goalKey]
	while cur and cur ~= startKey do
		table.insert(points, 1, CellPos(math.floor(cur / 65536), cur % 65536))
		cur = came[cur]
	end
	if #points == 0 then return nil, expanded end
	return points, expanded, partial
end

local function FlatDist(a, b)
	return math.sqrt((a.x - b.x) ^ 2 + (a.y - b.y) ^ 2)
end

-- Полуширина машины (по меньшей стороне корпуса) с небольшим запасом
function PR_Nav.HalfWidth(veh)
	local mins, maxs = veh:OBBMins(), veh:OBBMaxs()
	return math.Clamp(math.min(maxs.x - mins.x, maxs.y - mins.y) * 0.5 + 15, 40, 200)
end

-- Куда рулить сейчас, чтобы доехать до goal: следующая точка пути. v — запись машины патруля
-- (там кэш пути). Без пути и когда до цели видно напрямую — сама цель
function PR_Nav.NextPoint(v, veh, goal)
	if not PR_Nav.Ready() then return goal, "direct" end
	local pos = veh:GetPos()
	local half = PR_Nav.HalfWidth(veh)
	local now = CurTime()

	-- Цель близко и корпус проходит напрямую — без пути
	if FlatDist(pos, goal) < 1500 and HullClear(pos, goal, half) then
		v.navPath = nil
		return goal, "direct"
	end

	local path = v.navPath
	if not path or now > (v.navAt or 0) + REPATH_TIME or FlatDist(v.navGoal or goal, goal) > REPATH_GOAL then
		local ok, found, _, partial = pcall(PR_Nav.FindPath, pos, goal, half)
		v.navAt, v.navGoal = now, goal
		v.navPath = ok and found or nil
		v.navPartial = ok and partial or nil
		v.navIndex = 1
		if not ok then v.navError = tostring(found) end
		path = v.navPath
	end
	if not path then return goal, "no path" end
	-- Путь обрывается раньше цели, и мы у его конца — дальше не пролезть: стоим
	if v.navPartial and FlatDist(pos, path[#path]) < WAYPOINT_REACHED then
		return path[#path], "nav: closest reachable", true
	end

	-- Пройденные точки — долой; дальше — самая дальняя из ближайших восьми, до которой корпус
	-- проходит напрямую (без этого машина ехала бы ступеньками от клетки к клетке)
	local i = v.navIndex or 1
	while i < #path and FlatDist(pos, path[i]) < WAYPOINT_REACHED do i = i + 1 end
	for j = math.min(#path, i + 8), i + 1, -1 do
		if HullClear(pos, path[j], half) then
			i = j
			break
		end
	end
	v.navIndex = i
	return path[i], string.format("nav %d/%d", i, #path)
end

-- Карта сменилась — сетка уже про другую карту
hook.Add("InitPostEntity", "PR_NavCache", function() bounds, ground, linkCache = nil, {}, {} end)
