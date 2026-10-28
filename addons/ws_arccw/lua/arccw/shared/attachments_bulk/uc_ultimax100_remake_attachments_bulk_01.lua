-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_u100_barrel_compact.lua
do
    local att = {}

att.PrintName = "13\" Paratrooper Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Shortest barrel length available on the market for this firearm. Very light and compact but accuracy is not as good."
att.AutoStats = true

att.Slot = "uc_u100_barrel"

att.SortOrder = 13

att.Add_BarrelLength = -7
att.Mult_Sway = .95
att.Mult_SightTime = .95
att.Mult_RPM = 1.125

att.Mult_Recoil = 1.15
att.Mult_AccuracyMOA = 1.45
att.Mult_Range = .8

att.Mult_HipDispersion = 1.15

att.ActivateElements = {"barrel_short"}

att.Mult_PhysBulletMuzzleVelocity = 0.90

    ArcCW.LoadAttachmentType(att, "uc_u100_barrel_compact")
end
-- END BUNDLED ATTACHMENT: uc_u100_barrel_compact.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_barrel_sd.lua
do
    local att = {}

att.PrintName = "20.5\" SD Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "Integrally suppressed barrel."
att.AutoStats = true

att.Slot = "uc_u100_barrel"

att.SortOrder = 15

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

att.ActivateElements = {"barrel_sd"}

att.Mult_PhysBulletMuzzleVelocity = 1.25

    ArcCW.LoadAttachmentType(att, "uc_u100_barrel_sd")
end
-- END BUNDLED ATTACHMENT: uc_u100_barrel_sd.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_bipod_open.lua
do
    local att = {}

att.PrintName = "Open Bipod"
att.AbbrevName = "Open Bipod"
att.Icon = Material("", "mips smooth")
att.Description = "Open the Bipod"
att.Slot = {"uc_u100_bipod"}
att.AutoStats = true

att.SortOrder = 99999

att.Mult_Sway = 1.5

att.Mult_Recoil = .8

att.Bipod = true
att.Mult_BipodRecoil = .25
att.Mult_BipodDispersion = .2

att.ActivateElements = {"bipod_open"}

    ArcCW.LoadAttachmentType(att, "uc_u100_bipod_open")
end
-- END BUNDLED ATTACHMENT: uc_u100_bipod_open.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_cal_308.lua
do
    local att = {}

att.PrintName = "7.62x51mm Receiver"
att.AbbrevName = "7.62x51mm Receiver"

att.Icon = Material("shit/ultimax_receiver.png", "smooth mips")
att.Description = "Modified receiver intended for marksman configurations. Loaded in the harder-hitting 7.62x51mm caliber."
att.AutoStats = true

att.Slot = "uc_u100_cal"

att.SortOrder = 1

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}
att.Mult_Damage = 1.765
att.Mult_DamageMin = 1.515
att.Mult_Penetration = 1.825

att.Mult_Recoil = 1.635
att.Mult_VisualRecoilMult = 1.45
att.Mult_RPM = 0.700

att.Mult_HipDispersion = 1.15

att.Override_Trivia_Calibre = "7.62x51mm"
att.Override_Trivia_Class = "Marksman Rifle"
att.Override_Ammo = "ar2"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 0.666

local path = ")weapons/arccw_ur/g3/"
local path1 = ")weapons/arccw_ur/ak/556/"

local fire556 = {"uc_u100/fire1_308.wav", "uc_u100/fire2_308.wav"}
local fire556sup = { "uc_u100/fire1_308_sup.wav", "uc_u100/fire2_308_sup.wav"}

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return fire556sup
    else
        return fire556
    end
end

local tail = ")/arccw_uc/common/556x45/"
local fire556dist = {tail .. "fire-dist-556x45-rif-ext-01.ogg", tail .. "fire-dist-556x45-rif-ext-02.ogg", tail .. "fire-dist-556x45-rif-ext-03.ogg", tail .. "fire-dist-556x45-rif-ext-04.ogg", tail .. "fire-dist-556x45-rif-ext-05.ogg", tail .. "fire-dist-556x45-rif-ext-06.ogg"}
local common = ")/arccw_uc/common/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then
    else
        return fire556dist
    end
end

att.ActivateElements = {"rec_308"}

    ArcCW.LoadAttachmentType(att, "uc_u100_cal_308")
end
-- END BUNDLED ATTACHMENT: uc_u100_cal_308.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_grip_competition.lua
do
    local att = {}

att.PrintName = "Competition Grip"
att.Icon = Material("", "smooth mips")
att.Description = "Ergonomic grip with grooves that allow better handling."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_u100_grip"

att.AutoStats = true
att.Free = true
att.SortOrder = 1

att.Mult_Recoil = 0.90
att.Mult_RecoilSide = 0.95
att.Mult_VisualRecoilMult = 0.875
att.Mult_Sway = 0.90

att.Mult_SightTime = 0.975
att.Mult_ShootSpeedMult = 1.025

att.Mult_DrawTime = 0.975
att.Mult_HolsterTime = 0.975

att.ActivateElements = {"grip_wood"}

    ArcCW.LoadAttachmentType(att, "uc_u100_grip_competition")
end
-- END BUNDLED ATTACHMENT: uc_u100_grip_competition.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_handguard_wood.lua
do
    local att = {}

att.PrintName = "Heavy Handguard"

att.Icon = Material("", "smooth mips")
att.Description = "Heavy handguard."
att.AutoStats = true

att.Slot = "uc_u100_hg"

att.SortOrder = 15

att.LHIK = true

att.Mult_Sway = 0.80
att.Mult_SightTime = 1.15

att.Mult_Recoil = 0.85

att.Mult_SpeedMult = 0.85
att.Mult_SightedSpeedMult = 0.85
att.Mult_ShootSpeedMult = 0.85

