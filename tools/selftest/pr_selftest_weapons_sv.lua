-- Оружейные аддоны из Workshop (addons/ws_*, tools/workshop): каждый ствол на базе CW 2.0 —
-- есть ли модели и звук выстрела, выдаётся ли боту и берётся ли в руки. run_selftest.ps1 -Suite weapons
-- Строки WEAPON_BAD <класс> <что> — в журнал; ошибки Lua самих стволов раннер покажет из консоли
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step = T.S, T.log, T.step

local BASES = {"cw_base", "mw3_wpn_base"}

local function IsCW(class)
	for _, b in ipairs(BASES) do
		if class ~= b and weapons.IsBasedOn(class, b) then return true end
	end
	return false
end

local function SoundFile(name)
	if not isstring(name) or name == "" then return nil end
	local props = sound.GetProperties(name)
	local snd = props and props.sound or name
	if istable(snd) then snd = snd[1] end
	if not isstring(snd) then return nil end
	snd = string.gsub(snd, "^[%^%)%(<>#@!*?$&~]+", "")
	return file.Exists("sound/" .. snd, "GAME"), snd
end

step(0, function()
	log("start (weapons)")
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()

	S.list = {}
	for _, w in ipairs(weapons.GetList()) do
		local c = w.ClassName
		if c and IsCW(c) and not string.find(c, "base", 1, true) and (w.Spawnable or w.AdminSpawnable) then
			table.insert(S.list, c)
		end
	end
	table.sort(S.list)
	log("CW weapons spawnable: " .. #S.list)
	T.check("600+ CW weapons from the Workshop packs", #S.list >= 600, #S.list)

	local noVM, noWM, noSnd = {}, {}, {}
	for _, c in ipairs(S.list) do
		local w = weapons.Get(c)
		local vm, wm = w.ViewModel or "", w.WorldModel or ""
		if vm == "" or not file.Exists(vm, "GAME") then table.insert(noVM, c) log("WEAPON_BAD " .. c .. " viewmodel " .. vm) end
		if wm ~= "" and not file.Exists(wm, "GAME") then table.insert(noWM, c) log("WEAPON_BAD " .. c .. " worldmodel " .. wm) end
		local fire = w.FireSound
		if fire then
			local ok, path = SoundFile(fire)
			if ok == false then table.insert(noSnd, c) log("WEAPON_BAD " .. c .. " firesound " .. tostring(fire) .. " -> " .. tostring(path)) end
		end
	end
	T.check("every CW weapon has its view model", #noVM == 0, #noVM .. ": " .. table.concat(noVM, " ", 1, math.min(#noVM, 12)))
	T.check("every CW weapon has its world model", #noWM <= 5, #noWM .. ": " .. table.concat(noWM, " ", 1, math.min(#noWM, 12)))
	T.check("every CW weapon has its fire sound", #noSnd <= 10, #noSnd .. ": " .. table.concat(noSnd, " ", 1, math.min(#noSnd, 12)))

	-- Взять в руки: бот получает ствол, переключается на него
	S.bot = player.CreateNextBot("wtest")
	S.i, S.notHeld = 0, {}
end)

step(1, function()
	if not IsValid(S.bot) then return end
	S.bot:Spawn()
	S.bot:SetPos(Vector(-7795.6, -1890, -480))
end)

-- По одному стволу за шаг: выдать, взять, проверить и убрать
local function Next()
	S.i = S.i + 1
	local c = S.list[S.i]
	if not c or not IsValid(S.bot) then return true end
	if not S.bot:Alive() then S.bot:Spawn() end
	S.bot:StripWeapons()
	local wep = S.bot:Give(c)
	if IsValid(wep) then S.bot:SelectWeapon(c) end
	S.current, S.currentWep = c, wep
	return false
end

local function Held()
	local c = S.current
	if not c then return end
	local active = IsValid(S.bot) and S.bot:GetActiveWeapon()
	if not (IsValid(active) and active:GetClass() == c) then
		table.insert(S.notHeld, c)
		log("WEAPON_BAD " .. c .. " not held (" .. tostring(IsValid(S.currentWep)) .. ")")
	elseif weapons.IsBasedOn(c, "cw_base") and not isnumber(active.EffectiveRange) then
		-- Initialize упал на полпути (у патрона нет баллистики CW — sh_cw_compat.lua)
		S.noRange = S.noRange or {}
		table.insert(S.noRange, c)
		log("WEAPON_BAD " .. c .. " no effective range (ammo " .. tostring(active.Primary and active.Primary.Ammo) .. ")")
	end
end

-- Шаги на каждый ствол строятся после того, как список известен
step(0.5, function()
	local function Loop()
		Held()
		if Next() then
			T.check("every CW weapon can be given and held", #S.notHeld <= 5, #S.notHeld .. ": " .. table.concat(S.notHeld, " ", 1, math.min(#S.notHeld, 15)))
			local noRange = S.noRange or {}
			T.check("every CW weapon initializes its ballistics", #noRange == 0, #noRange .. ": " .. table.concat(noRange, " ", 1, math.min(#noRange, 15)))
			if IsValid(S.bot) then S.bot:Kick("selftest") end
			T.done()
			return
		end
		timer.Simple(0.25, Loop)
	end
	Next()
	timer.Simple(0.25, Loop)
end)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
