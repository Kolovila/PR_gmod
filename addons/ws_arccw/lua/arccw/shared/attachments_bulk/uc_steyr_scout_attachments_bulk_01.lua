-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_scout_barrel_stub.lua
do
    local att = {}

att.PrintName = "Stub Barrel"
att.AbbrevName = "Stub Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "The barrel cut back flush with the forend, which is where the bipod used to fold. What is left is a very loud, very light .308 carbine that can be brought out from under a coat, and that gives up most of the reason anyone bought this rifle."
att.AutoStats = true

att.Slot = "uc_scout_barrel"
att.SortOrder = 4

att.Add_BarrelLength = -20

att.Mult_Range = 0.66
att.Mult_PhysBulletMuzzleVelocity = 0.78
att.Mult_MuzzleVelocity = 0.78
att.Mult_Penetration = 0.85

att.Mult_AccuracyMOA = 2.2
att.Mult_HipDispersion = 0.8
att.Mult_Recoil = 1.3
att.Mult_RecoilSide = 1.35

att.Mult_SpeedMult = 1.08
att.Mult_SightedSpeedMult = 1.07
att.Mult_DrawTime = 0.78
att.Mult_HolsterTime = 0.78
att.Mult_SightTime = 0.78
att.Mult_Sway = 0.75

att.Mult_ShootPitch = 1.08
att.Mult_ShootVol = 1.12

att.ActivateElements = {"barrel_stub"}
att.GivesFlags = {"scout_stub"}

    ArcCW.LoadAttachmentType(att, "uc_scout_barrel_stub")
end
-- END BUNDLED ATTACHMENT: uc_scout_barrel_stub.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_17hmr.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 .17 HMR Conversion"
att.AbbrevName = ".17 HMR"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout .17 HMR Conversion"
end

att.SortOrder = 3
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "A rimfire round about the width of a pencil lead, leaving faster than most rifle cartridges and carrying almost nothing with it. It shoots flatter than anything else that fits this rifle and it stops being a threat to anyone wearing a thick jacket."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".17 HMR"
att.Override_Ammo = "plinking"

att.Override_Damage = 16
att.Override_DamageMin = 8
att.Override_Penetration = 4
att.Override_PhysBulletMuzzleVelocity = 775

att.Override_ClipSize = 12
att.Override_ClipSize_Priority = 2

att.Mult_Range = 0.62
att.Mult_AccuracyMOA = 0.62
att.Mult_Recoil = 0.14
att.Mult_RecoilSide = 0.2
att.Mult_VisualRecoilMult = 0.2
att.Mult_Sway = 0.8
att.Mult_ReloadTime = 0.85

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 1.42
att.Mult_ShootVol = 0.58

att.GivesFlags = {"scout_17hmr"}

local src = ")^uc_kolibri/"
local tail = ")^/arccw_uc/common/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire1_sup.wav"}
    else
        return {src .. "fire1.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-22-dist-01.ogg",
        tail .. "fire-22-dist-02.ogg",
        tail .. "fire-22-dist-03.ogg",
        tail .. "fire-22-dist-04.ogg",
        tail .. "fire-22-dist-05.ogg",
        tail .. "fire-22-dist-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_17hmr")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_17hmr.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_223.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 .223 Remington Conversion"
att.AbbrevName = ".223 Remington"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout .223 Remington Conversion"
end

att.SortOrder = 6
att.Icon = Material("entities/att/uc_bullets/556x45.png", "smooth mips")
att.Description = "The commercial version of the service round, loaded a little softer and made a great deal more carefully. It is the cheapest way to shoot this rifle accurately, and it runs out of authority long before the .308 does."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".223 Remington"
att.Override_Ammo = "smg1"

att.Override_Damage = 33
att.Override_DamageMin = 19
att.Override_Penetration = 13
att.Override_PhysBulletMuzzleVelocity = 890

att.Override_ClipSize = 10
att.Override_ClipSize_Priority = 2