att.ActivateElements = {"handguard_wood"}

    ArcCW.LoadAttachmentType(att, "uc_u100_handguard_wood")
end
-- END BUNDLED ATTACHMENT: uc_u100_handguard_wood.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_mag_15.lua
do
    local att = {}

att.PrintName = "Ultimax-100 15-Round Compact Mag"
att.AbbrevName = "15-Round Compact Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SAR-100 15-Round Compact Mag"
end

att.SortOrder = 10
att.Icon = Material("entities/att/acwatt_ud_m16_mag_20.png", "smooth mips")
att.Description = "Rare low-capacity magazine meant for sporting purposes. The lighter load promotes reliability of the mechanism."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_u100_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 15

att.Mult_SightTime = 0.85
att.Mult_ReloadTime = 0.87
att.Mult_Sway = 0.85

att.Mult_SpeedMult = 1.15
att.Mult_SightedSpeedMult = 1.13
att.Mult_ShootSpeedMult = 1.10

att.Mult_MalfunctionMean = 1.1

att.Mult_HipDispersion = 0.90

att.Mult_DrawTime = 0.80
att.Mult_HolsterTime = 0.80
att.Mult_RecoilSide = 0.80

att.ActivateElements = {"mag_10"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_10"
end

    ArcCW.LoadAttachmentType(att, "uc_u100_mag_15")
end
-- END BUNDLED ATTACHMENT: uc_u100_mag_15.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_mag_drum.lua
do
    local att = {}

att.PrintName = "Ultimax-100 100-Round Drum Magazine"
att.AbbrevName = "100-Round Drum Mag"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SAR-100 100-Round Drum Magazine"
end

att.SortOrder = 10
att.Icon = Material("entities/att/ur_g3/mag50.png", "smooth mips")
att.Description = "Renowned drum magazine proprietary to the Ultimax-100, that increases the amount of rounds that can be shot before reloading. The cylindrical design destabilizes the weapon's center of mass, causing imbalanced and poor accuracy when firing."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_u100_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 100

att.Mult_SightTime = 1.20
att.Mult_ReloadTime = 1.25
att.Mult_Sway = 1.80

att.Mult_SpeedMult = 0.825
att.Mult_SightedSpeedMult = 0.80
att.Mult_ShootSpeedMult = 0.80
att.Mult_Recoil = 1.125
att.Mult_AccuracyMOA = 1.10

att.Mult_MalfunctionMean = 0.90
att.Mult_MalfunctionVariance = 1.05

att.Mult_DrawTime = 1.2
att.Mult_HolsterTime = 1.2
att.Mult_RecoilSide = 1.15

att.Mult_HipDispersion = 1.45

att.ActivateElements = {"mag_drum"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_100"
end

    ArcCW.LoadAttachmentType(att, "uc_u100_mag_drum")
end
-- END BUNDLED ATTACHMENT: uc_u100_mag_drum.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_receiver_mk5.lua
do
    local att = {}

att.PrintName = "Ultimax-100 Mark 5 Receiver"
att.AbbrevName = "Mark 5 Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "SAR-100 Mark 5 Receiver"
end

att.Icon = Material("shit/ultimax_receiver.png", "smooth mips")
att.Description = "Newer generation version of the receiver that allows select-fire capability."
att.AutoStats = true

att.Slot = "uc_u100_cal"

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

att.Mult_SightTime = 0.95

att.Mult_Recoil = 0.95

att.ActivateElements = {"rec_mk5"}

    ArcCW.LoadAttachmentType(att, "uc_u100_receiver_mk5")
end
-- END BUNDLED ATTACHMENT: uc_u100_receiver_mk5.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_stock_marksman.lua
do
    local att = {}

att.PrintName = "Marksman Stock"
att.Icon = Material("", "smooth mips")
att.Description = "Heavier stock that maximizes stability greatly but weighs down the weapon."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_u100_stock"

att.AutoStats = true
att.Free = true
att.SortOrder = 1

att.Mult_Recoil = 0.80
att.Mult_RecoilSide = 0.85
att.Mult_VisualRecoilMult = 0.85
att.Mult_Sway = 0.90

att.Mult_SpeedMult = 0.90
att.Mult_SightTime = 1.15
att.Mult_SightedSpeedMult = 0.85
att.Mult_ShootSpeedMult = 0.80

att.Mult_DrawTime = 1.15
att.Mult_HolsterTime = 1.15
att.Add_BarrelLength = 2
att.Mult_AccuracyMOA = 0.95

att.ActivateElements = {"stock_wood"}

    ArcCW.LoadAttachmentType(att, "uc_u100_stock_marksman")
end
-- END BUNDLED ATTACHMENT: uc_u100_stock_marksman.lua

-- BEGIN BUNDLED ATTACHMENT: uc_u100_stock_none.lua
do
    local att = {}

att.PrintName = "No Stock"
att.Icon = nil
att.Description = "Remove your stock."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_u100_stock"

att.AutoStats = true
att.Free = true
att.SortOrder = 2

att.Mult_Recoil = 1.50
att.Mult_RecoilSide = 1.25
att.Mult_VisualRecoilMult = 1.60
att.Mult_Sway = 2.15

att.Mult_SightTime = 0.70
att.Mult_SightedSpeedMult = 1.15
att.Mult_ShootSpeedMult = 1.15

att.Mult_DrawTime = 0.70
att.Mult_HolsterTime = 0.70
att.Add_BarrelLength = -4
att.Mult_AccuracyMOA = 1.15

att.ActivateElements = {"stock_none"}

    ArcCW.LoadAttachmentType(att, "uc_u100_stock_none")
end
-- END BUNDLED ATTACHMENT: uc_u100_stock_none.lua
