SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "Brnos VZ-11"
SWEP.TrueName = "CZ Bren 805 A1"
SWEP.Trivia_Class = "Battle Rifle"
SWEP.Trivia_Desc = [[Named for Brno and Enfield, the 805 replaced the vz. 58 in Czech service. Designed for multi-role versatility with a quick-change barrel system and full ambidextrous controls. It functions as a standard, straightforward workhorse that handles adverse combat environments without skipping a beat during extended firefights.]]
SWEP.Trivia_Manufacturer = "Brnos Zbrojovka"
SWEP.Trivia_Calibre = "7.62x51mm NATO"
SWEP.Trivia_Mechanism = "Short-Stroke Piston, Rotating Bolt"
SWEP.Trivia_Country = "Czech Republic"
SWEP.Trivia_Year = 2011

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Ceska Zbrojovka"
end

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/uc/c_uc_cz805.mdl"
SWEP.WorldModel = "models/weapons/uc/c_uc_cz805.mdl"
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 65

SWEP.DefaultBodygroups = "000000"

SWEP.Damage = ArcCW.UC.StdDmg["762_51"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["762_51"].min
SWEP.Range = 220
SWEP.RangeMin = 45
SWEP.Penetration = ArcCW.UC.StdDmg["762_51"].pen
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["762_51"].vel
SWEP.CanFireUnderwater = false

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 20
SWEP.ExtendedClipSize = 30
SWEP.ReducedClipSize = 10

SWEP.Recoil = 0.78
SWEP.RecoilSide = 0.58
SWEP.RecoilRise = 0.4
SWEP.VisualRecoilMult = 1.15
SWEP.MaxRecoilBlowback = 0.7
SWEP.MaxRecoilPunch = 0.85
SWEP.Sway = 1

SWEP.Malfunction = true
SWEP.MalfunctionMean = 560
SWEP.MalfunctionTakeRound = false

SWEP.Delay = 60 / 700
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = -3,
        PostBurstDelay = 0.12,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 80

SWEP.AccuracyMOA = 3
SWEP.HipDispersion = 400
SWEP.MoveDispersion = 110
SWEP.JumpDispersion = 820

SWEP.Primary.Ammo = "ar2"
SWEP.MagID = "cz805"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

local path = ")uc_cz805/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local rutle = {common .. "movement-rifle-01.ogg", common .. "movement-rifle-02.ogg", common .. "movement-rifle-03.ogg", common .. "movement-rifle-04.ogg"}

SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.ShootDrySound = {path .. "empty.wav"}
SWEP.FiremodeSound = {path .. "fireselect.wav"}

SWEP.ShootSound = {
    path .. "fire-1.wav",
    path .. "fire-2.wav",
    path .. "fire-3.wav"
}
SWEP.ShootSoundSilenced = {
    path .. "fire-sil.wav"
}

local tail = ")/arccw_uc/common/308/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-308-rif-ext-01.ogg",
    tail .. "fire-dist-308-rif-ext-02.ogg",
    tail .. "fire-dist-308-rif-ext-03.ogg",
    tail .. "fire-dist-308-rif-ext-04.ogg",
    tail .. "fire-dist-308-rif-ext-05.ogg",
    tail .. "fire-dist-308-rif-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    tail .. "fire-dist-308-rif-int-01.ogg",
    tail .. "fire-dist-308-rif-int-02.ogg",
    tail .. "fire-dist-308-rif-int-03.ogg",
    tail .. "fire-dist-308-rif-int-04.ogg",
    tail .. "fire-dist-308-rif-int-05.ogg",
    tail .. "fire-dist-308-rif-int-06.ogg"
}
SWEP.DistantShootSoundOutdoorsSilenced = {
    common .. "sup-tail-01.ogg",
    common .. "sup-tail-02.ogg",
    common .. "sup-tail-03.ogg",
    common .. "sup-tail-04.ogg",
    common .. "sup-tail-05.ogg",
    common .. "sup-tail-06.ogg"
}
SWEP.DistantShootSoundIndoorsSilenced = {
    common .. "fire-dist-int-pistol-light-01.ogg",
    common .. "fire-dist-int-pistol-light-02.ogg",
    common .. "fire-dist-int-pistol-light-03.ogg",
    common .. "fire-dist-int-pistol-light-04.ogg",
    common .. "fire-dist-int-pistol-light-05.ogg",
    common .. "fire-dist-int-pistol-light-06.ogg"
}

SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.MuzzleEffect = "muzzleflash_ak47"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellScale = 1.25
SWEP.ShellPitch = 95

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 3

SWEP.SpeedMult = 0.9
SWEP.SightedSpeedMult = 0.78
SWEP.SightTime = 0.3
SWEP.ShootSpeedMult = 0.84

SWEP.BulletBones = {
    [1] = "Bullet",
    [2] = "Bullet_2",
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-2.52, -1.951, -0.075),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
    CrosshairInSights = false,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "ar2"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0.68, 0, -0.04)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(5.76, 0, 0.12)
SWEP.CustomizeAng = Angle(29.268, 30.244, 25.366)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetHip = Vector(0, 0, 0)

SWEP.BarrelLength = 26
SWEP.ExtraSightDist = 10

SWEP.AttachmentElements = {
    ["conv_bren2"] = {
        VMBodygroups = {
            {ind = 0, bg = 2},
            {ind = 1, bg = 3},
            {ind = 2, bg = 2},
            {ind = 3, bg = 3},
            {ind = 4, bg = 3},
            {ind = 5, bg = 20},
        },
        WMBodygroups = {
            {ind = 0, bg = 2},
            {ind = 1, bg = 3},
            {ind = 2, bg = 2},
            {ind = 3, bg = 3},
            {ind = 4, bg = 3},
            {ind = 5, bg = 20},
        },
    },
    ["mag_bren2_10"] = {
        VMBodygroups = {{ind = 5, bg = 21}},
        WMBodygroups = {{ind = 5, bg = 21}},
    },
    ["barrel_long"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
        WMBodygroups = {
            {ind = 1, bg = 1},
        },
        AttPosMods = {
            [3] = {
                vpos = Vector(2.382, 0, 0),
            },
        },
    },
    ["barrel_short"] = {
        VMBodygroups = {
            {ind = 1, bg = 2},
            {ind = 2, bg = 1},
        },
        WMBodygroups = {
            {ind = 1, bg = 2},
            {ind = 2, bg = 1},
        },
        AttPosMods = {
            [3] = {
                vpos = Vector(-2.318, 0, 0),
            },
        },
    },
    ["no_irons"] = {
        VMBodygroups = {
            {ind = 3, bg = 2},
        },
        WMBodygroups = {
            {ind = 3, bg = 2},
        },
    },
    ["stock_folded"] = {
        VMBodygroups = {
            {ind = 4, bg = 1},
        },
        WMBodygroups = {
            {ind = 4, bg = 1},
        },
    },
    ["stock_full"] = {
        VMBodygroups = {
            {ind = 4, bg = 2},
        },
        WMBodygroups = {
            {ind = 4, bg = 2},
        },
    },
    ["stock_none"] = {
        VMBodygroups = {
            {ind = 4, bg = 3},
        },
        WMBodygroups = {
            {ind = 4, bg = 3},
        },
    },
    ["conv_9mm"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
        },
        WMBodygroups = {
            {ind = 0, bg = 1},
        },
    },
    ["mag_5"] = {
        VMBodygroups = {
            {ind = 5, bg = 1},
        },
        WMBodygroups = {
            {ind = 5, bg = 1},
        },
    },
    ["mag_15"] = {
        VMBodygroups = {
            {ind = 5, bg = 2},
        },
        WMBodygroups = {
            {ind = 5, bg = 2},
        },
    },
    ["mag_40"] = {
        VMBodygroups = {
            {ind = 5, bg = 3},
        },
        WMBodygroups = {
            {ind = 5, bg = 3},
        },
    },
    ["mag_60"] = {
        VMBodygroups = {
            {ind = 5, bg = 4},
        },
        WMBodygroups = {
            {ind = 5, bg = 4},
        },
    },
    ["mag_100"] = {
        VMBodygroups = {
            {ind = 5, bg = 5},
        },
        WMBodygroups = {
            {ind = 5, bg = 5},
        },
    },
    ["mag_556_20"] = {
        VMBodygroups = {
            {ind = 5, bg = 7},
        },
        WMBodygroups = {
            {ind = 5, bg = 7},
        },
    },
    ["mag_556_40"] = {
        VMBodygroups = {
            {ind = 5, bg = 9},
        },
        WMBodygroups = {
            {ind = 5, bg = 9},
        },
    },
    ["mag_556_60"] = {
        VMBodygroups = {
            {ind = 5, bg = 10},
        },
        WMBodygroups = {
            {ind = 5, bg = 10},
        },
    },
    ["mag_556_100"] = {
        VMBodygroups = {
            {ind = 5, bg = 11},
        },
        WMBodygroups = {
            {ind = 5, bg = 11},
        },
    },
    ["mag_556_pmag"] = {
        VMBodygroups = {
            {ind = 5, bg = 12},
        },
        WMBodygroups = {
            {ind = 5, bg = 12},
        },
    },
    ["mag_300blk_40"] = {
        VMBodygroups = {
            {ind = 5, bg = 14},
        },
        WMBodygroups = {
            {ind = 5, bg = 14},
        },
    },
    ["mag_300blk_75"] = {
        VMBodygroups = {
            {ind = 5, bg = 15},
        },
        WMBodygroups = {
            {ind = 5, bg = 15},
        },
    },
    ["mag_762_75"] = {
        VMBodygroups = {
            {ind = 5, bg = 17},
        },
        WMBodygroups = {
            {ind = 5, bg = 17},
        },
    },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic", "optic_lp", "optic_sniper"},
        Bone = "A_Optic",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, 90),
        },
        InstalledEles = {"no_irons"},
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_cz805_barrel"},
        ExcludeFlags = {"cz805_bren2"},
        DefaultAttName = "14\" Service Barrel",
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "A_Muzzle",
        Offset = {
            vpos = Vector(-0.6, 0, 0),
            vang = Angle(0, 0, 0),
        },
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip", "bipod", "ubgl"},
        Bone = "A_Foregrip",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 90, 0),
        },
        MergeSlots = {14},
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "A_LaserFlashlight",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, 0),
        },
    },
    {
        PrintName = "Conversion",
        Slot = {"uc_cz805_cal"},
        DefaultAttIcon = Material("entities/att/uc_bullets/762x51.png", "mips smooth"),
        DefaultAttName = "7.62x51mm NATO"
    },
    {
        PrintName = "Magazine",
        Slot = {"uc_cz805_mag"},
        DefaultAttName = "20-Round Magazine"
    },
    {
        PrintName = "Stock",
        Slot = {"uc_cz805_stock"},
        ExcludeFlags = {"cz805_bren2"},
        DefaultAttName = "Folding Stock"
    },
    {
        PrintName = "Fire Group",
        Slot = "fcg",
        DefaultAttName = "Standard FCG"
    },
    {
        PrintName = "Training Package",
        Slot = "uc_tp",
        DefaultAttName = "Basic Training"
    },
    {
        PrintName = "Internals",
        Slot = "uc_fg",
        DefaultAttName = "Standard Internals"
    },
    {
        PrintName = "Powder Load",
        Slot = "uc_powder",
        DefaultAttName = "Standard Load"
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"FMJ\" Full Metal Jacket",
        DefaultAttIcon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth"),
        Slot = "uc_ammo",
    },
    {
        PrintName = "Underbarrel Weapon",
        Slot = {"uc_ubgl"},
        Bone = "A_Foregrip",
        Offset = {
            vpos = Vector(0, -0.6, 1.1),
            vang = Angle(0, 90, 0),
        },
        Hidden = true,
    },
    {
        PrintName = "Perk",
        Slot = "perk"
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "base_idle",
        Time = 0.033,
    },
    ["ready"] = {
        Source = "base_ready",
        Time = 2.25,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.3,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0.02},
            {s = rottle, t = 0.1},
            {s = path .. "boltback.wav", t = 0.719, c = CHAN_ITEM},
            {s = path .. "boltforward.wav", t = 1.125},
        },
    },
    ["draw"] = {
        Source = "base_draw",
        Time = 0.71,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0.02},
            {s = rottle, t = 0.08},
        },
    },
    ["holster"] = {
        Source = "base_holster",
        Time = 0.559,
        LHIK = true,
        LHIKIn = 1,
        LHIKOut = 1,
        SoundTable = {
            {s = common .. "cloth_2.ogg", t = 0},
        },
    },
    ["idle_sprint"] = {
        Source = "base_sprint",
        Time = 0.743,
    },
    ["fire"] = {
        Source = "base_fire",
        Time = 0.35,
        ShellEjectAt = 0,
        SoundTable = {
            {s = path .. "mech.wav", t = 0.005, v = 0.55},
        },
    },
    ["fire_empty"] = {
        Source = "base_fire",
        Time = 0.35,
        ShellEjectAt = 0,
        SoundTable = {
            {s = path .. "mech_empty.wav", t = 0.005, l = 85},
        },
    },
    ["fire_iron"] = {
        Source = {"iron_fire_a", "iron_fire_b", "iron_fire_c", "iron_fire_d", "iron_fire_e", "iron_fire_f", "iron_fire_g"},
        Time = 0.35,
        ShellEjectAt = 0,
        SoundTable = {
            {s = path .. "mech.wav", t = 0.005, v = 0.55},
        },
    },
    ["fire_iron_empty"] = {
        Source = {"iron_fire_a", "iron_fire_b", "iron_fire_c", "iron_fire_d", "iron_fire_e", "iron_fire_f", "iron_fire_g"},
        Time = 0.35,
        ShellEjectAt = 0,
        SoundTable = {
            {s = path .. "mech_empty.wav", t = 0.005, l = 85},
        },
    },
    ["fire_dry"] = {
        Source = "base_dryfire",
        Time = 0.667,
        SoundTable = {
            {s = path .. "empty.wav", t = 0},
        },
    },
    ["fire_dry_iron"] = {
        Source = "iron_dryfire",
        Time = 0.667,
        SoundTable = {
            {s = path .. "empty.wav", t = 0},
        },
    },
    ["fireselect"] = {
        Source = "base_fireselect",
        Time = 0.833,
        SoundTable = {
            {s = path .. "fireselect.wav", t = 0.367, c = CHAN_ITEM},
        },
    },
    ["fireselect_iron"] = {
        Source = "iron_fireselect",
        Time = 0.833,
        SoundTable = {
            {s = path .. "fireselect.wav", t = 0.367, c = CHAN_ITEM},
        },
    },

    ["reload"] = {
        Source = "base_reload",
        Time = 115 / 35,
        Framerate = 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magrelease.ogg", t = 13 / 35, c = CHAN_ITEM},
            {s = path .. "mag_out.wav", t = 17 / 35, c = CHAN_ITEM},
            {s = rutle, t = 32 / 35},
            {s = path .. "mag_in.wav", t = 59 / 35, c = CHAN_ITEM},
            {s = path .. "mag_hit.wav", t = 80 / 35, c = CHAN_ITEM},
        },
    },

    ["reload_empty"] = {
        Source = "base_reloadempty",
        Time = 136 / 35,
        Framerate = 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magrelease.ogg", t = 13 / 35, c = CHAN_ITEM},
            {s = path .. "mag_out.wav", t = 17 / 35, c = CHAN_ITEM},
            {s = rutle, t = 32 / 35},
            {s = path .. "mag_in.wav", t = 62 / 35, c = CHAN_ITEM},
            {s = path .. "mag_hit.wav", t = 85 / 35, c = CHAN_ITEM},
            {s = path .. "boltforward.wav", t = 107 / 35, c = CHAN_ITEM},
        },
    },
}

