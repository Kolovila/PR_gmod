-- Generated attachment bulk. Original files are preserved in the external backup.

-- BEGIN BUNDLED ATTACHMENT: uc_vector_barrel_competition.lua
do
    local att = {}

att.PrintName = "KRISS Vector Competition Barrel"
att.AbbrevName = "Competition Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C45 Competition Barrel"
end

att.Icon = Material("entities/long_barrel_fennec.png", "smooth mips")
att.Description = "A longer match barrel with a threaded muzzle, sold for shooting at paper. It gains a little velocity and a lot of consistency, and it puts enough weight in front of the grip that the counterweight has something to work against."
att.AutoStats = true

att.Slot = "uc_vector_barrel"
att.SortOrder = 4

att.Add_BarrelLength = 4

att.Mult_Range = 1.14
att.Mult_PhysBulletMuzzleVelocity = 1.1
att.Mult_MuzzleVelocity = 1.1

att.Mult_AccuracyMOA = 0.82
att.Mult_Recoil = 0.94
att.Mult_HipDispersion = 1.06

att.Mult_SpeedMult = 0.97
att.Mult_SightedSpeedMult = 0.96
att.Mult_DrawTime = 1.06
att.Mult_SightTime = 1.07
att.Mult_Sway = 1.1

att.ActivateElements = {"barrel_carbine"}
att.GivesFlags = {"vector_barrel_comp"}

    ArcCW.LoadAttachmentType(att, "uc_vector_barrel_competition")
end
-- END BUNDLED ATTACHMENT: uc_vector_barrel_competition.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_barrel_extended.lua
do
    local att = {}

att.PrintName = "KRISS Vector 16\" Barrel"
att.AbbrevName = "16\" Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C45 16\" Barrel"
end

att.Icon = Material("entities/long_barrel_fennec.png", "smooth mips")
att.Description = "The barrel and shroud fitted to the carbine so that it clears the legal minimum without a stamp. On a pistol cartridge the extra length buys real velocity, and it makes a weapon designed to be short into something that no longer fits under a coat."
att.AutoStats = true

att.Slot = "uc_vector_barrel"
att.SortOrder = 5

att.Add_BarrelLength = 12

att.Mult_Range = 1.32
att.Mult_PhysBulletMuzzleVelocity = 1.24
att.Mult_MuzzleVelocity = 1.24
att.Mult_Penetration = 1.1

att.Mult_AccuracyMOA = 0.68
att.Mult_Recoil = 0.88
att.Mult_RecoilSide = 0.9
att.Mult_HipDispersion = 1.2

att.Mult_SpeedMult = 0.92
att.Mult_SightedSpeedMult = 0.9
att.Mult_DrawTime = 1.2
att.Mult_HolsterTime = 1.15
att.Mult_SightTime = 1.18
att.Mult_Sway = 1.28

att.Mult_ShootPitch = 0.95

att.ActivateElements = {"barrel_long"}
att.GivesFlags = {"vector_barrel_long"}

    ArcCW.LoadAttachmentType(att, "uc_vector_barrel_extended")
end
-- END BUNDLED ATTACHMENT: uc_vector_barrel_extended.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_barrel_sd.lua
do
    local att = {}

att.PrintName = "KRISS Vector Suppressed Barrel"
att.AbbrevName = "Suppressed Barrel"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C45 Suppressed Barrel"
end

att.Icon = Material("entities/vectortacrun.png", "smooth mips")
att.Description = "A can built onto the barrel rather than screwed to the end of it. The service round is already below the speed of sound, so there is no crack to hide and nothing left to hear but the bolt running. Nothing else will fit on the muzzle afterwards."
att.AutoStats = true

att.Slot = "uc_vector_barrel"
att.SortOrder = 6

att.Add_BarrelLength = 8

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.Override_MuzzleEffectAttachment = 2
att.Mult_ShootPitch = 1.05
att.Mult_ShootVol = 0.75

att.Mult_Range = 1.06
att.Mult_PhysBulletMuzzleVelocity = 1.04
att.Mult_MuzzleVelocity = 1.04

att.Mult_Recoil = 0.9
att.Mult_AccuracyMOA = 0.9
att.Mult_HipDispersion = 1.06

att.Mult_SpeedMult = 0.95
att.Mult_SightedSpeedMult = 0.94
att.Mult_DrawTime = 1.12
att.Mult_SightTime = 1.12
att.Mult_Sway = 1.16

att.ActivateElements = {"barrel_sd"}
att.GivesFlags = {"vector_sd"}

    ArcCW.LoadAttachmentType(att, "uc_vector_barrel_sd")
