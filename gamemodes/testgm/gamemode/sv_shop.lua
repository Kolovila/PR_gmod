-- Магазины на сервере: списки товаров, покупки, одежда.
-- Клиент присылает только ЧТО он хочет купить. Цену, опыт и условия сервер берёт из своих списков.

util.AddNetworkString("MainMenuOpen")

util.AddNetworkString("SaveWeaponData")
util.AddNetworkString("SaveVehicleData")
util.AddNetworkString("SaveEquipData")
util.AddNetworkString("SaveClothData")

util.AddNetworkString("WeaponTable")
util.AddNetworkString("EquipTable")
util.AddNetworkString("VehicleTable")
util.AddNetworkString("ClothTable")

util.AddNetworkString("GiveWeapon")
util.AddNetworkString("GiveVehicle")
util.AddNetworkString("GiveEnity")
util.AddNetworkString("BuyPlayerModel")
util.AddNetworkString("Preset")

util.AddNetworkString("IsPlayerInBuyBox")
util.AddNetworkString("SendIsPlayerInBuyBox")

-- Списки магазинов: вид в sqlite (sv_db.lua), глобальная таблица, сообщение со списком, сообщение сохранения
local LISTS = {
    {kind = "weapon", global = "PR_WS_List", send = "WeaponTable", save = "SaveWeaponData"},
    {kind = "equip", global = "PR_Equip_List", send = "EquipTable", save = "SaveEquipData"},
    {kind = "vehicle", global = "PR_Vehicle_List", send = "VehicleTable", save = "SaveVehicleData"},
    {kind = "cloth", global = "PR_Cloth_List", send = "ClothTable", save = "SaveClothData"}
}

for _, list in ipairs(LISTS) do
    _G[list.global] = PR_DB.LoadShopList(list.kind)
end

-- Патрули — недописанная фича (pr_point_for_patrol), их список пока остаётся в JSON
PR_Patrols_List = util.JSONToTable(file.Read("pr_gamemode/patrols_list.txt", "DATA") or "") or {}

local function SendList(list, target)
    net.Start(list.send)
        net.WriteTable(_G[list.global] or {})
    if target then net.Send(target) else net.Broadcast() end
end

concommand.Add("open_main_menu", function(ply)
    if not IsValid(ply) or not PR_NetThrottle(ply, "open_main_menu", 0.5) then return end

    for _, list in ipairs(LISTS) do
        SendList(list, ply)
    end

    net.Start("MainMenuOpen")
    net.Send(ply)
end)

-- Редактор магазинов в меню: сохранять может только админ
for _, list in ipairs(LISTS) do
    net.Receive(list.save, function(len, ply)
        if not PR_IsAdmin(ply) then return end

        local tbl = net.ReadTable()
        if not istable(tbl) then return end

        if not PR_DB.SaveShopList(list.kind, tbl) then
            ply:ChatPrint("Не удалось сохранить магазин, подробности в консоли сервера")
            return
        end

        -- Перечитываем из базы, чтобы у всех был ровно сохранённый вид
        _G[list.global] = PR_DB.LoadShopList(list.kind)
        SendList(list)

        PR_Log(ply, "сохранил магазин " .. list.kind)
    end)
end

----------------------------------------------------------------------------------------------------
-- Зона покупки
----------------------------------------------------------------------------------------------------

function PR_IsInBuyZone(ply, kind)
    local zones = PR_BuyZones[string.lower(game.GetMap())]
    if not zones or not zones[kind] then return true end

    for _, box in ipairs(zones[kind]) do
        local a, b = box[1], box[2]
        local mins = Vector(math.min(a.x, b.x), math.min(a.y, b.y), math.min(a.z, b.z))
        local maxs = Vector(math.max(a.x, b.x), math.max(a.y, b.y), math.max(a.z, b.z))

        for _, ent in ipairs(ents.FindInBox(mins, maxs)) do
            if ent == ply then return true end
        end
    end

    return false
end

net.Receive("IsPlayerInBuyBox", function(len, ply)
    local typeBuy = net.ReadString()

    net.Start("SendIsPlayerInBuyBox")
        net.WriteBool(PR_IsInBuyZone(ply, typeBuy))
    net.Send(ply)
end)