att.Mult_Range = 0.84
att.Mult_AccuracyMOA = 0.76
att.Mult_Recoil = 0.4
att.Mult_RecoilSide = 0.5
att.Mult_VisualRecoilMult = 0.5
att.Mult_Sway = 0.92
att.Mult_ReloadTime = 0.92

att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 1.18
att.Mult_ShootVol = 0.84

att.GivesFlags = {"scout_223"}

local src = ")^uc_scout/"
local tail = ")^/arccw_uc/common/556x45/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire_sup.wav"}
    else
        return {src .. "fire.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-556x45-rif-ext-01.ogg",
        tail .. "fire-dist-556x45-rif-ext-02.ogg",
        tail .. "fire-dist-556x45-rif-ext-03.ogg",
        tail .. "fire-dist-556x45-rif-ext-04.ogg",
        tail .. "fire-dist-556x45-rif-ext-05.ogg",
        tail .. "fire-dist-556x45-rif-ext-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_223")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_223.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_22lr.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 .22 LR Conversion"
att.AbbrevName = ".22 LR"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout .22 LR Conversion"
end

att.SortOrder = 4
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "The rimfire trainer barrel, sold so the same rifle could be practised with for the price of the coffee you drink while doing it. Quiet enough to shoot without ear protection, and incapable of reliably stopping anything larger than a rabbit."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".22 LR"
att.Override_Ammo = "plinking"

att.Override_Damage = ArcCW.UC.StdDmg["22lr"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["22lr"].min
att.Override_Penetration = ArcCW.UC.StdDmg["22lr"].pen
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["22lr"].vel

att.Override_ClipSize = 12
att.Override_ClipSize_Priority = 2

att.Mult_Range = 0.4
att.Mult_AccuracyMOA = 0.75
att.Mult_Recoil = 0.1
att.Mult_RecoilSide = 0.16
att.Mult_VisualRecoilMult = 0.15
att.Mult_Sway = 0.78
att.Mult_ReloadTime = 0.82

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 0.9

att.Mult_ShootPitch = 1
att.Mult_ShootVol = 0.48

att.GivesFlags = {"scout_22lr"}

local src = ")^uc_kolibri/"
local tail = ")^/arccw_uc/common/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire1_sup.wav"}
    else
        return {src .. "fire1.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-22-dist-01.ogg",
        tail .. "fire-22-dist-02.ogg",
        tail .. "fire-22-dist-03.ogg",
        tail .. "fire-22-dist-04.ogg",
        tail .. "fire-22-dist-05.ogg",
        tail .. "fire-22-dist-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_22lr")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_22lr.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_22wmr.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 .22 WMR Conversion"
att.AbbrevName = ".22 WMR"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout .22 WMR Conversion"
end

att.SortOrder = 5
att.Icon = Material("entities/att/uc_bullets/22lr.png", "smooth mips")
att.Description = "The magnum rimfire, which is the same idea as the .22 with a longer case and a great deal more noise. It reaches the far side of a field rather than the far side of a yard, and it still cannot be called a serious cartridge."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".22 WMR"
att.Override_Ammo = "plinking"

att.Override_Damage = 21
att.Override_DamageMin = 11
att.Override_Penetration = 5
att.Override_PhysBulletMuzzleVelocity = 600

att.Override_ClipSize = 12
att.Override_ClipSize_Priority = 2

att.Mult_Range = 0.5
att.Mult_AccuracyMOA = 0.8
att.Mult_Recoil = 0.18
att.Mult_RecoilSide = 0.22
att.Mult_VisualRecoilMult = 0.22
att.Mult_Sway = 0.82
att.Mult_ReloadTime = 0.85

att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 1.2
att.Mult_ShootVol = 0.68

att.GivesFlags = {"scout_22wmr"}

