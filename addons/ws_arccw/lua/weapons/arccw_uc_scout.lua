SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "Steinhauer JG-98"
SWEP.TrueName = "Steyr Scout"
SWEP.Trivia_Class = "Bolt-Action Rifle"
SWEP.Trivia_Desc = "Lightweight bolt-action rifle introduced in the late 1990s as a commercial realization of Jeff Cooper's ideal universal military and civilian scout rifle concept.\n\nChambered in .308 Winchester and comes with a synthetic polymer stock and an integrated bipod. It handles like a traditional hunting rifle while offering the rugged durability required for field operations and tactical tracking."
SWEP.Trivia_Manufacturer = "Steinhauer Industrie"
SWEP.Trivia_Calibre = ".308 Winchester"
SWEP.Trivia_Mechanism = "Rotating Bolt"
SWEP.Trivia_Country = "Austria"
SWEP.Trivia_Year = 1998

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Steyr Mannlicher"
end

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/uc/c_uc_scout.mdl"
SWEP.WorldModel = "models/uc/c_uc_scout.mdl"
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 65

SWEP.DefaultBodygroups = "0000"

SWEP.Damage = 75
SWEP.DamageMin = 42
SWEP.Range = 600
SWEP.RangeMin = 120
SWEP.Penetration = 20
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.PhysBulletMuzzleVelocity = 800
SWEP.CanFireUnderwater = false

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 5
SWEP.ExtendedClipSize = 10
SWEP.ReducedClipSize = 5

SWEP.ManualAction = true
SWEP.NoLastCycle = true
SWEP.ShotgunReload = true

SWEP.Recoil = 1.85
SWEP.RecoilSide = 0.75
SWEP.RecoilRise = 0.65
SWEP.RecoilPunch = 1.3
SWEP.VisualRecoilMult = 1.2
SWEP.MaxRecoilBlowback = 0.6
SWEP.MaxRecoilPunch = 1
SWEP.Sway = 1.1

SWEP.Bipod_Integral = true
SWEP.BipodDispersion = 0.2
SWEP.BipodRecoil = 0.35

SWEP.Malfunction = false
SWEP.MalfunctionMean = 600
SWEP.MalfunctionTakeRound = false

SWEP.Delay = 60 / 1000
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 90

SWEP.AccuracyMOA = 1.6
SWEP.HipDispersion = 750
SWEP.MoveDispersion = 220
SWEP.JumpDispersion = 1400

SWEP.Primary.Ammo = "ar2"
SWEP.MagID = "scout"

SWEP.ShootVol = 110
SWEP.ShootPitch = 100

local path = ")uc_scout/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local rutle = {common .. "movement-pistol-01.ogg", common .. "movement-pistol-02.ogg", common .. "movement-pistol-03.ogg", common .. "movement-pistol-04.ogg"}
local insert = {path .. "insert1.wav", path .. "insert2.wav", path .. "insert3.wav", path .. "insert4.wav"}

SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.ShootDrySound = {path .. "mech.wav"}
SWEP.FiremodeSound = {path .. "mech.wav"}

SWEP.ShootSound = {
    path .. "fire.wav"
}
SWEP.ShootSoundSilenced = {
    path .. "fire_sup.wav"
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
    common .. "sup-tail-06.ogg",
    common .. "sup-tail-07.ogg",
    common .. "sup-tail-08.ogg",
    common .. "sup-tail-09.ogg",
    common .. "sup-tail-10.ogg"
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

SWEP.MuzzleEffect = "muzzleflash_sniper"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellScale = 1.25
SWEP.ShellPitch = 85

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 3

SWEP.SpeedMult = 0.93
SWEP.SightedSpeedMult = 0.8
SWEP.SightTime = 0.4
SWEP.ShootSpeedMult = 0.85

SWEP.BulletBones = {
    [1] = "Bullet01",
    [2] = "Bullet02",
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-2.8, -2.927, 1.44),
    Ang = Angle(0, 0, 0),
    Magnification = 1.2,
    CrosshairInSights = false,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "ar2"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0, 1.5, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0, 0, 0)
SWEP.SprintAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(0.5, -0.5, -0.4)
SWEP.CrouchAng = Angle(0, 0, -3)

SWEP.CustomizePos = Vector(4.5, 1.6, 2.6)
SWEP.CustomizeAng = Angle(13.659, 34.146, 9.756)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetHip = Vector(0, 0, 0)

SWEP.BarrelLength = 38
SWEP.ExtraSightDist = 10

