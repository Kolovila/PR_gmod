-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_m14_barrel_short.lua
do
    local att = {}

att.PrintName = "20\" Short Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Short barrel. Handling is light but recoil is hard to manage."
att.AutoStats = true

att.Slot = "uc_m14_barrel"
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

    ArcCW.LoadAttachmentType(att, "uc_m14_barrel_short")
end
-- END BUNDLED ATTACHMENT: uc_m14_barrel_short.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m14_cal_410.lua
do
    local att = {}

att.PrintName = ".410 Bore Conversion"
att.AbbrevName = ".410 Bore"

att.Icon = Material("", "smooth mips")
att.Description = "En bloc clip with 10 shotshells."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_m14_cal"
att.SortOrder = 410

att.AutoStats = true
att.HideIfBlocked = true

att.Override_Ammo = "Buckshot"
att.Override_Trivia_Calibre = ".410 Bore"

att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
att.Override_ShellScale = 1
att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
att.Override_IsShotgun = true

att.Mult_ReloadTime = 1.10
att.Mult_Recoil = 1.15
att.Mult_HipDispersion = 1.10
att.Override_Num = 4
att.Override_AccuracyMOA = 35
att.Override_AccuracyMOA_Priority = 0

att.Mult_Penetration = 14 / 20
att.Mult_DamageMin = 1.30
att.Mult_Damage = 1.38
att.ShootPitchVariation = 1

att.Override_ClipSize = 10

att.ActivateElements = {"cal_410"}

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_garand"
end

att.Mult_RPM = 0.80

local path = "weapons/misc/"