local src = ")^uc_kolibri/"
local tail = ")^/arccw_uc/common/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire1_sup.wav"}
    else
        return {src .. "fire1.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-22-dist-01.ogg",
        tail .. "fire-22-dist-02.ogg",
        tail .. "fire-22-dist-03.ogg",
        tail .. "fire-22-dist-04.ogg",
        tail .. "fire-22-dist-05.ogg",
        tail .. "fire-22-dist-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_22wmr")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_22wmr.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_243.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 .243 Winchester Conversion"
att.AbbrevName = ".243 Winchester"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout .243 Winchester Conversion"
end

att.SortOrder = 8
att.Icon = Material("entities/att/uc_bullets/762x51.png", "smooth mips")
att.Description = "The .308 case necked down to six millimetres, which turns a general purpose cartridge into a very flat shooting one. It gives up terminal weight for a trajectory that forgives a badly judged range, and the recoil all but disappears."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".243 Winchester"
att.Override_Ammo = "ar2"

att.Override_Damage = 60
att.Override_DamageMin = 38
att.Override_Penetration = 16
att.Override_PhysBulletMuzzleVelocity = 900

att.Override_ClipSize = 5
att.Override_ClipSize_Priority = 2

att.Mult_Range = 1.18
att.Mult_AccuracyMOA = 0.78
att.Mult_Recoil = 0.66
att.Mult_RecoilSide = 0.72
att.Mult_VisualRecoilMult = 0.7
att.Mult_Sway = 0.95
att.Mult_ReloadTime = 1

att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.25

att.Mult_ShootPitch = 1.12
att.Mult_ShootVol = 0.92

att.GivesFlags = {"scout_243"}

local src = ")^uc_scout/"
local tail = ")^/arccw_uc/common/308/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire_sup.wav"}
    else
        return {src .. "fire.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-ext-01.ogg",
        tail .. "fire-dist-308-rif-ext-02.ogg",
        tail .. "fire-dist-308-rif-ext-03.ogg",
        tail .. "fire-dist-308-rif-ext-04.ogg",
        tail .. "fire-dist-308-rif-ext-05.ogg",
        tail .. "fire-dist-308-rif-ext-06.ogg"
    }
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-int-01.ogg",
        tail .. "fire-dist-308-rif-int-02.ogg",
        tail .. "fire-dist-308-rif-int-03.ogg",
        tail .. "fire-dist-308-rif-int-04.ogg",
        tail .. "fire-dist-308-rif-int-05.ogg",
        tail .. "fire-dist-308-rif-int-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_243")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_243.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_376.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 .376 Steyr Conversion"
att.AbbrevName = ".376 Steyr"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout .376 Steyr Conversion"
end

att.SortOrder = 12
att.Icon = Material("entities/att/uc_bullets/366tkm.png", "smooth mips")
att.Description = "The cartridge the factory built this rifle around for people who expected to be charged by something. A fat, slow, heavy bullet out of a rifle weighing three kilos, and the arithmetic on that lands entirely in the shooter's shoulder."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".376 Steyr"
att.Override_Ammo = "SniperPenetratedRound"

att.Override_Damage = 98
att.Override_DamageMin = 55
att.Override_Penetration = 25
att.Override_PhysBulletMuzzleVelocity = 720

att.Override_ClipSize = 4
att.Override_ClipSize_Priority = 2

att.Mult_Range = 0.88
att.Mult_AccuracyMOA = 1.2
att.Mult_Recoil = 1.9
att.Mult_RecoilSide = 1.7
att.Mult_VisualRecoilMult = 1.75
att.Mult_Sway = 1.1
att.Mult_ReloadTime = 1.12

att.Override_ShellModel = "models/weapons/arccw/uc_shells/366tkm.mdl"
att.Override_ShellScale = 1.15

att.Mult_ShootPitch = 0.86
att.Mult_ShootVol = 1.16

att.GivesFlags = {"scout_376"}