SWEP.AttachmentElements = {
    ["body_obrez"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
        },
        WMBodygroups = {
            {ind = 0, bg = 1},
        },
        NameChange = "Steinhauer JG-98 Obrez",
        TrueNameChange = "Steyr Scout Obrez",
    },
    ["barrel_stub"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
        WMBodygroups = {
            {ind = 1, bg = 1},
        },
        AttPosMods = {
            [3] = {
                vpos = Vector(0, 10.028, 0),
            },
        },
    },
    ["mag_10"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
        WMBodygroups = {
            {ind = 2, bg = 1},
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
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_scout_barrel"},
        DefaultAttName = "19\" Match Barrel",
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "A_Suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 90, 0),
        },
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip", "bipod", "ubgl"},
        Bone = "A_UnderBarrel",
        Offset = {
            vpos = Vector(0, 0, -1.526),
            vang = Angle(0, 90, 0),
        },
        MergeSlots = {13},
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "A_LaserFlashlight",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 0, 180),
        },
    },
    {
        PrintName = "Calibre",
        Slot = {"uc_scout_cal"},
        DefaultAttIcon = Material("entities/att/uc_bullets/762x51.png", "mips smooth"),
        DefaultAttName = ".308 Winchester",
    },
    {
        PrintName = "Magazine",
        Slot = {"uc_scout_mag"},
        DefaultAttName = "5-Round Magazine",
    },
    {
        PrintName = "Stock",
        Slot = {"uc_scout_stock"},
        DefaultAttName = "Factory Stock",
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
        Bone = "A_UnderBarrel",
        Offset = {
            vpos = Vector(0, 2.5, 0),
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
    ["idle_bipod"] = {
        Source = "deployed_idle",
        Time = 0.033,
    },
    ["ready"] = {
        Source = "base_ready",
        Time = 2.96,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.3,
        SoundTable = {
            {s = common .. "raise.ogg", t = 0.02},
            {s = rottle, t = 0.1},
            {s = path .. "bolt_back.wav", t = 0.96, c = CHAN_ITEM},
            {s = path .. "bolt_forward.wav", t = 1.32},
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
    ["fire"] = {
        Source = "base_fire_start",
        Time = 0.3,
    },
    ["fire_iron"] = {
        Source = "iron_fire_start",
        Time = 0.3,
    },
    ["fire_bipod"] = {
        Source = "deployed_fire_start",
        Time = 0.267,
    },
    ["fire_iron_bipod"] = {
        Source = "deployed_iron_fire_start",
        Time = 0.3,
    },
    ["fire_empty"] = {
        Source = "base_fire_last",
        Time = 0.3,
    },
    ["cycle"] = {
        Source = "base_fire_end",
        Time = 1.533,
        ShellEjectAt = 0.5,
        MinProgress = 1.1,
        SoundTable = {
            {s = path .. "bolt_back.wav", t = 0.433, c = CHAN_ITEM},
            {s = path .. "bolt_forward.wav", t = 0.8},
        },
    },
    ["cycle_iron"] = {
        Source = "iron_fire_end",
        Time = 1.754,
        ShellEjectAt = 0.596,
        MinProgress = 1.25,
        SoundTable = {
            {s = path .. "bolt_back.wav", t = 0.526, c = CHAN_ITEM},
            {s = path .. "bolt_forward.wav", t = 0.807},
        },
    },
    ["cycle_bipod"] = {
        Source = "deployed_fire_end",
        Time = 1.667,
        ShellEjectAt = 0.4,
        MinProgress = 1.15,
        SoundTable = {
            {s = path .. "bolt_back.wav", t = 0.433, c = CHAN_ITEM},
            {s = path .. "bolt_forward.wav", t = 0.8},
        },
    },
    ["cycle_iron_bipod"] = {
        Source = "deployed_iron_fire_end",
        Time = 1.471,
        ShellEjectAt = 0.441,
        MinProgress = 1.05,
        SoundTable = {
            {s = path .. "bolt_back.wav", t = 0.382, c = CHAN_ITEM},
            {s = path .. "bolt_forward.wav", t = 0.706},
        },
    },
    ["fire_dry"] = {
        Source = "base_dryfire",
        Time = 0.667,
        SoundTable = {
            {s = path .. "mech.wav", t = 0},
        },
    },
    ["fire_dry_iron"] = {
        Source = "iron_dryfire",
        Time = 0.667,
        SoundTable = {
            {s = path .. "mech.wav", t = 0},
        },
    },
    ["fire_dry_bipod"] = {
        Source = "deployed_dryfire",
        Time = 0.333,
        SoundTable = {
            {s = path .. "mech.wav", t = 0},
        },
    },
    ["fire_dry_iron_bipod"] = {
        Source = "deployed_iron_dryfire",
        Time = 0.333,
        SoundTable = {
            {s = path .. "mech.wav", t = 0},
        },
    },
    ["enter_bipod"] = {
        Source = "deploy_in",
        Time = 1,
        SoundTable = {
            {s = rottle, t = 0.1},
            {s = path .. "mech.wav", t = 0.6, c = CHAN_ITEM},
        },
    },
    ["exit_bipod"] = {
        Source = "deploy_out",
        Time = 1,
        SoundTable = {
            {s = path .. "mech.wav", t = 0.3, c = CHAN_ITEM},
            {s = rottle, t = 0.45},
        },
    },
    ["idle_sprint"] = {
        Source = "base_sprint",
        Time = 0.816,
    },
    ["sgreload_start"] = {
        Source = "base_reload_start",
        Time = 0.867,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        ShellEjectAt = 0.5,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.3,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "bolt_back_rechamber.wav", t = 0.367, c = CHAN_ITEM},
        },
    },
    ["sgreload_start_bipod"] = {
        Source = "deployed_reload_start",
        Time = 0.867,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        ShellEjectAt = 0.5,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.3,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "bolt_back_rechamber.wav", t = 0.367, c = CHAN_ITEM},
        },
    },
    ["sgreload_insert"] = {
        Source = "base_reload_insert",
        Time = 0.812,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.25,
        SoundTable = {
            {s = rutle, t = 0.05},
            {s = insert, t = 0.375, c = CHAN_ITEM},
        },
    },
    ["sgreload_insert_reserve"] = {
        Source = "base_reload_insert",
        Time = 0.58,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.25,
        SoundTable = {
            {s = rutle, t = 0.03},
            {s = insert, t = 0.268, c = CHAN_ITEM},
        },
    },
    ["sgreload_insert_bipod"] = {
        Source = "deployed_reload_insert",
        Time = 0.833,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.25,
        SoundTable = {
            {s = rutle, t = 0.05},
            {s = insert, t = 0.267, c = CHAN_ITEM},
        },
    },
    ["sgreload_insert_reserve_bipod"] = {
        Source = "deployed_reload_insert",
        Time = 0.595,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.25,
        SoundTable = {
            {s = rutle, t = 0.03},
            {s = insert, t = 0.191, c = CHAN_ITEM},
        },
    },
    ["sgreload_finish"] = {
        Source = "base_reload_end",
        Time = 1.033,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.4,
        SoundTable = {
            {s = path .. "bolt_forward_rechamber.wav", t = 0.2},
            {s = rottle, t = 0.45},
        },
    },
    ["sgreload_finish_empty"] = {
        Source = "base_reload_end_empty",
        Time = 1.033,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.4,
        SoundTable = {
            {s = path .. "bolt_forward_rechamber.wav", t = 0.2},
            {s = rottle, t = 0.45},
        },
    },
    ["sgreload_finish_bipod"] = {
        Source = "deployed_reload_end",
        Time = 1.067,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0.4,
        SoundTable = {
            {s = path .. "bolt_forward_rechamber.wav", t = 0.2},
            {s = rottle, t = 0.45},
        },
    },
}

