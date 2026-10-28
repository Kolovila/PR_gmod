-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_evolys_barrel_long.lua
do
    local att = {}

att.PrintName = "24\" Heavy Barrel"
att.AbbrevName = "Long Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "A longer, heavier profile with the extended hider. More barrel to burn powder in and more steel to soak up the heat of a sustained belt, which is what the gun is for. It also turns a carbine-weight machine gun back into something you notice carrying."
att.AutoStats = true

att.Slot = "uc_evolys_barrel"
att.SortOrder = 11

att.Add_BarrelLength = 8
att.Mult_Range = 1.25
att.Mult_MuzzleVelocity = 1.08
att.Mult_AccuracyMOA = 0.82
att.Mult_Penetration = 1.10

att.Mult_Recoil = 0.85
att.Mult_RecoilSide = 0.85
att.Mult_RecoilRise = 0.85
att.Mult_VisualRecoilMult = 0.90
att.Mult_HipDispersion = 1.20
att.Mult_ShootPitch = 0.95

att.Mult_Sway = 1.20
att.Mult_SightTime = 1.20
att.Mult_SpeedMult = 0.93
att.Mult_SightedSpeedMult = 0.93
att.Mult_DrawTime = 1.15

att.ActivateElements = {"barrel_long"}
att.GivesFlags = {"evolys_barrel_long"}

    ArcCW.LoadAttachmentType(att, "uc_evolys_barrel_long")
end
-- END BUNDLED ATTACHMENT: uc_evolys_barrel_long.lua

-- BEGIN BUNDLED ATTACHMENT: uc_evolys_barrel_short.lua
do
    local att = {}

att.PrintName = "16\" Assault Barrel"
att.AbbrevName = "Short Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "A stubby barrel and the matching hider, fitted by people who fully intend to use a machine gun indoors. It comes onto target fast and does not catch on doorframes. Everything the long tube was doing for reach and heat, it is no longer doing."
att.AutoStats = true

att.Slot = "uc_evolys_barrel"
att.SortOrder = 10

att.Add_BarrelLength = -8
att.Mult_Range = 0.80
att.Mult_MuzzleVelocity = 0.90
att.Mult_AccuracyMOA = 1.20

att.Mult_Recoil = 1.15
att.Mult_RecoilSide = 1.15
att.Mult_VisualRecoilMult = 1.10
att.Mult_HipDispersion = 0.85
att.Mult_ShootPitch = 1.06

att.Mult_Sway = 0.85
att.Mult_SightTime = 0.85
att.Mult_SpeedMult = 1.06
att.Mult_SightedSpeedMult = 1.06
att.Mult_DrawTime = 0.88

att.ActivateElements = {"barrel_short"}
att.GivesFlags = {"evolys_barrel_short"}

    ArcCW.LoadAttachmentType(att, "uc_evolys_barrel_short")
end
-- END BUNDLED ATTACHMENT: uc_evolys_barrel_short.lua

-- BEGIN BUNDLED ATTACHMENT: uc_evolys_cal_300blk.lua
do
    local att = {}

att.PrintName = ".300 Blackout Upper Receiver"
att.AbbrevName = ".300 Blackout"

att.Icon = Material("entities/att/uc_bullets/300winchester.png", "mips smooth")
att.Description = "A heavy pistol-weight bullet loafing along under the speed of sound, so the only noise left to deal with is the gun itself. Hits hard enough inside a building and falls out of the air shortly after leaving one. Put a can on the front and it is about as quiet as a belt-fed gets."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_evolys_cal"
att.SortOrder = 7
att.AutoStats = true

att.Mult_Damage = 40 / 65
att.Mult_DamageMin = 15 / 35
att.Mult_Penetration = 10 / 20
att.Mult_MuzzleVelocity = 310 / 850

att.Mult_Range = 0.45
att.Mult_RPM = 0.93
att.Mult_Recoil = 0.55
att.Mult_RecoilSide = 0.60
att.Mult_RecoilRise = 0.60
att.Mult_RecoilPunch = 0.65
att.Mult_VisualRecoilMult = 0.65
att.Mult_AccuracyMOA = 1.05
att.Mult_HipDispersion = 0.85

att.Override_ClipSize = 150
att.Mult_SpeedMult = 1.03

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = ".300 AAC Blackout"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 0.95

att.Mult_ShootPitch = 0.88
att.Mult_ShootVol = 0.80

att.GivesFlags = {"evolys_300blk", "cal_subsonic"}

    ArcCW.LoadAttachmentType(att, "uc_evolys_cal_300blk")
end
-- END BUNDLED ATTACHMENT: uc_evolys_cal_300blk.lua

-- BEGIN BUNDLED ATTACHMENT: uc_evolys_cal_556.lua
do
    local att = {}

att.PrintName = "5.56x45mm Upper Receiver"
att.AbbrevName = "5.56x45mm"

