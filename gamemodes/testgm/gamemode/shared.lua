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

-- Группировки, за которые можно играть
PR_FRACTIONS = {"SSNK", "USA", "GBC", "WN", "SCAV"}

-- Название для интерфейса (по умолчанию — сам ключ)
PR_FRACTION_NAMES = {
    SCAV = "Мародёры"
}

-- Мародёры: покупают любое оружие любой группировки, техника только своя (старьё),
-- друг другу не союзники — убийство своего оплачивается как обычное.
-- Охрану на точки не нанимают: точку держат сами, а деньги с неё может утащить любой мародёр
PR_ALL_WEAPONS_FRACTIONS = {SCAV = true}
PR_FREE_FOR_ALL_FRACTIONS = {SCAV = true}
PR_NO_GUARDIANS_FRACTIONS = {SCAV = true}

function PR_IsFraction(name)
    return table.HasValue(PR_FRACTIONS, name)
end

function PR_FractionName(key)
    if not isstring(key) or key == "" then return "без группировки" end
    return PR_FRACTION_NAMES[key] or key
end

function PR_FractionFlag(key)
    return "test_gm_mat/flags/" .. string.lower(key or "") .. ".png"
end

-- Свои ли друг другу два игрока одной группировки (мародёры — нет)
function PR_AreAllies(fracA, fracB)
    return fracA ~= "" and fracA == fracB and not PR_FREE_FOR_ALL_FRACTIONS[fracA]
end

-- Оружие, доступное группировке: {{entry, index, faction}, ...}.
-- У мародёров — стволы всех группировок без повторов (плюс их собственный список, если админ его завёл).
function PR_GetWeaponEntries(frac)
    local out = {}
    local sources = PR_ALL_WEAPONS_FRACTIONS[frac] and PR_FRACTIONS or {frac}
    local seen = {}

    for _, source in ipairs(sources) do
        for i, e in ipairs((PR_WS_List or {})[source] or {}) do
            if istable(e) and isstring(e.ClassName) and not seen[e.ClassName] then
                seen[e.ClassName] = true
                table.insert(out, {entry = e, index = i, faction = source})
            end
        end
    end

    return out
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

-- Какая техника годится в патруль (sv_patrols.lua) и как ей управлять:
--   "ground"   — simfphys (танки Луны и Гредвича, БТР, джипы): своего ИИ нет, водит бот-экипаж;
--   "air"      — LFS/LVS вертолёты и самолёты: летают своим ИИ;
--   "aiground" — LVS наземная (wheeldrive): тоже свой ИИ, но едет по земле.
-- nil — такую технику патруль взять не может.
function PR_PatrolVehicleKind(class)
	if not isstring(class) or class == "" then return end
	if list.Get("simfphys_vehicles")[class] then return "ground" end

	local base = class
	for _ = 1, 10 do
		if base == "lvs_base_wheeldrive" then return "aiground" end
		if base == "lunasflightschool_basescript" or base == "lvs_base" then return "air" end

		local stored = scripted_ents.GetStored(base)
		base = stored and stored.t and stored.t.Base
		if not base then return end
	end
end

-- Есть ли такое оружие в игре: Lua-оружие (weapons.GetStored) или встроенное оружие HL2 (список "Weapon")
function PR_WeaponExists(class)
    return isstring(class) and (weapons.GetStored(class) ~= nil or list.Get("Weapon")[class] ~= nil)
end

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

-- Мини-карта: снимки карт и их границы (нужны клиенту, cl_minimap.lua)
include("config/minimap.lua")
include("sh_cw_compat.lua")
include("config/infantry.lua")
