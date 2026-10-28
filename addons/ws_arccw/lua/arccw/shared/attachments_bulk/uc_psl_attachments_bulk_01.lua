-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_psl_barrel_alpha.lua
do
    local att = {}

att.PrintName = "24.5\" Alpha Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Barrel with polymer handguard."
att.AutoStats = true

att.Slot = "uc_psl_barrel"
att.SortOrder = 15

att.Mult_SightTime = 0.95
att.Mult_RPM = 1.10

att.Mult_Recoil = 1.05
att.Mult_AccuracyMOA = 0.90
att.Mult_Range = .885

att.Mult_HipDispersion = 0.90

att.ActivateElements = {"barrel_alpha"}

    ArcCW.LoadAttachmentType(att, "uc_psl_barrel_alpha")
end
-- END BUNDLED ATTACHMENT: uc_psl_barrel_alpha.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_barrel_sawnoff.lua
do
    local att = {}

att.PrintName = "15\" Krinkov Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Stubby krinkov-like barrel. Handling is much light but recoil is harder to manage."
att.AutoStats = true

att.Slot = "uc_psl_barrel"

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

    ArcCW.LoadAttachmentType(att, "uc_psl_barrel_sawnoff")
end
-- END BUNDLED ATTACHMENT: uc_psl_barrel_sawnoff.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_barrel_short.lua
do
    local att = {}

att.PrintName = "20\" Short Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Short barrel. Handling is light but recoil is hard to manage."
att.AutoStats = true

att.Slot = "uc_psl_barrel"
att.SortOrder = 15

att.Add_BarrelLength = -4
att.Mult_Sway = .90
att.Mult_SightTime = .90
att.Mult_RPM = 1.10

att.Mult_Recoil = 1.25
att.Mult_AccuracyMOA = 1.35
att.Mult_Range = .885

att.Mult_HipDispersion = 1.15
att.Mult_ShootPitch = 1.15

att.ActivateElements = {"barrel_short"}

att.Mult_PhysBulletMuzzleVelocity = 0.90

    ArcCW.LoadAttachmentType(att, "uc_psl_barrel_short")
end
-- END BUNDLED ATTACHMENT: uc_psl_barrel_short.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_dustcover_alpha.lua
do
    local att = {}

att.PrintName = "Alpha Dust Cover"
att.AbbrevName = "Alpha Dust Cover"

att.Icon = Material("", "smooth mips")
att.Description = "Highly modernized dust cover."
att.AutoStats = true

att.Slot = "uc_psl_dustcover"

att.SortOrder = 1

att.ActivateElements = {"dustcover_alpha"}

    ArcCW.LoadAttachmentType(att, "uc_psl_dustcover_alpha")
end
-- END BUNDLED ATTACHMENT: uc_psl_dustcover_alpha.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_lower_sef.lua
do
    local att = {}

att.PrintName = "Full-Auto Lower Receiver"
att.AbbrevName = "Full-Auto Lower Receiver"

att.Icon = Material("", "smooth mips")
att.Description = "Custom select-fire receiver that includes a fully automatic firegroup."
att.AutoStats = true

att.Slot = "uc_psl_lower"

att.SortOrder = 1

att.Override_Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Mult_RPM = 0.80

att.Mult_Recoil = 0.75

    ArcCW.LoadAttachmentType(att, "uc_psl_lower_sef")
end
-- END BUNDLED ATTACHMENT: uc_psl_lower_sef.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_mag_20.lua
do
    local att = {}

att.PrintName = "PSL 20-Round Extended Mag"
att.AbbrevName = "20-Round Magazine"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SR-54 20-Round Extended Mag"
end

att.SortOrder = 20
att.Icon = Material("", "smooth mips")
att.Description = "Extended magazine that doubles the amount of shots fired before having to reload."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_psl_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 20

att.Mult_SightTime = 1.14
att.Mult_ReloadTime = 1.10
att.Mult_Sway = 1.075

att.Mult_SpeedMult = 0.925
att.Mult_SightedSpeedMult = 0.925
att.Mult_ShootSpeedMult = 0.925

att.Mult_DrawTime = 1.075
att.Mult_HolsterTime = 1.075

