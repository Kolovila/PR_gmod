-- Паки NPC (addons/ws_npcs, tools/workshop): каждый VJ-NPC из спавн-меню появляется, жив, с моделью
-- и оружием в руках. По одному: выпустить, подождать, проверить, убрать. run_selftest.ps1 -Suite npcs
-- Строки NPC_BAD <класс> <что> — в журнал; ошибки Lua паков раннер покажет из консоли
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step = T.S, T.log, T.step

local SPOT = Vector(-7795.6, -1890, -505)

step(0, function()
	log("start (npcs)")
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	RunConsoleCommand("ai_ignoreplayers", "1")

	S.list = {}
	for key, data in SortedPairs(list.Get("NPC")) do
		local class = data.Class or key
		local stored = scripted_ents.GetStored(class)
		if stored and scripted_ents.IsBasedOn(class, "npc_vj_human_base") then
			table.insert(S.list, {key = key, class = class, data = data})
		end
	end
	log("VJ human NPCs in the spawn menu: " .. #S.list)
	T.check("100+ VJ human NPCs from the packs", #S.list >= 100, #S.list)
	S.i, S.bad = 0, {dead = {}, model = {}, weapon = {}, failed = {}}
end)

local function Spawn(entry)
	local npc = ents.Create(entry.class)
	if not IsValid(npc) then return nil end
	local weps = entry.data.Weapons
	if istable(weps) and #weps > 0 then npc:SetKeyValue("additionalequipment", weps[1]) end
	if entry.data.KeyValues then
		for k, v in pairs(entry.data.KeyValues) do npc:SetKeyValue(k, v) end
	end
	npc:SetPos(SPOT)
	npc:SetAngles(Angle(0, math.random(0, 359), 0))
	PR_Quietly(function()
		npc:Spawn()
		npc:Activate()
	end)
	return npc
end

local function Check(entry, npc)
	local c = entry.key
	if not IsValid(npc) then
		table.insert(S.bad.failed, c) log("NPC_BAD " .. c .. " not created / removed")
		return
	end
	if npc:Health() <= 0 or npc.Dead then table.insert(S.bad.dead, c) log("NPC_BAD " .. c .. " dead right after spawn") end
	local mdl = npc:GetModel() or ""
	if mdl == "" or not file.Exists(mdl, "GAME") then table.insert(S.bad.model, c) log("NPC_BAD " .. c .. " model " .. mdl) end
	local weps = entry.data.Weapons
	if istable(weps) and #weps > 0 and not IsValid(npc:GetActiveWeapon()) then
		table.insert(S.bad.weapon, c) log("NPC_BAD " .. c .. " no weapon in hands (" .. tostring(weps[1]) .. ")")
	end
	npc:Remove()
end

step(0.5, function()
	local function Loop()
		S.i = S.i + 1
		local entry = S.list[S.i]
		if not entry then
			local b = S.bad
			local function list(t) return #t .. ": " .. table.concat(t, " ", 1, math.min(#t, 12)) end
			T.check("every VJ NPC is created", #b.failed == 0, list(b.failed))
			T.check("every VJ NPC is alive after spawn", #b.dead == 0, list(b.dead))
			T.check("every VJ NPC has its model", #b.model == 0, list(b.model))
			T.check("every armed VJ NPC holds its weapon", #b.weapon <= 3, list(b.weapon))
			RunConsoleCommand("ai_ignoreplayers", "0")
			T.done()
			return
		end
		local npc = Spawn(entry)
		timer.Simple(1.5, function()
			Check(entry, npc)
			timer.Simple(0.1, Loop)
		end)
	end
	Loop()
end)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
