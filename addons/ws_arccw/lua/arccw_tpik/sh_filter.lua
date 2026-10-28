ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

TPIK.FilterOff = 0
TPIK.FilterBlacklist = 1
TPIK.FilterWhitelist = 2

TPIK.FilterFile = "arccw_tpik/filter.json"

TPIK.FilterList = TPIK.FilterList or {}

function TPIK.GetFilterMode()
    if not TPIK.CVars or not TPIK.CVars.Filter then return TPIK.FilterOff end

    local mode = TPIK.CVars.Filter:GetInt()

    if mode ~= TPIK.FilterBlacklist and mode ~= TPIK.FilterWhitelist then
        return TPIK.FilterOff
    end

    return mode
end

function TPIK.IsListed(class)
    if not isstring(class) then return false end

    return TPIK.FilterList[string.lower(class)] == true
end

function TPIK.SetListed(class, listed)
    if not isstring(class) or class == "" then return end

    class = string.lower(class)

    if listed then
        TPIK.FilterList[class] = true
    else
        TPIK.FilterList[class] = nil
    end

    TPIK.SaveFilter()

    if TPIK.RebuildAll then TPIK.RebuildAll() end
end

function TPIK.ToggleListed(class)
    if not isstring(class) or class == "" then return false end

    local listed = not TPIK.IsListed(class)
    TPIK.SetListed(class, listed)

    return listed
end

function TPIK.FilterAllows(wep)
    local mode = TPIK.GetFilterMode()
    if mode == TPIK.FilterOff then return true end

    local class = IsValid(wep) and wep.GetClass and wep:GetClass() or wep
    if not isstring(class) then return true end

    local listed = TPIK.IsListed(class)

    if mode == TPIK.FilterWhitelist then return listed end

    return not listed
end

function TPIK.ClearFilter()
    TPIK.FilterList = {}
    TPIK.SaveFilter()

    if TPIK.RebuildAll then TPIK.RebuildAll() end
end

function TPIK.CountListed()
    local n = 0
    for _ in pairs(TPIK.FilterList) do n = n + 1 end

    return n
end

if CLIENT then
    function TPIK.SaveFilter()
        if not file.IsDir("arccw_tpik", "DATA") then
            file.CreateDir("arccw_tpik")
        end

        local out = {}
        for class in pairs(TPIK.FilterList) do out[#out + 1] = class end
        table.sort(out)

        file.Write(TPIK.FilterFile, util.TableToJSON({weapons = out}, true))
    end

    function TPIK.LoadFilter()
        TPIK.FilterList = {}

        local raw = file.Read(TPIK.FilterFile, "DATA")
        if not raw then return false end

        local parsed = util.JSONToTable(raw)
        if not istable(parsed) or not istable(parsed.weapons) then return false end

        for _, class in ipairs(parsed.weapons) do
            if isstring(class) and class ~= "" then
                TPIK.FilterList[string.lower(class)] = true
            end
        end

        return true
    end

    TPIK.LoadFilter()

    local function heldClass(ply)
        local wep = IsValid(ply) and ply:GetActiveWeapon()
        if not IsValid(wep) then return nil end
        if not TPIK.IsArcCWWeapon(wep) then return nil end

        return wep:GetClass()
    end

    concommand.Add("arccw_tpik_list_toggle", function(ply)
        local class = heldClass(ply)

        if not class then
            print("[TPIK] Hold an ArcCW weapon first.")
            return
        end

        local listed = TPIK.ToggleListed(class)
        local mode = TPIK.GetFilterMode()

        local meaning

        if mode == TPIK.FilterWhitelist then
            meaning = listed and "TPIK on" or "TPIK off"
        elseif mode == TPIK.FilterBlacklist then
            meaning = listed and "TPIK off" or "TPIK on"
        else
            meaning = "no effect, filter mode is off"
        end

        print(string.format("[TPIK] %s %s the list (%s)",
            class, listed and "added to" or "removed from", meaning))
    end, nil, "Add or remove the weapon you are holding from the TPIK list")

    concommand.Add("arccw_tpik_list_print", function()
        local mode = TPIK.GetFilterMode()
        local names = {"off", "blacklist", "whitelist"}

        print(string.format("[TPIK] filter mode: %s, %d weapon(s) listed",
            names[mode + 1], TPIK.CountListed()))

        local out = {}
        for class in pairs(TPIK.FilterList) do out[#out + 1] = class end
        table.sort(out)

        for _, class in ipairs(out) do print("   " .. class) end
    end, nil, "Print the TPIK weapon list")

    concommand.Add("arccw_tpik_list_clear", function()
        TPIK.ClearFilter()
        print("[TPIK] list cleared")
    end, nil, "Empty the TPIK weapon list")
else
    function TPIK.SaveFilter() end
    function TPIK.LoadFilter() return false end
end