local RESERVE = 2

local function hasElement(wep, name)
    for _, v in ipairs(wep:GetActiveElements()) do
        if v == name then return true end
    end

    return false
end

local function reserveLeft(wep)
    if hasElement(wep, "body_obrez") then return 0 end

    return math.max(RESERVE - wep:Clip1(), 0)
end

SWEP.Hook_SelectReloadAnimation = function(wep, anim)
    if reserveLeft(wep) <= 0 then return end

    if anim == "sgreload_insert" then
        return "sgreload_insert_reserve"
    elseif anim == "sgreload_insert_bipod" then
        return "sgreload_insert_reserve_bipod"
    end
end

SWEP.Hook_Think = function(wep)
    wep.Bipod_Integral = not hasElement(wep, "barrel_stub")
end

local BASE_DESC = SWEP.Trivia_Desc

SWEP.Hook_DescChange = function(wep, desc)
    local left = reserveLeft(wep)
    local spare

    if hasElement(wep, "body_obrez") then
        spare = "no butt to hold one"
    elseif left >= RESERVE then
        spare = "full, first two rounds come off it"
    elseif left > 0 then
        spare = "one round left on it"
    else
        spare = "spent, loading from pouches"
    end

    local legs = hasElement(wep, "barrel_stub") and "cut away with the forend" or
        (wep:InBipod() and "deployed" or "folded")

    return BASE_DESC .. "\n\nButt spare: " .. spare .. ". Bipod: " .. legs .. "."
end