----------------------------------------------------------------------------------------------------
-- Покупки
----------------------------------------------------------------------------------------------------

local function FindEntry(list, field, value)
    if not istable(list) then return end

    for _, entry in pairs(list) do
        if istable(entry) and entry[field] == value then
            return entry
        end
    end
end

local function Price(entry, field)
    return math.max(math.floor(tonumber(entry[field or "Price"]) or 0), 0)
end

local function CanBuyNow(ply)
    return IsValid(ply) and ply:Alive() and PR_NetThrottle(ply, "buy", 0.3)
end

-- Перед глазами игрока, на полу: туда ставим экипировку и технику без точки вызова
local function SpotInFront(ply, dist)
    local yaw = Angle(0, ply:EyeAngles().y, 0)
    local tr = util.TraceLine({
        start = ply:EyePos(),
        endpos = ply:EyePos() + yaw:Forward() * dist,
        filter = ply
    })
    local back = tr.HitPos - yaw:Forward() * 40
    local down = util.TraceLine({start = back, endpos = back - Vector(0, 0, 500), filter = ply})

    return down.HitPos + Vector(0, 0, 10)
end

net.Receive("GiveWeapon", function(len, ply)
    local class = net.ReadString()
    if not CanBuyNow(ply) then return end

    local frac = ply:GetNWString("PR_fraction")
    local entry = FindEntry(PR_WS_List[frac], "ClassName", class)
    if not entry then return end

    if not PR_IsInBuyZone(ply, "weapon") then
        ply:ChatPrint("Ты не в зоне покупки!")
        return
    end

    ply.PurchasedWeapons = ply.PurchasedWeapons or {}

    if not table.HasValue(ply.PurchasedWeapons, class) then
        local price, exp = Price(entry), Price(entry, "Exp")
        local expKey = "PR_weapon_exp_" .. frac

        if not PR_IsWeaponUnlocked(entry, ply.PurchasedWeapons) then
            ply:ChatPrint("Это оружие ещё не открыто")
            return
        end
        if ply:GetNWInt("PR_money") < price then
            ply:ChatPrint("Не хватает денег!")
            return
        end
        if ply:GetNWInt(expKey) < exp then
            ply:ChatPrint("Не хватает опыта!")
            return
        end

        ply:SetNWInt("PR_money", ply:GetNWInt("PR_money") - price)
        ply:SetNWInt(expKey, ply:GetNWInt(expKey) - exp)
        table.insert(ply.PurchasedWeapons, class)
        PR_SendPurchased(ply)
    end

    ply:Give(class)
end)

-- Оружие, которое выдаётся при спавне. Только из уже купленного.
net.Receive("Preset", function(len, ply)
    local item = net.ReadString()
    local slot = net.ReadString()
    local name = net.ReadString()

    if slot ~= "Primary" and slot ~= "Secondary" then return end
    if not table.HasValue(ply.PurchasedWeapons or {}, item) then return end

    ply.Preset = ply.Preset or {}
    ply.Preset[slot] = {
        ["Item"] = item,
        ["Name"] = string.sub(name, 1, 64)
    }
end)

-- Экипировка (гранаты, аптечки, стационарки): список общий для всех фракций
net.Receive("GiveEnity", function(len, ply)
    local class = net.ReadString()
    if not CanBuyNow(ply) then return end

    local entry = FindEntry(PR_Equip_List, "ClassName", class)
    if not entry then return end

    if not PR_IsInBuyZone(ply, "weapon") then
        ply:ChatPrint("Ты не в зоне покупки!")
        return
    end

    local price = Price(entry)
    if ply:GetNWInt("PR_money") < price then
        ply:ChatPrint("Не хватает денег!")
        return
    end

    if weapons.GetStored(class) then
        ply:Give(class)
    else
        local item = ents.Create(class)
        if not IsValid(item) then
            ply:ChatPrint("Нет такого предмета: " .. class)
            return
        end

        item:SetPos(SpotInFront(ply, 95))
        item:Spawn()
        item:Activate()
    end

    ply:SetNWInt("PR_money", ply:GetNWInt("PR_money") - price)
end)