local src = ")^uc_psl/"
local tail = ")^/arccw_uc/common/308/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire_sup.wav"}
    else
        return {src .. "fire.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-ext-01.ogg",
        tail .. "fire-dist-308-rif-ext-02.ogg",
        tail .. "fire-dist-308-rif-ext-03.ogg",
        tail .. "fire-dist-308-rif-ext-04.ogg",
        tail .. "fire-dist-308-rif-ext-05.ogg",
        tail .. "fire-dist-308-rif-ext-06.ogg"
    }
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-int-01.ogg",
        tail .. "fire-dist-308-rif-int-02.ogg",
        tail .. "fire-dist-308-rif-int-03.ogg",
        tail .. "fire-dist-308-rif-int-04.ogg",
        tail .. "fire-dist-308-rif-int-05.ogg",
        tail .. "fire-dist-308-rif-int-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_376")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_376.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_556.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 5.56x45mm NATO Conversion"
att.AbbrevName = "5.56x45mm NATO"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout 5.56x45mm NATO Conversion"
end

att.SortOrder = 7
att.Icon = Material("entities/att/uc_bullets/556x45.png", "smooth mips")
att.Description = "The military loading of the same case, run at higher pressure with a heavier jacket on the bullet. It penetrates better than the commercial round and groups worse, which is the trade every army has decided it can live with."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "5.56x45mm NATO"
att.Override_Ammo = "smg1"

att.Override_Damage = ArcCW.UC.StdDmg["556"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["556"].min
att.Override_Penetration = ArcCW.UC.StdDmg["556"].pen
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["556"].vel

att.Override_ClipSize = 10
att.Override_ClipSize_Priority = 2

att.Mult_Range = 0.86
att.Mult_AccuracyMOA = 0.88
att.Mult_Recoil = 0.44
att.Mult_RecoilSide = 0.54
att.Mult_VisualRecoilMult = 0.55
att.Mult_Sway = 0.92
att.Mult_ReloadTime = 0.92

att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 1.22
att.Mult_ShootVol = 0.9

att.GivesFlags = {"scout_556"}

local src = ")^uc_psl/"
local tail = ")^/arccw_uc/common/556x45/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire_sup.wav"}
    else
        return {src .. "fire.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-556x45-rif-ext-01.ogg",
        tail .. "fire-dist-556x45-rif-ext-02.ogg",
        tail .. "fire-dist-556x45-rif-ext-03.ogg",
        tail .. "fire-dist-556x45-rif-ext-04.ogg",
        tail .. "fire-dist-556x45-rif-ext-05.ogg",
        tail .. "fire-dist-556x45-rif-ext-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_556")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_556.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_65cm.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 6.5mm Creedmoor Conversion"
att.AbbrevName = "6.5mm Creedmoor"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout 6.5mm Creedmoor Conversion"
end

att.SortOrder = 9
att.Icon = Material("entities/att/uc_bullets/65creedmoor.png", "smooth mips")
att.Description = "A cartridge designed from nothing around long, heavy bullets and a barrel twist fast enough to hold them. It hits harder at distance than the round it was meant to replace while recoiling less, which is the closest thing to a free lunch on this list."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "6.5mm Creedmoor"
att.Override_Ammo = "ar2"

att.Override_Damage = 70
att.Override_DamageMin = 48
att.Override_Penetration = 21
att.Override_PhysBulletMuzzleVelocity = 840

att.Override_ClipSize = 5
att.Override_ClipSize_Priority = 2

att.Mult_Range = 1.28
att.Mult_AccuracyMOA = 0.68
att.Mult_Recoil = 0.84
att.Mult_RecoilSide = 0.88
att.Mult_VisualRecoilMult = 0.85
att.Mult_Sway = 0.98
att.Mult_ReloadTime = 1

att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.25

att.Mult_ShootPitch = 1.04
att.Mult_ShootVol = 0.98

att.GivesFlags = {"scout_65cm"}

