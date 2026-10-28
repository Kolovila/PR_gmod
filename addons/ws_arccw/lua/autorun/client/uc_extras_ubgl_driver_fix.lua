local PATCHED = "ArcCW_UC_Extras_DriverFix"

local function setupDrivers(wep)
    local atts = wep.Attachments
    if not istable(atts) then return end

    for _, slot in pairs(atts) do
        local reflect = slot.ReflectDriver
        local god = slot.GodDriver

        if reflect and IsValid(reflect.Model) then reflect.Model:SetupBones() end
        if god and IsValid(god.Model) then god.Model:SetupBones() end
    end
end

local function withoutDrivers(wep, fn, pos, ang)
    local atts = wep.Attachments
    local saved

    if istable(atts) then
        for i, slot in pairs(atts) do
            if slot.ReflectDriver then
                saved = saved or {}
                saved[i] = slot.ReflectDriver
                slot.ReflectDriver = nil
            end
        end
    end

    local ok, a, b = pcall(fn, wep, pos, ang)

    if saved then
        for i, driver in pairs(saved) do
            atts[i].ReflectDriver = driver
        end
    end

    if ok then return a, b end
end

local function patch(tbl)
    if not istable(tbl) then return end
    if tbl[PATCHED] then return end

    local original = tbl.GetViewModelPosition
    if not isfunction(original) then return end

    tbl[PATCHED] = true

    tbl.GetViewModelPosition = function(wep, pos, ang)
        setupDrivers(wep)

        local ok, a, b = pcall(original, wep, pos, ang)
        if ok then return a, b end

        local c, d = withoutDrivers(wep, original, pos, ang)
        if c then return c, d end

        return pos, ang
    end
end

local function derivesFromArcCW(class)
    local seen = 0

    while class and seen < 8 do
        if class == "arccw_base" then return true end

        local tbl = weapons.GetStored(class)
        if not tbl then return false end

        class = tbl.Base
        seen = seen + 1
    end

    return false
end

local function patchAll()
    for _, entry in ipairs(weapons.GetList()) do
        local class = entry.ClassName

        if class and derivesFromArcCW(class) then
            patch(weapons.GetStored(class))
        end
    end
end

hook.Add("InitPostEntity", PATCHED, patchAll)
hook.Add("OnReloaded", PATCHED, patchAll)

timer.Simple(0, patchAll)
