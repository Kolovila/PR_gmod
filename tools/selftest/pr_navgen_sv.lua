-- Генерация navmesh карты: run_selftest.ps1 -Suite navgen -Instance N. Движок строит сетку от
-- «затравок» — точек, с которых растекается по проходимой земле. Ставим их на точки появления и
-- сеткой по всей карте (луч сверху до земли), чтобы сетка покрыла и куски, не связанные с
-- точками появления. По окончании движок сам пишет maps/<карта>.nav и перезапускает карту —
-- тогда скрипт видит готовый navmesh и пишет итог
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step, waitFor = T.S, T.log, T.step, T.waitFor

local GRID = 1500

local function Summary()
	local areas = navmesh.GetAllNavAreas()
	local total, big = 0, 0
	for _, a in ipairs(areas) do
		local size = a:GetSizeX() * a:GetSizeY()
		total = total + size
		if a:GetSizeX() >= 150 and a:GetSizeY() >= 150 then big = big + 1 end
	end
	log(string.format("NAVGEN result: areas=%d, area sum=%.1f mln sq units, areas at least 150x150: %d", #areas, total / 1e6, big))
end

step(0, function()
	log("start (navgen), map=" .. game.GetMap())
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	if navmesh.IsLoaded() and navmesh.GetNavAreaCount() > 0 then
		S.ready = true
		Summary()
		return
	end
	RunConsoleCommand("sv_cheats", "1")
	-- Без анализа укрытий и видимости: он для ботов CS, а на карте 30000×30000 идёт часами
	RunConsoleCommand("nav_quicksave", "1")

	local seeds = 0
	local function Seed(pos)
		navmesh.AddWalkableSeed(pos, Vector(0, 0, 1))
		seeds = seeds + 1
	end
	for _, sp in ipairs(ents.FindByClass("info_player_*")) do Seed(sp:GetPos()) end
	-- Сетка: луч сверху вниз; садим, только если попали в землю (не в небо, не в воду, не на крышу
	-- выше 300 над самым низом карты — крыши связаны с землёй лестницами не всегда)
	for x = -15360 + GRID / 2, 15360, GRID do
		for y = -15360 + GRID / 2, 15360, GRID do
			local tr = util.TraceLine({start = Vector(x, y, 440), endpos = Vector(x, y, -900), mask = MASK_PLAYERSOLID_BRUSHONLY})
			if tr.Hit and not tr.StartSolid and not tr.HitSky and tr.HitNormal.z > 0.7
				and bit.band(util.PointContents(tr.HitPos + Vector(0, 0, 5)), CONTENTS_WATER) == 0 then
				Seed(tr.HitPos + Vector(0, 0, 5))
			end
		end
	end
	log(string.format("NAVGEN seeds %d", seeds))
end)

-- Квар ставится через консоль — на следующем кадре
step(1, function()
	log("NAVGEN nav_quicksave=" .. GetConVarString("nav_quicksave") .. ", generation started")
	S.genStart = SysTime()
	navmesh.BeginGeneration()
end)

waitFor(90 * 60, function()
	if S.ready then return true end
	if navmesh.IsGenerating() then
		if SysTime() > (S.nextNote or 0) then
			S.nextNote = SysTime() + 60
			log(string.format("NAVGEN generating, %d s", SysTime() - (S.genStart or SysTime())))
		end
		return false
	end
	return navmesh.GetNavAreaCount() > 0
end, "navmesh generated")

step(0, function()
	if not S.ready then
		log(string.format("NAVGEN finished in %d s", SysTime() - (S.genStart or SysTime())))
		Summary()
		navmesh.Save()
	end
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
