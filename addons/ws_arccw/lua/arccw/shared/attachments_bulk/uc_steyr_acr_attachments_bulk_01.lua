-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_barrel_carbine.lua
do
    local att = {}

att.PrintName = "24\" Carbine Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Slightly elongated barrel meant for bridging the gap between close range and long range roles."
att.AutoStats = true

att.Slot = "uc_stacr_barrel"

att.SortOrder = 30

att.Add_BarrelLength = 3
att.Mult_Sway = 1.05
att.Mult_SightTime = 1.25
att.Mult_RPM = 0.90

att.Mult_Recoil = 0.90
att.Mult_AccuracyMOA = 0.90
att.Mult_Range = 1.40

att.Mult_HipDispersion = 1.10
att.Mult_ShootPitch = 0.95

att.ActivateElements = {"barrel_carbine"}

att.Mult_PhysBulletMuzzleVelocity = 1.35

    ArcCW.LoadAttachmentType(att, "uc_stacr_barrel_carbine")
end
-- END BUNDLED ATTACHMENT: uc_stacr_barrel_carbine.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_barrel_heavy_sd.lua
do
    local att = {}

att.PrintName = "30\" Heavy SD Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Extremely long barrel and frame with built-in bipod and silencer."
att.AutoStats = true

att.Slot = "uc_stacr_barrel"

att.SortOrder = 30

att.Add_BarrelLength = 9
att.Mult_Sway = 0.90
att.Mult_SightTime = 1.40
att.Mult_RPM = 0.85

att.Mult_Recoil = 0.475
att.Mult_AccuracyMOA = 0.70
att.Mult_Range = 1.75
att.Mult_ShootPitch = 0.85

att.Mult_HipDispersion = 1.10

att.Bipod = true
att.Mult_BipodRecoil = .45
att.Mult_BipodDispersion = .45

att.ActivateElements = {"barrel_machinegun_sd"}

att.Mult_PhysBulletMuzzleVelocity = 1.15

att.Mult_ShootVol = 0.475
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.SDBarrel = true

att.Override_Jamming = true
att.Override_HeatLockout = false
att.Override_HeatFix = false
att.Override_HeatCapacity = 90
att.Override_HeatDelayTime = 2
att.Override_HeatDissipation = 7.5

att.Hook_ModifyRPM = function(wep, delay)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        return delay * (1 + ((heat - 0.5) / 0.5) * 0.5)
    end
end

att.M_Hook_Mult_ShootVol = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    data.mult = data.mult * (1 + heat * 0.25)
end

att.M_Hook_Mult_ShootPitch = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 - (heat - 0.5) / 0.5 * 0.15)
    end
end

att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5))
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_stacr_barrel_heavy_sd")
end
-- END BUNDLED ATTACHMENT: uc_stacr_barrel_heavy_sd.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_barrel_heavy.lua
do
    local att = {}

att.PrintName = "30\" Heavy Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Extremely long barrel and frame with built-in bipod."
att.AutoStats = true

att.Slot = "uc_stacr_barrel"

att.SortOrder = 30

att.Add_BarrelLength = 9
att.Mult_Sway = 0.90
att.Mult_SightTime = 1.36
att.Mult_RPM = 0.85

att.Mult_Recoil = 0.60
att.Mult_AccuracyMOA = 0.70
att.Mult_Range = 1.75
att.Mult_ShootPitch = 0.85

att.Mult_HipDispersion = 1.125

att.Bipod = true
att.Mult_BipodRecoil = .45
att.Mult_BipodDispersion = .45

att.ActivateElements = {"barrel_machinegun"}

att.Mult_PhysBulletMuzzleVelocity = 1.15

    ArcCW.LoadAttachmentType(att, "uc_stacr_barrel_heavy")
end
-- END BUNDLED ATTACHMENT: uc_stacr_barrel_heavy.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_barrel_marksman.lua
do
    local att = {}

att.PrintName = "30\" Marksman Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Extremely long barrel, fit for a marksman rifle role."
att.AutoStats = true

att.Slot = "uc_stacr_barrel"

att.SortOrder = 30

att.Add_BarrelLength = 9
att.Mult_Sway = 1.15
att.Mult_SightTime = 1.25
att.Mult_RPM = 0.85

att.Mult_Recoil = 0.70
att.Mult_AccuracyMOA = 0.70
att.Mult_Range = 1.75
att.Mult_ShootPitch = 0.85