-- Техника. Клиент присылает класс и название точки вызова из PR_VehicleDeploys.
net.Receive("GiveVehicle", function(len, ply)
    local class = net.ReadString()
    local spotName = net.ReadString()
    if not CanBuyNow(ply) or not PR_NetThrottle(ply, "vehicle", 2) then return end

    local entry = FindEntry(PR_Vehicle_List[ply:GetNWString("PR_fraction")], "ClassName", class)
    if not entry then return end

    local spot = PR_GetVehicleDeploys(entry["Type"])[spotName]
    if spot == nil then return end

    local price = Price(entry)
    if ply:GetNWInt("PR_money") < price then
        ply:ChatPrint("Не хватает денег!")
        return
    end

    local pos = spot or SpotInFront(ply, 300)
    local ang = spot and Angle(0, 90, 0) or Angle(0, ply:EyeAngles().y, 0)

    if entry["Mod"] == "simfphys" then
        if not simfphys then
            ply:ChatPrint("На сервере не стоит simfphys")
            return
        end

        simfphys.SpawnVehicleSimple(class, pos, ang)
    else
        local veh = ents.Create(class)
        if not IsValid(veh) then
            ply:ChatPrint("Нет такой техники: " .. class)
            return
        end

        veh:SetPos(pos)
        veh:SetAngles(ang)
        veh:Spawn()
        veh:Activate()
    end

    ply:SetNWInt("PR_money", ply:GetNWInt("PR_money") - price)
    PR_Log(ply, "вызвал технику " .. class .. " (" .. spotName .. ")")
end)

----------------------------------------------------------------------------------------------------
-- Одежда
----------------------------------------------------------------------------------------------------

-- Бодигруппы от клиента: только числа и только существующие у этой модели
local function CleanBodygroups(ply, raw)
    local clean = {}
    if not istable(raw) then return clean end

    for id, value in pairs(raw) do
        id, value = tonumber(id), tonumber(value)
        if id and value and id >= 0 and id < ply:GetNumBodyGroups() then
            local count = ply:GetBodygroupCount(id)
            clean[math.floor(id)] = math.Clamp(math.floor(value), 0, math.max(count - 1, 0))
        end
    end

    return clean
end

local function ApplyOutfit(ply, outfit)
    ply:SetModel(outfit["Model"])
    for id, value in pairs(outfit["Bodygroups"] or {}) do
        ply:SetBodygroup(tonumber(id), tonumber(value))
    end
end

net.Receive("BuyPlayerModel", function(len, ply)
    local model = net.ReadString()
    local rawBodygroups = net.ReadTable()
    if not CanBuyNow(ply) then return end

    local entry = FindEntry(PR_Cloth_List[ply:GetNWString("PR_fraction")], "Model", model)
    if not entry then return end

    if ply:GetNWInt("PR_level") < (tonumber(entry["Level"]) or 0) then
        ply:ChatPrint("Маловат уровень для этой формы")
        return
    end

    ply.PurchasedModels = ply.PurchasedModels or {}

    if not table.HasValue(ply.PurchasedModels, model) then
        local price = Price(entry)
        if ply:GetNWInt("PR_money") < price then
            ply:ChatPrint("Не хватает денег!")
            return
        end

        ply:SetNWInt("PR_money", ply:GetNWInt("PR_money") - price)
        table.insert(ply.PurchasedModels, model)
        PR_SendPurchased(ply)
    end

    ply:SetModel(model)
    ply.PR_Outfit = {
        ["Model"] = model,
        ["Bodygroups"] = CleanBodygroups(ply, rawBodygroups)
    }
    ApplyOutfit(ply, ply.PR_Outfit)
end)

-- Купленная форма остаётся после смерти: sandbox при спавне ставит модель из настроек игрока
hook.Add("PlayerSetModel", "PR_KeepOutfit", function(ply)
    local outfit = ply.PR_Outfit
    if istable(outfit) and isstring(outfit["Model"]) and util.IsValidModel(outfit["Model"]) then
        ApplyOutfit(ply, outfit)
        return true
    end
end)
