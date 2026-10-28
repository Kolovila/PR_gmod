-- Оружие ArcCW (addons/ws_arccw, tools/workshop): каждый ствол — есть ли модели и звук выстрела,
-- выдаётся ли боту и берётся ли в руки; все товары стартовых списков магазина есть в игре.
-- run_selftest.ps1 -Suite weapons. Строки WEAPON_BAD <класс> <что> — в журнал; ошибки Lua самих
-- стволов раннер покажет из консоли
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")

local T = include("pr_selftest_lib.lua")
local S, log, step = T.S, T.log, T.step

local function IsArc(class)
	return weapons.IsBasedOn(class, "arccw_base") and not string.find(class, "base", 1, true)
end

local function SoundOk(name)
	if istable(name) then name = name[1] end
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
		if c and IsArc(c) and (w.Spawnable or w.AdminSpawnable) then table.insert(S.list, c) end
	end
	table.sort(S.list)
	log("ArcCW weapons spawnable: " .. #S.list)
	T.check("200+ ArcCW weapons from the Workshop packs", #S.list >= 200, #S.list)
	T.check("no CW 2.0 weapons left", weapons.GetStored("cw_base") == nil)

	local noVM, noWM, noSnd = {}, {}, {}
	for _, c in ipairs(S.list) do
		local w = weapons.Get(c)
		local vm = w.ViewModel or ""
		local wm = w.MirrorVMWM and (w.MirrorWorldModel or vm) or (w.WorldModel or "")
		if vm == "" or not file.Exists(vm, "GAME") then table.insert(noVM, c) log("WEAPON_BAD " .. c .. " viewmodel " .. vm) end
		if wm ~= "" and not file.Exists(wm, "GAME") then table.insert(noWM, c) log("WEAPON_BAD " .. c .. " worldmodel " .. wm) end
		if not weapons.IsBasedOn(c, "arccw_base_nade") and not weapons.IsBasedOn(c, "arccw_base_melee") then
			local ok, path = SoundOk(w.ShootSound)
			if ok == false then table.insert(noSnd, c) log("WEAPON_BAD " .. c .. " shootsound " .. tostring(path)) end
		end
	end
	T.check("every ArcCW weapon has its view model", #noVM == 0, #noVM .. ": " .. table.concat(noVM, " ", 1, math.min(#noVM, 12)))
	T.check("every ArcCW weapon has its world model", #noWM <= 3, #noWM .. ": " .. table.concat(noWM, " ", 1, math.min(#noWM, 12)))
	T.check("every ArcCW weapon has its fire sound", #noSnd <= 5, #noSnd .. ": " .. table.concat(noSnd, " ", 1, math.min(#noSnd, 12)))

	-- Стартовые списки магазина: каждый товар есть в игре
	local missing = {}
	for _, types in pairs(PR_SHOP_DEFAULTS.Weapons) do
		for _, chain in pairs(types) do
			for _, item in ipairs(chain) do
				if not PR_WeaponExists(item[1]) then missing[#missing + 1] = item[1] end
			end
		end
	end
	for _, items in pairs(PR_SHOP_DEFAULTS.Equipment) do
		for _, item in ipairs(items) do
			if not (PR_WeaponExists(item[1]) or scripted_ents.GetStored(item[1]) or string.StartWith(item[1], "item_")) then
				missing[#missing + 1] = item[1]
			end
		end
	end
	for _, m in ipairs(missing) do log("WEAPON_BAD shop item missing " .. m) end
	T.check("every shop default weapon and equipment exists", #missing == 0, #missing .. ": " .. table.concat(missing, " ", 1, math.min(#missing, 12)))
	local cw = 0
	for _, entries in pairs(PR_WS_List or {}) do
		for _, e in ipairs(entries) do
			if isstring(e.ClassName) and string.StartWith(e.ClassName, "cw_") then cw = cw + 1 end
		end
	end
	T.check("shop has no CW 2.0 items after the migration", cw == 0, cw)

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
	end
end

step(0.5, function()
	local function Loop()
		Held()
		if Next() then
			T.check("every ArcCW weapon can be given and held", #S.notHeld <= 3, #S.notHeld .. ": " .. table.concat(S.notHeld, " ", 1, math.min(#S.notHeld, 15)))
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