end
-- END BUNDLED ATTACHMENT: uc_vector_barrel_sd.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_cal_10mm.lua
do
    local att = {}

att.PrintName = "KRISS Vector 10mm Auto Conversion"
att.AbbrevName = "10mm Auto"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C10 10mm Auto Conversion"
end

att.SortOrder = 5
att.Icon = Material("entities/att/uc_bullets/10.png", "smooth mips")
att.Description = "A hotter round in a narrower case, which trades bullet weight for the speed to keep hitting at distance. The counterweight is not quite matched to it, so the mechanism gives back a little less than it does on the load it was built for, and in exchange the weapon stops being a room clearing tool only."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_vector_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "10mm Auto"

att.Override_Damage = ArcCW.UC.StdDmg["10mm"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["10mm"].min
att.Override_Penetration = ArcCW.UC.StdDmg["10mm"].pen
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["10mm"].vel

att.SuperVTune = 0.85

att.Mult_Range = 1.45
att.Mult_RangeMin = 1.5
att.Mult_RPM = 0.92
att.Mult_ClipSize = 1.08
att.Mult_Recoil = 1.08
att.Mult_RecoilSide = 1.05

att.Override_TracerNum = 1
att.Override_TracerNum_Priority = 0.5

att.Override_ShellModel = "models/weapons/arccw/uc_shells/40sw.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 1.02

att.ActivateElements = {"cal_10mm"}
att.GivesFlags = {"vector_10mm"}

local path = ")^uc_vector/"
local path2 = ")^weapons/arccw_ur/1911/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {path .. "fire_10mm_sup_1.wav", path .. "fire_10mm_sup_2.wav", path .. "fire_10mm_sup_3.wav", path .. "fire_10mm_sup_4.wav"}
    else
        return {path .. "fire_10mm_1.wav", path .. "fire_10mm_2.wav", path .. "fire_10mm_3.wav", path .. "fire_10mm_4.wav"}
    end
end

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {path2 .. "fire-10-dist-01.ogg", path2 .. "fire-10-dist-02.ogg", path2 .. "fire-10-dist-03.ogg", path2 .. "fire-10-dist-04.ogg", path2 .. "fire-10-dist-05.ogg", path2 .. "fire-10-dist-06.ogg"}
end

    ArcCW.LoadAttachmentType(att, "uc_vector_cal_10mm")
end
-- END BUNDLED ATTACHMENT: uc_vector_cal_10mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_cal_308.lua
do
    local att = {}

att.PrintName = "KRISS Vector .308 Conversion"
att.AbbrevName = ".308 Winchester"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C308 .308 Conversion"
end

att.SortOrder = 6
att.Icon = Material("entities/att/uc_bullets/762x51.png", "smooth mips")
att.Description = "A rifle cartridge forced through a frame that was designed around pistol pressures. It hits harder than anything else the weapon will chamber and it reaches out past anything a submachine gun has any business shooting at. It also slams the counterweight to the end of its travel every single shot, which is the one condition under which the whole mechanism stops helping."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_vector_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = ".308 Winchester"
att.Override_Trivia_Mechanism = "Delayed Blowback, Super V (Overdriven)"

att.Override_Damage = ArcCW.UC.StdDmg["762_51"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["762_51"].min
att.Override_Penetration = ArcCW.UC.StdDmg["762_51"].pen
att.Override_PhysBulletMuzzleVelocity = 640

att.SuperVTune = 0.35

att.Mult_Range = 3.2
att.Mult_RPM = 0.55
att.Mult_ReloadTime = 1.15
att.Mult_ClipSize = 0.6
att.Mult_AccuracyMOA = 0.85
att.Mult_HipDispersion = 1.35

att.Mult_Recoil = 2.35
att.Mult_RecoilSide = 1.8
att.Mult_VisualRecoilMult = 2.2
att.Mult_Sway = 1.15

att.Add_MalfunctionMean = -160

att.Override_TracerNum = 1
att.Override_TracerNum_Priority = 0.5

att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
att.Override_ShellScale = 1.2

att.Mult_ShootPitch = 0.9
att.Mult_ShootVol = 1.1

att.ActivateElements = {"cal_308"}
att.GivesFlags = {"vector_308"}

local path = ")^uc_vector/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {path .. "fire_308_1_sup.wav", path .. "fire_308_2_sup.wav", path .. "fire_308_3_sup.wav", path .. "fire_308_4_sup.wav"}
    else
        return {path .. "fire_308_1.wav", path .. "fire_308_2.wav", path .. "fire_308_3.wav", path .. "fire_308_4.wav"}
    end
end

local tail = ")^/arccw_uc/common/308/"

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

    ArcCW.LoadAttachmentType(att, "uc_vector_cal_308")
end
-- END BUNDLED ATTACHMENT: uc_vector_cal_308.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_cal_9mm.lua
do
    local att = {}

att.PrintName = "KRISS Vector 9x19mm Conversion"
att.AbbrevName = "9x19mm Parabellum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C9 9x19mm Conversion"
end

att.SortOrder = 4
att.Icon = Material("entities/att/uc_bullets/9x19.png", "smooth mips")
att.Description = "A bolt face, barrel and magazine well cut for the cheapest round anybody stocks. It fits more into the same magazine and it costs almost nothing to feed. It also weighs half what the counterweight was tuned around, so the mechanism has far less to push against and the weapon behaves much more like an ordinary submachine gun."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_vector_cal"

att.AutoStats = true

att.Override_Trivia_Calibre = "9x19mm Parabellum"

att.Override_Damage = ArcCW.UC.StdDmg["9mm"].max
att.Override_DamageMin = ArcCW.UC.StdDmg["9mm"].min
att.Override_Penetration = ArcCW.UC.StdDmg["9mm"].pen
att.Override_PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["9mm"].vel

att.SuperVTune = 0.7

att.Mult_Range = 1.2
att.Mult_RPM = 1.1
att.Mult_ReloadTime = 0.95
att.Mult_ClipSize = 1.32
att.Mult_AccuracyMOA = 0.92

att.Override_TracerNum = 1
att.Override_TracerNum_Priority = 0.5

att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
att.Override_ShellScale = 1

att.Mult_ShootPitch = 1.06

att.ActivateElements = {"cal_9mm"}
att.GivesFlags = {"vector_9mm"}

local path = ")^uc_vector/"

att.Hook_GetShootSound = function(wep, sound)
    if wep:GetBuff_Override("Silencer") then
        return {path .. "fire_9mm_sup_1.wav", path .. "fire_9mm_sup_2.wav", path .. "fire_9mm_sup_3.wav", path .. "fire_9mm_sup_4.wav"}
    else
        return {path .. "fire_9mm_1.wav", path .. "fire_9mm_2.wav", path .. "fire_9mm_3.wav", path .. "fire_9mm_4.wav"}
    end
end

local tail = ")^/arccw_uc/common/9x19/"

att.Hook_GetDistantShootSoundOutdoors = function(wep, distancesound)
    if wep:GetBuff_Override("Silencer") then return end

    return {
        tail .. "fire-dist-9x19-pistol-ext-01.ogg",
        tail .. "fire-dist-9x19-pistol-ext-02.ogg",
        tail .. "fire-dist-9x19-pistol-ext-03.ogg",
        tail .. "fire-dist-9x19-pistol-ext-04.ogg",
        tail .. "fire-dist-9x19-pistol-ext-05.ogg",
        tail .. "fire-dist-9x19-pistol-ext-06.ogg"
    }
end

    ArcCW.LoadAttachmentType(att, "uc_vector_cal_9mm")
end
-- END BUNDLED ATTACHMENT: uc_vector_cal_9mm.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_foregrip.lua
do
    local att = {}

att.PrintName = "KRISS Vector Angled Foregrip"
att.AbbrevName = "Angled Foregrip"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C45 Angled Foregrip"
end

att.Icon = Material("entities/vectorgrip.png", "smooth mips")
att.Description = "The factory grip that clamps to the rail under the shroud. Holding the weapon by it changes where the support hand sits entirely, which is the only way to actually pull the muzzle down against a mechanism that is already trying to do the same thing."
att.AutoStats = true

att.Slot = "uc_vector_grip"
att.SortOrder = 1

att.VectorForegrip = true

att.Mult_Recoil = 0.9
att.Mult_RecoilSide = 0.82
att.Mult_VisualRecoilMult = 0.88
att.Mult_HipDispersion = 0.85
att.Mult_AccuracyMOA = 0.95

att.Mult_Sway = 0.92
att.Mult_SightTime = 1.05
att.Mult_SpeedMult = 0.98

att.ActivateElements = {"vector_grip"}
att.GivesFlags = {"vector_foregrip"}

    ArcCW.LoadAttachmentType(att, "uc_vector_foregrip")
end
-- END BUNDLED ATTACHMENT: uc_vector_foregrip.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_laser.lua
do
    local att = {}

att.PrintName = "KRISS Vector Rail Laser"
att.AbbrevName = "Rail Laser"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C45 Rail Laser"
end

att.Icon = Material("entities/vectortacrun.png", "smooth mips")
att.Description = "A visible laser clamped to the side rail and zeroed at close range, which is the only range this weapon was built for. It is quicker to put on target than the sights and it tells everyone in the room roughly where the shooter is standing."
att.AutoStats = true

att.Slot = "uc_vector_tac"
att.SortOrder = 1
att.Free = true

att.Mult_HipDispersion = 0.78
att.Mult_SightTime = 1.02

att.ActivateElements = {"laser"}
att.GivesFlags = {"vector_laser"}

    ArcCW.LoadAttachmentType(att, "uc_vector_laser")
end
-- END BUNDLED ATTACHMENT: uc_vector_laser.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_mag_10.lua
do
    local att = {}

att.PrintName = "KRISS Vector 13-Round Magazine"
att.AbbrevName = "13-Round Magazine"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C45 13-Round Magazine"
end

att.SortOrder = 4
att.Icon = Material("entities/att/acwatt_ud_glock_mag_33.png", "smooth mips")
att.Description = "A plain service pistol magazine with no extension sleeve on it. It sits flush with the bottom of the well, which is the only way this weapon will ever be carried comfortably, and it runs dry before the mechanism has finished settling down."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_vector_mag"

att.AutoStats = true

att.Override_ClipSize = 13
att.Override_ClipSize_Priority = 3

att.Mult_ReloadTime = 0.88
att.Mult_SightTime = 0.94
att.Mult_Sway = 0.9

att.Mult_SpeedMult = 1.05
att.Mult_SightedSpeedMult = 1.04
att.Mult_ShootSpeedMult = 1.05

att.ActivateElements = {"mag_13"}
att.GivesFlags = {"vector_mag_13"}

    ArcCW.LoadAttachmentType(att, "uc_vector_mag_10")
end
-- END BUNDLED ATTACHMENT: uc_vector_mag_10.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_mag_50.lua
do
    local att = {}

att.PrintName = "KRISS Vector 50-Round Drum"
att.AbbrevName = "50-Round Drum"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C45 50-Round Drum"
end

att.SortOrder = 5
att.Icon = Material("entities/att/ur_mp5/mag50.png", "smooth mips")
att.Description = "A drum that feeds into the same well as the box magazines. Fifty rounds at this cyclic rate is two and a half seconds of trigger, which is more than long enough for the counterweight to do everything it is capable of doing."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_vector_mag"

att.AutoStats = true
att.HideIfBlocked = true

att.Override_ClipSize = 50
att.Override_ClipSize_Priority = 3

att.Mult_ReloadTime = 1.18
att.Mult_SightTime = 1.12
att.Mult_Sway = 1.14

att.Mult_SpeedMult = 0.92
att.Mult_SightedSpeedMult = 0.9
att.Mult_ShootSpeedMult = 0.9

att.Mult_MalfunctionMean = 0.9
att.Mult_HipDispersion = 1.05

att.ActivateElements = {"mag_drum"}
att.GivesFlags = {"vector_mag_drum"}

    ArcCW.LoadAttachmentType(att, "uc_vector_mag_50")
end
-- END BUNDLED ATTACHMENT: uc_vector_mag_50.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_mitigator_heavy.lua
do
    local att = {}

att.PrintName = "Heavy Counterweight"
att.AbbrevName = "Heavy Weight"

att.Icon = Material("entities/tfa_trepang2_vector.png", "smooth mips")
att.Description = "A denser slug fitted into the counterweight channel. It takes longer to get moving and longer to stop, so the weapon is slower into the shoulder and slower to change direction, but once the mechanism is running there is almost nothing left of the muzzle rise."
att.AutoStats = true

att.Slot = "uc_vector_lower"
att.SortOrder = 4

att.SuperVGain = 1.25

att.Mult_Sway = 1.12
att.Mult_SpeedMult = 0.92
att.Mult_SightTime = 1.18
att.Mult_ShootSpeedMult = 0.9
att.Mult_DrawTime = 1.12
att.Mult_HolsterTime = 1.1

att.Mult_HipDispersion = 0.92

att.GivesFlags = {"vector_heavy"}

    ArcCW.LoadAttachmentType(att, "uc_vector_mitigator_heavy")
end
-- END BUNDLED ATTACHMENT: uc_vector_mitigator_heavy.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_mitigator_light.lua
do
    local att = {}

att.PrintName = "Light Counterweight"
att.AbbrevName = "Light Weight"

att.Icon = Material("entities/tfa_trepang2_vector.png", "smooth mips")
att.Description = "An alloy counterweight machined down to save a pound off the back of the receiver. Everything about handling the weapon gets quicker, and the mechanism has correspondingly less mass to trade the recoil impulse against."
att.AutoStats = true

att.Slot = "uc_vector_lower"
att.SortOrder = 5

att.SuperVGain = 0.6

att.Mult_Sway = 0.9
att.Mult_SpeedMult = 1.08
att.Mult_SightTime = 0.84
att.Mult_ShootSpeedMult = 1.08
att.Mult_DrawTime = 0.86
att.Mult_HolsterTime = 0.86

att.Mult_HipDispersion = 1.08

att.GivesFlags = {"vector_light"}

    ArcCW.LoadAttachmentType(att, "uc_vector_mitigator_light")
end
-- END BUNDLED ATTACHMENT: uc_vector_mitigator_light.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_receiver_crb.lua
do
    local att = {}

att.PrintName = "KRISS Vector Carbine Receiver"
att.AbbrevName = "CRB Receiver"

if !GetConVar("arccw_truenames"):GetBool() then
    att.PrintName = "Korsair C45 Carbine Receiver"
end

att.Icon = Material("entities/tfa_trepang2_vector.png", "smooth mips")
att.Description = "The civilian upper, with the automatic sear left out of it and a barrel long enough to be sold over a counter. What it loses in volume of fire it gets back in a trigger that breaks cleanly and a mechanism that is not being asked to cycle twenty times a second."
att.AutoStats = true

att.Slot = "uc_vector_upper"
att.SortOrder = 4

att.RequireFlags = {"vector_barrel_long"}

att.Override_Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

att.Mult_AccuracyMOA = 0.78
att.Mult_HipDispersion = 1.08
att.Mult_Recoil = 0.9
att.Mult_Range = 1.1
att.Mult_PhysBulletMuzzleVelocity = 1.06

att.Mult_Sway = 1.05
att.Mult_SightTime = 1.06

att.GivesFlags = {"vector_crb"}

    ArcCW.LoadAttachmentType(att, "uc_vector_receiver_crb")
end
-- END BUNDLED ATTACHMENT: uc_vector_receiver_crb.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_stock_folded.lua
do
    local att = {}

att.PrintName = "Folded Stock"
att.AbbrevName = "Folded Stock"

att.Icon = Material("entities/mw_stockhvy.png", "smooth mips")
att.Description = "The factory stock left folded over the top of the receiver instead of extended. The weapon comes out of a bag considerably faster like this, and there is nothing behind the grip to stop the counterweight from taking the recoil straight into the wrist."
att.AutoStats = true

att.Slot = "uc_vector_stock"
att.SortOrder = 4
att.Free = true

att.Mult_Recoil = 1.18
att.Mult_RecoilSide = 1.12
att.Mult_VisualRecoilMult = 1.3
att.Mult_Sway = 1.35
att.Mult_AccuracyMOA = 1.1

att.Mult_SightTime = 0.84
att.Mult_SightedSpeedMult = 1.08
att.Mult_ShootSpeedMult = 1.08

att.Mult_DrawTime = 0.84
att.Mult_HolsterTime = 0.84

att.ActivateElements = {"stock_folded"}
att.GivesFlags = {"vector_stock_folded"}

    ArcCW.LoadAttachmentType(att, "uc_vector_stock_folded")
end
-- END BUNDLED ATTACHMENT: uc_vector_stock_folded.lua

-- BEGIN BUNDLED ATTACHMENT: uc_vector_stock_remove.lua
do
    local att = {}

att.PrintName = "No Stock"
att.AbbrevName = "No Stock"

att.Icon = Material("entities/mw_stockhvy.png", "smooth mips")
att.Description = "Stock and hinge unbolted and left behind. What remains is a very heavy pistol with a very fast trigger, and the only thing standing between the shooter and the whole recoil impulse is the counterweight."
att.Desc_Pros = {}
att.Desc_Cons = {}
att.Desc_Neutrals = {}
att.Slot = "uc_vector_stock"

att.AutoStats = true
att.Free = true
att.SortOrder = 5

att.Mult_Recoil = 1.4
att.Mult_RecoilSide = 1.28
att.Mult_VisualRecoilMult = 1.6
att.Mult_Sway = 1.7
att.Mult_AccuracyMOA = 1.2

att.Mult_SightTime = 0.72
att.Mult_SightedSpeedMult = 1.14
att.Mult_ShootSpeedMult = 1.14

att.Mult_DrawTime = 0.72
att.Mult_HolsterTime = 0.72
att.Add_BarrelLength = -3

att.ActivateElements = {"stock_none"}
att.GivesFlags = {"vector_stock_none"}

    ArcCW.LoadAttachmentType(att, "uc_vector_stock_remove")
end
-- END BUNDLED ATTACHMENT: uc_vector_stock_remove.lua