local src = ")^uc_scout/"
local tail = ")^/arccw_uc/common/308/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire_sup.wav"}
    else
        return {src .. "fire.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-ext-01.ogg",
        tail .. "fire-dist-308-rif-ext-02.ogg",
        tail .. "fire-dist-308-rif-ext-03.ogg",
        tail .. "fire-dist-308-rif-ext-04.ogg",
        tail .. "fire-dist-308-rif-ext-05.ogg",
        tail .. "fire-dist-308-rif-ext-06.ogg"
    }
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-int-01.ogg",
        tail .. "fire-dist-308-rif-int-02.ogg",
        tail .. "fire-dist-308-rif-int-03.ogg",
        tail .. "fire-dist-308-rif-int-04.ogg",
        tail .. "fire-dist-308-rif-int-05.ogg",
        tail .. "fire-dist-308-rif-int-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_65cm")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_65cm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_762nato.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 7.62x51mm NATO Conversion"
att.AbbrevName = "7.62x51mm NATO"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout 7.62x51mm NATO Conversion"
end

att.SortOrder = 11
att.Icon = Material("entities/att/uc_bullets/762x51.png", "smooth mips")
att.Description = "Military ball in the chamber the rifle was built for. Dimensionally the same as the commercial round, loaded to a lower pressure in a thicker case, so it punches harder through cover, groups looser, and can be scavenged off anyone carrying a service rifle."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "7.62x51mm NATO"
att.Override_Ammo = "ar2"

att.Override_Damage = ArcCW.UC.StdDmg["762_51"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["762_51"].min
att.Override_Penetration = 23
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["762_51"].vel

att.Override_ClipSize = 5
att.Override_ClipSize_Priority = 2

att.Mult_Range = 0.96
att.Mult_AccuracyMOA = 1.28
att.Mult_Recoil = 1.06
att.Mult_RecoilSide = 1.05
att.Mult_VisualRecoilMult = 1.05
att.Mult_Sway = 1
att.Mult_ReloadTime = 0.95

att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.25

att.Mult_ShootPitch = 0.97
att.Mult_ShootVol = 1.06

att.GivesFlags = {"scout_762nato"}

local src = ")^uc_vector/"
local tail = ")^/arccw_uc/common/308/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire_308_1_sup.wav", src .. "fire_308_2_sup.wav", src .. "fire_308_3_sup.wav", src .. "fire_308_4_sup.wav"}
    else
        return {src .. "fire_308_1.wav", src .. "fire_308_2.wav", src .. "fire_308_3.wav", src .. "fire_308_4.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-ext-01.ogg",
        tail .. "fire-dist-308-rif-ext-02.ogg",
        tail .. "fire-dist-308-rif-ext-03.ogg",
        tail .. "fire-dist-308-rif-ext-04.ogg",
        tail .. "fire-dist-308-rif-ext-05.ogg",
        tail .. "fire-dist-308-rif-ext-06.ogg"
    }
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-int-01.ogg",
        tail .. "fire-dist-308-rif-int-02.ogg",
        tail .. "fire-dist-308-rif-int-03.ogg",
        tail .. "fire-dist-308-rif-int-04.ogg",
        tail .. "fire-dist-308-rif-int-05.ogg",
        tail .. "fire-dist-308-rif-int-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_762nato")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_762nato.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_cal_7mm08.lua
do
    local att = {}

att.PrintName = "Steinhauer JG-98 7mm-08 Remington Conversion"
att.AbbrevName = "7mm-08 Remington"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Steyr Scout 7mm-08 Remington Conversion"
end

att.SortOrder = 10
att.Icon = Material("entities/att/uc_bullets/300winchester.png", "smooth mips")
att.Description = "The same case again, this time necked to seven millimetres. It sits between the .243 and the .308 in every respect, and it is the answer for a shooter who found one of those too light and the other too much."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_scout_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "7mm-08 Remington"
att.Override_Ammo = "ar2"