att.Mult_HipDispersion = 1.10

att.ActivateElements = {"barrel_marksman"}

att.Mult_PhysBulletMuzzleVelocity = 1.15

    ArcCW.LoadAttachmentType(att, "uc_stacr_barrel_marksman")
end
-- END BUNDLED ATTACHMENT: uc_stacr_barrel_marksman.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_barrel_sawnoff_sd.lua
do
    local att = {}

att.PrintName = "15\" Short SD Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Barrel, carry handle and frame that have been cut off and equipped with an integral silencer in order to maximize compact-ness (and potentially the cursed factor as well). Handling is much light but recoil is harder to manage."
att.AutoStats = true

att.Slot = "uc_stacr_barrel"

att.SortOrder = 15

att.Add_BarrelLength = -6
att.Mult_Sway = .85
att.Mult_SightTime = .85
att.Mult_RPM = 1.20

att.Mult_Recoil = 1.355
att.Mult_AccuracyMOA = 1.20
att.Mult_Range = .785

att.Mult_HipDispersion = 1.25
att.Mult_ShootPitch = 1.25

att.Mult_ShootVol = 0.85
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.SDBarrel = true

att.Override_Jamming = true
att.Override_HeatLockout = false
att.Override_HeatFix = false
att.Override_HeatCapacity = 90
att.Override_HeatDelayTime = 2
att.Override_HeatDissipation = 7.5

att.Hook_ModifyRPM = function(wep, delay)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        return delay * (1 + ((heat - 0.5) / 0.5) * 0.5)
    end
end

att.M_Hook_Mult_ShootVol = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    data.mult = data.mult * (1 + heat * 0.25)
end

att.M_Hook_Mult_ShootPitch = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 - (heat - 0.5) / 0.5 * 0.15)
    end
end

att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5))
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

att.ActivateElements = {"barrel_sawnoff_sd"}

att.Mult_PhysBulletMuzzleVelocity = 0.80

    ArcCW.LoadAttachmentType(att, "uc_stacr_barrel_sawnoff_sd")
end
-- END BUNDLED ATTACHMENT: uc_stacr_barrel_sawnoff_sd.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_barrel_sawnoff.lua
do
    local att = {}

att.PrintName = "15\" Sawn-Off Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Barrel, carry handle and frame that have been cut off in order to maximize compact-ness (and potentially the cursed factor as well). Handling is much light but recoil is harder to manage."
att.AutoStats = true

att.Slot = "uc_stacr_barrel"

att.SortOrder = 15

att.Add_BarrelLength = -6
att.Mult_Sway = .85
att.Mult_SightTime = .85
att.Mult_RPM = 1.20

att.Mult_Recoil = 1.355
att.Mult_AccuracyMOA = 1.50
att.Mult_Range = .785

att.Mult_HipDispersion = 1.25
att.Mult_ShootPitch = 1.25

att.ActivateElements = {"barrel_sawnoff"}

att.Mult_PhysBulletMuzzleVelocity = 0.80

    ArcCW.LoadAttachmentType(att, "uc_stacr_barrel_sawnoff")
end
-- END BUNDLED ATTACHMENT: uc_stacr_barrel_sawnoff.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_barrel_sd.lua
do
    local att = {}

att.PrintName = "24\" SD Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Integrally suppressed barrel that absorbs heat and gases."
att.AutoStats = true

att.Slot = "uc_stacr_barrel"

att.SortOrder = 30

att.Add_BarrelLength = 3
att.Mult_Sway = 1.05
att.Mult_SightTime = 1.25
att.Mult_RPM = 0.90

att.Mult_Recoil = 0.825
att.Mult_AccuracyMOA = 1.15
att.Mult_Range = 1.40

att.Mult_HipDispersion = 1.10
att.Mult_ShootVol = 0.475
att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.SDBarrel = true

att.Override_Jamming = true
att.Override_HeatLockout = false
att.Override_HeatFix = false
att.Override_HeatCapacity = 90
att.Override_HeatDelayTime = 2
att.Override_HeatDissipation = 7.5

att.ActivateElements = {"barrel_sd"}

att.Hook_ModifyRPM = function(wep, delay)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        return delay * (1 + ((heat - 0.5) / 0.5) * 0.5)
    end
end

att.M_Hook_Mult_ShootVol = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    data.mult = data.mult * (1 + heat * 0.25)
end

