-- Временный автотест PR. Кладётся в garrysmod/lua/autorun/server/, после теста удаляется.
if engine.ActiveGamemode() ~= "testgm" then return end

util.AddNetworkString("PR_SELFTEST_ATTACK")
util.AddNetworkString("PR_SELFTEST_ATTACK_DONE")
util.AddNetworkString("PR_SELFTEST_SETPOINT")
util.AddNetworkString("PR_SELFTEST_SHOT")
util.AddNetworkString("PR_SELFTEST_CLOSE")
util.AddNetworkString("PR_SELFTEST_TAB")
util.AddNetworkString("PR_SELFTEST_EDITOR")
util.AddNetworkString("PR_SELFTEST_SETFRAC")
util.AddNetworkString("PR_SELFTEST_GUARD")
util.AddNetworkString("PR_SELFTEST_PTYPE_SAVE")
util.AddNetworkString("PR_SELFTEST_PTYPE_CMD")
util.AddNetworkString("PR_SELFTEST_PTYPES_OPEN")
util.AddNetworkString("PR_SELFTEST_PTYPES_SCROLL")
util.AddNetworkString("PR_SELFTEST_RESULT")
util.AddNetworkString("PR_SELFTEST_MINIMAP")

local T = include("pr_selftest_lib.lua")
local S, log, check, step, waitFor, shot = T.S, T.log, T.check, T.step, T.waitFor, T.shot

-- Проверки, которые делает клиент (окна): итог присылает сюда
net.Receive("PR_SELFTEST_RESULT", function()
	local name, ok, detail = net.ReadString(), net.ReadBool(), net.ReadString()
	S.clientResults = (S.clientResults or 0) + 1
	check(name, ok, detail)
end)

local function damage(victim, attacker, inflictor)
	local d = DamageInfo()
	d:SetDamage(100000)
	d:SetAttacker(attacker)
	d:SetInflictor(inflictor or attacker)
	d:SetDamageType(DMG_BULLET)
	victim:TakeDamageInfo(d)
end

local function ground(pos)
	local tr = util.TraceLine({start = pos + Vector(0, 0, 100), endpos = pos - Vector(0, 0, 1000)})
	return tr.HitPos
end

-- Место метрах в четырёх от точки на том же полу, откуда точку видно
local function viewSpotAt(base)
	for yaw = 0, 330, 30 do
		local probe = base + Angle(0, yaw, 0):Forward() * 220
		local down = util.TraceLine({start = probe + Vector(0, 0, 80), endpos = probe - Vector(0, 0, 300), mask = MASK_PLAYERSOLID_BRUSHONLY})
		if down.Hit and not down.StartSolid and math.abs(down.HitPos.z - base.z) < 60 then
			local feet = down.HitPos + Vector(0, 0, 2)
			local hull = util.TraceHull({start = feet, endpos = feet, mins = Vector(-16, -16, 0), maxs = Vector(16, 16, 72), mask = MASK_PLAYERSOLID})
			local sight = util.TraceLine({start = feet + Vector(0, 0, 64), endpos = base + Vector(0, 0, 100), mask = MASK_SOLID_BRUSHONLY})
			if not hull.Hit and not sight.Hit then return feet end
		end
	end
end

local function findIn(list, field, value)
	for _, e in ipairs(list or {}) do if e[field] == value then return e end end
end

