-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_barrel_long.lua
do
    local att = {}

att.PrintName = "18\" Marksman Barrel"
att.AbbrevName = "Long Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "The long barrel from the kit, pinned in place of the service one. Two pins and a minute of work turn the rifle into something that will hold a group at four hundred metres, and into something you notice on a sling all day."
att.AutoStats = true

att.Slot = "uc_cz805_barrel"
att.SortOrder = 4

att.Add_BarrelLength = 8

att.Mult_Range = 1.24
att.Mult_PhysBulletMuzzleVelocity = 1.12
att.Mult_MuzzleVelocity = 1.12

att.Mult_AccuracyMOA = 0.7
att.Mult_Recoil = 0.9
att.Mult_RecoilSide = 0.92
att.Mult_HipDispersion = 1.2

att.Mult_SpeedMult = 0.95
att.Mult_SightedSpeedMult = 0.93
att.Mult_DrawTime = 1.12
att.Mult_SightTime = 1.14
att.Mult_Sway = 1.2

att.Mult_ShootPitch = 0.96

att.ActivateElements = {"barrel_long"}
att.GivesFlags = {"cz805_long"}

    ArcCW.LoadAttachmentType(att, "uc_cz805_barrel_long")
end
-- END BUNDLED ATTACHMENT: uc_cz805_barrel_long.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_barrel_short.lua
do
    local att = {}

att.PrintName = "11\" Carbine Barrel"
att.AbbrevName = "Short Barrel"

att.Icon = Material("", "smooth mips")
att.Description = "The short barrel and the stubby handguard that goes with it, which is the configuration the rifle was bought for by people who work indoors. The front sight comes back with the handguard, and a good deal of the powder finishes burning outside the muzzle."
att.AutoStats = true

att.Slot = "uc_cz805_barrel"
att.SortOrder = 5

att.Add_BarrelLength = -8

att.Mult_Range = 0.78
att.Mult_PhysBulletMuzzleVelocity = 0.88
att.Mult_MuzzleVelocity = 0.88

att.Mult_AccuracyMOA = 1.3
att.Mult_HipDispersion = 0.78
att.Mult_Recoil = 1.15
att.Mult_RecoilSide = 1.18

att.Mult_SpeedMult = 1.06
att.Mult_SightedSpeedMult = 1.05
att.Mult_DrawTime = 0.86
att.Mult_HolsterTime = 0.86
att.Mult_SightTime = 0.84
att.Mult_Sway = 0.84

att.Mult_ShootPitch = 1.07
att.Mult_ShootVol = 1.06

att.ActivateElements = {"barrel_short"}
att.GivesFlags = {"cz805_short"}

    ArcCW.LoadAttachmentType(att, "uc_cz805_barrel_short")
end
-- END BUNDLED ATTACHMENT: uc_cz805_barrel_short.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_cal_300blk.lua
do
    local att = {}

att.PrintName = "CZ 805 BREN A1 .300 AAC Blackout Conversion"
att.AbbrevName = ".300 AAC Blackout"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Brnos VZ-11 .300 AAC Blackout Conversion"
end