att.M_Hook_Mult_ShootPitch = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 - (heat - 0.5) / 0.5 * 0.15)
    end
end

att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
    if heat > 0.5 then
        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5))
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_stacr_barrel_sd")
end
-- END BUNDLED ATTACHMENT: uc_stacr_barrel_sd.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_lower_sef.lua
do
    local att = {}

att.PrintName = "Full-Auto Lower Receiver"
att.AbbrevName = "Full-Auto Lower Receiver"

att.Icon = Material("shit/steyr_acr_lower.png", "smooth mips")
att.Description = "Custom select-fire receiver that includes a fully automatic firegroup."
att.AutoStats = true

att.Slot = "uc_stacr_lower"

att.SortOrder = 1

att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = -3,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

    ArcCW.LoadAttachmentType(att, "uc_stacr_lower_sef")
end
-- END BUNDLED ATTACHMENT: uc_stacr_lower_sef.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_mag_12.lua
do
    local att = {}

att.PrintName = "Steyr ACR 12-Round Compact Mag"
att.AbbrevName = "12-Round Magazine"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steinhauer GZ-11 12-Round Compact Mag"
end

att.SortOrder = 12
att.Icon = Material("", "smooth mips")
att.Description = "Low capacity magazine that lightens the weapon weight even more."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_stacr_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 12

att.Mult_SightTime = 0.90
att.Mult_ReloadTime = 0.87
att.Mult_Sway = 0.90

att.Mult_SpeedMult = 1.15
att.Mult_SightedSpeedMult = 1.08
att.Mult_ShootSpeedMult = 1.10

att.Mult_HipDispersion = 0.90

att.Mult_DrawTime = 0.865
att.Mult_HolsterTime = 0.865

att.ActivateElements = {"mag_12"}

    ArcCW.LoadAttachmentType(att, "uc_stacr_mag_12")
end
-- END BUNDLED ATTACHMENT: uc_stacr_mag_12.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_mag_48.lua
do
    local att = {}

att.PrintName = "Steyr ACR 48-Round Extended Mag"
att.AbbrevName = "48-Round Magazine"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steinhauer GZ-11 48-Round Extended Mag"
end

att.SortOrder = 48
att.Icon = Material("", "smooth mips")
att.Description = "Extended magazine that doubles the amount of shots fired before having to reload."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_stacr_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 48

att.Mult_SightTime = 1.14
att.Mult_ReloadTime = 1.10
att.Mult_Sway = 1.075

att.Mult_SpeedMult = 0.925
att.Mult_SightedSpeedMult = 0.925
att.Mult_ShootSpeedMult = 0.925

att.Mult_DrawTime = 1.075
att.Mult_HolsterTime = 1.075

att.ActivateElements = {"mag_48"}

    ArcCW.LoadAttachmentType(att, "uc_stacr_mag_48")
end
-- END BUNDLED ATTACHMENT: uc_stacr_mag_48.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_mag_75.lua
do
    local att = {}

att.PrintName = "Steyr ACR 75-Round Drum Mag"
att.AbbrevName = "75-Round Drum Magazine"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steinhauer GZ-11 75-Round Drum Mag"
end

att.SortOrder = 75
att.Icon = Material("", "smooth mips")
att.Description = "Custom-forged drum magazine that greatly increases the amount of ammo that can be loaded at once, being fit for light squad weapon roles."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_stacr_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 75

att.Mult_SightTime = 1.235
att.Mult_ReloadTime = 1.215
att.Mult_Sway = 1.125

att.Mult_SpeedMult = 0.815
att.Mult_SightedSpeedMult = 0.815
att.Mult_ShootSpeedMult = 0.815

att.Mult_DrawTime = 1.20
att.Mult_HolsterTime = 1.20

