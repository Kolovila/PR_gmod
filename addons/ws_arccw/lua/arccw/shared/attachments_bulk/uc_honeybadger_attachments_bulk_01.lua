-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_barrel_14.lua
do
    local att = {}

att.PrintName = "14.5\" Extended Barrel"
att.Icon = Material("entities/att/acwatt_uc_lynx_barrel_14.png", "mips smooth")
att.Description = "Carbine length barrel. Significantly enhances ballistic performance and recoil control at the cost of handling."

att.AutoStats = true
att.Slot = "uc_lynx_barrel"
att.SortOrder = 14.5

att.Mult_SightTime = 1.15
att.Mult_SightedSpeedMult = 0.9
att.Mult_HipDispersion = 1.15

att.Add_BarrelLength = 7
att.Mult_AccuracyMOA = 0.75
att.Mult_Recoil = 0.85
att.Mult_RecoilSide = 0.85

att.Mult_Sway = 1.15
att.Mult_Range = 1.25

att.Mult_PhysBulletMuzzleVelocity = 1+(1/12)

    ArcCW.LoadAttachmentType(att, "uc_lynx_barrel_14")
end
-- END BUNDLED ATTACHMENT: uc_lynx_barrel_14.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_barrel_long.lua
do
    local att = {}

att.PrintName = "18\" Long Barrel"
att.Icon = Material("entities/att/acwatt_uc_lynx_barrel_14.png", "mips smooth")
att.Description = "A full-length barrel and extended handguard assembly. It substantially improves muzzle velocity, effective range and precision, but makes the weapon cumbersome."

att.AutoStats = true
att.Slot = "uc_lynx_barrel"
att.SortOrder = 18
att.BlockedSlots = {handguard = true}

att.Add_BarrelLength = 11
att.Mult_Range = 1.5
att.Mult_MuzzleVelocity = 1.2
att.Mult_PhysBulletMuzzleVelocity = 1.2
att.Mult_AccuracyMOA = 0.65
att.Mult_Recoil = 0.8
att.Mult_RecoilSide = 0.8

att.Mult_SightTime = 1.25
att.Mult_SightedSpeedMult = 0.82
att.Mult_HipDispersion = 1.25
att.Mult_Sway = 1.3

att.ActivateElements = {"uc_lynx_barrel_long"}
att.GivesFlags = {"uc_lynx_no_handguard"}

    ArcCW.LoadAttachmentType(att, "uc_lynx_barrel_long")
end
-- END BUNDLED ATTACHMENT: uc_lynx_barrel_long.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_cal_308.lua
do
    local att = {}

att.PrintName = "Honey Badger .308 Winchester Conversion"
att.AbbrevName = ".308 Winchester"
att.Icon = Material("entities/att/uc_bullets/762x51.png", "smooth mips")
att.Description = "A full-power rifle conversion that greatly improves damage, penetration, velocity and effective range at the cost of capacity, fire rate and recoil control."

att.AutoStats = true
att.Slot = "uc_lynx_caliber"
att.SortOrder = 7.62

att.Override_Trivia_Calibre = ".308 Winchester"
att.Override_Trivia_Class = "Battle Rifle"
att.Override_Ammo = "ar2"

