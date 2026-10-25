-- Снимок карты сверху для мини-карты: run_selftest.ps1 -Suite mapshot, потом stitch_mapshot.ps1.
-- Сервер находит границы карты (стены неба) и высоту неба, клиент снимает карту ортокамерой
-- плитками (pr_selftest_cl.lua, PR_SELFTEST_MAPSHOT) в data/pr_selftest/map_<ряд>_<столбец>.png
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")
util.AddNetworkString("PR_SELFTEST_MAPSHOT")
util.AddNetworkString("PR_SELFTEST_MAPSHOT_DONE")

local T = include("pr_selftest_lib.lua")
local S, log, check, step, waitFor = T.S, T.log, T.check, T.step, T.waitFor

local TILES, TILE_PX = 4, 512

net.Receive("PR_SELFTEST_MAPSHOT_DONE", function()
	S.mapshotTiles = net.ReadUInt(8)
end)

-- Куда упирается луч (до стены неба)
local function Reach(from, dir)
	local tr = util.TraceLine({start = from, endpos = from + dir * 60000, mask = MASK_SOLID_BRUSHONLY})
	return tr.HitPos, tr.HitSky
end

step(0, function()
	log("start (mapshot), map=" .. game.GetMap())
	S.host = player.GetHumans()[1]
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()

	-- Высота неба: луч вверх от точки появления, которая под открытым небом (а не под крышей).
	-- Камера встаёт чуть ниже неба
	local spawns = ents.FindByClass("info_player_*")
	check("spawn points found", #spawns > 0, #spawns)
	local origin, ceil
	for _, sp in ipairs(spawns) do
		local hit, sky = Reach(sp:GetPos() + Vector(0, 0, 64), Vector(0, 0, 1))
		if sky and (not ceil or hit.z > ceil) then origin, ceil = sp:GetPos(), hit.z end
	end
	check("spawn point under open sky", origin ~= nil)
	if not origin then return end
	S.camZ = ceil - 32

	-- Границы: у самого неба лучи по сторонам света упираются только в стены неба. Берём
	-- самые дальние из нескольких параллельных лучей
	local z = S.camZ - 64
	local minX, maxX, minY, maxY = math.huge, -math.huge, math.huge, -math.huge
	for _, off in ipairs({-3000, 0, 3000}) do
		local px = Reach(Vector(origin.x, origin.y + off, z), Vector(1, 0, 0))
		local nx = Reach(Vector(origin.x, origin.y + off, z), Vector(-1, 0, 0))
		local py = Reach(Vector(origin.x + off, origin.y, z), Vector(0, 1, 0))
		local ny = Reach(Vector(origin.x + off, origin.y, z), Vector(0, -1, 0))
		maxX, minX = math.max(maxX, px.x), math.min(minX, nx.x)
		maxY, minY = math.max(maxY, py.y), math.min(minY, ny.y)
	end
	S.bounds = {minX = math.floor(minX), maxX = math.ceil(maxX), minY = math.floor(minY), maxY = math.ceil(maxY)}
	log(string.format("map bounds x %d..%d, y %d..%d, camera z %d, ground at spawn %d",
		S.bounds.minX, S.bounds.maxX, S.bounds.minY, S.bounds.maxY, S.camZ, origin.z))
	check("map bounds look sane", maxX - minX > 2000 and maxY - minY > 2000 and S.camZ > origin.z + 200)

	-- Хоста убираем подальше вверх, чтобы не попал в кадр
	S.host:SetMoveType(MOVETYPE_NOCLIP)
	S.host:SetPos(Vector(S.bounds.minX + 64, S.bounds.minY + 64, S.camZ - 40))
end)

step(2, function()
	net.Start("PR_SELFTEST_MAPSHOT")
		net.WriteFloat(S.bounds.minX)
		net.WriteFloat(S.bounds.maxX)
		net.WriteFloat(S.bounds.minY)
		net.WriteFloat(S.bounds.maxY)
		net.WriteFloat(S.camZ)
		net.WriteUInt(TILES, 8)
		net.WriteUInt(TILE_PX, 16)
	net.Send(S.host)
end)

waitFor(60, function() return S.mapshotTiles ~= nil end, "map tiles")

step(0, function()
	check("all map tiles captured", S.mapshotTiles == TILES * TILES, S.mapshotTiles)
	-- Для stitch_mapshot.ps1 и config/minimap.lua
	file.CreateDir("pr_selftest")
	file.Write("pr_selftest/map_bounds.txt", string.format("%d %d %d %d %d %d", S.bounds.minX, S.bounds.maxX, S.bounds.minY, S.bounds.maxY, TILES, TILE_PX))
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
