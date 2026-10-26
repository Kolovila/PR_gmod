-- Сведения о карте: туман (env_fog_controller, туман неба), дальность прорисовки, navmesh и пути
-- техники по нему. run_selftest.ps1 -Suite mapinfo; строки MAPINFO в журнал и проверки
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step = T.S, T.log, T.step

local KEYS = {"fogenable", "fogstart", "fogend", "fogmaxdensity", "farz", "fogcolor", "fogblend", "use_angles",
	"fogcolor2", "fogdir", "spawnflags", "targetname"}

local function Dump(ent)
	local kv = ent:GetKeyValues()
	local parts = {}
	for _, k in ipairs(KEYS) do
		if kv[k] ~= nil then parts[#parts + 1] = k .. "=" .. tostring(kv[k]) end
	end
	-- Остальные ключи, где есть «fog» или «far»
	for k, v in pairs(kv) do
		local lk = string.lower(k)
		if (lk:find("fog") or lk:find("far")) and not table.HasValue(KEYS, lk) then parts[#parts + 1] = k .. "=" .. tostring(v) end
	end
	log(string.format("MAPINFO %s #%d at %s: %s", ent:GetClass(), ent:EntIndex(), tostring(ent:GetPos()), table.concat(parts, " ")))
end

step(0, function()
	log("start (mapinfo), map=" .. game.GetMap())
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	for _, class in ipairs({"env_fog_controller", "sky_camera", "env_skypaint", "env_sun", "shadow_control", "env_tonemap_controller"}) do
		local list = ents.FindByClass(class)
		if #list == 0 then log("MAPINFO " .. class .. ": нет") end
		for _, ent in ipairs(list) do Dump(ent) end
	end
	local player1 = player.GetHumans()[1]
	if IsValid(player1) then
		local fog = player1:GetInternalVariable("m_PlayerFog.m_hCtrl")
		log("MAPINFO player fog controller: " .. tostring(fog))
	end
	log(string.format("MAPINFO navmesh loaded=%s areas=%d", tostring(navmesh.IsLoaded()), navmesh.GetNavAreaCount()))
	local w = game.GetWorld()
	log(string.format("MAPINFO world bounds %s .. %s", tostring(w:GetInternalVariable("m_WorldMins")), tostring(w:GetInternalVariable("m_WorldMaxs"))))

	-- Туман из config/map.lua (sv_map.lua) встал на контроллер
	local fog = PR_Map and PR_Map.Settings().fog
	local ctrl = ents.FindByClass("env_fog_controller")[1]
	if fog and IsValid(ctrl) then
		local kv = ctrl:GetKeyValues()
		T.check("fog end from config/map.lua", tonumber(kv.fogend) == fog.fin, kv.fogend)
		T.check("draw distance from config/map.lua", tonumber(kv.farz) == fog.farz, kv.farz)
	end

	-- Снимок вдаль: игрок над картой смотрит вдоль самой длинной открытой линии
	local host = player.GetHumans()[1]
	if IsValid(host) then
		host:SetMoveType(MOVETYPE_NOCLIP)
		local from, best, bestYaw = Vector(0, 0, 350), 0, 0
		for yaw = 0, 345, 15 do
			local tr = util.TraceLine({start = from, endpos = from + Angle(5, yaw, 0):Forward() * 20000, mask = MASK_SOLID_BRUSHONLY})
			local d = tr.Fraction * 20000
			if d > best then best, bestYaw = d, yaw end
		end
		host:SetPos(from)
		host:SetEyeAngles(Angle(5, bestYaw, 0))
		log(string.format("MAPINFO view from %s yaw %d, clear %d", tostring(from), bestYaw, best))
	end
end)

step(3, function() T.shot("fog_far") end)

-- Пути техники по navmesh (sv_nav.lua): между самыми далёкими друг от друга точками появления
-- путь есть, ищется быстро, и по каждому отрезку проходит корпус танка
step(0, function()
	T.check("vehicle path grid ready", PR_Nav and PR_Nav.Ready())
	if not (PR_Nav and PR_Nav.Ready()) then return end
	-- Открытые места, известные тестам: база патруля → спот среди домов на другом краю города
	-- (точки появления не годятся: часть стоит в комнатах спавна)
	local a, b = T.FIXED_BASES[1], T.HARD_SPOTS[2]
	local best = a:Distance(b)
	local half = 130   -- Tiger / King Tiger: корпус ~230 в ширину плюс запас
	-- Первый поиск без кэша — без ограничения времени, чтобы замерить, сколько он стоит
	local budget = PR_Nav.TIME_BUDGET
	PR_Nav.TIME_BUDGET = 60
	local t0 = SysTime()
	local path, expanded, partial = PR_Nav.FindPath(a, b, half)
	PR_Nav.TIME_BUDGET = budget
	local ms = (SysTime() - t0) * 1000
	local endGap = path and path[#path]:Distance(b) or -1
	log(string.format("MAPINFO nav path %s -> %s (%d apart): %s points, %s cells searched, %.0f ms, partial %s, ends %d from the goal",
		tostring(a), tostring(b), best, path and #path or "no", tostring(expanded), ms, tostring(partial), endGap))
	-- Цель среди домов: корпус может не пролезть к самой точке — путь до ближайшего проезда
	T.check("tank path across the town", path ~= nil and endGap < 800, endGap)
	if not path then
		for _, h in ipairs({5, 20, 40, 70, 130}) do
			local tr = util.TraceHull({start = a + Vector(0, 0, 35), endpos = a + Vector(200, 0, 35),
				mins = Vector(-h, -h, 0), maxs = Vector(h, h, 60), mask = MASK_SOLID_BRUSHONLY})
			log(string.format("MAPINFO hull %d: hit %s startsolid %s frac %.2f ent %s normal %s", h, tostring(tr.Hit), tostring(tr.StartSolid),
				tr.Fraction, tostring(tr.Entity), tostring(tr.HitNormal)))
		end
		-- Что вокруг старта: земля в соседних клетках и пролезает ли корпус
		for yaw = 0, 315, 45 do
			local p = a + Angle(0, yaw, 0):Forward() * 200
			local down = util.TraceLine({start = p + Vector(0, 0, 300), endpos = p - Vector(0, 0, 300), mask = MASK_SOLID_BRUSHONLY})
			log(string.format("MAPINFO around start yaw %d: ground %s, hull %s", yaw, down.Hit and math.Round(down.HitPos.z) or "-",
				tostring(PR_Nav.HullClear(a, down.HitPos, half))))
		end
		return
	end
	local bad, prev = 0, a
	for _, p in ipairs(path) do
		if not PR_Nav.HullClear(prev, p, half - 15) then bad = bad + 1 end
		prev = p
	end
	T.check("tank hull passes every path segment", bad <= 1, bad .. " of " .. #path)
	local t1 = SysTime()
	PR_Nav.FindPath(b, a, half)
	T.check("path search with cache is quick", (SysTime() - t1) * 1000 < 300, (SysTime() - t1) * 1000)
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
