-- Кто убирает технику патруля: run_selftest.ps1 -Suite vanish. Выпускает патруль «Техника» на
-- спот #5 (как у пользователя: машины пропали без урона через ~20 с) и пишет, кто вызвал Remove у
-- машины патруля (стек Lua), когда она пропала и что с ней было перед этим. Если Remove из Lua
-- не вызывался, а машина пропала — её убрал движок (вылетела за карту и т. п.)
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step, waitFor = T.S, T.log, T.step, T.waitFor

local function Info(e)
	local v = e.PR_PatrolVehicle
	local hp = isfunction(e.GetCurHealth) and e:GetCurHealth() or "-"
	return string.format("%s at %s up=%.2f speed=%d hp=%s state=%s", v and v.class or e:GetClass(), tostring(e:GetPos()),
		e:GetUp().z, e:GetVelocity():Length(), tostring(hp), tostring(v and v.driveState))
end

step(0, function()
	log("start (vanish), map=" .. game.GetMap())
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	S.host = player.GetHumans()[1]
	if IsValid(S.host) then S.host:AddFlags(FL_NOTARGET) end

	-- Кто вызвал Remove — пишет сам режим (sv_patrols.lua, «убран(а) извне») в журнал патрулей
	hook.Add("EntityRemoved", "PR_SelftestVanish", function(e)
		if e.PR_PatrolVehicle then log("VANISH removed: " .. Info(e)) end
	end)
	hook.Add("simfphysOnDestroyed", "PR_SelftestVanish", function(e)
		if e.PR_PatrolVehicle then log("VANISH simfphys destroyed: " .. Info(e) .. "\n" .. debug.traceback("", 2)) end
	end)

	local key
	for k, cfg in pairs(PR_PATROL_TYPES or {}) do
		if cfg.name == "Техника" then key = k end
	end
	log("VANISH type key " .. tostring(key) .. ", spot 5 " .. tostring(PR_Patrol.Spots[5] and PR_Patrol.Spots[5].Pos))
	if not key then return end
	S.patrol = PR_Patrol.Spawn(key, 5)
	S.t0 = CurTime()
end)

-- Диагностика в sv_patrols.lua: «чужое» удаление машины и живого бойца попадает в журнал патрулей
step(15, function()
	if not S.patrol then return end
	S.logLines = {}
	local oldLog = PR_Patrol.Log
	PR_Patrol.Log = function(text) table.insert(S.logLines, text) return oldLog(text) end
	S.oldLog = oldLog
	local v = S.patrol.vehicles[1]
	local npc = S.patrol.members[#S.patrol.members]
	if v and IsValid(v.ent) then S.foreignVeh = v; v.ent:Remove() end
	if IsValid(npc) then npc:Remove() end
	timer.Simple(0.5, function()
		PR_Patrol.Log = S.oldLog
		local vehLine, npcLine = false, false
		for _, l in ipairs(S.logLines) do
			if l:find("убран(а) извне", 1, true) and l:find("pr_selftest_sv", 1, true) then
				if l:find("боец", 1, true) then npcLine = true else vehLine = true end
			end
		end
		T.check("foreign removal of a patrol vehicle is logged with the caller", vehLine, table.concat(S.logLines, " / "))
		T.check("foreign removal of a living patrol member is logged", npcLine)
	end)
end)

-- 90 с: раз в 3 с — где машины
waitFor(75, function()
	if not S.patrol then return true end
	if CurTime() > (S.nextNote or 0) then
		S.nextNote = CurTime() + 3
		local parts = {}
		for _, v in ipairs(S.patrol.vehicles or {}) do
			parts[#parts + 1] = IsValid(v.ent) and Info(v.ent) or (tostring(v.class) .. " GONE")
		end
		log(string.format("VANISH t=%d %s", CurTime() - S.t0, table.concat(parts, " || ")))
	end
	return false
end, "90 s of the patrol")

step(0, function()
	if S.patrol then PR_Patrol.Remove(S.patrol) end
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