att.ActivateElements = {"mag_75"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_drum"
end

    ArcCW.LoadAttachmentType(att, "uc_stacr_mag_75")
end
-- END BUNDLED ATTACHMENT: uc_stacr_mag_75.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_receiver_40mm_nervegas.lua
do
    local att = {}

att.PrintName = "Steyr ACR 40mm Nerve Gas Upper Receiver"
att.AbbrevName = "40mm Nerve Gas Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steinhauer GZ-11 40mm Nerve Gas Upper Receiver"
end

att.Icon = Material("entities/att/arccw_nervegas.png", "smooth mips")
att.Description = "Unholy aftermarket conversion kit that butchers the frame and replaces the barrel, trigger, stock, charging handle and magazine with that of an XM25 grenade launcher, making it able to load 40mm nerve gas grenades. \n\n Yup, you've read that right, a prototype weapon conversion for another prototype weapon."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_stacr_cal"
att.SortOrder = 3

att.AutoStats = true

att.Mult_AccuracyMOA = 0.72
att.Mult_Range = 1.65
att.Mult_Precision = 1.35
att.Mult_Recoil = 1.55
att.Mult_MalfunctionMean = 0.83
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}
att.Override_PhysBulletMuzzleVelocity = 525
att.Override_AlwaysPhysBullet = true
att.Mult_VisualRecoilMult = 1.325
att.Mult_RPM = 0.80
att.Mult_ReloadTime = 1.075
att.Override_ShootEntity = "m9k_nervegasnade"
att.Override_MuzzleVelocity = 725
att.Mult_ShootPitch = 0.99
att.Override_ClipSize = 5
att.ActivateElements = {"conv_gl"}

att.Override_Trivia_Calibre = "40mm Nerve Gas"
att.Override_Ammo = "SMG1_Grenade"
att.Override_Trivia_Class = "Grenade Launcher"

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_gl"
end

att.Hook_TranslateAnimation = function(wep, anim)
    if (anim == "ready") then
        return anim .. "_gl"
    end
end

local path = "weapons/ar458/"

local fire22 = {"weapons/40mm_nervegas/40mm_nervegas_fire.wav"}
local fire22sup = {"uc_stacr/fire_sup_762.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {"weapons/misc/r870_40mm_fire.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {"weapons/misc/r870_40mm_fire.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "uc_stacr_receiver_40mm_nervegas")
end
-- END BUNDLED ATTACHMENT: uc_stacr_receiver_40mm_nervegas.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_receiver_40mm.lua
do
    local att = {}

att.PrintName = "Steyr ACR 40mm HE Upper Receiver"
att.AbbrevName = "40mm HE Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steinhauer GZ-11 40mm HE Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/40.png", "smooth mips")
att.Description = "Unholy aftermarket conversion kit that butchers the frame and replaces the barrel, trigger, stock, charging handle and magazine with that of an XM25 grenade launcher, making it able to load 40mm High-Explosive grenades. \n\n Yup, you've read that right, a prototype weapon conversion for another prototype weapon."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_stacr_cal"
att.SortOrder = 4

att.AutoStats = true

att.Mult_AccuracyMOA = 0.72
att.Mult_Range = 1.65
att.Mult_Precision = 1.35
att.Mult_Recoil = 1.55
att.Mult_MalfunctionMean = 0.83
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}
att.Override_PhysBulletMuzzleVelocity = 525
att.Override_AlwaysPhysBullet = true
att.Mult_Damage = 2
att.Mult_DamageMin = 2
att.Mult_VisualRecoilMult = 1.325
att.Mult_RPM = 0.80
att.Mult_ReloadTime = 1.075
att.Override_ShootEntity = "arccw_uc_40mm_hv"
att.Override_MuzzleVelocity = 725
att.Mult_ShootPitch = 0.99
att.Override_ClipSize = 5
att.ActivateElements = {"conv_gl"}

att.Override_Trivia_Calibre = "40mm HE"
att.Override_Ammo = "SMG1_Grenade"
att.Override_Trivia_Class = "Grenade Launcher"

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_gl"
end

att.Hook_TranslateAnimation = function(wep, anim)
    if (anim == "ready") then
        return anim .. "_gl"
    end
end

local path = "weapons/ar458/"

