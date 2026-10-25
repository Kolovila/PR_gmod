-- Мини-карта (cl_minimap.lua), серверная часть.
--   Союзники: игроков вдали движок клиенту не присылает (а мини-карта показывает своих по всей
--   карте), поэтому раз в полсекунды рассылаем каждой группировке, где её игроки.
--   Территории: названия из редактора патрулей и споты каждой — клиент пишет название посередине
--   и знает, в какой территории игрок сейчас.
util.AddNetworkString("PR_MinimapAllies")
util.AddNetworkString("PR_MinimapZones")

local ALLY_INTERVAL = 0.5

timer.Create("PR_MinimapAllies", ALLY_INTERVAL, 0, function()
	local byFaction = {}
	for _, ply in ipairs(player.GetAll()) do
		local frac = ply:GetNWString("PR_fraction")
		-- У мародёров союзников нет (каждый сам за себя), экипаж патрулей — не игроки
		if ply:Alive() and not ply:GetNWBool("PR_PatrolCrew") and PR_AreAllies(frac, frac) then
			byFaction[frac] = byFaction[frac] or {}
			table.insert(byFaction[frac], ply)
		end
	end

	for _, members in pairs(byFaction) do
		local humans = {}
		for _, ply in ipairs(members) do
			if not ply:IsBot() then table.insert(humans, ply) end
		end
		if #members > 1 and #humans > 0 then
			net.Start("PR_MinimapAllies")
				net.WriteUInt(#members, 8)
				for _, ply in ipairs(members) do
					local pos = ply:GetPos()
					net.WriteUInt(ply:EntIndex(), 8)
					net.WriteInt(math.Round(pos.x), 17)
					net.WriteInt(math.Round(pos.y), 17)
					net.WriteUInt(math.Round(math.NormalizeAngle(ply:EyeAngles().y) + 180) % 360, 9)
				end
			net.Send(humans)
		end
	end
end)

-- {{name, spots = {Vector, ...}}, ...} по названию территории
local function Zones()
	local byName = {}
	for _, spot in pairs(PR_Patrol and PR_Patrol.Spots or {}) do
		if spot.Zone and spot.Zone ~= "" then
			byName[spot.Zone] = byName[spot.Zone] or {name = spot.Zone, spots = {}}
			table.insert(byName[spot.Zone].spots, spot.Pos)
		end
	end
	local out = {}
	for _, zone in SortedPairs(byName) do table.insert(out, zone) end
	return out
end

local function SendZones(target)
	local zones = Zones()
	net.Start("PR_MinimapZones")
		net.WriteUInt(math.min(#zones, 255), 8)
		for i = 1, math.min(#zones, 255) do
			local zone = zones[i]
			net.WriteString(zone.name)
			net.WriteUInt(math.min(#zone.spots, 255), 8)
			for j = 1, math.min(#zone.spots, 255) do
				net.WriteInt(math.Round(zone.spots[j].x), 17)
				net.WriteInt(math.Round(zone.spots[j].y), 17)
			end
		end
	if IsValid(target) then net.Send(target) else net.Broadcast() end
end

hook.Add("PR_PatrolSpotsChanged", "PR_Minimap", function() SendZones() end)

-- Клиент просит территории, когда загрузился (раз в 5 секунд, не чаще)
net.Receive("PR_MinimapZones", function(_, ply)
	if (ply.PR_MinimapZonesAt or 0) > CurTime() then return end
	ply.PR_MinimapZonesAt = CurTime() + 5
	SendZones(ply)
end)
