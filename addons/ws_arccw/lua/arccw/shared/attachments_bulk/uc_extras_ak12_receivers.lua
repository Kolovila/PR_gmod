local specs = include("uc_extras/ak12_specs.lua")
local profiles = {
    ["545"] = {calibre = "5.45x39mm", ammo = "smg1", damage = 40, minimum = 20, recoil = 0.85, penetration = 0.65, accuracy = 0.85, velocity = 900, shell = "545x39", flag = "cal_545", sound = "545_39"},
    ["762"] = {calibre = "7.62x39mm", ammo = "ar2", damage = 50, minimum = 25, recoil = 1, penetration = 1, accuracy = 0.9, velocity = 715, shell = "762x39", flag = "cal_default"},
    ["556"] = {calibre = "5.56x45mm NATO", ammo = "smg1", damage = 34, minimum = 20, recoil = 0.65, penetration = 0.75, accuracy = 0.6, velocity = 910, shell = "556x45", flag = "cal_556", sound = "556"},
    ["308"] = {calibre = "7.62x51mm NATO", ammo = "ar2", damage = 65, minimum = 42, recoil = 1.5, penetration = 1.75, accuracy = 0.65, velocity = 800, shell = "762x51", flag = "cal_308"},
    ["602"] = {calibre = "6.02x41mm (experimental)", ammo = "ar2", damage = 45, minimum = 25, recoil = 0.95, penetration = 1.15, accuracy = 0.8, velocity = 900, shell = "545x39", flag = "cal_602"},
}
for id, spec in pairs(specs) do
     
    if id ~= "ur_ak_cal_545_ak12" then
        local att, p = {}, profiles[spec.cal]
        att.PrintName = spec.name .. " Receiver"
        att.AbbrevName = spec.name
        att.Icon = Material("entities/att/uc_ak12/" .. id .. ".png", "smooth mips")
        att.Description = spec.description
        att.Slot = "ur_ak_cal"
        att.AutoStats = true
        att.SortOrder = spec.year + spec.barrel_mm / 1000
        att.Override_Ammo = p.ammo
        att.Override_Trivia_Calibre = p.calibre
        att.Override_Trivia_Country = "Russia"
        att.Override_Trivia_Manufacturer = "Kalashnikov Concern"
        att.Override_Trivia_Year = spec.year
        att.Override_Trivia_Desc = att.Description
        att.Override_Trivia_Class = spec.mode == "semi" and "Sporting Rifle" or spec.cal == "308" and "Battle Rifle" or "Assault Rifle"
        att.Mult_Damage = p.damage / 50
        att.Mult_DamageMin = p.minimum / 25
        att.Mult_Recoil = p.recoil
        att.Mult_Penetration = p.penetration
        att.Mult_AccuracyMOA = p.accuracy
        att.Mult_RPM = 700 / 600
         
        att.Mult_PhysBulletMuzzleVelocity = (spec.velocity_mps or p.velocity) / 715
        att.Mult_Range = (spec.range_m or (spec.cal == "762" and 350 or 440)) / 300
        att.Override_ShellModel = spec.cal == "308" and "models/weapons/arccw/ud_shells/762.mdl" or "models/weapons/arccw/uc_shells/" .. p.shell .. ".mdl"
        att.Override_ShellScale = 1
        att.GivesFlags = {p.flag, "receiver_ak12", "ux_ak12_family"}
        att.ActivateElements = {"ux_ak12_family_" .. id}
        att.Override_Firemodes = spec.mode == "semi" and {{Mode = 1}, {Mode = 0}}
            or spec.mode == "burst" and {{Mode = 2}, {Mode = -2}, {Mode = 1}, {Mode = 0}}
            or {{Mode = 2}, {Mode = 1}, {Mode = 0}}
        if spec.cal == "308" or spec.mode == "semi" then att.Override_ClipSize = spec.capacity end
        if spec.cal == "545" or spec.cal == "556" then
            att.Mult_ReloadTime = 0.95
            att.Mult_HipDispersion = 0.75
            att.Mult_SightedSpeedMult = 1.05
            local path = ")^weapons/arccw_ur/ak/" .. p.sound .. "/"
            att.Hook_GetShootSound = function(wep, sound)
                if sound == wep.ShootSound or sound == wep.FirstShootSound then
                    return {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"}
                end
                if sound == wep.ShootSoundSilenced then
                    return spec.cal == "545" and ")^weapons/arccw_ur/ak/fire_545_sup.ogg" or path .. "fire-sup-01.ogg"
                end
            end
        end
        att.Hook_GetDefaultAttName = function(wep, slot)
            if slot == 6 then return spec.capacity .. "-Round " .. (spec.cal == "308" and "AK-308" or spec.cal == "545" and "Bakelite" or "Factory") .. " Mag" end
        end
        att.Hook_GetDefaultAttIcon = function(wep, slot)
            if slot == 6 then return Material("entities/att/uc_ak12/mag_" .. spec.cal .. ".png", "smooth mips") end
        end
        ArcCW.LoadAttachmentType(att, id)
    end
end
