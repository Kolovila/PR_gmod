GM.Name = "PR"
GM.Author = "Kolovila"
GM.Email = "N/A"
GM.Website = "https://github.com/Kolovila/PR_gmod"

team.SetUp(0, "Loh", Color(255,0,0))
team.SetUp(1, "SSNK", Color(0,0,255))
team.SetUp(2, "USA", Color(0,255,0))
team.SetUp(3, "GBC", Color(255,0,255))
team.SetUp(4, "WN", Color(0,255,255))

DeriveGamemode("sandbox")

-- Группировки, за которые можно играть. Есть ещё служебная "admin", только для админов.
PR_FRACTIONS = {"SSNK", "USA", "GBC", "WN"}

function PR_IsFraction(name)
    return table.HasValue(PR_FRACTIONS, name)
end

-- Админ режима: админ сервера или выданный через табло флаг PR_admin
function PR_IsAdmin(ply)
    return IsValid(ply) and (ply:IsAdmin() or ply:GetNWBool("PR_admin"))
end

----------------------------------------------------------------------------------------------------
-- Настройки карт
----------------------------------------------------------------------------------------------------

-- Зоны покупки: список коробок {угол1, угол2} для каждого типа покупки.
-- Если для карты зон нет, покупать можно где угодно.
PR_BuyZones = PR_BuyZones or {
    ["rp_desert_conflict"] = {
        ["weapon"] = {
            {Vector(2599, -5735, -534), Vector(2827, -5960, -396)}
        }
    }
}

-- Куда можно вызвать технику: air — самолёты и вертолёты, ground — остальное.
-- Если для карты мест нет, техника появляется перед игроком.
PR_VehicleDeploys = PR_VehicleDeploys or {
    ["rp_desert_conflict"] = {
        air = {
            ["Город"] = Vector(-12486, -2897, -350)
        },
        ground = {
            ["Южная военка"] = Vector(-11599, -6272, -353),
            ["Северная военка"] = Vector(12800, -4566, -353)
        }
    }
}

PR_DEPLOY_NEAR = "Рядом со мной"

-- Места вызова для типа техники: {["название"] = Vector} или {[PR_DEPLOY_NEAR] = false}
function PR_GetVehicleDeploys(vehType)
    local mapSpots = PR_VehicleDeploys[string.lower(game.GetMap())]
    local kind = (vehType == "jets" or vehType == "helicopters") and "air" or "ground"

    if mapSpots and istable(mapSpots[kind]) and not table.IsEmpty(mapSpots[kind]) then
        return mapSpots[kind]
    end

    return {[PR_DEPLOY_NEAR] = false}
end

----------------------------------------------------------------------------------------------------
-- Списки магазинов. На сервере грузятся из data/pr_gamemode (sv_shop.lua), клиенту приходят по сети.
----------------------------------------------------------------------------------------------------

PR_WS_List = PR_WS_List or {}
PR_Vehicle_List = PR_Vehicle_List or {}
PR_Equip_List = PR_Equip_List or {}
PR_Cloth_List = PR_Cloth_List or {}
PR_Capture_Points_List = PR_Capture_Points_List or {}
PR_Patrols_List = PR_Patrols_List or {}

-- Открыто ли оружие: хватает любого купленного из NeedToUnlock (пустая строка = без условий)
function PR_IsWeaponUnlocked(entry, purchased)
    local need = entry["NeedToUnlock"]
    if not istable(need) then return true end

    for _, class in pairs(need) do
        if class == "" or table.HasValue(purchased or {}, class) then
            return true
        end
    end

    return false
end