att.SortOrder = 6
att.Icon = Material("entities/att/uc_bullets/300blackout.png", "smooth mips")
att.Description = [[A heavy, subsonic .30-calibre conversion made for short barrels and suppressors. It hits harder than 5.56 up close without a ballistic crack, then drops like it remembered an appointment with the ground.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_cz805_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".300 AAC Blackout"
att.Override_Trivia_Class = "Assault Rifle"
att.Override_Ammo = "smg1"

att.Override_Damage = ArcCW.UC.StdDmg["300blk"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["300blk"].min
att.Override_Penetration = ArcCW.UC.StdDmg["300blk"].pen
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["300blk"].vel

att.Override_ClipSize = 30
att.Override_ClipSize_Priority = 2

att.Mult_RPM = 1.03
att.Mult_Range = 0.5
att.Mult_AccuracyMOA = 1.05
att.Mult_Recoil = 0.6
att.Mult_RecoilSide = 0.7
att.Mult_ReloadTime = 1

att.Override_ShellModel = "models/weapons/arccw/uc_shells/300blk.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 1.16
att.Mult_ShootVol = 0.8

att.GivesFlags = {"cz805_300"}

local tail = ")^/arccw_uc/common/762x39/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-762x39-rif-ext-01.ogg",
        tail .. "fire-dist-762x39-rif-ext-02.ogg",
        tail .. "fire-dist-762x39-rif-ext-03.ogg",
        tail .. "fire-dist-762x39-rif-ext-04.ogg",
        tail .. "fire-dist-762x39-rif-ext-05.ogg",
        tail .. "fire-dist-762x39-rif-ext-06.ogg"
    }
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-762x39-rif-int-01.ogg",
        tail .. "fire-dist-762x39-rif-int-02.ogg",
        tail .. "fire-dist-762x39-rif-int-03.ogg",
        tail .. "fire-dist-762x39-rif-int-04.ogg",
        tail .. "fire-dist-762x39-rif-int-05.ogg",
        tail .. "fire-dist-762x39-rif-int-06.ogg"
    }
end

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_300blk.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_300blk.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_556.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

    ArcCW.LoadAttachmentType(att, "uc_cz805_cal_300blk")
end
-- END BUNDLED ATTACHMENT: uc_cz805_cal_300blk.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_cal_50beo.lua
do
    local att = {}

att.PrintName = "CZ 808 12.7x42mm Conversion"
att.AbbrevName = "12.7x42mm"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Brnos VZ-19 12.7x42mm Conversion"
end

att.SortOrder = 7
att.Icon = Material("entities/att/uc_bullets/50beowulf.png", "smooth mips")
att.Description = [[A half-inch bullet squeezed through a rifle-sized action. Ten rounds and semiautomatic fire keep the receiver alive while enormous close-range damage makes the shooter question the same arrangement.

Brutal through light cover, brutal on the shoulder and hopeless at distance.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_cz805_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "12.7x42mm"
att.Override_Ammo = "ar2"

att.Override_Damage = 88
att.Override_DamageMin = 40
att.Override_Penetration = ArcCW.UC.StdDmg["50beo"].pen
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["50beo"].vel

att.Override_ClipSize = 10
att.Override_ClipSize_Priority = 2

att.Mult_RPM = 0.75
att.Mult_Range = 0.45
att.Mult_AccuracyMOA = 1.35
att.Mult_Recoil = 1.75
att.Mult_RecoilSide = 1.6
att.Mult_ReloadTime = 1.1

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
att.Override_ShellScale = 1.15

att.Mult_ShootPitch = 0.86
att.Mult_ShootVol = 1.2

att.GivesFlags = {"cz805_50beo"}

local name = "CZ 808"

if !GetConVar("arccw_truenames"):GetBool() then
    name = "Brnos VZ-19"
end

att.Hook_NameChange = function(wep, oldname)
    return name
end

local tail = ")^/arccw_uc/common/50bmg/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-50bmg-rif-ext-01.ogg",
        tail .. "fire-dist-50bmg-rif-ext-02.ogg",
        tail .. "fire-dist-50bmg-rif-ext-03.ogg",
        tail .. "fire-dist-50bmg-rif-ext-04.ogg",
        tail .. "fire-dist-50bmg-rif-ext-05.ogg",
        tail .. "fire-dist-50bmg-rif-ext-06.ogg"
    }
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-50bmg-rif-int-01.ogg",
        tail .. "fire-dist-50bmg-rif-int-02.ogg",
        tail .. "fire-dist-50bmg-rif-int-03.ogg",
        tail .. "fire-dist-50bmg-rif-int-04.ogg",
        tail .. "fire-dist-50bmg-rif-int-05.ogg",
        tail .. "fire-dist-50bmg-rif-int-06.ogg"
    }
end

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_556_20.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_556_20.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_556.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

    ArcCW.LoadAttachmentType(att, "uc_cz805_cal_50beo")
end
-- END BUNDLED ATTACHMENT: uc_cz805_cal_50beo.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_cal_556.lua
do
    local att = {}

att.PrintName = "CZ Bren 805 A2 5.56x45mm NATO Conversion"
att.AbbrevName = "5.56x45mm NATO"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Brnos VZ-17 5.56x45mm NATO Conversion"
end

att.SortOrder = 4
att.Icon = Material("entities/att/uc_bullets/556x45.png", "smooth mips")
att.Description = [[The chambering Czech troops actually received; A1 meant the full-length rifle and A2 its shorter carbine. Thirty-round magazines, a quicker cycle and soft recoil make the heavy 805 remarkably easy to control.

Less authority than 7.62 NATO, with far more chances to use it.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_cz805_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "5.56x45mm NATO"
att.Override_Trivia_Class = "Assault Rifle"
att.Override_Ammo = "smg1"

att.Override_Damage = ArcCW.UC.StdDmg["556"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["556"].min
att.Override_Penetration = ArcCW.UC.StdDmg["556"].pen
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["556"].vel

att.Override_ClipSize = 30
att.Override_ClipSize_Priority = 2

att.Mult_RPM = 1.07
att.Mult_Range = 0.82
att.Mult_AccuracyMOA = 1.07
att.Mult_Recoil = 0.67
att.Mult_RecoilSide = 0.69
att.Mult_ReloadTime = 0.92

att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.88

att.GivesFlags = {"cz805_556"}

local name = "CZ Bren 805 A2"

if !GetConVar("arccw_truenames"):GetBool() then
    name = "Brnos VZ-17"
end

att.Hook_NameChange = function(wep, oldname)
    return name
end

local tail = ")^/arccw_uc/common/556x45/"

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

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-556x45-rif-int-01.ogg",
        tail .. "fire-dist-556x45-rif-int-02.ogg",
        tail .. "fire-dist-556x45-rif-int-03.ogg",
        tail .. "fire-dist-556x45-rif-int-04.ogg",
        tail .. "fire-dist-556x45-rif-int-05.ogg",
        tail .. "fire-dist-556x45-rif-int-06.ogg"
    }
end

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_556.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_556.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_556.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

    ArcCW.LoadAttachmentType(att, "uc_cz805_cal_556")
end
-- END BUNDLED ATTACHMENT: uc_cz805_cal_556.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_cal_762.lua
do
    local att = {}

att.PrintName = "CZ 807 7.62x39mm Conversion"
att.AbbrevName = "7.62x39mm"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Brnos VZ-17 7.62x39mm Conversion"
end

att.SortOrder = 5
att.Icon = Material("entities/att/uc_bullets/762x39.png", "smooth mips")
att.Description = [[The other cartridge promised by the 805's modular design, chosen to consume old vz. 58 ammunition stocks. It flies slower than 5.56 but carries a heavier bullet through light cover.

Thirty rounds, moderate recoil and no shortage of ammunition anywhere east of Prague.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_cz805_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "7.62x39mm"
att.Override_Trivia_Class = "Assault Rifle"
att.Override_Ammo = "ar2"

att.Override_Damage = ArcCW.UC.StdDmg["762_39"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["762_39"].min
att.Override_Penetration = ArcCW.UC.StdDmg["762_39"].pen
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["762_39"].vel

att.Override_ClipSize = 30
att.Override_ClipSize_Priority = 2

att.Mult_RPM = 0.99
att.Mult_Range = 0.68
att.Mult_AccuracyMOA = 1.15
att.Mult_Recoil = 0.82
att.Mult_RecoilSide = 0.88
att.Mult_ReloadTime = 1

att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 0.96
att.Mult_ShootVol = 1.02

att.GivesFlags = {"cz805_762"}

local name = "CZ 807"

if !GetConVar("arccw_truenames"):GetBool() then
    name = "Brnos VZ-17"
end

att.Hook_NameChange = function(wep, oldname)
    return name
end

local tail = ")^/arccw_uc/common/762x39/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-762x39-rif-ext-01.ogg",
        tail .. "fire-dist-762x39-rif-ext-02.ogg",
        tail .. "fire-dist-762x39-rif-ext-03.ogg",
        tail .. "fire-dist-762x39-rif-ext-04.ogg",
        tail .. "fire-dist-762x39-rif-ext-05.ogg",
        tail .. "fire-dist-762x39-rif-ext-06.ogg"
    }
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-762x39-rif-int-01.ogg",
        tail .. "fire-dist-762x39-rif-int-02.ogg",
        tail .. "fire-dist-762x39-rif-int-03.ogg",
        tail .. "fire-dist-762x39-rif-int-04.ogg",
        tail .. "fire-dist-762x39-rif-int-05.ogg",
        tail .. "fire-dist-762x39-rif-int-06.ogg"
    }
end

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_762.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_762.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_762.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

    ArcCW.LoadAttachmentType(att, "uc_cz805_cal_762")
end
-- END BUNDLED ATTACHMENT: uc_cz805_cal_762.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_cal_9mm.lua
do
    local att = {}

att.PrintName = "CZ Scorpion Hybrid 9x19mm Parabellum Conversion"
att.AbbrevName = "9x19mm Parabellum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Brnos VZ-11 Hybrid 9x19mm Parabellum Conversion"
end

att.SortOrder = 8
att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = [[A simple blowback conversion wearing an entire service rifle as a disguise. Thirty pistol rounds, almost no recoil and an eager cyclic rate make it vicious indoors.

Outside that room it is still a 9mm, regardless of how much rifle surrounds it.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_cz805_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "9x19mm Parabellum"
att.Override_Trivia_Class = "Submachine Gun"
att.Override_Ammo = "pistol"

att.Override_Damage = ArcCW.UC.StdDmg["9mm"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["9mm"].min
att.Override_Penetration = ArcCW.UC.StdDmg["9mm"].pen
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["9mm"].vel

att.Override_ClipSize = 30
att.Override_ClipSize_Priority = 2

att.Mult_RPM = 1.29
att.Mult_Range = 0.32
att.Mult_AccuracyMOA = 0.8
att.Mult_Recoil = 0.35
att.Mult_RecoilSide = 0.45
att.Mult_ReloadTime = 0.88

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 1.24
att.Mult_ShootVol = 0.72

att.ActivateElements = {"conv_9mm"}
att.GivesFlags = {"cz805_9mm"}

local name = "CZ Scorpion Hybrid"

if !GetConVar("arccw_truenames"):GetBool() then
    name = "Brnos VZ-11 Hybrid"
end

att.Hook_NameChange = function(wep, oldname)
    return name
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-9x19-smg-ext-01.ogg",
        tail .. "fire-dist-9x19-smg-ext-02.ogg",
        tail .. "fire-dist-9x19-smg-ext-03.ogg",
        tail .. "fire-dist-9x19-smg-ext-04.ogg",
        tail .. "fire-dist-9x19-smg-ext-05.ogg",
        tail .. "fire-dist-9x19-smg-ext-06.ogg"
    }
end

att.Hook_GetDistantShootSoundIndoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-9x19-pistol-int-01.ogg",
        tail .. "fire-dist-9x19-pistol-int-02.ogg",
        tail .. "fire-dist-9x19-pistol-int-03.ogg",
        tail .. "fire-dist-9x19-pistol-int-04.ogg",
        tail .. "fire-dist-9x19-pistol-int-05.ogg",
        tail .. "fire-dist-9x19-pistol-int-06.ogg"
    }
end

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_9mm.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_9mm.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_9mm.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

    ArcCW.LoadAttachmentType(att, "uc_cz805_cal_9mm")
end
-- END BUNDLED ATTACHMENT: uc_cz805_cal_9mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_cal_bren2.lua
do
    local att = {}

att.PrintName = "CZ Bren 2 Conversion"
att.AbbrevName = "BREN 2 7.62x51mm"
att.Icon = Material("entities/att/uc_bullets/762x51.png", "smooth mips")
att.Description = [[Combat experience sent the 805 back to the drawing board and produced the lighter, handier BREN 2. This battle-rifle version keeps the 7.62 NATO punch and loses much of the original's bulk.

Faster handling, smoother operation and a proprietary magazine well with expensive taste.]]
att.AutoStats = true
att.Slot = "uc_cz805_cal"
att.SortOrder = 9

att.Override_Trivia_Calibre = "7.62x51mm NATO"
att.Override_Ammo = "ar2"
att.Override_Trivia_Class = "Battle Rifle"
att.Override_ClipSize = 20
att.Override_ClipSize_Priority = 2

att.ActivateElements = {"conv_bren2"}
att.GivesFlags = {"cz805_bren2"}

att.Hook_NameChange = function(wep, oldname)
    return "CZ Bren 2"
end

local snd = ")uc_cz805/"

local foley = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_bren2.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_bren2.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_bren2.wav",
    [snd .. "boltback.wav"] = snd .. "boltback_bren2.wav",
    [snd .. "boltforward.wav"] = snd .. "boltforward_bren2.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return foley[fsound]
end

att.Hook_TranslateSound_Priority = 2

    ArcCW.LoadAttachmentType(att, "uc_cz805_cal_bren2")
end
-- END BUNDLED ATTACHMENT: uc_cz805_cal_bren2.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_100.lua
do
    local att = {}

att.PrintName = "100-Round Drum"
att.AbbrevName = "100-Round Drum"

att.Icon = Material("", "smooth mips")
att.Description = "A twin drum clamped under the magazine well, holding more than three standard boxes. It turns the rifle into a substitute for a light machine gun and weighs about as much as one."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 7

att.Override_ClipSize = 100
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.74
att.Mult_SightedSpeedMult = 0.82
att.Mult_Sway = 1.5
att.Mult_ReloadTime = 1.55

att.HideIfBlocked = true

att.ExcludeFlags = {"cz805_bren2", "cz805_556", "cz805_762", "cz805_300", "cz805_50beo", "cz805_9mm"}

att.ActivateElements = {"mag_100"}
att.GivesFlags = {"cz805_mag_100"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_100.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_100.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_100.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_100")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_100.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_15.lua
do
    local att = {}

att.PrintName = "15-Round Magazine"
att.AbbrevName = "15-Round Magazine"

att.Icon = Material("", "smooth mips")
att.Description = "A short box, a few rounds under the standard twenty, which keeps the rifle out of the dirt when firing prone and keeps the profile down when firing from a vehicle."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 4

att.Override_ClipSize = 15
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 1.04
att.Mult_SightedSpeedMult = 1.03
att.Mult_Sway = 0.94
att.Mult_ReloadTime = 0.96

att.HideIfBlocked = true

att.ExcludeFlags = {"cz805_bren2", "cz805_556", "cz805_762", "cz805_300", "cz805_50beo", "cz805_9mm"}

att.ActivateElements = {"mag_15"}
att.GivesFlags = {"cz805_mag_15"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_15.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_15.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_15")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_15.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_300blk_40.lua
do
    local att = {}

att.PrintName = "40-Round Magazine"
att.AbbrevName = "40-Round Magazine"

att.Icon = Material("", "smooth mips")
att.Description = "An extended box for the subsonic loading, which needs the extra rounds more than most given how little each one carries."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 14

att.Override_ClipSize = 40
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.96
att.Mult_SightedSpeedMult = 0.972
att.Mult_Sway = 1.08
att.Mult_ReloadTime = 1.06

att.HideIfBlocked = true

att.RequireFlags = {"cz805_300"}

att.ActivateElements = {"mag_300blk_40"}
att.GivesFlags = {"cz805_mag_300blk_40"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_300blk.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_300blk.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_556.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_300blk_40")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_300blk_40.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_300blk_75.lua
do
    local att = {}

att.PrintName = "75-Round Drum"
att.AbbrevName = "75-Round Drum"

att.Icon = Material("", "smooth mips")
att.Description = "A drum for the quiet cartridge, which is a strange combination: seventy five rounds of ammunition chosen for not being heard, in a magazine that rattles."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 15

att.Override_ClipSize = 75
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.84
att.Mult_SightedSpeedMult = 0.888
att.Mult_Sway = 1.3
att.Mult_ReloadTime = 1.38

att.HideIfBlocked = true

att.RequireFlags = {"cz805_300"}

att.ActivateElements = {"mag_300blk_75"}
att.GivesFlags = {"cz805_mag_300blk_75"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_300blk_75.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_300blk_75.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_300blk_75.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_300blk_75")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_300blk_75.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_40.lua
do
    local att = {}

att.PrintName = "40-Round Magazine"
att.AbbrevName = "40-Round Magazine"

att.Icon = Material("", "smooth mips")
att.Description = "The extended box. Twice what the standard magazine holds, a good deal more of it hanging below the rifle, and the first thing to catch on the lip of a trench."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 5

att.Override_ClipSize = 40
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.92
att.Mult_SightedSpeedMult = 0.95
att.Mult_Sway = 1.14
att.Mult_ReloadTime = 1.12

att.HideIfBlocked = true

att.ExcludeFlags = {"cz805_bren2", "cz805_556", "cz805_762", "cz805_300", "cz805_50beo", "cz805_9mm"}

att.ActivateElements = {"mag_40"}
att.GivesFlags = {"cz805_mag_40"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_40.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_40.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_40")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_40.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_5.lua
do
    local att = {}

att.PrintName = "5-Round Magazine"
att.AbbrevName = "5-Round Magazine"

att.Icon = Material("", "smooth mips")
att.Description = "A five round box, issued for range work and for carrying the rifle somewhere that a full magazine would be impolite. It sits flush and it runs out immediately."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 3

att.Override_ClipSize = 5
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 1.1
att.Mult_SightedSpeedMult = 1.07
att.Mult_Sway = 0.86
att.Mult_ReloadTime = 0.9

att.HideIfBlocked = true

att.ExcludeFlags = {"cz805_bren2", "cz805_556", "cz805_762", "cz805_300", "cz805_50beo", "cz805_9mm"}

att.ActivateElements = {"mag_5"}
att.GivesFlags = {"cz805_mag_5"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_15.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_15.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_5")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_5.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_556_100.lua
do
    local att = {}

att.PrintName = "100-Round STANAG Drum"
att.AbbrevName = "100-Round STANAG Drum"

att.Icon = Material("", "smooth mips")
att.Description = "A hundred round drum in the common pattern. The same trade as every drum ever made: you stop reloading and you start noticing the weight."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 11

att.Override_ClipSize = 100
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.82
att.Mult_SightedSpeedMult = 0.874
att.Mult_Sway = 1.35
att.Mult_ReloadTime = 1.4

att.HideIfBlocked = true

att.RequireFlags = {"cz805_556"}

att.ActivateElements = {"mag_556_100"}
att.GivesFlags = {"cz805_mag_556_100"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_556_100.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_556_100.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_556_100.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_556_100")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_556_100.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_556_20.lua
do
    local att = {}

att.PrintName = "20-Round STANAG"
att.AbbrevName = "20-Round STANAG"

att.Icon = Material("", "smooth mips")
att.Description = "The short STANAG box. Fewer rounds, but the rifle sits lower and the magazine stops being the first thing that touches the ground."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 8

att.Override_ClipSize = 20
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 1.06
att.Mult_SightedSpeedMult = 1.042
att.Mult_Sway = 0.9
att.Mult_ReloadTime = 0.94

att.HideIfBlocked = true

att.RequireFlags = {"cz805_556"}

att.ActivateElements = {"mag_556_20"}
att.GivesFlags = {"cz805_mag_556_20"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_556_20.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_556_20.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_556.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_556_20")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_556_20.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_556_40.lua
do
    local att = {}

att.PrintName = "40-Round STANAG"
att.AbbrevName = "40-Round STANAG"

att.Icon = Material("", "smooth mips")
att.Description = "The forty round STANAG box, which is the standard answer to wanting more rounds without carrying a drum."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 9

att.Override_ClipSize = 40
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.96
att.Mult_SightedSpeedMult = 0.972
att.Mult_Sway = 1.08
att.Mult_ReloadTime = 1.06

att.HideIfBlocked = true

att.RequireFlags = {"cz805_556"}

att.ActivateElements = {"mag_556_40"}
att.GivesFlags = {"cz805_mag_556_40"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_556_40.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_556_40.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_556.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_556_40")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_556_40.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_556_60.lua
do
    local att = {}

att.PrintName = "60-Round STANAG Casket"
att.AbbrevName = "60-Round STANAG Casket"

att.Icon = Material("", "smooth mips")
att.Description = "A casket magazine in the common pattern, four rounds wide at the base and tapering to a single feed. Sixty rounds without the bulk of a drum, at the cost of a great deal of width."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 10

att.Override_ClipSize = 60
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.93
att.Mult_Sway = 1.18
att.Mult_ReloadTime = 1.16

att.HideIfBlocked = true

att.RequireFlags = {"cz805_556"}

att.ActivateElements = {"mag_556_60"}
att.GivesFlags = {"cz805_mag_556_60"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_556_60.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_556_60.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_556.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_556_60")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_556_60.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_556_pmag.lua
do
    local att = {}

att.PrintName = "Polymer STANAG"
att.AbbrevName = "Polymer STANAG"

att.Icon = Material("", "smooth mips")
att.Description = "A polymer box with an anti tilt follower, lighter than the steel one and far less likely to be the reason the rifle stops. Same thirty rounds, fewer excuses."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 12

att.Override_ClipSize = 30
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 1.02
att.Mult_SightedSpeedMult = 1.014
att.Mult_Sway = 0.97
att.Mult_ReloadTime = 0.9

att.HideIfBlocked = true

att.RequireFlags = {"cz805_556"}

att.ActivateElements = {"mag_556_pmag"}
att.GivesFlags = {"cz805_mag_556_pmag"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_556pmag.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_556pmag.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_556.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_556_pmag")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_556_pmag.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_60.lua
do
    local att = {}

att.PrintName = "60-Round Casket"
att.AbbrevName = "60-Round Casket"

att.Icon = Material("", "smooth mips")
att.Description = "A four stack casket that holds sixty and is nearly as wide as the receiver. It doubles what the rifle carries and it makes prone fire an exercise in tilting."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 6

att.Override_ClipSize = 60
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.84
att.Mult_SightedSpeedMult = 0.89
att.Mult_Sway = 1.28
att.Mult_ReloadTime = 1.26

att.HideIfBlocked = true

att.ExcludeFlags = {"cz805_bren2", "cz805_556", "cz805_762", "cz805_300", "cz805_50beo", "cz805_9mm"}

att.ActivateElements = {"mag_60"}
att.GivesFlags = {"cz805_mag_60"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_60.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_60.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_60")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_60.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_762_75.lua
do
    local att = {}

att.PrintName = "75-Round Drum"
att.AbbrevName = "75-Round Drum"

att.Icon = Material("", "smooth mips")
att.Description = "An eastern pattern drum that happens to fit the converted magazine well. Seventy five rounds of the heavier cartridge, and a rifle that now balances somewhere in front of your left hand."
att.AutoStats = true

att.Slot = "uc_cz805_mag"
att.SortOrder = 13

att.Override_ClipSize = 75
att.Override_ClipSize_Priority = 3

att.Mult_SpeedMult = 0.84
att.Mult_SightedSpeedMult = 0.888
att.Mult_Sway = 1.3
att.Mult_ReloadTime = 1.38

att.HideIfBlocked = true

att.RequireFlags = {"cz805_762"}

att.ActivateElements = {"mag_762_75"}
att.GivesFlags = {"cz805_mag_762_75"}

local snd = ")uc_cz805/"

local magsounds = {
    [snd .. "mag_out.wav"] = snd .. "mag_out_762_75.wav",
    [snd .. "mag_in.wav"] = snd .. "mag_in_762_75.wav",
    [snd .. "mag_hit.wav"] = snd .. "mag_hit_762.wav",
}

att.Hook_TranslateSound = function(wep, fsound)
    return magsounds[fsound]
end

att.Hook_TranslateSound_Priority = 1

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_762_75")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_762_75.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_mag_bren2_10.lua
do
    local att = {}

att.PrintName = "10-Round BREN 2 Magazine"
att.AbbrevName = "10-Round BREN 2"
att.Icon = Material("", "smooth mips")
att.Description = "Compact proprietary BREN 2 magazine holding ten rounds of 7.62x51mm NATO."
att.AutoStats = true
att.Slot = "uc_cz805_mag"
att.SortOrder = 16

att.Override_ClipSize = 10
att.Override_ClipSize_Priority = 3

att.HideIfBlocked = true
att.RequireFlags = {"cz805_bren2"}
att.ActivateElements = {"mag_bren2_10"}
att.GivesFlags = {"cz805_mag_bren2_10"}

    ArcCW.LoadAttachmentType(att, "uc_cz805_mag_bren2_10")
end
-- END BUNDLED ATTACHMENT: uc_cz805_mag_bren2_10.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_stock_folded.lua
do
    local att = {}

att.PrintName = "Stock Folded"
att.AbbrevName = "Folded"

att.Icon = Material("", "smooth mips")
att.Description = "The side folding stock left folded against the receiver. It clears a doorway and a vehicle hatch, and it leaves nothing to put in your shoulder."
att.AutoStats = true

att.Slot = "uc_cz805_stock"
att.SortOrder = 4
att.Free = true

att.Mult_Recoil = 1.3
att.Mult_RecoilSide = 1.25
att.Mult_VisualRecoilMult = 1.35
att.Mult_Sway = 1.3
att.Mult_AccuracyMOA = 1.15

att.Mult_SightTime = 0.86
att.Mult_SightedSpeedMult = 1.08
att.Mult_ShootSpeedMult = 1.08

att.Mult_DrawTime = 0.84
att.Mult_HolsterTime = 0.84

att.ActivateElements = {"stock_folded"}
att.GivesFlags = {"cz805_stock_folded"}

    ArcCW.LoadAttachmentType(att, "uc_cz805_stock_folded")
end
-- END BUNDLED ATTACHMENT: uc_cz805_stock_folded.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_stock_full.lua
do
    local att = {}

att.PrintName = "Fixed Marksman Stock"
att.AbbrevName = "Fixed Stock"

att.Icon = Material("", "smooth mips")
att.Description = "A solid stock with an adjustable comb, fitted in place of the folder by units that decided they would rather have the cheek weld than the shorter package. It does not fold and it does not move under recoil."
att.AutoStats = true

att.Slot = "uc_cz805_stock"
att.SortOrder = 5

att.Mult_Recoil = 0.82
att.Mult_RecoilSide = 0.85
att.Mult_VisualRecoilMult = 0.82
att.Mult_Sway = 0.88
att.Mult_AccuracyMOA = 0.9

att.Mult_SightTime = 1.08
att.Mult_SightedSpeedMult = 0.94
att.Mult_ShootSpeedMult = 0.94

att.Mult_DrawTime = 1.08
att.Mult_HolsterTime = 1.08

att.ActivateElements = {"stock_full"}
att.GivesFlags = {"cz805_stock_full"}

    ArcCW.LoadAttachmentType(att, "uc_cz805_stock_full")
end
-- END BUNDLED ATTACHMENT: uc_cz805_stock_full.lua

-- BEGIN BUNDLED ATTACHMENT: uc_cz805_stock_none.lua
do
    local att = {}

att.PrintName = "Stock Removed"
att.AbbrevName = "No Stock"

att.Icon = Material("", "smooth mips")
att.Description = "Stock and hinge off the back of the receiver entirely. What is left is a very short rifle firing a rifle cartridge with nothing between it and your collarbone."
att.AutoStats = true

att.Slot = "uc_cz805_stock"
att.SortOrder = 6
att.Free = true

att.Mult_Recoil = 1.6
att.Mult_RecoilSide = 1.5
att.Mult_VisualRecoilMult = 1.55
att.Mult_Sway = 1.55
att.Mult_AccuracyMOA = 1.3

att.Mult_SightTime = 0.76
att.Mult_SightedSpeedMult = 1.14
att.Mult_ShootSpeedMult = 1.14

att.Mult_DrawTime = 0.74
att.Mult_HolsterTime = 0.74

att.ActivateElements = {"stock_none"}
att.GivesFlags = {"cz805_stock_none"}

    ArcCW.LoadAttachmentType(att, "uc_cz805_stock_none")
end
-- END BUNDLED ATTACHMENT: uc_cz805_stock_none.lua

-- BEGIN BUNDLED ATTACHMENT: uc_ubgl_czgl1.lua
do
    local att = {}

att.PrintName = "CZ GL 1 Underbarrel Grenade Launcher"
att.AbbrevName = "CZ GL 1"
att.Icon = Material("", "mips smooth")
att.Description = [[The 805's companion launcher can hang under a rifle or fire from its own carrier. Its barrel slides forward and swings to either side, admitting long 40mm grenades without favoring a handed shooter.

Accurate and unusually flexible, with a reload elaborate enough to make every miss embarrassing.]]

att.Desc_Pros = {
    "Flat, consistent 40mm trajectory",
    "Accepts long HEDP and airburst rounds",
    "Milder handling penalty than most UBGLs"
}
att.Desc_Cons = {
    "Slow multi-stage breech reload",
    "Less explosive output with specialist rounds"
}
att.Desc_Neutrals = {
    "250mm barrel; side-swiveling breech"
}

att.SortOrder = -99999
att.AutoStats = true
att.Slot = "uc_ubgl"
att.ExcludeFlags = {"uc_noubgl"}

att.LHIK = true
att.ModelOffset = Vector(0, 0, 0)
att.Model = "models/weapons/arccw/atts/uc_ubgl_czgl1.mdl"

att.SelectUBGLSound = ""
att.ExitUBGLSound = ""

att.UBGL = true
att.UBGL_PrintName = "GL 1"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_m79"
att.UBGL_Ammo = "smg1_grenade"
att.UBGL_RPM = 90
att.UBGL_Recoil = 2.25
att.UBGL_Capacity = 1
att.UBGL_ClipSize = 1

local ubglFireDelay = 60 / 90

att.LHIK_GunDriver = 2
att.LHIK_CamDriver = 3

local infiniteAmmo = GetConVar("arccw_uc_infiniteubwammo")

local soundPath = ")^/uc_cz805/"

                                                                        
                                                                         
                                                        
local projectileProfiles = {
    ["arccw_uc_40mm_dp"] = {velocity = 4000, damage = 84},
    ["arccw_uc_40mm_he"] = {velocity = 3600, damage = 120},
    ["arccw_uc_40mm_airburst"] = {velocity = 3200, damage = 95},
    ["arccw_uc_40mm_smoke"] = {velocity = 3800, damage = 10}
}

local function Ammo(wep)
    if infiniteAmmo and infiniteAmmo:GetBool() then return 9999 end
    return wep:GetOwner():GetAmmoCount("smg1_grenade")
end

att.Hook_LHIK_TranslateAnimation = function(wep, key)
    if key == "idle" then
        return wep:GetInUBGL() and "idle_armed" or "idle"
    end
end

att.Hook_ShouldNotSight = function(wep)
    if wep:GetInUBGL() then return true end
end

att.Hook_OnSelectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)

    if (game.SinglePlayer() and SERVER) or (not game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_armed", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
            {s = "arccw_uc/common/raise.ogg", t = 0.2},
            {s = "arccw_uc/common/grab.ogg", t = 0.5}
        })
    end
end

att.Hook_OnDeselectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)

    if (game.SinglePlayer() and SERVER) or (not game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_idle", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
            {s = "arccw_uc/common/shoulder.ogg", t = 0.4}
        })
    end
end

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 then return end

    local class = wep:GetBuff_Override("UBGL_Entity") or "arccw_uc_40mm_dp"
    local profile = projectileProfiles[class] or projectileProfiles["arccw_uc_40mm_dp"]
    local projectile = wep:FireRocket(class, profile.velocity)

    if SERVER and IsValid(projectile) then
        projectile.Damage = profile.damage
    end

    if game.SinglePlayer() and SERVER or (not game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:MyEmitSound(soundPath .. "czgl1_fire.wav", 105, 100, 1, CHAN_WEAPON)
        wep:MyEmitSound(soundPath .. "czgl1_fire_dist.wav", 149, 100, 0.65, CHAN_BODY)
        wep:MyEmitSound(soundPath .. "czgl1_mech.wav", 85, 100, 0.68, CHAN_AUTO)
        wep:DoEffects()
        wep:DoLHIKAnimation("fire")
    end

    wep:SetClip2(wep:Clip2() - 1)
    wep:SetNextSecondaryFire(CurTime() + ubglFireDelay)
end

local casings = {
    "arccw_uc/common/40mm/casing-40mm-01.ogg",
    "arccw_uc/common/40mm/casing-40mm-02.ogg",
    "arccw_uc/common/40mm/casing-40mm-03.ogg",
    "arccw_uc/common/40mm/casing-40mm-04.ogg",
    "arccw_uc/common/40mm/casing-40mm-05.ogg",
    "arccw_uc/common/40mm/casing-40mm-06.ogg"
}

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 1 or Ammo(wep) <= 0 then return end

    local reloadTime = 111 / 30
    wep:SetNextSecondaryFire(CurTime() + reloadTime)

    if (game.SinglePlayer() and SERVER) or (not game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("reload_cz", reloadTime)
        wep:PlaySoundTable({
            {s = {"arccw_uc/common/rattle1.ogg", "arccw_uc/common/rattle2.ogg", "arccw_uc/common/rattle3.ogg"}, t = 0},
                                                       
            {s = soundPath .. "czgl1_mech.wav", t = 9 / 30, v = 0.65},
                                                                            
                                                                            
            {s = soundPath .. "czgl1_open.wav", t = 10 / 30},
            {s = casings, t = 14 / 30, v = 0.8},
                                                                 
            {s = soundPath .. "czgl1_swivel_open.wav", t = 14 / 30},
            {s = "arccw_uc/common/magpouch_replace_small.ogg", t = 0.95, v = 0.7},
                                                                    
            {s = soundPath .. "czgl1_insert.wav", t = 48 / 30},
                                                                             
                                                                           
                                                                             
            {s = soundPath .. "czgl1_swivel_close.wav", t = 51 / 30},
                                                                        
            {s = soundPath .. "czgl1_close.wav", t = 80 / 30},
            {s = "arccw_uc/common/shoulder.ogg", t = 3.25}
        })
    end

    if not (infiniteAmmo and infiniteAmmo:GetBool()) then
        wep:GetOwner():RemoveAmmo(1, "smg1_grenade")
    end
    wep:SetClip2(1)
end

att.Mult_SightTime = 1.16
att.Mult_SpeedMult = 0.93
att.Mult_SightedSpeedMult = 0.9
att.Mult_Sway = 1.08

att.ToggleLockDefault = true
att.ToggleStats = {
    {
        PrintName = "HEDP Long Grenade",
        UBGL_Entity = "arccw_uc_40mm_dp"
    },
    {
        PrintName = "HE Fragmentation",
        UBGL_Entity = "arccw_uc_40mm_he"
    },
    {
        PrintName = "Airburst Fragmentation",
        UBGL_Entity = "arccw_uc_40mm_airburst"
    },
    {
        PrintName = "Smoke / Marker",
        UBGL_Entity = "arccw_uc_40mm_smoke"
    }
}

    ArcCW.LoadAttachmentType(att, "uc_ubgl_czgl1")
end
-- END BUNDLED ATTACHMENT: uc_ubgl_czgl1.lua
