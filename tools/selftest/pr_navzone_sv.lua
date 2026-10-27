-- Навмеш движка только там, где бой пехоты: город, аэродром, базы, нефтебаза, постройки, споты.
-- Прошлый navgen сеял по всей карте 30000×30000 — сетка растекалась по пустыне, слияние шло часами.
-- Здесь: затравки только внутри зон и пошаговая генерация (nav_generate_incremental) с ограниченным
-- радиусом. run_selftest.ps1 -Suite navzone -Instance N; строки NAVZONE — итог (сколько, где)
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step, waitFor = T.S, T.log, T.step, T.waitFor

local SEED_GRID = 800
local RANGE = tonumber(GetConVarString("pr_navzone_range")) or 1500

-- Прямоугольники зон {имя, minX, minY, maxX, maxY} (снимок мини-карты, верх — +Y)
local ZONES = {
	{"town", -10430, -4680, -5980, 2800},
	{"airfield", -12900, -2300, -9700, 4300},
	{"base_sw", -13800, -13750, -10600, -5450},
	{"base_e", 9450, -7400, 13900, -130},
	{"oil", 1150, -5800, 3750, -3400},
	{"hangar_n", 1150, 11200, 2300, 12200},
	{"tanks_w", -4500, -7000, -3400, -5900},
	{"south", -1000, -13600, 1400, -8900},
}

local function Ground(x, y)
	local tr = util.TraceLine({start = Vector(x, y, 3000), endpos = Vector(x, y, -3000), mask = MASK_PLAYERSOLID_BRUSHONLY})
	if tr.Hit and not tr.StartSolid and not tr.HitSky and tr.HitNormal.z > 0.7
		and bit.band(util.PointContents(tr.HitPos + Vector(0, 0, 5)), CONTENTS_WATER) == 0 then
		return tr.HitPos + Vector(0, 0, 5)
	end
end

local function Summary()
	local areas = navmesh.GetAllNavAreas()
	local minX, minY, maxX, maxY = math.huge, math.huge, -math.huge, -math.huge
	local perZone, outside = {}, 0
	for _, a in ipairs(areas) do
		local c = a:GetCenter()
		minX, minY, maxX, maxY = math.min(minX, c.x), math.min(minY, c.y), math.max(maxX, c.x), math.max(maxY, c.y)
		local inZone
		for _, z in ipairs(ZONES) do
			if c.x >= z[2] - RANGE and c.x <= z[4] + RANGE and c.y >= z[3] - RANGE and c.y <= z[5] + RANGE then inZone = z[1] break end
		end
		if inZone then perZone[inZone] = (perZone[inZone] or 0) + 1 else outside = outside + 1 end
	end
	log(string.format("NAVZONE result: areas=%d, bounds x %d..%d y %d..%d, outside zones+range: %d", #areas, minX, maxX, minY, maxY, outside))
	for _, z in ipairs(ZONES) do log(string.format("NAVZONE zone %s: %d areas", z[1], perZone[z[1]] or 0)) end
	T.check("navmesh built", #areas > 0, #areas)
	T.check("navmesh stays near the zones", outside < #areas * 0.1, outside .. " of " .. #areas)
end

step(0, function()
	log("start (navzone), map=" .. game.GetMap() .. ", range " .. RANGE)
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	if navmesh.IsLoaded() and navmesh.GetNavAreaCount() > 0 then
		S.ready = true
		Summary()
		return
	end
	RunConsoleCommand("sv_cheats", "1")
	RunConsoleCommand("nav_quicksave", "1")
	RunConsoleCommand("nav_generate_incremental_range", tostring(RANGE))

	local seeds = 0
	for _, z in ipairs(ZONES) do
		local n = 0
		for x = z[2], z[4], SEED_GRID do
			for y = z[3], z[5], SEED_GRID do
				local p = Ground(x, y)
				if p then navmesh.AddWalkableSeed(p, Vector(0, 0, 1)) n = n + 1 end
			end
		end
		log(string.format("NAVZONE seeds %s: %d", z[1], n))
		seeds = seeds + n
	end
	for _, spot in pairs(PR_Patrol.Spots or {}) do navmesh.AddWalkableSeed(spot.Pos + Vector(0, 0, 5), Vector(0, 0, 1)) seeds = seeds + 1 end
	log("NAVZONE seeds total " .. seeds)
end)

step(1, function()
	log("NAVZONE incremental generation started, range " .. GetConVarString("nav_generate_incremental_range"))
	S.genStart = SysTime()
	RunConsoleCommand("nav_generate_incremental")
end)

waitFor(150 * 60, function()
	if S.ready then return true end
	if navmesh.IsGenerating() then
		if SysTime() > (S.nextNote or 0) then
			S.nextNote = SysTime() + 60
			log(string.format("NAVZONE generating, %d s, areas so far %d", SysTime() - (S.genStart or SysTime()), navmesh.GetNavAreaCount()))
		end
		return false
	end
	return SysTime() - (S.genStart or SysTime()) > 5 and navmesh.GetNavAreaCount() > 0
end, "navmesh generated")

step(0, function()
	if not S.ready then
		log(string.format("NAVZONE finished in %d s", SysTime() - (S.genStart or SysTime())))
		Summary()
		navmesh.Save()
	end
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
