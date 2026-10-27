-- Связь режима с VJ Base 3.2 (addons/VJ-Base) без правки самого VJ. Раньше то же самое было
-- вписано прямо в копию VJ 2.15.3b (WhiteFractionList) — при переезде перенесено сюда.
--  * Игрок получает VJ-класс своей группировки (CLASS_PR_<группировка>): защитники точек этой
--    группировки ему свои (VJ сам ставит D_LI, ходят за ним по E), чужим — враг. Мародёры (каждый
--    сам за себя) класса не получают.
--  * Сигналы защитников в чат своей группировке: «на нас напали» (не чаще раза в 10 с) и «я помер».

-- VJ кэширует классы по ссылке на таблицу, поэтому при смене группировки — новая таблица
local function SyncPlayerClass(ply)
	local frac = ply:GetNWString("PR_fraction")
	if ply.PR_VJClassFrac == frac then return end
	ply.PR_VJClassFrac = frac

	if frac == "" or (PR_FREE_FOR_ALL_FRACTIONS and PR_FREE_FOR_ALL_FRACTIONS[frac]) then
		ply.VJ_NPC_Class = nil
	else
		ply.VJ_NPC_Class = {"CLASS_PR_" .. frac}
	end
end

-- Группировку ставят в нескольких местах (вход, админка, сейвы, автотест) — сверяем раз в полсекунды
timer.Create("PR_VJPlayerClasses", 0.5, 0, function()
	for _, ply in ipairs(player.GetAll()) do
		SyncPlayerClass(ply)
	end
end)

local function TellFraction(frac, text)
	if not isstring(frac) or frac == "" then return end
	for _, ply in ipairs(player.GetHumans()) do
		if ply:GetNWString("PR_fraction") == frac then ply:ChatPrint(text) end
	end
end

hook.Add("PostEntityTakeDamage", "PR_GuardSignalAttacked", function(ent, dmg, took)
	if not took or not ent.SignalUpgrade or ent:Health() <= 0 then return end
	if CurTime() < (ent.PR_NextSignalT or 0) then return end
	ent.PR_NextSignalT = CurTime() + 10
	TellFraction(ent:GetNWString("PR_fraction"), "Король Артур, на нас напали!\nМоя изначальная точка: " .. tostring(ent.SignalPoint))
end)

hook.Add("OnNPCKilled", "PR_GuardSignalDied", function(npc)
	if not npc.SignalUpgrade then return end
	TellFraction(npc:GetNWString("PR_fraction"), "Я помер\nМоя изначальная точка: " .. tostring(npc.SignalPoint))
end)