local fire22 = {"uc_stacr/fire1_40mm.wav","uc_stacr/fire2_40mm.wav","uc_stacr/fire3_40mm.wav"}
local fire22sup = {"uc_stacr/fire_sup_762.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {"weapons/misc/r870_40mm_fire.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {"weapons/misc/r870_40mm_fire.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "uc_stacr_receiver_40mm")
end
-- END BUNDLED ATTACHMENT: uc_stacr_receiver_40mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_receiver_410.lua
do
    local att = {}

att.PrintName = "Steyr ACR .410 Bore Upper Receiver"
att.AbbrevName = ".410 Bore Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steinhauer GZ-11 .410 Bore Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/20g.png", "smooth mips")
att.Description = "Modified receiver that allows .410 Bore conversion, turning the weapon into a shotgun."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_stacr_cal"
att.SortOrder = 7

att.AutoStats = true

att.Mult_RPM = 0.83

att.Mult_RPM = 0.65

att.Mult_Damage = 72 / 70
att.Mult_DamageMin = 20 / 17
att.Override_Penetration = 1
att.Override_Num = 4
att.Override_AccuracyMOA = 35
att.Override_AccuracyMOA_Priority = 0

att.Mult_Range = 0.5
att.Mult_ShootSpeedMult = 1.2
att.Mult_Recoil = 1.15
att.Mult_VisualRecoilMult = 0.2
att.Mult_ClipSize = 0.85
att.Override_HullSize = 0.1
att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun

att.Override_Ammo = "Buckshot"
att.Override_Trivia_Calibre = ".410 Bore"
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true
att.Override_Trivia_Class = "Shotgun"

local path = "weapons/410bore_m16/"

local fire22 = {"uc_stacr/fire1_410.wav"}
local fire22sup = {"uc_stacr/fire1_sup_410.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "410bore_m16_fire_dist.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "410bore_m16_fire_dist_int.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end
att.ActivateElements = {"cal_410"}

    ArcCW.LoadAttachmentType(att, "uc_stacr_receiver_410")
end
-- END BUNDLED ATTACHMENT: uc_stacr_receiver_410.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_receiver_50bmg.lua
do
    local att = {}

att.PrintName = "Steyr ACR .50 BMG Upper Receiver"
att.AbbrevName = ".50 BMG Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steinhauer GZ-11 .50 BMG Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/338lapua.png", "smooth mips")
att.Description = "Preposterous custom bodykit that turns your bullpup rifle into a horribly butchered and kitbashed Barret M82, by adding a bipod and replacing the barrel, handguard, stock, magwell, charging handle and magazine accordingly, allowing it to feed .50 BMG cartridges. \n\n You're welcome/I'm sorry."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_stacr_cal"
att.SortOrder = 3

att.AutoStats = true

att.Mult_RPM = 0.50

att.Mult_Damage = 2.85
att.Mult_DamageMin = 2.55
att.Mult_Penetration = 2.55
att.Mult_Precision = 2
att.Mult_MalfunctionMean = 0.50
att.Mult_ReloadTime = 1.175
att.Override_MuzzleVelocity = 900
att.Mult_HipDispersion = 2
att.Mult_AccuracyMOA = 0.45
att.Mult_Sway = 1.25
att.Mult_SightTime = 1.25
att.Mult_TriggerDelayTime = 1.80
att.Bipod = true
att.Mult_BipodRecoil = .30
att.Mult_BipodDispersion = .30
att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Mult_Range = 3.25
att.Mult_Recoil = 1.85
att.Mult_VisualRecoilMult = 1.45
att.Override_ClipSize = 10
att.ActivateElements = {"conv_50bmg"}

att.Override_Ammo = "SniperPenetratedRound"
att.Override_Trivia_Calibre = ".50 Browning Machine Gun"
att.Override_Trivia_Class = "Anti Material Rifle"

att.Hook_TranslateAnimation = function(wep, anim)
    if (anim == "ready") then
        return anim .. "_50bmg"
    end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_50bmg"
end

local path = "weapons/misc/"

local fire22 = {"uc_stacr/fire1_50bmg.wav","uc_stacr/fire2_50bmg.wav","uc_stacr/fire3_50bmg.wav"}
local fire22sup = {"uc_stacr/fire_sup_50bmg.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "type20_6mm_arisaka_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "type20_6mm_arisaka_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "uc_stacr_receiver_50bmg")
end
-- END BUNDLED ATTACHMENT: uc_stacr_receiver_50bmg.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_receiver_762.lua
do
    local att = {}

att.PrintName = "Steyr ACR 7.62x39 Upper Receiver"
att.AbbrevName = "7.62x39mm Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steinhauer GZ-11 7.62x39 Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/762x39.png", "smooth mips")
att.Description = "Custom conversion kit that can feed 7.62x39mm rounds from AK magazines."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_stacr_cal"
att.SortOrder = 7

att.AutoStats = true

att.Mult_RPM = 0.80

att.Mult_Damage = 1.2
att.Mult_DamageMin = 1.24
att.Mult_Penetration = 1.19

att.Mult_Range = 1.2
att.Mult_Recoil = 1.17
att.Mult_VisualRecoilMult = 1.2
att.Override_ClipSize = 30
att.ActivateElements = {"mag_762"}

att.Override_Trivia_Calibre = "7.62x39"

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_762"
end

local path = "weapons/ar458/"

local fire22 = {"uc_stacr/fire1_762.wav","uc_stacr/fire2_762.wav","uc_stacr/fire3_762.wav"}
local fire22sup = {"uc_stacr/fire_sup_762.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "ar762_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "ar762_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "uc_stacr_receiver_762")
end
-- END BUNDLED ATTACHMENT: uc_stacr_receiver_762.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_receiver_9mm.lua
do
    local att = {}

att.PrintName = "Steyr ACR 9x19mm Upper Receiver"
att.AbbrevName = "9x19mm Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steinhauer GZ-11 9x19mm Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "Custom conversion kit fitted with a magwell that allows the loading of custom 9x19mm magazines."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_stacr_cal"
att.SortOrder = 7

att.AutoStats = true

att.Mult_RPM = 1.40

att.Mult_Damage = 0.30
att.Mult_DamageMin = 0.25
att.Mult_Penetration = 0.40

att.Mult_Range = 0.80
att.Mult_Recoil = 0.50
att.Mult_VisualRecoilMult = 0.50
att.Override_ClipSize = 32
att.ActivateElements = {"mag_9mm"}

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "9x19mm"

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

local path = "weapons/misc/"

local fire22 = {"uc_stacr/fire1_9mm.wav","uc_stacr/fire2_9mm.wav","uc_stacr/fire3_9mm.wav"}
local fire22sup = {"uc_stacr/fire_sup_9mm.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "type20_8mm_nambu_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "type20_8mm_nambu_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "uc_stacr_receiver_9mm")
end
-- END BUNDLED ATTACHMENT: uc_stacr_receiver_9mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_scope.lua
do
    local att = {}

att.PrintName = "Integrated Optic"
att.Icon = Material("", "mips smooth")
att.Description = "The integrated optic native to the Steyr ACR rifle."

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Neutrals = {

}

att.SortOrder = 1000

att.AutoStats = true
att.Slot = "uc_stacr_optic"

att.Model = "models/weapons/arccw/atts/acrscope.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0.025, 10.064, -0.76),
        Ang = Angle(0, 0, 0),
        Magnification = 1.25,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 2,
        IgnoreExtra = true,
        HolosightData = {
        Holosight = true,
        HolosightReticle = Material("shit/stacr_scope.png", "mips smooth"),
        HolosightNoFlare = true,
        HolosightSize = 15,
        HolosightBone = "holosight",
        Colorable = true,
        HolosightBlackbox = true,
        HolosightMagnification = 2,
        HolosightMagnificationMin = 1.5,
        HolosightMagnificationMax = 2,
        HolosightPiece = true,
        }
    },
}

att.HolosightPiece = "models/weapons/arccw/atts/acrscope_hsp.mdl"

att.Mult_SightTime = 1.1

    ArcCW.LoadAttachmentType(att, "uc_stacr_scope")
end
-- END BUNDLED ATTACHMENT: uc_stacr_scope.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_skin_dark.lua
do
    local att = {}

att.PrintName = "Dark Furniture"

att.Icon = Material("shit/steyr_acr_dark.png", "smooth mips")
att.Description = "Cosmetic dark skin."
att.AutoStats = true

att.Slot = "uc_stacr_skin"

att.SortOrder = 1

att.ActivateElements = {"skin_dark"}

    ArcCW.LoadAttachmentType(att, "uc_stacr_skin_dark")
end
-- END BUNDLED ATTACHMENT: uc_stacr_skin_dark.lua

-- BEGIN BUNDLED ATTACHMENT: uc_stacr_skin_fde.lua
do
    local att = {}

att.PrintName = "Flat Dark Earth Furniture"

att.Icon = Material("shit/steyr_acr_fde.png", "smooth mips")
att.Description = "Cosmetic FDE skin."
att.AutoStats = true

att.Slot = "uc_stacr_skin"

att.SortOrder = 1

att.ActivateElements = {"skin_fde"}

    ArcCW.LoadAttachmentType(att, "uc_stacr_skin_fde")
end
-- END BUNDLED ATTACHMENT: uc_stacr_skin_fde.lua