local SETTLE = 5

local function hasElement(wep, name)
    for _, v in ipairs(wep:GetActiveElements()) do
        if v == name then return true end
    end

    return false
end

local function walk(wep)
    return math.Clamp(((wep:GetBurstCount() or 0) - 1) / SETTLE, 0, 1)
end

SWEP.Hook_ModDispersion = function(wep, hip)
    return hip * Lerp(walk(wep), 0.55, 1.4)
end

SWEP.Hook_ModifyRecoil = function(wep, rec)
    local k = walk(wep)

    rec.Recoil = rec.Recoil * Lerp(k, 0.8, 1.3)
    rec.RecoilSide = rec.RecoilSide * Lerp(k, 0.85, 1.35)
    rec.VisualRecoilMul = rec.VisualRecoilMul * Lerp(k, 0.85, 1.25)

    return rec
end

local CONV_MAG = {
    {"uc_cz805_cal_bren2", 20, "20-Round BREN 2 Magazine"},
    {"uc_cz805_cal_556", 8, "30-Round STANAG"},
    {"uc_cz805_cal_300blk", 13, "30-Round Magazine"},
    {"uc_cz805_cal_762", 16, "30-Round Magazine"},
    {"uc_cz805_cal_50beo", 18, "10-Round Magazine"},
    {"uc_cz805_cal_9mm", 6, "30-Round Magazine"},
}