att.Override_Damage = ArcCW.UC.StdDmg["762_51"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["762_51"].min
att.Override_RangeMin = 60
att.Override_Range = 450
att.Override_Penetration = ArcCW.UC.StdDmg["762_51"].pen
att.Override_MuzzleVelocity = 760
att.Override_PhysBulletMuzzleVelocity = 760

att.Override_ClipSize = 20
att.Override_ClipSize_Priority = 3
att.Mult_RPM = 0.75
att.Mult_Recoil = 1.75
att.Mult_RecoilSide = 1.45
att.Mult_VisualRecoilMult = 1.6
att.Mult_AccuracyMOA = 0.75
att.Mult_HipDispersion = 1.25
att.Mult_SightTime = 1.1
att.Mult_ReloadTime = 1.1
att.Mult_ShootVol = 1.15
att.Mult_ShootPitch = 0.9

att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 0.75

att.GivesFlags = {"uc_lynx_caliber_308"}

local path = ")uc/badger/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return path .. "fire_308_supp.wav"
    end

    return path .. "fire_308.wav"
end

    ArcCW.LoadAttachmentType(att, "uc_lynx_cal_308")
end
-- END BUNDLED ATTACHMENT: uc_lynx_cal_308.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_cal_45.lua
do
    local att = {}

att.PrintName = "Honey Badger .45 ACP Conversion"
att.AbbrevName = ".45 ACP"
att.Icon = Material("entities/att/uc_bullets/45acp.png", "smooth mips")
att.Description = "A pistol-caliber receiver and magazine conversion. It trades penetration and reach for softer recoil, faster handling and plentiful pistol ammunition."

att.AutoStats = true
att.Slot = "uc_lynx_caliber"
att.SortOrder = 4.5

att.Override_Trivia_Calibre = ".45 ACP"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_Ammo = "pistol"

att.Override_Damage = 40
att.Override_DamageMin = 18
att.Override_RangeMin = 20
att.Override_Range = 100
att.Override_Penetration = 6
att.Override_MuzzleVelocity = 285
att.Override_PhysBulletMuzzleVelocity = 285

att.Override_ClipSize = 25
att.Override_ClipSize_Priority = 3
att.Mult_RPM = 0.875
att.Mult_Recoil = 0.72
att.Mult_RecoilSide = 0.8
att.Mult_VisualRecoilMult = 0.8
att.Mult_HipDispersion = 0.85
att.Mult_SightTime = 0.9
att.Mult_ReloadTime = 0.9

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 0.75
att.Override_ShellSounds = ArcCW.PistolShellSoundsTable

att.ActivateElements = {"uc_lynx_caliber_45"}
att.GivesFlags = {"uc_lynx_caliber_45"}

local path = ")uc/badger/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return path .. "fire_45_supp.wav"
    end

    return path .. "fire_45.wav"
end

    ArcCW.LoadAttachmentType(att, "uc_lynx_cal_45")
end
-- END BUNDLED ATTACHMENT: uc_lynx_cal_45.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_cal_50beo.lua
do
    local att = {}

att.PrintName = "Honey Badger .50 Beowulf Conversion"
att.AbbrevName = ".50 Beowulf"
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = "A large-bore conversion with exceptional close-range damage and penetration. Magazine capacity, cyclic rate and controllability are substantially reduced."

att.AutoStats = true
att.Slot = "uc_lynx_caliber"
att.SortOrder = 5

att.Override_Trivia_Calibre = ".50 Beowulf"
att.Override_Ammo = "ar2"

att.Override_Damage = 88
att.Override_DamageMin = 40
att.Override_RangeMin = 30
att.Override_Range = 160
att.Override_Penetration = ArcCW.UC.StdDmg["50beo"].pen
att.Override_MuzzleVelocity = ArcCW.UC.StdDmg["50beo"].vel
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["50beo"].vel

att.Override_ClipSize = 10
att.Override_ClipSize_Priority = 3
att.Mult_RPM = 0.75
att.Mult_Recoil = 1.85
att.Mult_RecoilSide = 1.65
att.Mult_VisualRecoilMult = 1.7
att.Mult_AccuracyMOA = 1.25
att.Mult_HipDispersion = 1.2
att.Mult_ReloadTime = 1.1
att.Mult_ShootVol = 1.2
att.Mult_ShootPitch = 0.86

att.Override_Firemodes = {
    {Mode = 1},
    {Mode = 0},
}

att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 0.75

att.GivesFlags = {"uc_lynx_caliber_50beo"}

local path = ")uc/badger/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return path .. "fire_127_supp.wav"
    end

    return path .. "fire_127.wav"
end

    ArcCW.LoadAttachmentType(att, "uc_lynx_cal_50beo")
end
-- END BUNDLED ATTACHMENT: uc_lynx_cal_50beo.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_hg_long.lua
do
    local att = {}

att.PrintName = "Extended Handguard"
att.Icon = Material("entities/att/acwatt_uc_lynx_hg_long.png", "mips smooth")
att.Description = "Extended M-LOK handguard to stuff a suppressor inside!"
att.Desc_Neutrals = {
    "uc.cosmetic"
}
att.AutoStats = true
att.Slot = "uc_lynx_handguard"
att.SortOrder = 12

    ArcCW.LoadAttachmentType(att, "uc_lynx_hg_long")
end
-- END BUNDLED ATTACHMENT: uc_lynx_hg_long.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_mag_40.lua
do
    local att = {}

att.PrintName = "40-Round Extended Mag"
att.Icon = Material("entities/att/acwatt_uc_lynx_mag_40.png", "smooth mips")
att.Description = "40-round box magazine. Heavier than the standard 30-rounder, but reliable."
att.Desc_Pros = {}
att.Desc_Cons = {
    "uc.jam"
}
att.Desc_Neutrals = {}
att.AutoStats = true
att.Slot = "uc_lynx_mag"
att.SortOrder = 40
att.HideIfBlocked = true

att.Override_ClipSize = 40

att.Mult_SightTime = 1.1
att.Mult_ReloadTime = 1.1
att.Mult_Sway = 1.5

att.Mult_SpeedMult = 0.95
att.Mult_ShootSpeedMult = 0.95

att.Override_Malfunction = true

    ArcCW.LoadAttachmentType(att, "uc_lynx_mag_40")
end
-- END BUNDLED ATTACHMENT: uc_lynx_mag_40.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_mag_60.lua
do
    local att = {}

att.PrintName = "60-Round Drum"
att.Icon = Material("entities/att/acwatt_uc_lynx_mag_60.png", "smooth mips")
att.Description = "Drum magazine. Bulky construction and high ammo capacity substantially increases weight, making the weapon difficult to handle. Prone to feeding failures."
att.Desc_Pros = {}
att.Desc_Cons = {
    "uc.jam"
}
att.Desc_Neutrals = {}
att.AutoStats = true
att.Slot = "uc_lynx_mag"
att.SortOrder = 60
att.HideIfBlocked = true

att.Override_ClipSize = 60

att.Mult_SightTime = 1.25
att.Mult_ReloadTime = 1.25
att.Mult_Sway = 2

att.Mult_SpeedMult = 0.9
att.Mult_ShootSpeedMult = 0.9

att.Mult_DrawTime = 1.25
att.Mult_HolsterTime = 1.25

att.Override_Malfunction = true
att.Mult_MalfunctionMean = 0.75
att.Mult_MalfunctionVariance = 1.5

    ArcCW.LoadAttachmentType(att, "uc_lynx_mag_60")
end
-- END BUNDLED ATTACHMENT: uc_lynx_mag_60.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_skin_black.lua
do
    local att = {}

att.PrintName = "Black Finish"
att.AbbrevName = "Black"
att.Description = "A cosmetic black finish for the receiver and iron sights."
att.Desc_Neutrals = {"uc.cosmetic"}

att.Slot = "uc_lynx_skin"
att.SortOrder = 1
att.AutoStats = true
att.Free = true

att.ActivateElements = {"uc_lynx_skin_black"}

    ArcCW.LoadAttachmentType(att, "uc_lynx_skin_black")
end
-- END BUNDLED ATTACHMENT: uc_lynx_skin_black.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_stock_compact.lua
do
    local att = {}

att.PrintName = "Compact Stock"

att.Icon = Material("entities/att/acwatt_uc_lynx_stock_collapsed.png", "smooth mips")
att.Description = "Collapse the stock, enhancing the weapon's utility in close-quarters combat."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_lynx_stock"

att.AutoStats = true
att.SortOrder = 65
att.Free = true

att.Mult_Sway = 1.25

att.Mult_SightedSpeedMult = 1.1
att.Mult_ShootSpeedMult = 1.1
att.Mult_RecoilSide = 1.5
att.Add_BarrelLength = -4

    ArcCW.LoadAttachmentType(att, "uc_lynx_stock_compact")
end
-- END BUNDLED ATTACHMENT: uc_lynx_stock_compact.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_stock_light.lua
do
    local att = {}

att.PrintName = "Light Folding Stock"
att.Icon = Material("entities/att/acwatt_uc_lynx_stock_collapsed.png", "smooth mips")
att.Description = "A lightweight folding stock. Toggle it between an extended firing position and a compact folded position."

att.AutoStats = true
att.Slot = "uc_lynx_stock"
att.SortOrder = 66
att.Free = true

att.Mult_SightTime = 0.92
att.Mult_DrawTime = 0.9
att.Mult_HolsterTime = 0.9
att.Mult_SpeedMult = 1.03
att.Mult_SightedSpeedMult = 1.04
att.Mult_Recoil = 1.12
att.Mult_RecoilSide = 1.1
att.Mult_Sway = 1.12

att.ToggleLockDefault = true
att.ToggleStats = {
    {
        PrintName = "Extended",
        AutoStats = true,
        ActivateElements = {"uc_lynx_stock_light_extended"},
    },
    {
        PrintName = "Folded",
        AutoStats = true,
        ActivateElements = {"uc_lynx_stock_light_folded"},
        Add_BarrelLength = -5,
        Mult_SightTime = 0.82,
        Mult_DrawTime = 0.82,
        Mult_HolsterTime = 0.82,
        Mult_SightedSpeedMult = 1.1,
        Mult_ShootSpeedMult = 1.08,
        Mult_Recoil = 1.45,
        Mult_RecoilSide = 1.35,
        Mult_Sway = 1.4,
    },
}

    ArcCW.LoadAttachmentType(att, "uc_lynx_stock_light")
end
-- END BUNDLED ATTACHMENT: uc_lynx_stock_light.lua

-- BEGIN BUNDLED ATTACHMENT: uc_lynx_stock_none.lua
do
    local att = {}

att.PrintName = "No Stock"

att.Icon = Material("entities/att/acwatt_uc_lynx_stock_none.png", "smooth mips")
att.Description = "Completely removed. As compact as it gets!"
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_lynx_stock"

att.AutoStats = true
att.SortOrder = 64
att.Free = true

att.Mult_SpeedMult = 1.05

att.Mult_SightTime = 0.5
att.Mult_DrawTime = 0.6
att.Mult_HolsterTime = 0.6

att.Mult_Recoil = 1.5
att.Mult_RecoilSide = 2

att.Mult_SightedSpeedMult = 1.2
att.Mult_ShootSpeedMult = 1.15

att.Add_BarrelLength = -8
att.Mult_Sway = 3

    ArcCW.LoadAttachmentType(att, "uc_lynx_stock_none")
end
-- END BUNDLED ATTACHMENT: uc_lynx_stock_none.lua

-- BEGIN BUNDLED ATTACHMENT: uc_muzzle_supp_qfullnelson.lua
do
    local att = {}

att.PrintName = "Q Full Nelson Suppressor"
att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_qfullnelson.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nExtremely long suppressor tube provides excellent noise reduction, but is also very unwieldy.\n\nWould fit quite snuggly in the handguard of a Honey Badger!"
att.Desc_Neutrals = {"uc.exclusive.rifle", "uc.supptail"}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/uc/att/supp_qhalfnelson.mdl"
att.ModelBodygroups = "1"
att.ModelOffset = Vector(0, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.7
att.Mult_Range = 1.2

att.Add_BarrelLength = 10
att.Mult_SightTime = 1.15
att.Mult_SightedSpeedMult = 0.9
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_Compatible = function(wep,data)
    if wep:CheckFlags(nil, {"uc_lynx_caliber_45"}) then
        return
    end

    if !ArcCW.UC.RifleAmmoTypes[wep:GetBuff_Override("Override_Ammo", wep.Primary.Ammo)] then
        return false
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_qfullnelson")
end
-- END BUNDLED ATTACHMENT: uc_muzzle_supp_qfullnelson.lua

-- BEGIN BUNDLED ATTACHMENT: uc_muzzle_supp_qhalfnelson.lua
do
    local att = {}

att.PrintName = "Q Half Nelson Suppressor"
att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_qhalfnelson.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nLow-profile and enhances ballistics, but slightly cumbersome.\n\nWould fit quite snuggly in the handguard of a Honey Badger!"
att.Desc_Neutrals = {"uc.exclusive.rifle", "uc.supptail"}

att.AutoStats = true
att.Slot = {"muzzle"}

att.SortOrder = 150

att.Model = "models/uc/att/supp_qhalfnelson.mdl"
att.ModelBodygroups = "0"
att.ModelOffset = Vector(0, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75
att.Mult_Range = 1.1

att.Add_BarrelLength = 4
att.Mult_SightTime = 1.07
att.Mult_Sway = 1.15

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_Compatible = function(wep,data)
    if wep:CheckFlags(nil, {"uc_lynx_caliber_45"}) then
        return
    end

    if !ArcCW.UC.RifleAmmoTypes[wep:GetBuff_Override("Override_Ammo", wep.Primary.Ammo)] then
        return false
    end
end

att.Hook_GetDistantShootSound = function(wep, distancesound)
    if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then
        return false
    end
end

    ArcCW.LoadAttachmentType(att, "uc_muzzle_supp_qhalfnelson")
end
-- END BUNDLED ATTACHMENT: uc_muzzle_supp_qhalfnelson.lua
