-- Правки карты из config/map.lua: туман и дальность прорисовки. Ставим через входы самого
-- env_fog_controller — он передаёт их всем игрокам, клиентского кода не нужно
include("config/map.lua")

PR_Map = PR_Map or {}

function PR_Map.Settings()
	return PR_MAP_SETTINGS and PR_MAP_SETTINGS[game.GetMap()] or {}
end

function PR_Map.ApplyFog()
	local fog = PR_Map.Settings().fog
	if not fog then return 0 end
	local count = 0
	for _, ent in ipairs(ents.FindByClass("env_fog_controller")) do
		if fog.start then ent:Fire("SetStartDist", tostring(fog.start)) end
		if fog.fin then ent:Fire("SetEndDist", tostring(fog.fin)) end
		if fog.farz then ent:Fire("SetFarZ", tostring(fog.farz)) end
		if fog.density then ent:SetKeyValue("fogmaxdensity", tostring(fog.density)) end
		count = count + 1
	end
	return count
end

-- Без возврата значения: хук, который что-то вернул, обрывает остальные обработчики события
local function Apply() PR_Map.ApplyFog() end
hook.Add("InitPostEntity", "PR_MapFog", Apply)
hook.Add("PostCleanupMap", "PR_MapFog", Apply)