att.Override_Damage = 70
att.Override_DamageMin = 44
att.Override_Penetration = 19
att.Override_PhysBulletMuzzleVelocity = 820

att.Override_ClipSize = 5
att.Override_ClipSize_Priority = 2

att.Mult_Range = 1.12
att.Mult_AccuracyMOA = 0.84
att.Mult_Recoil = 0.88
att.Mult_RecoilSide = 0.9
att.Mult_VisualRecoilMult = 0.88
att.Mult_Sway = 0.98
att.Mult_ReloadTime = 1

att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.25

att.Mult_ShootPitch = 1.07
att.Mult_ShootVol = 0.96

att.GivesFlags = {"scout_7mm08"}

local src = ")^uc_scout/"
local tail = ")^/arccw_uc/common/308/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {src .. "fire_sup.wav"}
    else
        return {src .. "fire.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-ext-01.ogg",
        tail .. "fire-dist-308-rif-ext-02.ogg",
        tail .. "fire-dist-308-rif-ext-03.ogg",
        tail .. "fire-dist-308-rif-ext-04.ogg",
        tail .. "fire-dist-308-rif-ext-05.ogg",
        tail .. "fire-dist-308-rif-ext-06.ogg"
    }
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-308-rif-int-01.ogg",
        tail .. "fire-dist-308-rif-int-02.ogg",
        tail .. "fire-dist-308-rif-int-03.ogg",
        tail .. "fire-dist-308-rif-int-04.ogg",
        tail .. "fire-dist-308-rif-int-05.ogg",
        tail .. "fire-dist-308-rif-int-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_scout_cal_7mm08")
end
-- END BUNDLED ATTACHMENT: uc_scout_cal_7mm08.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_mag_10.lua
do
    local att = {}

att.PrintName = "10-Round Magazine"
att.AbbrevName = "10 Rounds"

att.Icon = Material("", "smooth mips")
att.Description = "The double stack magazine sold for the rifle, twice the height of the flush one. It stops the rifle sitting flat on its belly and it doubles the number of rounds you get through before the bolt has to be worked over an empty well."
att.AutoStats = true

att.Slot = "uc_scout_mag"
att.SortOrder = 4

att.Override_ClipSize = 10
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.97
att.Mult_SightedSpeedMult = 0.96
att.Mult_Sway = 1.08
att.Mult_SightTime = 1.05

att.ActivateElements = {"mag_10"}
att.GivesFlags = {"scout_mag_10"}

    ArcCW.LoadAttachmentType(att, "uc_scout_mag_10")
end
-- END BUNDLED ATTACHMENT: uc_scout_mag_10.lua

-- BEGIN BUNDLED ATTACHMENT: uc_scout_stock_obrez.lua
do
    local att = {}

att.PrintName = "Cut Stock"
att.AbbrevName = "Obrez Stock"

att.Icon = Material("", "smooth mips")
att.Description = "The stock sawn off behind the grip. It takes the buttpad, the cheekpiece and the spare magazine compartment with it, so there is nothing to shoulder and nothing to reload from except pouches. What remains is a .308 pistol that will dislocate something."
att.AutoStats = true

att.Slot = "uc_scout_stock"
att.SortOrder = 4

att.Mult_Recoil = 1.85
att.Mult_RecoilSide = 1.7
att.Mult_VisualRecoilMult = 1.6
att.Mult_AccuracyMOA = 1.6
att.Mult_HipDispersion = 1.25
att.Mult_Sway = 1.35

att.Mult_SpeedMult = 1.1
att.Mult_SightedSpeedMult = 1.08
att.Mult_DrawTime = 0.7
att.Mult_HolsterTime = 0.7
att.Mult_SightTime = 0.72

att.ActivateElements = {"body_obrez"}
att.GivesFlags = {"scout_obrez"}

    ArcCW.LoadAttachmentType(att, "uc_scout_stock_obrez")
end
-- END BUNDLED ATTACHMENT: uc_scout_stock_obrez.lua