att.Icon = Material("entities/att/uc_bullets/556x45.png", "mips smooth")
att.Description = "The other half of the family. FN builds the gun in both, and the small-bore version is the one most armies actually buy: the belt is lighter, the box holds twice as much, and the thing barely moves under a long burst. You give up the ability to shoot through the wall the target is standing behind."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_evolys_cal"
att.SortOrder = 5
att.AutoStats = true

att.Mult_Damage = 34 / 65
att.Mult_DamageMin = 20 / 35
att.Mult_Penetration = 14 / 20
att.Mult_MuzzleVelocity = 910 / 850

att.Mult_Range = 0.85
att.Mult_RPM = 850 / 750
att.Mult_Recoil = 0.45
att.Mult_RecoilSide = 0.50
att.Mult_RecoilRise = 0.55
att.Mult_RecoilPunch = 0.55
att.Mult_VisualRecoilMult = 0.60
att.Mult_AccuracyMOA = 0.90
att.Mult_HipDispersion = 0.90

att.Override_ClipSize = 200
att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.05
att.Mult_ReloadTime = 0.95

att.Override_Ammo = "smg1"
att.Override_Trivia_Calibre = "5.56x45mm NATO"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.GivesFlags = {"evolys_556"}

local path = ")^uc_evolys/"
local tail = ")/arccw_uc/common/556x45/"

local fire = {path .. "fire1_556.wav", path .. "fire2_556.wav", path .. "fire3_556.wav", path .. "fire4_556.wav"}
local dist = {tail .. "fire-dist-556x45-mg-ext-01.ogg", tail .. "fire-dist-556x45-mg-ext-02.ogg", tail .. "fire-dist-556x45-mg-ext-03.ogg", tail .. "fire-dist-556x45-mg-ext-04.ogg", tail .. "fire-dist-556x45-mg-ext-05.ogg", tail .. "fire-dist-556x45-mg-ext-06.ogg"}

att.Hook_GetShootSound = function(wep, fsound)
    if wep:GetBuff_Override("Silencer") then return end
    return fire
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end
    return dist
end

    ArcCW.LoadAttachmentType(att, "uc_evolys_cal_556")
end
-- END BUNDLED ATTACHMENT: uc_evolys_cal_556.lua

-- BEGIN BUNDLED ATTACHMENT: uc_evolys_cal_65cm.lua
do
    local att = {}

att.PrintName = "6.5mm Creedmoor Upper Receiver"
att.AbbrevName = "6.5mm Creedmoor"

att.Icon = Material("entities/att/uc_bullets/65creedmoor.png", "mips smooth")
att.Description = "A long, slender bullet that holds its speed far past where the 7.62 has given up, in a gun whose whole job is putting fire on things too far away to argue with. The belt runs slower and there is less of it, but every round that leaves still means something at the other end of the field."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}

att.Slot = "uc_evolys_cal"
att.SortOrder = 6
att.AutoStats = true

att.Mult_Damage = 55 / 65
att.Mult_DamageMin = 42 / 35
att.Mult_Penetration = 23 / 20
att.Mult_MuzzleVelocity = 830 / 850

att.Mult_Range = 1.45
att.Mult_RPM = 0.88
att.Mult_AccuracyMOA = 0.75
att.Mult_Recoil = 0.85
att.Mult_RecoilRise = 0.90
att.Mult_VisualRecoilMult = 0.90

att.Override_ClipSize = 75
att.Mult_ReloadTime = 1.05

att.Override_Trivia_Calibre = "6.5mm Creedmoor"
att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.15

att.Mult_ShootPitch = 0.96

att.GivesFlags = {"evolys_65cm"}

    ArcCW.LoadAttachmentType(att, "uc_evolys_cal_65cm")
end
-- END BUNDLED ATTACHMENT: uc_evolys_cal_65cm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_evolys_mag_50.lua
do
    local att = {}

att.PrintName = "50-Round Box"
att.AbbrevName = "50-Round Ammobox"

att.SortOrder = 20
att.Icon = Material("", "smooth mips")
att.Description = "50 round ammobox for a lighter load."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_evolys_mag"

att.AutoStats = true

att.Override_ClipSize = 50
att.Override_ClipSize_Priority = 2

att.Mult_SightTime = 0.87
att.Mult_ReloadTime = 0.87
att.Mult_Sway = 1.05

att.Mult_SpeedMult = 1.1
att.Mult_SightedSpeedMult = 1.1
att.Mult_ShootSpeedMult = 1.1

att.Mult_DrawTime = 0.87
att.Mult_HolsterTime = 0.87

att.ActivateElements = {"box_50"}

    ArcCW.LoadAttachmentType(att, "uc_evolys_mag_50")
end
-- END BUNDLED ATTACHMENT: uc_evolys_mag_50.lua