local fire22 = {path .. "scar_410_fire.wav"}
local fire22sup = {path .. "scar_410_fire_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire22sup
    else
        return fire22
    end
end

local fire22dist = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22dist
    end
end

local fire22distint = {path .. "uzi_50ae_tail.wav"}

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire22distint
    end
end

    ArcCW.LoadAttachmentType(att, "uc_m14_cal_410")
end
-- END BUNDLED ATTACHMENT: uc_m14_cal_410.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m14_cal_garand.lua
do
    local att = {}

att.PrintName = "SR1 Garand Conversion"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M1 Garand Conversion"
end
att.AbbrevName = "Garand"
att.Icon = Material("","mips smooth")
att.Description = "M1 Garand receiver loaded in .30-06"
att.Slot = "uc_m14_cal"
att.AutoStats = true

att.Override_ClipSize = 8
att.Mult_SightTime = 0.85
att.Mult_ReloadTime = 0.85
att.Mult_Sway = 0.90
att.Mult_SpeedMult = 1.10
att.Mult_ShootSpeedMult = 1.15

att.Mult_Damage = 1.40
att.Mult_DamageMin = 1.34
att.Mult_Penetration = 1.40

att.Mult_Range = 1.48
att.Mult_Recoil = 1.25
att.Mult_VisualRecoilMult = 1.32
att.Mult_RPM = 0.79
att.Mult_ShootSpeedMult = 0.93
att.Mult_MalfunctionMean = 0.88

att.Mult_HipDispersion = 0.65

att.ActivateElements = {"garand"}

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

local path = "weapons/misc/"

local fire22 = {"uc_m14/wep_m1_garand_single_1.wav", "uc_m14/wep_m1_garand_single_2.wav", "uc_m14/wep_m1_garand_single_3.wav", "uc_m14/wep_m1_garand_single_4.wav", "uc_m14/wep_m1_garand_single_5.wav", "uc_m14/wep_m1_garand_single_6.wav", "uc_m14/wep_m1_garand_single_7.wav", "uc_m14/wep_m1_garand_single_8.wav"}
local fire22sup = {"weapons/misc/223remington_fire_sup.wav"}

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

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_garand"
end

    ArcCW.LoadAttachmentType(att, "uc_m14_cal_garand")
end
-- END BUNDLED ATTACHMENT: uc_m14_cal_garand.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m14_cal_m21.lua
do
    local att = {}

att.PrintName = "SR21 Conversion"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M21 Conversion"
end
att.AbbrevName = "M21"
att.Icon = Material("","mips smooth")
att.Description = "M21 configuration with reinforced handguard and integrated bipod. The M21 sniper weapon system (SWS) in the US Army is a national match grade M14 rifle, selected for accuracy."
att.Slot = "uc_m14_cal"
att.AutoStats = true

att.Mult_SightTime = 0.80
att.Mult_Sway = 0.90
att.Mult_SpeedMult = 0.90
att.Mult_ShootSpeedMult = 0.90

att.Mult_Recoil = 0.85
att.Mult_VisualRecoilMult = 0.90

att.Bipod = true
att.Mult_BipodRecoil = .50
att.Mult_BipodDispersion = .2

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Mult_HipDispersion = 0.45

att.ActivateElements = {"m21"}

    ArcCW.LoadAttachmentType(att, "uc_m14_cal_m21")
end
-- END BUNDLED ATTACHMENT: uc_m14_cal_m21.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m14_mag_10.lua
do
    local att = {}

att.PrintName = "SR-14 10-Round Magazine"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M14 10-Round Magazine"
end
att.AbbrevName = "10-Round Mag"
att.Icon = Material("","mips smooth")
att.Description = "Lower capacity magazine."
att.Slot = "uc_m14_mag"
att.AutoStats = true

att.Override_ClipSize = 10
att.Mult_SightTime = 0.85
att.Mult_ReloadTime = 0.85
att.Mult_Sway = 0.90
att.Mult_SpeedMult = 1.10
att.Mult_ShootSpeedMult = 1.15

att.Mult_HipDispersion = 0.65

att.ActivateElements = {"mag_10"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_10"
end

    ArcCW.LoadAttachmentType(att, "uc_m14_mag_10")
end
-- END BUNDLED ATTACHMENT: uc_m14_mag_10.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m14_mag_50.lua
do
    local att = {}

att.PrintName = "SR-14 50-Round Magazine"
if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "M14 50-Round Magazine"
end
att.AbbrevName = "50-Round Mag"
att.Icon = Material("","mips smooth")
att.Description = "High capacity drum"
att.Slot = "uc_m14_mag"
att.AutoStats = true

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

    ArcCW.LoadAttachmentType(att, "uc_m14_mag_50")
end
-- END BUNDLED ATTACHMENT: uc_m14_mag_50.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m14_skin_olive.lua
do
    local att = {}

att.PrintName = "Olive Furniture"
att.AbbrevName = "Olive"
att.Icon = Material("","mips smooth")
att.Description = "Olive Furniture"
att.SortOrder = 9

att.Desc_Neutrals = {
    "uc.cosmetic"
}

att.AutoStats = true
att.Slot = "uc_m14_skin"
att.Free = true
att.ActivateElements = {"skin_olive"}

    ArcCW.LoadAttachmentType(att, "uc_m14_skin_olive")
end
-- END BUNDLED ATTACHMENT: uc_m14_skin_olive.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m14_skin_poly.lua
do
    local att = {}

att.PrintName = "Polymer Furniture"
att.AbbrevName = "Polymer"
att.Icon = Material("","mips smooth")
att.Description = "Black Polymer Furniture"
att.SortOrder = 9

att.Desc_Neutrals = {
    "uc.cosmetic"
}

att.AutoStats = true
att.Slot = "uc_m14_skin"
att.Free = true
att.ActivateElements = {"skin_poly"}

    ArcCW.LoadAttachmentType(att, "uc_m14_skin_poly")
end
-- END BUNDLED ATTACHMENT: uc_m14_skin_poly.lua

-- BEGIN BUNDLED ATTACHMENT: uc_m14_stock_none.lua
do
    local att = {}

att.PrintName = "Obrez Configuration"
att.AbbrevName = "Obrez Configuration"
att.Slot = "uc_m14_stock"
att.Icon = Material("", "smooth mips")
att.Description = "Sawn-off stock and barrel."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.AutoStats = true
att.SortOrder = 6

att.Mult_Recoil = 1.70
att.Add_BarrelLength = -6
att.Mult_RPM = 1.20
att.Mult_RecoilSide = 1.25
att.Mult_VisualRecoilMult = 1.25
att.Mult_Sway = 1.37

att.Mult_SightTime = 0.50
att.Mult_SightedSpeedMult = 1.50
att.Mult_ShootSpeedMult = 1.50

att.Mult_DrawTime = 0.50
att.Mult_HolsterTime = 0.50
att.Mult_HipDispersion = 1.25
att.Mult_ShootPitch = 1.25
att.Mult_PhysBulletMuzzleVelocity = 0.80
att.Mult_AccuracyMOA = 1.50
att.Mult_Range = .785

att.ActivateElements = {"stock_none", "barrel_sawnoff"}

    ArcCW.LoadAttachmentType(att, "uc_m14_stock_none")
end
-- END BUNDLED ATTACHMENT: uc_m14_stock_none.lua