att.ActivateElements = {"mag_20"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_20"
end

    ArcCW.LoadAttachmentType(att, "uc_psl_mag_20")
end
-- END BUNDLED ATTACHMENT: uc_psl_mag_20.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_mag_5.lua
do
    local att = {}

att.PrintName = "PSL 5-Round Compact Mag"
att.AbbrevName = "5-Round Magazine"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SR-54 5-Round Compact Mag"
end

att.SortOrder = 5
att.Icon = Material("", "smooth mips")
att.Description = "Rare low-capacity magazine manufactured by Cugir."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_psl_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 5

att.Mult_SightTime = 0.90
att.Mult_ReloadTime = 0.87
att.Mult_Sway = 0.90

att.Mult_SpeedMult = 1.15
att.Mult_SightedSpeedMult = 1.08
att.Mult_ShootSpeedMult = 1.10

att.Mult_HipDispersion = 0.90

att.Mult_DrawTime = 0.865
att.Mult_HolsterTime = 0.865

att.ActivateElements = {"mag_5"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_5"
end

    ArcCW.LoadAttachmentType(att, "uc_psl_mag_5")
end
-- END BUNDLED ATTACHMENT: uc_psl_mag_5.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_mag_50.lua
do
    local att = {}

att.PrintName = "PSL 50-Round Drum Mag"
att.AbbrevName = "50-Round Drum Magazine"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SR-54 50-Round Drum Mag"
end

att.SortOrder = 50
att.Icon = Material("", "smooth mips")
att.Description = "High-capacity drum magazine intended for suppressive fire roles."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_psl_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 50

att.Mult_SightTime = 1.235
att.Mult_ReloadTime = 1.215
att.Mult_Sway = 1.125

att.Mult_SpeedMult = 0.815
att.Mult_SightedSpeedMult = 0.815
att.Mult_ShootSpeedMult = 0.815

att.Mult_DrawTime = 1.20
att.Mult_HolsterTime = 1.20

att.ActivateElements = {"mag_50"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_50"
end

    ArcCW.LoadAttachmentType(att, "uc_psl_mag_50")
end
-- END BUNDLED ATTACHMENT: uc_psl_mag_50.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_receiver_50bmg.lua
do
    local att = {}

att.PrintName = "PSL .50 BMG Upper Receiver"
att.AbbrevName = ".50 BMG Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SR-54 .50 BMG Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/338lapua.png", "smooth mips")
att.Description = "I bestow upon you the closest thing you can get to an AK-50."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_psl_cal"
att.SortOrder = 3

att.AutoStats = true

att.Mult_RPM = 0.50

att.Override_Damage = 104
att.Override_DamageMin = 60
att.Override_Penetration = 46
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

local fire22 = {"uc_psl/fire_50bmg.wav"}
local fire22sup = {"weapons/ak50/ak50_fire_sup.wav"}

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

    ArcCW.LoadAttachmentType(att, "uc_psl_receiver_50bmg")
end
-- END BUNDLED ATTACHMENT: uc_psl_receiver_50bmg.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_receiver_9mm.lua
do
    local att = {}

att.PrintName = "PSL 9x19mm Upper Receiver"
att.AbbrevName = "9x19mm Upper"

if GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SR-54 9x19mm Upper Receiver"
end

att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "Custom conversion kit fitted with a magwell that allows the loading of modified Glock magazines."
att.Desc_Pros = {

}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_psl_cal"
att.SortOrder = 7

att.AutoStats = true

att.Mult_RPM = 1.40

att.Mult_Damage = 0.20
att.Mult_DamageMin = 0.17
att.Mult_Penetration = 0.40

att.Mult_Range = 0.80
att.Mult_Recoil = 0.30
att.Mult_VisualRecoilMult = 0.50
att.Override_ClipSize = 32
att.ActivateElements = {"mag_9mm"}

att.Override_Ammo = "pistol"
att.Override_Trivia_Calibre = "9x19mm"

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_9mm"
end

local path = "weapons/misc/"

local fire22 = {"uc_psl/fire_9mm.wav"}
local fire22sup = {"weapons/ar45/ar45_fire_sup.wav"}

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

    ArcCW.LoadAttachmentType(att, "uc_psl_receiver_9mm")
end
-- END BUNDLED ATTACHMENT: uc_psl_receiver_9mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_stock_alpha.lua
do
    local att = {}

att.PrintName = "Alpha Stock"
att.AbbrevName = "Alpha Stock"
att.Slot = "uc_psl_stock"
att.Icon = Material("", "smooth mips")
att.Description = "Slightly more lightweight stock, pistol grip and handguard adapted from an RPKM."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.AutoStats = true
att.SortOrder = 6

att.Mult_Recoil = 1.25
att.Mult_RecoilSide = 1.15
att.Mult_VisualRecoilMult = 1.12
att.Mult_Sway = 1.15

att.Mult_SightTime = 0.80
att.Mult_SightedSpeedMult = 1.20
att.Mult_ShootSpeedMult = 1.20

att.Mult_DrawTime = 0.80
att.Mult_HolsterTime = 0.80

att.ActivateElements = {"stock_alpha"}

    ArcCW.LoadAttachmentType(att, "uc_psl_stock_alpha")
end
-- END BUNDLED ATTACHMENT: uc_psl_stock_alpha.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_stock_none.lua
do
    local att = {}

att.PrintName = "No Stock"
att.AbbrevName = "No Stock"
att.Slot = "uc_psl_stock"
att.Icon = Material("", "smooth mips")
att.Description = "Remove the gripstock in favour of a simple polymer grip. Really light."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.AutoStats = true
att.SortOrder = 6

att.Mult_Recoil = 1.70
att.Mult_RecoilSide = 1.25
att.Mult_VisualRecoilMult = 1.25
att.Mult_Sway = 1.37

att.Mult_SightTime = 0.50
att.Mult_SightedSpeedMult = 1.50
att.Mult_ShootSpeedMult = 1.50

att.Mult_DrawTime = 0.50
att.Mult_HolsterTime = 0.50

att.ActivateElements = {"stock_none"}

    ArcCW.LoadAttachmentType(att, "uc_psl_stock_none")
end
-- END BUNDLED ATTACHMENT: uc_psl_stock_none.lua

-- BEGIN BUNDLED ATTACHMENT: uc_psl_stock_skeleton.lua
do
    local att = {}

att.PrintName = "Skeleton Stock"
att.AbbrevName = "Skeleton Stock"
att.Slot = "uc_psl_stock"
att.Icon = Material("", "smooth mips")
att.Description = "A skeleton stock that cant actually be folded despite looking like it, because it was welded shut."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.AutoStats = true
att.SortOrder = 6

att.Mult_Recoil = 1.40
att.Mult_RecoilSide = 1.18
att.Mult_VisualRecoilMult = 1.18
att.Mult_Sway = 1.25

att.Mult_SightTime = 0.70
att.Mult_SightedSpeedMult = 1.30
att.Mult_ShootSpeedMult = 1.30

att.Mult_DrawTime = 0.70
att.Mult_HolsterTime = 0.70

att.ActivateElements = {"stock_skel"}

    ArcCW.LoadAttachmentType(att, "uc_psl_stock_skeleton")
end
-- END BUNDLED ATTACHMENT: uc_psl_stock_skeleton.lua