-- Какие net-сообщения сервер начал отправлять, пока выполнялся fn
local function netSentBy(fn)
	local names, orig = {}, net.Start
	net.Start = function(name, ...)
		names[#names + 1] = name
		return orig(name, ...)
	end
	local ok, err = pcall(fn)
	net.Start = orig
	if not ok then error(err) end
	return names
end


----------------------------------------------------------------------------------------------------
-- Часть 1: игровая логика (как в прошлом прогоне)
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Общая подготовка: хост и два бота (нужны всем секциям). Секции: core (игровая логика, сейвы,
-- точки, меню), patrol (пеший патруль и редактор), armor (патруль с техникой)
----------------------------------------------------------------------------------------------------
T.section("common")

step(0, function()
	S.host = player.GetHumans()[1]
	log("start, map=" .. game.GetMap() .. ", sections " .. (T.only and table.concat(table.GetKeys(T.only), " ") or "all"))
	RunConsoleCommand("pr_capture_time", "2")
	RunConsoleCommand("bot")
	RunConsoleCommand("bot")
end)

waitFor(6, function() return #player.GetBots() >= 2 end, "two bots")

step(0, function()
	local bots = player.GetBots()
	check("two bots joined", #bots >= 2, #bots)
	S.b1, S.b2 = bots[1], bots[2]
end)

T.section("core")

step(0, function()
	log("core, VJBASE_VERSION=" .. tostring(VJBASE_VERSION))
	check("PR_IsAdmin defined", isfunction(PR_IsAdmin))
	check("PR_IsInBuyZone defined", isfunction(PR_IsInBuyZone))
	check("PR_Save_All defined", isfunction(PR_Save_All))
	check("PR_NetThrottle defined", isfunction(PR_NetThrottle))
	check("PR_FactionSpawns table", istable(PR_FactionSpawns))
	check("concommands removed", concommand.GetTable()["set_ssnkcloth1"] == nil and concommand.GetTable()["buy_entity"] == nil)

	local sp = scripted_ents.Get("spawn_point_SSNK") or scripted_ents.Get("spawn_point_ssnk")
	check("spawn_point_SSNK based on pr_spawn_point_base", sp and sp.Base == "pr_spawn_point_base", sp and sp.Base)
	check("guardian NPC registered", list.Get("NPC")["npc_vj_mishawild_sniper1"] ~= nil)

	S.host = player.GetHumans()[1]
	check("host save migrated or loaded", IsValid(S.host) and S.host.PR_Loaded == true)

	-- SQLite: таблицы и импорт старых JSON
	for _, t in ipairs({"pr_meta", "pr_players", "pr_player_fractions", "pr_player_items", "pr_player_presets", "pr_points", "pr_point_layout", "pr_shop_weapons", "pr_shop_equipment", "pr_shop_vehicles", "pr_shop_cloth"}) do
		check("table " .. t, sql.TableExists(t))
	end
	check("weapon json moved to backup", not file.Exists("pr_gamemode/weapon_shop_list.txt", "DATA") and file.Exists("pr_gamemode/json_backup/weapon_shop_list.txt", "DATA"))
	check("points json moved to backup", not file.Exists("pr_gamemode/capture_points_list.txt", "DATA") and file.Exists("pr_gamemode/json_backup/capture_points_list.txt", "DATA"))
	check("legacy players.txt emptied and backed up", not file.Exists("pr_gamemode/players.txt", "DATA") and file.Exists("pr_gamemode/json_backup/players.txt", "DATA"))

	local usa, ssnk = PR_WS_List["USA"] or {}, PR_WS_List["SSNK"] or {}
	-- Смена паков: товары без стволов убраны и посеяны заново; AR-15 игрока (цена 5000) — теперь M16A2 из UC
	check("weapon list imported (USA)", usa[1] and usa[1]["ClassName"] == "arccw_ud_mini14" and istable(usa[1]["NeedToUnlock"]), usa[1] and usa[1]["ClassName"])
	local cwLeft = 0
	for _, entries in pairs(PR_WS_List) do
		for _, e in ipairs(entries) do if string.StartWith(e.ClassName or "", "cw_") then cwLeft = cwLeft + 1 end end
	end
	check("shop migration: no CW 2.0 items left", cwLeft == 0 and PR_DB.GetMeta("shop_arccw_v2") == "1", cwLeft)
	check("weapon list imported (SSNK)", ssnk[1] and ssnk[1]["ClassName"] == "arc9_eft_aks74u")

	local jopass = PR_DB.GetPoint("Jopass")
	check("point state in db", jopass and jopass.Monitor == 4 and jopass.System == 5, jopass and util.TableToJSON(jopass))

	local hostSaved = IsValid(S.host) and PR_DB.LoadPlayer(PR_SaveKey(S.host))
	check("host money loaded from db", hostSaved and S.host:GetNWInt("PR_money") == hostSaved.Money, IsValid(S.host) and S.host:GetNWInt("PR_money"))
	check("host PR-admin not imported", IsValid(S.host) and S.host:GetNWBool("PR_admin") == false)

	-- Мародёры
	check("SCAV is a faction", PR_IsFraction("SCAV") and PR_FractionName("SCAV") == "Мародёры")
	check("admin is not a faction", not PR_IsFraction("admin"))
	check("SCAV allies rule", not PR_AreAllies("SCAV", "SCAV") and PR_AreAllies("USA", "USA") and not PR_AreAllies("USA", "SSNK"))

	-- Патрули: модуль загружен, таймер не выпустит патруль посреди теста
	check("patrols loaded", istable(PR_Patrol) and istable(PR_PATROL_TYPES) and istable(PR_PATROL_TYPES.reshala) and sql.TableExists("pr_patrol_spots"))
	check("old patrol skeleton removed", scripted_ents.Get("pr_point_for_patrol") == nil and PR_Patrols_List == nil)
	if PR_Patrol then PR_Patrol.NextSpawn = math.huge end

	-- Стартовые товары (config/shop_defaults.lua)
	check("shop defaults seeded", PR_DB.GetMeta("shop_defaults_v2") == "1")
	local function findIn(list, field, value)
		for _, e in ipairs(list or {}) do if e[field] == value then return e end end
	end
	local akm = findIn(PR_WS_List["SSNK"], "ClassName", "arccw_firearms2_ak47")
	check("seed: SSNK AK-47", akm and akm.Type == "ar" and akm.Tier == 2 and istable(akm.NeedToUnlock) and akm.NeedToUnlock[1] == "arccw_uc_sks", akm and util.TableToJSON(akm))
	local ar15 = findIn(PR_WS_List["USA"], "ClassName", "arccw_ud_m16")
	check("seed: user's AR-15 price carried over to its replacement", ar15 and ar15.Price == 5000 and ar15.Exp == 15, ar15 and util.TableToJSON(ar15))
	check("seed: M16A2 unlocks after Mini-14", ar15 and ar15.NeedToUnlock and ar15.NeedToUnlock[1] == "arccw_ud_mini14")
	local noCoD = true
	for _, entries in pairs(PR_WS_List) do
		for _, e in ipairs(entries) do
			if string.find(e.ClassName or "", "^arccw_bo") or string.find(e.ClassName or "", "^arccw_mw") or string.find(e.ClassName or "", "^arccw_cod") then noCoD = false end
		end
	end
	check("shop has no CoD weapons", noCoD)
	check("seed: ammo box instead of CW ammo kit", findIn(PR_Equip_List, "ClassName", "pr_ammo_kit") ~= nil and findIn(PR_Equip_List, "ClassName", "cw_ammo_kit_regular") == nil)
	check("seed: equipment medkit", findIn(PR_Equip_List, "ClassName", "weapon_medkit") ~= nil)
	check("seed: equipment DShK", findIn(PR_Equip_List, "ClassName", "gred_emp_dshk") ~= nil)
	check("seed: SSNK T-90", findIn(PR_Vehicle_List["SSNK"], "ClassName", "sim_fphys_tank4") ~= nil)
	local phoenix = findIn(PR_Cloth_List["SSNK"], "Model", "models/player/phoenix.mdl")
	check("seed: SSNK starter outfit free", phoenix and phoenix.Price == 0)
	local wcount = 0
	for _, f in ipairs(PR_FRACTIONS) do wcount = wcount + #(PR_WS_List[f] or {}) end
	log("weapons in shop: " .. wcount .. ", equipment: " .. #PR_Equip_List)

	-- У мародёров все стволы всех группировок, техника — только старьё
	local scavWeapons = PR_GetWeaponEntries("SCAV")
	local scavClasses = {}
	for _, it in ipairs(scavWeapons) do scavClasses[it.entry.ClassName] = it.faction end
	log("SCAV weapons: " .. #scavWeapons)
	check("SCAV gets SSNK and USA weapons", scavClasses["arccw_firearms2_ak47"] == "SSNK" and scavClasses["arccw_ud_mini14"] == "USA")
	check("SCAV weapon count = all unique", #scavWeapons >= #(PR_WS_List["SSNK"] or {}) + #(PR_WS_List["USA"] or {}) - 1)
	check("SCAV vehicles: Tiger yes", findIn(PR_Vehicle_List["SCAV"], "ClassName", "sim_fphys_tank") ~= nil)
	check("SCAV vehicles: no T-90", findIn(PR_Vehicle_List["SCAV"], "ClassName", "sim_fphys_tank4") == nil)
	check("SCAV cloth seeded", #(PR_Cloth_List["SCAV"] or {}) >= 2)

	-- Магазин сохраняется и читается обратно, включая нестандартные поля
	local clothBefore = table.Copy(PR_Cloth_List)
	PR_DB.SaveShopList("cloth", {SSNK = {{Model = "models/player/barney.mdl", Price = 150, Level = 3, Note = "тест"}}, USA = {}})
	local clothAfter = PR_DB.LoadShopList("cloth")
	local e = clothAfter["SSNK"] and clothAfter["SSNK"][1]
	check("shop roundtrip", e and e.Model == "models/player/barney.mdl" and e.Price == 150 and e.Level == 3 and e.Note == "тест", e and util.TableToJSON(e))
	PR_DB.SaveShopList("cloth", clothBefore)
	check("shop restored", table.Count(PR_DB.LoadShopList("cloth")) == table.Count(clothBefore))

end)

step(0, function()
	if not (IsValid(S.b1) and IsValid(S.b2)) then return end

	S.b1:SetNWString("PR_fraction", "SSNK")
	S.b2:SetNWString("PR_fraction", "USA")

	-- Точка рядом с ботом, а если оттуда её не видно с ровного места (бот появляется, где велят
	-- сейвы игрока, — например, на склоне) — на заранее найденном ровном месте
	local place = ground(S.b2:GetPos() + Vector(120, 0, 0))
	if not viewSpotAt(place) then place = ground(T.FIXED_BASES[1]) end
	local p = ents.Create("zahvat_ojka")
	p:SetPos(place)
	p:Spawn()
	p:Activate()
	p:SpawnModules()
	S.point = p

	p:SetCurPoint("pr_selftest")
	p:SetCaptureTeam("Ничья")

	S.b2:SetPos(p:GetPos() + Vector(-60, 0, 10))
	p:Use(S.b2)
	check("capture started", p:GetCapturer() == S.b2)
end)

waitFor(6, function() return not IsValid(S.point) or S.point:GetCaptureTeam() == "USA" end, "point captured")

step(0, function()
	local p = S.point
	check("point captured by USA", IsValid(p) and p:GetCaptureTeam() == "USA", IsValid(p) and p:GetCaptureTeam())

	local g = p:SpawnGuardian("npc_vj_mishawild_sniper1", "weapon_vj_meft_mr43", 1.5, true)
	check("guardian spawned", IsValid(g) and p:GetGuardianCount() == 1)
	S.money1 = S.b1:GetNWInt("PR_money")
	if IsValid(g) then damage(g, S.b1, S.point) end
end)

step(2, function()
	check("guardian count back to 0", S.point:GetGuardianCount() == 0)
	check("enemy guardian kill pays 100", S.b1:GetNWInt("PR_money") == S.money1 + 100, S.b1:GetNWInt("PR_money") - S.money1)

	S.money2 = S.b2:GetNWInt("PR_money")
	hook.Run("PlayerDeath", S.b1, S.b2, S.b2)
	check("player kill pays 120", S.b2:GetNWInt("PR_money") == S.money2 + 120, S.b2:GetNWInt("PR_money") - S.money2)

	S.money3 = S.b2:GetNWInt("PR_money")
	hook.Run("PlayerDeath", S.b1, game.GetWorld(), game.GetWorld())
	check("world kill pays nobody", S.b2:GetNWInt("PR_money") == S.money3)

	check("normal chat passes", hook.Run("PlayerSay", S.b2, "привет", false) == "привет")

	-- Мародёр убил мародёра: обычная награда, а не штраф за своего
	S.b1:SetNWString("PR_fraction", "SCAV")
	S.b2:SetNWString("PR_fraction", "SCAV")
	local before = S.b2:GetNWInt("PR_money")
	hook.Run("PlayerDeath", S.b1, S.b2, S.b2)
	check("SCAV kills SCAV for a reward", S.b2:GetNWInt("PR_money") == before + 100 + 20 * S.b1:GetNWInt("PR_level_SCAV"), S.b2:GetNWInt("PR_money") - before)
	-- А свой своего в обычной группировке — штраф
	S.b1:SetNWString("PR_fraction", "USA")
	S.b2:SetNWString("PR_fraction", "USA")
	before = S.b2:GetNWInt("PR_money")
	hook.Run("PlayerDeath", S.b1, S.b2, S.b2)
	check("USA kills USA for a penalty", S.b2:GetNWInt("PR_money") == math.max(before - 100, 0), S.b2:GetNWInt("PR_money") - before)
	S.b1:SetNWString("PR_fraction", "SSNK")
end)

-- pr_shop_reseed: удалённый стартовый товар возвращается, правки в магазине не трогаются
step(1, function()
	local list = PR_DB.LoadShopList("weapon")
	local kept = {}
	for _, e in ipairs(list["SSNK"] or {}) do
		if e.ClassName ~= "arccw_firearms2_ak47" then kept[#kept + 1] = e end
	end
	list["SSNK"] = kept
	PR_DB.SaveShopList("weapon", list)

	local function akmInDb() return findIn(PR_DB.LoadShopList("weapon")["SSNK"], "ClassName", "arccw_firearms2_ak47") end

	concommand.Run(S.b1, "pr_shop_reseed", {}, "")
	check("reseed: ignored for non-admin", akmInDb() == nil and PR_DB.GetMeta("shop_defaults_v2") == "1")

	concommand.Run(S.host, "pr_shop_reseed", {}, "")
	local akm = findIn(PR_WS_List["SSNK"], "ClassName", "arccw_firearms2_ak47")
	check("reseed: removed starter item is back", akm ~= nil and akmInDb() ~= nil)
	check("reseed: unlock chain rebuilt", akm and akm.NeedToUnlock and akm.NeedToUnlock[1] == "arccw_uc_sks", akm and util.TableToJSON(akm))
	local ar15 = findIn(PR_WS_List["USA"], "ClassName", "arccw_ud_m16")
	check("reseed: user's AR-15 untouched", ar15 and ar15.Price == 5000 and ar15.Exp == 15, ar15 and util.TableToJSON(ar15))
	check("reseed: meta set again", PR_DB.GetMeta("shop_defaults_v2") == "1")
end)

----------------------------------------------------------------------------------------------------
-- Часть 2: атака от имени обычного игрока (хост временно не админ)
----------------------------------------------------------------------------------------------------

step(2, function()
	local host = S.host
	if not IsValid(host) then return end

	host:SetUserGroup("user")
	host:SetNWBool("PR_admin", false)
	host:SetNWString("PR_fraction", "USA")
	host:SetNWBool("PR_leader_USA", false)
	host:SetNWInt("PR_money", 500)
	host:SetNWInt("PR_coin", 0)
	host:SetNWInt("PR_weapon_exp_USA", 100)
	host:SetNWInt("PR_level", 5)
	host.PurchasedWeapons = {}
	host.PurchasedModels = {}
	host.Preset = {}
	host:StripWeapons()

	-- Тестовые товары (только в памяти, в файл не пишутся)
	PR_WS_List["USA"] = {
		{["ClassName"] = "weapon_pistol", ["Name"] = "Пистолет", ["Price"] = 100, ["Exp"] = 10, ["Tier"] = 1, ["Type"] = "pistol", ["NeedToUnlock"] = {""}},
		{["ClassName"] = "weapon_357", ["Name"] = "Револьвер", ["Price"] = 50, ["Exp"] = 0, ["Tier"] = 2, ["Type"] = "pistol", ["NeedToUnlock"] = {"weapon_crossbow"}},
		{["ClassName"] = "weapon_pr_not_installed", ["Name"] = "Призрак", ["Price"] = 1, ["Exp"] = 0, ["Tier"] = 1, ["Type"] = "pistol", ["NeedToUnlock"] = {""}}
	}
	PR_Cloth_List["USA"] = {
		{["Model"] = "models/player/alyx.mdl", ["Price"] = 100, ["Level"] = 1}
	}

	-- Хост в зоне покупки
	local zone = util.TraceLine({start = Vector(2713, -5847, -420), endpos = Vector(2713, -5847, -1000)}).HitPos
	host:SetPos(zone + Vector(0, 0, 5))
	S.zone = zone

	S.props = #ents.FindByModel("models/props_c17/oildrum001.mdl")
	S.weaponFileBefore = file.Read("pr_gamemode/weapon_shop_list.txt", "DATA") or ""

	check("host is now a normal player", not PR_IsAdmin(host))

	net.Start("PR_SELFTEST_ATTACK")
	net.Send(host)
	log("attack started")
end)

net.Receive("PR_SELFTEST_ATTACK_DONE", function(len, ply)
	timer.Simple(1.5, function()
		local host = S.host
		log("attack finished, checking")

		check("forged SetMoneyPR ignored, honest buys charged", host:GetNWInt("PR_money") == 300, host:GetNWInt("PR_money"))
		check("forged SetAdminPR ignored", host:GetNWBool("PR_admin") == false)
		check("forged SetCoinPR ignored", host:GetNWInt("PR_coin") == 0, host:GetNWInt("PR_coin"))
		check("forged kick ignored", IsValid(S.b1))
		check("SetFrac admin rejected for non-admin", host:GetNWString("PR_fraction") == "USA", host:GetNWString("PR_fraction"))
		check("SetLeader rejected for non-leader", not S.b2:GetNWBool("PR_leader_USA"))

		local listOk = true
		for _, e in ipairs(PR_WS_List["USA"] or {}) do
			if e["ClassName"] == "weapon_rpg" then listOk = false end
		end
		check("forged SaveWeaponData ignored (memory)", listOk)
		local rpgRows = PR_DB.Query("SELECT COUNT(*) AS n FROM pr_shop_weapons WHERE class = ?", "weapon_rpg")
		check("forged SaveWeaponData ignored (db)", rpgRows and rpgRows[1] and rpgRows[1].n == "0")

		check("unlisted weapon not given", not host:HasWeapon("weapon_rpg"))
		check("locked weapon not given", not host:HasWeapon("weapon_357"))
		check("gm_giveswep blocked", not host:HasWeapon("weapon_crossbow"))
		check("forged preset ignored", not (host.Preset["Primary"] and host.Preset["Primary"]["Item"] == "weapon_rpg"))
		check("honest weapon bought", host:HasWeapon("weapon_pistol") and table.HasValue(host.PurchasedWeapons, "weapon_pistol"))
		check("weapon exp charged", host:GetNWInt("PR_weapon_exp_USA") == 90, host:GetNWInt("PR_weapon_exp_USA"))
		check("honest outfit bought", host:GetModel() == "models/player/alyx.mdl" and table.HasValue(host.PurchasedModels, "models/player/alyx.mdl"), host:GetModel())
		check("gm_spawn blocked", #ents.FindByModel("models/props_c17/oildrum001.mdl") == S.props)
		check("noclip blocked", host:GetMoveType() ~= MOVETYPE_NOCLIP)
		check("unlisted vehicle not spawned", #ents.FindByClass("prop_vehicle_jeep") == 0)
		check("preset accepted for owned weapon", host.Preset["Secondary"] and host.Preset["Secondary"]["Item"] == "weapon_pistol")

		-- Выход из зоны: покупка не проходит
		host:SetPos(S.point:GetPos() + Vector(0, -120, 10))
		check("outside buy zone", not PR_IsInBuyZone(host, "weapon"))

		host:Spawn()
		timer.Simple(1, function()
			check("outfit kept after respawn", host:GetModel() == "models/player/alyx.mdl", host:GetModel())
			check("preset weapon given on respawn", host:HasWeapon("weapon_pistol"))
			check("non-admin spawns with fists", host:HasWeapon("weapon_fists"))
			check("non-admin gets no sandbox loadout", not host:HasWeapon("weapon_physgun") and not host:HasWeapon("gmod_tool") and not host:HasWeapon("weapon_smg1"))

			host:SetUserGroup("superadmin")
			log("host restored to superadmin")
			S.attackDone = true
		end)
	end)
end)

----------------------------------------------------------------------------------------------------
-- Часть 3: сейвы, точки на карте, меню
----------------------------------------------------------------------------------------------------

waitFor(16, function() return S.attackDone == true end, "attack phase")

step(0, function()
	check("attack phase finished", S.attackDone == true)

	PR_Save_All()
	check("bot saved in db", PR_DB.LoadPlayer(PR_SaveKey(S.b1)) ~= nil)

	local saved = PR_DB.LoadPlayer(PR_SaveKey(S.host))
	log("host save key " .. PR_SaveKey(S.host))
	check("host saved in db", saved ~= nil)
	if saved then
		check("db: money", saved.Money == S.host:GetNWInt("PR_money"), saved.Money)
		check("db: fraction stats", saved.Weapon_exp_USA == S.host:GetNWInt("PR_weapon_exp_USA"), saved.Weapon_exp_USA)
		check("db: purchased weapon", table.HasValue(saved.PurchasedWeapons, "weapon_pistol"))
		check("db: purchased model", table.HasValue(saved.PurchasedModels, "models/player/alyx.mdl"))
		check("db: preset", saved.Preset.Secondary and saved.Preset.Secondary.Item == "weapon_pistol")
		check("db: outfit", saved.Outfit and saved.Outfit.Model == "models/player/alyx.mdl")
	end

	-- Хост снова админ: «Установить точку» сохраняет её место на карте.
	-- После респавна хост может стоять далеко, и клиенту точка не видна — подводим его к ней
	S.host:SetNWString("PR_fraction", "admin")
	S.host:SetPos(S.point:GetPos() + Vector(0, -120, 10))
	timer.Simple(1, function()
		net.Start("PR_SELFTEST_SETPOINT")
			net.WriteEntity(S.point)
		net.Send(S.host)
	end)
end)

step(3, function()
	local layout = PR_DB.GetLayout(string.lower(game.GetMap()))
	check("point position saved for map (db)", istable(layout["pr_selftest"]) and isvector(layout["pr_selftest"]["Pos"]))

	game.CleanUpMap()
end)

step(3, function()
	local found
	for _, p in ipairs(ents.FindByClass("zahvat_ojka")) do
		if p:GetCurPoint() == "pr_selftest" then found = p end
	end
	check("point respawned after map cleanup", IsValid(found))
	check("respawned point keeps owner", IsValid(found) and found:GetCaptureTeam() == "USA", IsValid(found) and found:GetCaptureTeam())
	S.point = found

	if IsValid(found) then
		S.host:SetNWString("PR_fraction", "USA")
		S.host:SetPos(found:GetPos() + Vector(0, -80, 10))
	end
end)

-- E по своей точке (админ, без Alt): меню владельца
step(1, function()
	local names = netSentBy(function() S.point:Use(S.host) end)
	check("E on own point opens owner menu", table.HasValue(names, "OpenIDKPanel") and not table.HasValue(names, "OpenAdminPanel"), table.concat(names, ","))
end)

step(2, function() shot("owner_panel") end)

-- Охрана: обычная группировка нанимает, мародёры нет
step(1, function()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)
	S.host:SetNWInt("PR_money", 50000)
	S.guardsBefore = S.point:GetGuardianCount()
	net.Start("PR_SELFTEST_GUARD") net.WriteEntity(S.point) net.Send(S.host)
end)

step(2, function()
	local price = S.point:GetGuardianPrice("дикий", "", 1, false)
	check("USA owner hires a guardian", S.point:GetGuardianCount() == S.guardsBefore + 1 and S.host:GetNWInt("PR_money") == 50000 - price,
		S.point:GetGuardianCount() .. " " .. S.host:GetNWInt("PR_money"))
	for guard in pairs(S.point.Guardians or {}) do
		if IsValid(guard) then guard:Remove() end
	end

	S.point:SetCaptureTeam("SCAV")
	S.host:SetNWString("PR_fraction", "SCAV")
	check("SCAV point can't have guardians", not S.point:CanHaveGuardians())
	check("USA point can have guardians", (function()
		S.point:SetCaptureTeam("USA")
		local can = S.point:CanHaveGuardians()
		S.point:SetCaptureTeam("SCAV")
		return can
	end)())
end)

step(1, function()
	check("guardians removed before SCAV test", S.point:GetGuardianCount() == 0, S.point:GetGuardianCount())
	S.moneyScav = S.host:GetNWInt("PR_money")
	net.Start("PR_SELFTEST_GUARD") net.WriteEntity(S.point) net.Send(S.host)
end)

step(2, function()
	check("SCAV owner can't hire a guardian", S.point:GetGuardianCount() == 0 and S.host:GetNWInt("PR_money") == S.moneyScav,
		S.point:GetGuardianCount() .. " " .. S.host:GetNWInt("PR_money"))
	local names = netSentBy(function() S.point:Use(S.host) end)
	check("SCAV owner still opens point menu", table.HasValue(names, "OpenIDKPanel"), table.concat(names, ","))
end)

step(2, function() shot("owner_panel_scav") end)

-- Alt+E: админ открывает настройку даже своей точки, обычный игрок — нет
step(1, function()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)
	S.point:SetCaptureTeam("USA")
	S.host:SetNWString("PR_fraction", "USA")
	hook.Add("StartCommand", "PR_SelfTestAlt", function(ply, cmd)
		if ply == S.host then cmd:AddKey(IN_WALK) end
	end)
end)

step(1, function()
	check("host holds Alt", S.host:KeyDown(IN_WALK))
	local names = netSentBy(function() S.point:Use(S.host) end)
	check("Alt+E by admin opens point settings", table.HasValue(names, "OpenAdminPanel") and not table.HasValue(names, "OpenIDKPanel"), table.concat(names, ","))
end)

step(2, function() shot("admin_panel") end)

step(1, function()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)
	S.host:SetUserGroup("user")
	S.host:SetNWBool("PR_admin", false)
	local names = netSentBy(function() S.point:Use(S.host) end)
	check("Alt+E by non-admin opens owner menu only", table.HasValue(names, "OpenIDKPanel") and not table.HasValue(names, "OpenAdminPanel"), table.concat(names, ","))
	S.host:SetUserGroup("superadmin")
	hook.Remove("StartCommand", "PR_SelfTestAlt")
end)

-- Табличка над точкой и полоса захвата: хост из другой группировки подходит и захватывает
local function viewSpot(point)
	return viewSpotAt(point:GetPos())
end

local function lookAtPoint()
	local eye = S.viewFeet + Vector(0, 0, 64)
	S.host:SetEyeAngles((S.point:GetPos() + Vector(0, 0, 85) - eye):Angle())
end

step(1, function()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)
	RunConsoleCommand("pr_capture_time", "30")
	S.host:SetNWString("PR_fraction", "SSNK")
	local feet = viewSpot(S.point)
	check("found a spot to look at the point", feet ~= nil)
	S.viewFeet = feet or (S.point:GetPos() + Vector(0, 180, 10))
	S.host:SetPos(S.viewFeet)
	lookAtPoint()
	log("view spot " .. tostring(S.viewFeet) .. " point " .. tostring(S.point:GetPos()))
end)

step(1, function()
	lookAtPoint()
	shot("point_label")
end)

step(1, function()
	S.point:Use(S.host)
	check("host started capture", S.point:GetCapturer() == S.host)
end)

step(3, function() shot("capture_hud") end)

step(1, function()
	S.point:StopCapture()
	RunConsoleCommand("pr_capture_time", "2")
	check("capture stopped", not IsValid(S.point:GetCapturer()))
end)

step(2, function()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)
	S.host:SetNWString("PR_fraction", "SSNK")
	S.host:SetNWInt("PR_money", 50000)
	S.host:ConCommand("open_main_menu")
end)

-- Новое меню F4: снимок каждой вкладки
local function tab(id)
	net.Start("PR_SELFTEST_TAB")
		net.WriteString(id)
	net.Send(S.host)
end

step(3, function() shot("menu_faction") end)
step(1, function() tab("weapon") end)
step(2, function() shot("menu_weapon") end)
step(1, function() tab("equip") end)
step(2, function() shot("menu_equip") end)
step(1, function() tab("vehicle") end)
step(2, function() shot("menu_vehicle") end)
step(1, function() tab("cloth") end)
step(2, function() shot("menu_cloth") end)
step(1, function() tab("profile") end)
step(2, function() shot("menu_profile") end)
step(1, function()
	tab("weapon")
	net.Start("PR_SELFTEST_EDITOR") net.Send(S.host)
end)
step(2, function() shot("menu_editor") end)
step(1, function()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)

	-- Обычный игрок вступает в мародёры
	S.host:SetUserGroup("user")
	S.host:SetNWBool("PR_admin", false)
	S.host:SetNWString("PR_fraction", "USA")
	S.host.PR_Outfit = {Model = "models/player/alyx.mdl", Bodygroups = {}}
	S.host.PR_NextAction = {}
	net.Start("PR_SELFTEST_SETFRAC") net.WriteString("SCAV") net.Send(S.host)
end)
step(2, function()
	check("non-admin joins marauders", S.host:GetNWString("PR_fraction") == "SCAV", S.host:GetNWString("PR_fraction"))
	check("faction change resets outfit", S.host.PR_Outfit == nil)
	S.host:SetUserGroup("superadmin")
end)

----------------------------------------------------------------------------------------------------
-- Часть 4: патрули NPC (Решала со свитой)
----------------------------------------------------------------------------------------------------


local function members(patrol, role)
	local out = {}
	for _, npc in ipairs(patrol and patrol.members or {}) do
		if IsValid(npc) and (not role or npc.PR_PatrolRole == role) then table.insert(out, npc) end
	end
	return out
end

local function lookAt(pos)
	S.host:SetEyeAngles((pos - S.host:EyePos()):Angle())
end

-- Линия из трёх спотов (Тест-А/Б/В): сперва на постоянных местах карты, потом у тестовой точки
-- захвата, точек из базы и хоста. Нужна и пешему патрулю, и патрулю с техникой
local function ensureLine()
	if S.spotA then return true end
	local map = string.lower(game.GetMap())
	S.dbSpotsBefore = S.dbSpotsBefore or #PR_DB.GetPatrolSpots(map)
	local extra = {}
	if IsValid(S.point) then table.insert(extra, S.point:GetPos()) end
	for _, place in pairs(PR_DB.GetLayout(map)) do
		if isvector(place.Pos) then table.insert(extra, place.Pos) end
	end
	table.insert(extra, S.host:GetPos())
	local pts = T.findLine(extra)
	if not pts then return false end
	log("patrol line " .. tostring(pts[1]) .. " / " .. tostring(pts[2]) .. " / " .. tostring(pts[3]))
	S.spotA = PR_Patrol.AddSpot(pts[1], "Тест-А")
	S.spotB = PR_Patrol.AddSpot(pts[2], "Тест-Б")
	S.spotC = PR_Patrol.AddSpot(pts[3], "Тест-В")
	return true
end

T.section("patrol")

step(1, function()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)
	RunConsoleCommand("ai_ignoreplayers", "1")
	RunConsoleCommand("pr_patrol_debug", "1")
	PR_Patrol.ClearAll()

	local map = string.lower(game.GetMap())
	S.dbSpotsBefore = #PR_DB.GetPatrolSpots(map)
	check("patrol: found a walkable line for spots", ensureLine())
	if not S.spotA then return end
	check("patrol spots saved in db", #PR_DB.GetPatrolSpots(map) == S.dbSpotsBefore + 3)
	check("patrol spots linked", PR_Patrol.Links[S.spotA][S.spotB] ~= nil and PR_Patrol.Links[S.spotB][S.spotC] ~= nil)
	local path = PR_Patrol.FindPath(S.spotA, S.spotC)
	check("patrol path A -> C", path and path[#path] == S.spotC, path and table.concat(path, ","))

	-- Рядом с игроком сам по себе патруль не появляется
	-- (на карте могут быть и настоящие споты вдали от игроков — туда можно)
	local patrol, err = PR_Patrol.Spawn("reshala")
	local nearPlayer = false
	if patrol then
		local spot = PR_Patrol.Spots[patrol.spot]
		local safe = PR_PATROL_SETTINGS and PR_PATROL_SETTINGS.safeDistance or 2500
		for _, ply in ipairs(player.GetAll()) do
			if spot and not ply:GetNWBool("PR_PatrolCrew") and ply:GetPos():Distance(spot.Pos) < safe then nearPlayer = true end
		end
		log("random patrol went to spot #" .. tostring(patrol.spot))
	end
	check("patrol doesn't spawn next to players", not nearPlayer, patrol and ("spot #" .. tostring(patrol.spot)) or err)
	if patrol then PR_Patrol.Remove(patrol) end

	-- Админский вызов на конкретный спот
	S.patrol = PR_Patrol.Spawn("reshala", S.spotA)
	local leader = S.patrol and S.patrol.leader
	check("reshala patrol spawned", S.patrol ~= nil and #S.patrol.members == 5, S.patrol and #S.patrol.members)
	check("reshala leads", IsValid(leader) and leader:GetClass() == "npc_vj_mishawild_reshala1" and leader.PR_PatrolRole == "leader")
	local guards = members(S.patrol, "follower")
	local allBully = #guards == 4
	for _, g in ipairs(guards) do
		if not string.find(g:GetClass(), "bully_security", 1, true) then allBully = false end
	end
	check("four reshala guards", allBully, #guards)
	check("patrol health from config", IsValid(leader) and leader:Health() == 600 and guards[1] and guards[1]:Health() == 300,
		IsValid(leader) and leader:Health())
	check("patrol hostile to everyone", IsValid(leader) and leader.PlayerFriendly == false and leader.VJ_NPC_Class[1] == "CLASS_PR_BANDITS"
		and not table.HasValue(leader.VJ_NPC_Class, "CLASS_PLAYER_ALLY") and leader.DisableWandering == true)
	check("patrol members don't block each other", IsValid(leader) and guards[1] and table.HasValue(leader.EntitiesToNoCollide or {}, guards[1]:GetClass())
		and not table.HasValue(scripted_ents.GetStored(leader:GetClass()).t.EntitiesToNoCollide or {}, guards[1]:GetClass()))
end)

step(2, function()
	if not S.patrol then return end
	local armed = 0
	for _, npc in ipairs(members(S.patrol)) do
		if IsValid(npc:GetActiveWeapon()) then armed = armed + 1 end
	end
	check("patrol armed", armed == 5, armed)

	-- Не ждать 5 секунд после появления: сразу в путь, и сразу на дальний спот C (длиннее 600 юнитов,
	-- которые движок проходит без AI-узлов, — проверяем ходьбу шагами)
	S.patrol.lingerUntil = 0
	S.patrol.route = {S.spotC}
	S.patrol.routeIndex = 1
	S.patrol.dest = S.spotC
	S.patrolStart = S.patrol.leader:GetPos()
	local c = PR_Patrol.Spots[S.spotC]
	log("patrol leg length " .. (c and math.Round(S.patrolStart:Distance(c.Pos)) or -1))
end)

step(1, function()
	if not S.patrol or not IsValid(S.patrol.leader) then return end
	log("patrol route " .. table.concat(S.patrol.route or {}, ",") .. " dest " .. tostring(S.patrol.dest))

	-- Игрок встаёт за последним спотом линии и смотрит на патруль
	local a, c = PR_Patrol.Spots[S.spotA], PR_Patrol.Spots[S.spotC]
	if a and c then
		S.host:SetPos(c.Pos + (c.Pos - a.Pos):GetNormalized() * 150 + Vector(0, 0, 5))
	end
	lookAt(S.patrol.leader:GetPos() + Vector(0, 0, 50))
end)

waitFor(8, function()
	if not (S.patrol and IsValid(S.patrol.leader)) then return true end
	return S.patrol.leader:GetPos():Distance(S.patrolStart) > 150 or S.patrol.spot ~= S.spotA
end, "patrol walking")

step(0, function()
	if not S.patrol or not IsValid(S.patrol.leader) then return end
	local leader = S.patrol.leader
	local moved = leader:GetPos():Distance(S.patrolStart)
	log("patrol leader moved " .. math.Round(moved))
	local enemies = {}
	for _, npc in ipairs(S.patrol.members) do
		local e = IsValid(npc) and npc:GetEnemy()
		if IsValid(e) then table.insert(enemies, npc:GetClass() .. "->" .. e:GetClass() .. "@" .. math.Round(e:GetPos():Distance(npc:GetPos()))) end
	end
	log(string.format("patrol state: enemies [%s], lastCombat %.1f ago, linger %s, route %s, orderAt %s",
		table.concat(enemies, ", "), CurTime() - (S.patrol.lastCombat or 0), tostring(S.patrol.lingerUntil and S.patrol.lingerUntil - CurTime()),
		table.concat(S.patrol.route or {}, ","), tostring(S.patrol.orderAt and CurTime() - S.patrol.orderAt)))
	check("patrol walks to the next spot", moved > 150 or (S.patrol.spot ~= S.spotA), math.Round(moved))

	local far = 0
	for _, g in ipairs(members(S.patrol, "follower")) do
		if g:GetPos():Distance(leader:GetPos()) > 700 then far = far + 1 end
	end
	check("guards keep up with reshala", far == 0, far)

	lookAt(leader:GetPos() + Vector(0, 0, 50))
	shot("patrol")
end)

-- Дошёл ли патруль до дальнего спота. Смотрим дважды: VJ-NPC по пути может остановиться
-- на перестрелку с игроком, который стоит за спотом
local function patrolAtFarSpot()
	local c = PR_Patrol.Spots[S.spotC]
	local leader = S.patrol.leader
	local left = c and leader:GetPos():Distance(c.Pos) or -1
	local enemy = isfunction(leader.GetEnemy) and leader:GetEnemy()
	log("patrol leader to C " .. math.Round(left) .. ", spot #" .. tostring(S.patrol.spot) .. ", enemy " .. tostring(enemy))
	return S.patrol.spot == S.spotC or (left >= 0 and left < 200), math.Round(left)
end

waitFor(20, function()
	if not (S.patrol and IsValid(S.patrol.leader)) then return true end
	local c = PR_Patrol.Spots[S.spotC]
	return S.patrol.spot == S.spotC or (c ~= nil and S.patrol.leader:GetPos():Distance(c.Pos) < 200)
end, "patrol at the far spot")

step(0, function()
	if not S.patrol or not IsValid(S.patrol.leader) then return end
	local ok, left = patrolAtFarSpot()
	check("patrol reaches the far spot", ok, left)
end)

step(2, function()
	if not S.patrol then return end
	S.moneyPatrol = S.host:GetNWInt("PR_money")
	local guard = members(S.patrol, "follower")[1]
	if IsValid(guard) then damage(guard, S.host) end
end)

step(2, function()
	if not S.patrol then return end
	check("guard kill pays 500", S.host:GetNWInt("PR_money") == S.moneyPatrol + 500, S.host:GetNWInt("PR_money") - S.moneyPatrol)

	S.moneyPatrol = S.host:GetNWInt("PR_money")
	local leader = members(S.patrol, "leader")[1]
	S.leaderPos = IsValid(leader) and leader:GetPos()
	if IsValid(leader) then damage(leader, S.host) end
end)

step(2, function()
	if not S.patrol then return end
	check("reshala kill pays 3000", S.host:GetNWInt("PR_money") == S.moneyPatrol + 3000, S.host:GetNWInt("PR_money") - S.moneyPatrol)

	local tt = false
	for _, w in ipairs(ents.FindByClass("arccw_ur_pm")) do
		if S.leaderPos and w:GetPos():Distance(S.leaderPos) < 300 and not IsValid(w:GetOwner()) then tt = true end
	end
	check("reshala drops his PM", tt)

	local lead = S.patrol.leader
	check("guards lead after reshala died", table.HasValue(PR_Patrol.Active, S.patrol) and IsValid(lead) and string.find(lead:GetClass(), "bully_security", 1, true) ~= nil,
		IsValid(lead) and lead:GetClass())

	PR_Patrol.ClearAll()
	check("patrol cleared", #PR_Patrol.Active == 0)

	-- Редактор: поставить спот прицелом и убрать
	S.host:Give("pr_patrol_tool")
	S.host:SelectWeapon("pr_patrol_tool")
	local spotB = PR_Patrol.Spots[S.spotB]
	if spotB then
		S.host:SetPos(spotB.Pos + Vector(0, 0, 5))
		S.host:SetEyeAngles(Angle(60, 0, 0))
	end
end)

step(1, function()
	-- Remove() срабатывает в конце кадра, поэтому NPC проверяем шагом позже
	check("patrol NPCs removed", #members(S.patrol) == 0, #members(S.patrol))

	local wep = S.host:GetActiveWeapon()
	check("patrol editor in hands", IsValid(wep) and wep:GetClass() == "pr_patrol_tool")
	if not IsValid(wep) or wep:GetClass() ~= "pr_patrol_tool" then return end

	local before = table.Count(PR_Patrol.Spots)
	wep:PrimaryAttack()
	check("editor LMB adds a spot", table.Count(PR_Patrol.Spots) == before + 1)
	wep:SetNextSecondaryFire(0)
	wep:SecondaryAttack()
	check("editor RMB removes the aimed spot", table.Count(PR_Patrol.Spots) == before)

	-- Окно патрулей открыто: клик (провалившийся из окна) спот не ставит
	S.spotsBefore = before
	net.Start("PR_SELFTEST_PTYPES_OPEN") net.WriteString("reshala") net.Send(S.host)
end)

step(1.5, function()
	local wep = S.host:GetActiveWeapon()
	if not IsValid(wep) or wep:GetClass() ~= "pr_patrol_tool" then return end
	wep:SetNextPrimaryFire(0)
	wep:PrimaryAttack()
	check("editor LMB ignored while patrol window open", table.Count(PR_Patrol.Spots) == S.spotsBefore and S.host.PR_PatrolUIOpen == true,
		tostring(S.host.PR_PatrolUIOpen))
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)
end)

step(0.2, function()
	local wep = S.host:GetActiveWeapon()
	if not IsValid(wep) or wep:GetClass() ~= "pr_patrol_tool" then return end
	wep:SetNextPrimaryFire(0)
	wep:PrimaryAttack()
	check("editor LMB ignored right after the window closed", table.Count(PR_Patrol.Spots) == S.spotsBefore and S.host.PR_PatrolUIOpen == false,
		tostring(S.host.PR_PatrolUIOpen))
end)

step(1, function()
	local wep = S.host:GetActiveWeapon()
	if not IsValid(wep) or wep:GetClass() ~= "pr_patrol_tool" then return end
	wep:SetNextPrimaryFire(0)
	wep:PrimaryAttack()
	check("editor LMB works again after the window", table.Count(PR_Patrol.Spots) == S.spotsBefore + 1)
	wep:SetNextSecondaryFire(0)
	wep:SecondaryAttack()

	-- Снимок редактора: смотрим вдоль линии спотов
	local a, c = PR_Patrol.Spots[S.spotA], PR_Patrol.Spots[S.spotC]
	if a and c then
		S.host:SetPos(a.Pos + (a.Pos - c.Pos):GetNormalized() * 250 + Vector(0, 0, 5))
		S.host:SetEyeAngles((c.Pos - (S.host:GetPos() + Vector(0, 0, 64))):Angle())
	end
end)

step(2, function() shot("patrol_editor") end)

-- Варианты патрулей: стартовый в базе, новый — через окно редактора (по сети, как кнопка «Сохранить»)
local function sendType(key, data)
	net.Start("PR_SELFTEST_PTYPE_SAVE")
		net.WriteString(key)
		net.WriteTable(data)
	net.Send(S.host)
end

local function typeCmd(cmd, key)
	net.Start("PR_SELFTEST_PTYPE_CMD")
		net.WriteString(cmd)
		net.WriteString(key)
	net.Send(S.host)
end

local function findType(name)
	for key, t in pairs(PR_PATROL_TYPES) do
		if t.name == name then return key, t end
	end
end

step(1, function()
	check("patrol types seeded into db", PR_DB.GetPatrolTypes().reshala ~= nil and PR_DB.GetMeta("patrol_types_v2") == "1")
	check("patrol without real NPC rejected", PR_Patrol.CleanType({name = "Пусто", followers = {{class = {"npc_bogus"}}}}) == nil)
	check("patrol without name rejected", PR_Patrol.CleanType({name = " ", leader = {class = {"npc_vj_mishawild_sniper1"}}}) == nil)
	local big = PR_Patrol.CleanType({name = "Толпа", followers = {{class = {"npc_vj_mishawild_sniper1"}, count = 50}}})
	check("a group of 50 is kept", big and big.followers[1].count == 50)
	local huge = PR_Patrol.CleanType({name = "Толпа", followers = {{class = {"npc_vj_mishawild_sniper1"}, count = 5000}}})
	check("group size capped by PR_PATROL_LIMITS", huge and huge.followers[1].count == PR_PATROL_LIMITS.perGroup)
	local groups = {}
	for i = 1, 12 do groups[i] = {name = "Группа " .. i, class = {"npc_vj_mishawild_sniper1"}, count = 2} end
	local many = PR_Patrol.CleanType({name = "Много групп", followers = groups})
	check("more than 6 follower groups are kept", many and #many.followers == 12, many and #many.followers)
	local over = {}
	for i = 1, 3 do over[i] = {class = {"npc_vj_mishawild_sniper1"}, count = 100} end
	check("patrol over the total limit is rejected", PR_Patrol.CleanType({name = "Армия", followers = over}) == nil)

	S.typesBefore = table.Count(PR_PATROL_TYPES)
	sendType("", {
		name = "Тестовый патруль",
		chance = 5, weight = 2, maxAlive = 9, formation = "wedge",
		announce = "Тест вышел", leaderKilled = "Снайпер убит: %s %d",
		leader = {
			name = "Снайпер", class = {"npc_vj_mishawild_sniper1"}, weapons = {"weapon_vj_meft_mosin", "weapon_bogus"},
			health = 999999, reward = {money = -5, exp = 3}, drop = {"weapon_bogus"}
		},
		followers = {{
			name = "Санитары", class = {"npc_vj_mishawild_sanitar_security1", "npc_bogus"}, count = 2,
			weapons = {"weapon_vj_meft_ak74m"}, health = 150, reward = {money = 200, exp = 2}
		}}
	})
end)

step(2, function()
	local key, t = findType("Тестовый патруль")
	S.testType = key
	check("new patrol type saved", key ~= nil and table.Count(PR_PATROL_TYPES) == S.typesBefore + 1 and PR_DB.GetPatrolTypes()[key or ""] ~= nil)
	if not t then return end

	check("patrol type cleaned: numbers", t.chance == 1 and t.maxAlive == 5 and t.leader.health == 100000 and t.leader.reward.money == 0,
		util.TableToJSON({t.chance, t.maxAlive, t.leader.health, t.leader.reward.money}))
	check("patrol type cleaned: unknown classes dropped", #t.leader.weapons == 1 and t.leader.weapons[1] == "weapon_vj_meft_mosin"
		and #t.leader.drop == 0 and #t.followers[1].class == 1, util.TableToJSON(t.followers[1].class))
	check("patrol type cleaned: kill text", t.leaderKilled == "Снайпер убит: %s %%d" and t.formation == "wedge", t.leaderKilled)

	-- Окно вариантов со Решалой на снимок и выпуск нового варианта «сейчас»
	net.Start("PR_SELFTEST_PTYPES_OPEN") net.WriteString("reshala") net.Send(S.host)
	typeCmd("spawn", key)
end)

step(2, function()
	local spawned
	for _, patrol in ipairs(PR_Patrol.Active) do
		if patrol.type == S.testType then spawned = patrol end
	end
	check("new patrol type spawns from editor", spawned ~= nil and #spawned.members == 3, spawned and #spawned.members)
	shot("patrol_types")
end)

-- Добавили группу свиты — окно не прыгает наверх (проверяет клиент)
step(0.5, function()
	S.clientResults = 0
	net.Start("PR_SELFTEST_PTYPES_SCROLL") net.Send(S.host)
end)
waitFor(4, function() return (S.clientResults or 0) >= 1 end, "client checks the patrol editor scroll")
step(0, function()
	if (S.clientResults or 0) == 0 then check("patrol editor keeps scroll when a group is added", false, "no answer from client") end
end)

step(1, function()
	PR_Patrol.ClearAll()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)

	-- Правка существующего: тот же ключ, новая копия не появляется
	local t = S.testType and table.Copy(PR_PATROL_TYPES[S.testType])
	if t then
		t.name = "Тестовый патруль 2"
		sendType(S.testType, t)
	end
end)

step(2, function()
	local t = S.testType and PR_PATROL_TYPES[S.testType]
	check("patrol type edited in place", t ~= nil and t.name == "Тестовый патруль 2" and table.Count(PR_PATROL_TYPES) == S.typesBefore + 1)

	-- Обычный игрок сохранить не может
	S.host:SetUserGroup("user")
	S.host:SetNWBool("PR_admin", false)
	sendType("", {name = "Чужой патруль", leader = {class = {"npc_vj_mishawild_sniper1"}}})
end)

step(2, function()
	check("non-admin can't save patrol types", findType("Чужой патруль") == nil)
	S.host:SetUserGroup("superadmin")
	if S.testType then typeCmd("delete", S.testType) end
end)

step(2, function()
	check("patrol type deleted", S.testType ~= nil and PR_PATROL_TYPES[S.testType] == nil and PR_DB.GetPatrolTypes()[S.testType] == nil)
	PR_Patrol.ClearAll()
end)

T.section("armor")

-- Техника в патруле: танк с ботами-экипажем и вертолёт со своим ИИ и ботом-стрелком
local function crewOf(v, i)
	return v and v.crew and v.crew[i]
end

-- Точка на полу в dist от pos, куда видно от pos
-- Точка в dist от машины, которую экипаж видит так же, как проверяет CrewAim
-- (от центра машины +60 до центра цели): иначе танк наведётся, но стрелять не станет
local function clearPointFrom(pos, dist, from)
	from = from or pos + Vector(0, 0, 120)
	for yaw = 0, 330, 30 do
		local p = pos + Angle(0, yaw, 0):Forward() * dist
		local down = util.TraceLine({start = p + Vector(0, 0, 100), endpos = p - Vector(0, 0, 400), mask = MASK_SOLID_BRUSHONLY})
		if down.Hit and not down.StartSolid then
			local clear = true
			for _, h in ipairs({20, 36, 60}) do
				if util.TraceLine({start = from, endpos = down.HitPos + Vector(0, 0, h), mask = MASK_SOLID_BRUSHONLY}).Hit then clear = false end
			end
			if clear then return down.HitPos end
		end
	end
end

step(1, function()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)
	PR_Patrol.ClearAll()

	-- Технику в нём игрок мог поменять (у него сейчас Ми-24, два A-10 и Гепард) — важно, что она есть
	check("default armored patrol seeded", PR_PATROL_TYPES.reshala_armor ~= nil and #(PR_PATROL_TYPES.reshala_armor.vehicles or {}) >= 1)
	check("vehicle kinds", PR_PatrolVehicleKind("sim_fphys_tank") == "ground" and PR_PatrolVehicleKind("gred_lfs_mi24a") == "air"
		and PR_PatrolVehicleKind("npc_bogus") == nil, tostring(PR_PatrolVehicleKind("gred_lfs_mi24a")))

	local key, err = PR_Patrol.SaveType(nil, {
		name = "Тест: броня",
		leader = {name = "Решала", class = {"npc_vj_mishawild_reshala1"}, weapons = {"weapon_vj_meft_reshala_ak101"}, health = 600},
		followers = {{name = "Охрана", class = {"npc_vj_mishawild_bully_security1"}, count = 2, weapons = {"weapon_vj_meft_ak74m"}}},
		vehicles = {
			{name = "Танк охраны", class = {"sim_fphys_tank"}, count = 1, crew = 2, reward = {money = 4000, exp = 10}},
			{name = "Вертолёт охраны", class = {"gred_lfs_mi24a"}, count = 1, crew = 1, reward = {money = 2500, exp = 8}}
		}
	})
	S.armorType = key
	check("armored patrol type saved", key ~= nil and #PR_PATROL_TYPES[key].vehicles == 2, err)
	if not key then return end

	RunConsoleCommand("pr_patrol_debug", "1")
	RunConsoleCommand("ai_ignoreplayers", "1")
	if not ensureLine() then
		check("armor: walkable line for spots", false)
		return
	end
	S.logMark = T.patrolLogMark()
	S.armor = PR_Patrol.Spawn(key, S.spotA)
	check("armored patrol spawned", S.armor ~= nil and #S.armor.vehicles == 2, S.armor and #S.armor.vehicles)
	if not S.armor then return end

	for _, v in ipairs(S.armor.vehicles) do
		if v.kind == "ground" then S.tank = v end
		if v.kind == "air" then S.heli = v end
	end
	S.armor.lingerUntil = 0
	S.armor.route = {S.spotC}
	S.armor.routeIndex = 1
	S.armor.dest = S.spotC
	S.tankStart = S.tank and IsValid(S.tank.ent) and S.tank.ent:GetPos()
	S.leaderStart = PR_Patrol.Center(S.armor)
end)

waitFor(8, function()
	return S.tank and IsValid(crewOf(S.tank, 1)) and IsValid(crewOf(S.tank, 2)) and S.heli and IsValid(crewOf(S.heli, 1))
end, "crews seated")

step(0, function()
	local tank, heli = S.tank, S.heli
	log("tank: " .. PR_Patrol.VehicleInfo(tank))
	log("heli: " .. PR_Patrol.VehicleInfo(heli))
	local driver = crewOf(tank, 1)
	check("tank has a bot driver", tank and IsValid(tank.ent) and IsValid(driver) and tank.ent:GetDriver() == driver,
		tank and IsValid(tank.ent) and tostring(tank.ent:GetDriver()))
	check("tank crew hidden and untargetable", IsValid(driver) and driver:GetNWBool("PR_PatrolCrew") and driver:IsFlagSet(FL_NOTARGET))
	check("tank MG gunner seated", IsValid(crewOf(tank, 2)) and IsValid(crewOf(tank, 2):GetVehicle()))
	check("heli flies on its own AI", heli and IsValid(heli.ent) and heli.ent:GetAI() == true)
	check("heli gunner seated", IsValid(crewOf(heli, 1)) and IsValid(crewOf(heli, 1):GetVehicle()))
	log("players now " .. player.GetCount() .. " / " .. game.MaxPlayers())

	if tank and IsValid(tank.ent) then
		lookAt(tank.ent:WorldSpaceCenter())
		shot("patrol_armor")
	end
end)

-- Патруль ушёл на 600 (застрявший танк к тому времени отстанет больше чем на 700), вертолёт
-- отпущен (держится на месте, пока раскручивается мотор) и поднялся над патрулём
waitFor(15, function()
	local center = S.armor and PR_Patrol.Center(S.armor)
	if not (center and S.leaderStart) then return true end
	local heliUp = not (S.heli and IsValid(S.heli.ent)) or (not S.heli.holdUntil and S.heli.ent:GetPos().z - center.z > 500)
	return center:Distance(S.leaderStart) > 600 and heliUp
end, "patrol on the move")

step(0, function()
	local tank, heli = S.tank, S.heli
	log("tank: " .. PR_Patrol.VehicleInfo(tank))
	log("heli: " .. PR_Patrol.VehicleInfo(heli))
	local leaderPos = S.armor and PR_Patrol.Center(S.armor)
	if tank and IsValid(tank.ent) and S.tankStart then
		local moved = tank.ent:GetPos():Distance(S.tankStart)
		local toLeader = leaderPos and tank.ent:GetPos():Distance(leaderPos) or 99999
		local leaderMoved = (leaderPos and S.leaderStart) and leaderPos:Distance(S.leaderStart) or 99999
		log(string.format("tank moved %d, to leader %d, leader moved %d", moved, toLeader, leaderMoved))
		if leaderMoved < 200 then
			local enemies = {}
			for _, npc in ipairs(S.armor.members) do
				local e = IsValid(npc) and npc:GetEnemy()
				if IsValid(e) then table.insert(enemies, npc:GetClass() .. "->" .. tostring(e)) end
			end
			log(string.format("armored patrol stands: enemies [%s], lastCombat %.1f ago, linger %s, route %s, idx %s, orderAt %s",
				table.concat(enemies, ", "), CurTime() - (S.armor.lastCombat or 0), tostring(S.armor.lingerUntil and S.armor.lingerUntil - CurTime()),
				table.concat(S.armor.route or {}, ","), tostring(S.armor.routeIndex), tostring(S.armor.orderAt and CurTime() - S.armor.orderAt)))
		end
		-- Едет за патрулём; а если патруль сам почти стоит (задержался на споте) — держится рядом
		check("tank drives after the patrol", toLeader < 700 and (moved > 100 or leaderMoved < 200 or toLeader < 400),
			string.format("%d / %d / %d", moved, toLeader, leaderMoved))
	end
	if heli and IsValid(heli.ent) and leaderPos then
		local hp = heli.ent:GetPos()
		local above = hp.z - leaderPos.z
		local flat = Vector(hp.x - leaderPos.x, hp.y - leaderPos.y, 0):Length()
		log("heli above patrol " .. math.Round(above) .. ", sideways " .. math.Round(flat))
		check("heli escorts above the patrol", above > 500 and flat < 3500, math.Round(above) .. " / " .. math.Round(flat))
	end

	-- Наведение: в танк «врагом» ставим тестового бота
	if tank and IsValid(tank.ent) and IsValid(S.b1) then
		local p = clearPointFrom(tank.ent:GetPos(), 900, tank.ent:WorldSpaceCenter() + Vector(0, 0, 60))
		log("tank target point " .. tostring(p))
		if p then S.b1:SetPos(p + Vector(0, 0, 5)) end
		-- Цель бессмертна: иначе после первого же попадания она возродится в другом месте
		S.b1:GodEnable()
		tank.forceTarget = S.b1
		S.tankShotBefore = tank.ent.NextShoot or 0
		lookAt(tank.ent:WorldSpaceCenter())
	end
end)

-- Башня поворачивается 35°/с: на разворот до 180° нужно до 6 секунд, плюс выстрел
waitFor(15, function()
	local t = S.tank
	return not (t and IsValid(t.ent)) or t.dead or (t.ent.NextShoot or 0) > (S.tankShotBefore or 0)
end, "tank cannon shot")

step(0, function()
	local tank = S.tank
	if not tank or not IsValid(tank.ent) or tank.dead then
		check("tank alive for aiming", false, PR_Patrol.VehicleInfo(tank))
		return
	end
	local veh = tank.ent
	if tank.aimAng then
		log(string.format("tank aim: want %s, turret yaw/pitch %.1f/%.1f, expected local %s",
			tostring(tank.aimAng), veh.sm_pp_yaw or -999, veh.sm_pp_pitch or -999, tostring(veh:WorldToLocalAngles(tank.aimAng))))
	end
	local id = veh:LookupAttachment("muzzle")
	local att = id and id > 0 and veh:GetAttachment(id)
	if att and IsValid(S.b1) then
		local want = (S.b1:WorldSpaceCenter() - att.Pos):GetNormalized()
		local errUp = math.deg(math.acos(math.Clamp(att.Ang:Up():Dot(want), -1, 1)))
		local errFwd = math.deg(math.acos(math.Clamp(att.Ang:Forward():Dot(want), -1, 1)))
		log(string.format("tank aim error: up %.1f, forward %.1f", errUp, errFwd))
		check("tank turret aims at the target", math.min(errUp, errFwd) < 12, string.format("%.1f / %.1f", errUp, errFwd))
	else
		check("tank has a muzzle", false)
	end
	check("tank fired its cannon", (veh.NextShoot or 0) > (S.tankShotBefore or 0), tostring(veh.NextShoot))
	shot("patrol_tank_aim")
	tank.forceTarget = nil
end)


-- Танк перевернулся: встаёт сам, экипаж жив, и его не швыряет по карте
T.addFlipSteps(function() return S.tank end)

step(1, function()
	local tank = S.tank
	if not tank or not IsValid(tank.ent) or tank.dead then return end
	local veh = tank.ent
	-- Подбить танк: огромный урон от хоста
	S.moneyTank = S.host:GetNWInt("PR_money")
	S.tankCrew = {crewOf(tank, 1), crewOf(tank, 2)}
	local d = DamageInfo()
	d:SetDamage(10000000)
	d:SetAttacker(S.host)
	d:SetInflictor(S.host)
	d:SetDamageType(DMG_BLAST)
	veh:TakeDamageInfo(d)
end)

waitFor(5, function()
	if not S.moneyTank then return true end
	for _, bot in pairs(S.tankCrew or {}) do
		if IsValid(bot) then return false end
	end
	return S.tank.dead
end, "tank destroyed and crew gone")

step(0, function()
	if S.moneyTank then
		local text = T.patrolLogSince(S.logMark)
		check("patrol log: armored patrol spawn written", string.find(text, "патруль «Тест: броня» вышел на спот", 1, true) ~= nil)
		check("destroyed tank pays its reward", S.host:GetNWInt("PR_money") == S.moneyTank + 4000, S.host:GetNWInt("PR_money") - S.moneyTank)
	end
	local left = 0
	for _, bot in pairs(S.tankCrew or {}) do
		if IsValid(bot) then left = left + 1 end
	end
	check("tank crew bots gone", left == 0, left)
	check("patrol lives on with the heli", table.HasValue(PR_Patrol.Active, S.armor))

	S.heliCrew = crewOf(S.heli, 1)
	PR_Patrol.ClearAll()
	RunConsoleCommand("pr_patrol_debug", "0")
end)

step(1, function()
	check("heli and its gunner removed", not (S.heli and IsValid(S.heli.ent)) and not IsValid(S.heliCrew))
	if S.armorType then PR_Patrol.DeleteType(S.armorType) end
	check("no crew bots left", (function()
		for _, ply in ipairs(player.GetAll()) do
			if ply:GetNWBool("PR_PatrolCrew") then return false end
		end
		return true
	end)())
end)


----------------------------------------------------------------------------------------------------
-- Мини-карта: союзник вдали (движок его клиенту не шлёт) — виден, враг рядом — нет; далёкая точка
-- захвата с названием и владельцем; территория из редактора и «где я»; карта рисуется
----------------------------------------------------------------------------------------------------
T.section("minimap")

net.Receive("PR_SELFTEST_MINIMAP", function()
	S.minimapState = net.ReadTable()
end)

-- Есть ли в присланном клиенту списке союзников бот ply рядом с его настоящим местом
local function allyListed(st, ply)
	if not IsValid(ply) then return false end
	for _, a in ipairs(st and st.allies or {}) do
		local idx, x, y = string.match(a, "^(%d+)@(-?%d+),(-?%d+)$")
		if tonumber(idx) == ply:EntIndex() and Vector(tonumber(x), tonumber(y), 0):Distance(Vector(ply:GetPos().x, ply:GetPos().y, 0)) < 200 then
			return true
		end
	end
	return false
end

local function askMinimap(cmd)
	net.Start("PR_SELFTEST_MINIMAP")
		net.WriteString(cmd)
	net.Send(S.host)
end

step(1, function()
	net.Start("PR_SELFTEST_CLOSE") net.Send(S.host)
	PR_Patrol.NextSpawn = math.huge
	PR_Patrol.ClearAll()
	check("minimap config for this map", istable(PR_MINIMAPS) and PR_MINIMAPS[string.lower(game.GetMap())] ~= nil)

	local base = T.FIXED_BASES[1]
	S.host:SetNWString("PR_fraction", "USA")
	S.host:SetMoveType(MOVETYPE_WALK)
	S.host:SetPos(base + Vector(0, 0, 10))
	-- Лицом на восток: на поворачивающейся карте север уходит влево, на «север сверху» — нет
	S.host:SetEyeAngles(Angle(0, 0, 0))
	-- Свой далеко (вне видимости клиента), чужой рядом
	if IsValid(S.b2) then
		S.b2:SetNWString("PR_fraction", "USA")
		S.b2:SetPos(T.HARD_SPOTS[2] + Vector(0, 0, 10))
	end
	if IsValid(S.b1) then
		S.b1:SetNWString("PR_fraction", "SSNK")
		S.b1:SetPos(base + Vector(600, 0, 10))
	end

	-- Далёкая точка: «Тест-точка» за USA; рядом — ничья
	local function Point(pos, name, team)
		local p = ents.Create("zahvat_ojka")
		p:SetPos(pos)
		p:Spawn()
		p:Activate()
		p:SetCurPoint(name)
		p:SetCaptureTeam(team)
		return p
	end
	S.mapPoints = {
		Point(T.HARD_SPOTS[1], "Тест-точка", "USA"),
		Point(base + Vector(-700, -900, 0), "Ничья-тест", "Ничья")
	}
	-- Третий бот — союзник рядом: стрелка с именем (дальний — значок на краю)
	S.botsBefore = #player.GetBots()
	RunConsoleCommand("bot")

	-- Территория из редактора патрулей — спот прямо под хостом (рядом могут быть споты Тест-А/Б/В
	-- из секции patrol: их названия — тоже территории)
	S.mapSpot = PR_Patrol.AddSpot(base, "Тест-территория")
end)

waitFor(5, function() return #player.GetBots() > (S.botsBefore or 0) end, "near ally bot")

step(0, function()
	local bots = player.GetBots()
	S.b3 = bots[#bots]
	if IsValid(S.b3) then
		S.b3:SetNWString("PR_fraction", "USA")
		S.b3:SetPos(T.FIXED_BASES[1] + Vector(500, 350, 10))
		S.b3:SetEyeAngles(Angle(0, 180, 0))
	end
end)

waitFor(6, function()
	if not S.minimapAsked or CurTime() > S.minimapAsked then
		S.minimapAsked = CurTime() + 1
		askMinimap("state")
	end
	-- Союзников сервер шлёт раз в полсекунды: ждём список уже после перестановки ботов
	local st = S.minimapState
	return st and st.zone == "Тест-территория" and allyListed(st, S.b2)
end, "minimap data on the client")

step(0, function()
	local st = S.minimapState or {}
	log(string.format("minimap: visible %s, drawn %.2f s ago, points [%s], allies [%s], zones [%s], zone %s, b2 dormant %s",
		tostring(st.visible), st.drawnAgo or -1, table.concat(st.points or {}, ", "), table.concat(st.allies or {}, ", "),
		table.concat(st.zones or {}, ", "), tostring(st.zone), tostring(st.b2Dormant)))
	check("minimap drawn", st.visible == true and (st.drawnAgo or 99) < 1)
	check("far capture point known with name and owner", table.HasValue(st.points or {}, "Тест-точка=USA"))
	check("far ally position reaches the client", allyListed(st, S.b2), table.concat(st.allies or {}, ", "))
	local enemyListed = false
	for _, a in ipairs(st.allies or {}) do
		if IsValid(S.b1) and tonumber(string.match(a, "^(%d+)@")) == S.b1:EntIndex() then enemyListed = true end
	end
	check("enemy is not sent as an ally", not enemyListed, table.concat(st.allies or {}, ", "))
	check("territory from the patrol editor on the minimap", table.HasValue(st.zones or {}, "Тест-территория"))
	check("minimap knows which territory you are in", st.zone == "Тест-территория", st.zone)
	shot("minimap")
	askMinimap("northup")
end)

step(1, function()
	shot("minimap_north_up")
	askMinimap("rotate")
end)

step(1, function()
	for _, p in ipairs(S.mapPoints or {}) do
		if IsValid(p) then p:Remove() end
	end
	if S.mapSpot then PR_Patrol.RemoveSpot(S.mapSpot) end
	if IsValid(S.b3) then S.b3:Kick("selftest") end
end)

T.section("common")

step(1, function()
	PR_Patrol.ClearAll()
	for _, id in ipairs({S.spotA, S.spotB, S.spotC}) do
		if id then PR_Patrol.RemoveSpot(id) end
	end
	if S.spotA then
		check("test spots removed from db", #PR_DB.GetPatrolSpots(string.lower(game.GetMap())) == (S.dbSpotsBefore or 0))
	end
	RunConsoleCommand("ai_ignoreplayers", "0")
	RunConsoleCommand("pr_patrol_debug", "0")
end)

step(1, T.done)

hook.Add("InitPostEntity", "PR_SelfTest", function() T.run(8) end)