local function conversion(wep)
    for _, v in ipairs(CONV_MAG) do
        if hasElement(wep, v[1]) then return v end
    end
end

SWEP.Hook_GetDefaultAttName = function(wep, slot)
    local s = wep.Attachments[slot]

    if !s or s.PrintName != "Magazine" then return end

    local v = conversion(wep)

    return v and v[3] or "20-Round Magazine"
end

SWEP.Hook_ModifyBodygroups = function(wep, data)
    local mdl = data.vm

    if !IsValid(mdl) then return end

    if hasElement(wep, "conv_bren2") then
        mdl:SetBodygroup(0, 2)
        mdl:SetBodygroup(1, 3)
        mdl:SetBodygroup(2, 2)
        mdl:SetBodygroup(3, hasElement(wep, "no_irons") and 2 or 3)
        mdl:SetBodygroup(4, 3)
        mdl:SetBodygroup(5, hasElement(wep, "mag_bren2_10") and 21 or 20)
        return
    end

    if !hasElement(wep, "no_irons") and hasElement(wep, "barrel_short") then
        mdl:SetBodygroup(3, 1)
    end

    if mdl:GetBodygroup(5) == 0 then
        local v = conversion(wep)

        if v then mdl:SetBodygroup(5, v[2]) end
    end
end

local BASE_DESC = SWEP.Trivia_Desc

SWEP.Hook_DescChange = function(wep, desc)
    local k = walk(wep)
    local state

    if k <= 0 then
        state = "settled, first round is the accurate one"
    elseif k < 0.6 then
        state = "walking off the aim point"
    else
        state = "climbing, let go and let it settle"
    end

    local description = BASE_DESC

    if hasElement(wep, "conv_bren2") then
        description = "CZ Bren 2 in 7.62x51mm NATO, with its own receiver, furniture, iron sights and magazine system. It feeds from a 20-round BREN 2 magazine, with a compact 10-round magazine available."
    end

    return description .. "\n\nGas piston: " .. state .. "."
end
