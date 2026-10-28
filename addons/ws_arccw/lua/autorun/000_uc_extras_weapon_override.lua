                                                                  
                                                                            
                                                      

local weaponFiles = {
    "ux_arccw_myt_c1a1.lua",
    "ux_arccw_myt_uc_gm6.lua",
    "ux_arccw_myt_uc_neostead.lua",
    "ux_arccw_myt_uc_scar.lua",
    "ux_arccw_uc_a1.lua",
    "ux_arccw_uc_unofficial_type20.lua",
    "ux_arccw_uc_usp.lua",
    "ux_arccw_ud_870.lua",
    "ux_arccw_ud_glock.lua",
    "ux_arccw_ud_m1014.lua",
    "ux_arccw_ud_m16.lua",
    "ux_arccw_ud_m79.lua",
    "ux_arccw_ud_mini14.lua",
    "ux_arccw_ud_uzi.lua",
    "ux_arccw_ur_329.lua",
    "ux_arccw_ur_ak.lua",
    "ux_arccw_ur_aw.lua",
    "ux_arccw_ur_db.lua",
    "ux_arccw_ur_deagle.lua",
    "ux_arccw_ur_g3.lua",
    "ux_arccw_ur_m1911.lua",
    "ux_arccw_ur_mp5.lua",
    "ux_arccw_ur_spas12.lua"
}

local basePath = "uc_extras/weapons/"

if SERVER then
    for _, fileName in ipairs(weaponFiles) do
        AddCSLuaFile(basePath .. fileName)
    end
end

UCExtrasWeaponOverride = UCExtrasWeaponOverride or {}
local override = UCExtrasWeaponOverride

override.ProtectedClasses = override.ProtectedClasses or {}
for _, fileName in ipairs(weaponFiles) do
    local className = string.StripExtension(string.sub(fileName, 4))
    override.ProtectedClasses[className] = true
end

                                                                             
                                                                              
                                                                  
override.RawRegister = override.RawRegister or weapons.Register
override.GuardedRegister = override.GuardedRegister or function(definition, className, ...)
                                                                           
                                                                           
                                                        
    if override.ProtectedClasses[className]
        and override.RegisteredClasses
        and override.RegisteredClasses[className]
        and not override.Applying then
        return
    end

    return override.RawRegister(definition, className, ...)
end

weapons.Register = override.GuardedRegister

function UCExtras_RegisterWeapon(definition, className)
    if not override.ProtectedClasses[className] then
        error("UC Extras refused an unprotected weapon class: " .. tostring(className), 2)
    end

    override.Applying = true
    local ok, result = pcall(override.RawRegister, definition, className)
    override.Applying = false

    if not ok then
        error(result, 2)
    end

    override.RegisteredClasses = override.RegisteredClasses or {}
    override.RegisteredClasses[className] = true
    return result
end

local applyingAll = false

local function ApplyWeaponOverrides()
    if applyingAll or not ArcCW or not weapons or not weapons.Register then
        return
    end

    applyingAll = true
    override.RegisteredClasses = {}

    for _, fileName in ipairs(weaponFiles) do
        local ok, err = pcall(include, basePath .. fileName)
        if not ok then
            ErrorNoHalt("[UC Extras] Failed to override " .. fileName .. ": " .. tostring(err) .. "\n")
        end
    end

    applyingAll = false
end

local function ApplyNextTick()
    timer.Simple(0, ApplyWeaponOverrides)
end

hook.Add("Initialize", "UCExtras.ApplyWeaponOverrides", ApplyNextTick)
hook.Add("InitPostEntity", "UCExtras.ApplyWeaponOverrides", ApplyNextTick)
hook.Add("OnReloaded", "UCExtras.ApplyWeaponOverrides", ApplyNextTick)

                                                                             
ApplyNextTick()
