SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "Steinhauer GZ-11"
SWEP.TrueName = "Steyr ACR"
SWEP.Trivia_Class = "Assault Rifle"
SWEP.Trivia_Desc = "Experimental rifle that was featured as part of an advanced combat rifle program and bears resemblance to another bullpup design from the same company 10 years prior. Despite having a seemingly innovative concept, it was never adopted by the military. \n\n Features an integrated optic and fires high-velocity flechette projectiles, aiming to increase penetration and accuracy while reducing recoil and instead of a standard bolt system, it employs a vertically sliding chamber, ensuring smooth cycling of the bolt. The rifle utilizes caseless ammunition with lightweight polymer shells, reducing weight significantly."
SWEP.Trivia_Manufacturer = "Steinhauer Industrie"
SWEP.Trivia_Calibre = "5.56×45mm SCF"
SWEP.Trivia_Mechanism = "Vertically Sliding Chamber"
SWEP.Trivia_Country = "Austria"
SWEP.Trivia_Year = 1987

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Steyr Arms GmbH"
end

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/v_coldwar_steyracr.mdl"
SWEP.WorldModel = "models/weapons/v_coldwar_steyracr.mdl"
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ProceduralIronFire = true

SWEP.Damage = 26
SWEP.DamageMin = 20
SWEP.Range = 400
SWEP.RangeMin = 60
SWEP.Penetration = 24
SWEP.MuzzleVelocity = 1450
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.PhysBulletMuzzleVelocity = 1450
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 24
SWEP.ExtendedClipSize = 48
SWEP.ReducedClipSize = 12

SWEP.Recoil = 0.14
SWEP.RecoilSide = 0.10
SWEP.RecoilRise = 0.20
SWEP.MaxRecoilBlowback = 0.25
SWEP.MaxRecoilPunch = 0.25
SWEP.Sway = 0.55

SWEP.MalfunctionMean = 100
SWEP.MalfunctionTakeRound = false

SWEP.Delay = 60 / 1200
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = -3,

    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 15

SWEP.AccuracyMOA = 1.5
SWEP.HipDispersion = 260
SWEP.MoveDispersion = 120
SWEP.JumpDispersion = 350

SWEP.Primary.Ammo = "smg1"
SWEP.MagID = "aug"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

local path = ")uc_stacr/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local ratel = {common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg"}
local rutle = {common .. "movement-pistol-01.ogg",common .. "movement-pistol-02.ogg",common .. "movement-pistol-03.ogg",common .. "movement-pistol-04.ogg"}
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.ShootDrySound = {path .. "dryfire.wav"}
SWEP.FiremodeSound = {path .. "firemode.wav"}

SWEP.ShootSound = {
    path .. "fire1.wav",
    path .. "fire2.wav",
    path .. "fire3.wav",
}
SWEP.ShootSoundSilenced = {
    path .. "fire1_sup.wav",
}

local tail = ")/arccw_uc/common/556x45/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-556x45-rif-ext-01.ogg",
    tail .. "fire-dist-556x45-rif-ext-02.ogg",
    tail .. "fire-dist-556x45-rif-ext-03.ogg",
    tail .. "fire-dist-556x45-rif-ext-04.ogg",
    tail .. "fire-dist-556x45-rif-ext-05.ogg",
    tail .. "fire-dist-556x45-rif-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    common .. "fire-dist-int-rifle-01.ogg",
    common .. "fire-dist-int-rifle-02.ogg",
    common .. "fire-dist-int-rifle-03.ogg",
    common .. "fire-dist-int-rifle-04.ogg",
    common .. "fire-dist-int-rifle-05.ogg",
    common .. "fire-dist-int-rifle-06.ogg"
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

SWEP.MuzzleEffect = "muzzleflash_6"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
SWEP.ShellScale = 0.0001
SWEP.ShellPitch = 90

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2

SWEP.SpeedMult = 0.93
SWEP.SightedSpeedMult = 0.86
SWEP.SightTime = 0.36
SWEP.VisualRecoilMult = 0.18
SWEP.ShootSpeedMult = 1

SWEP.BulletBones = {
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-2.336, -1.609, -0.03),
    Ang = Angle(1, 0.05, 0),
    Magnification = 1.1,
    CrosshairInSights = false,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0.72, 0.402, 0.56)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(4.19, 3.819, -0.101)
SWEP.CustomizeAng = Angle(21.809, 32.361, 4.925)

SWEP.HolsterPos = Vector(0.72, 0.402, 0.56)
SWEP.HolsterAng = Angle(-11.961, 10.553, -7.739)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.BarrelLength = 27.2
SWEP.ExtraSightDist = 10

SWEP.WElements = {
	["steyr_acr_w"] = { type = "Model", model = "models/weapons/v_coldwar_steyracr.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-4, -6, 7), angle = Angle(35, -160, -35), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.AttachmentElements = {

    ["barrel_carbine"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
        AttPosMods = {[3] = {
            vpos = Vector(0, -3, 0),
            vang = Angle(0, 90, 0),
        }},
    },
    ["no_irons"] = {
        VMBodygroups = {
            {ind = 3, bg = 1},
        },
    },
    ["barrel_sd"] = {
        VMBodygroups = {
            {ind = 4, bg = 1},
        },
        NameChange = "Steinhauer GZ-11 SD",
        TrueNameChange = "Steyr ACR SD",
    },
    ["barrel_marksman"] = {
        VMBodygroups = {
            {ind = 1, bg = 2},
        },
        AttPosMods = {[3] = {
            vpos = Vector(0, -15.57, 0),
            vang = Angle(0, 90, 0),
        }},
    },
    ["barrel_machinegun"] = {
        VMBodygroups = {
            {ind = 0, bg = 2},
            {ind = 1, bg = 4},
        },
        AttPosMods = {[3] = {
            vpos = Vector(0, -15.57, 0),
            vang = Angle(0, 90, 0),
        }},
        NameChange = "Steinhauer GZ-11 HBAR",
        TrueNameChange = "Steyr ACR HBAR",
    },
    ["barrel_machinegun_sd"] = {
        VMBodygroups = {
            {ind = 0, bg = 2},
            {ind = 1, bg = 4},
            {ind = 4, bg = 3},
        },
        NameChange = "Steinhauer GZ-11 HBAR SD",
        TrueNameChange = "Steyr ACR HBAR SD",
    },
    ["barrel_sawnoff"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 3},
        },
        AttPosMods = {[3] = {
            vpos = Vector(0, 6.4, 0),
            vang = Angle(0, 90, 0),
        }},
        NameChange = "Steinhauer GZ-11K",
        TrueNameChange = "Steyr ACR-K",
    },
    ["barrel_sawnoff_sd"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 3},
            {ind = 4, bg = 2},
        },
        NameChange = "Steinhauer GZ-11 SD",
        TrueNameChange = "Steyr ACR-K SD",
    },
    ["conv_gl"] = {
        VMBodygroups = {
            {ind = 0, bg = 3},
            {ind = 1, bg = 5},
            {ind = 2, bg = 4},
        },
        NameChange = "Steinhauer GZ-11 GLX",
        TrueNameChange = "Steyr ACR-GL",
    },
    ["cal_410"] = {
        AddSuffix = " .410",
    },
    ["conv_50bmg"] = {
        VMBodygroups = {
            {ind = 1, bg = 6},
            {ind = 2, bg = 6},
        },
        NameChange = "Steinhauer GZ-50 AMR",
        TrueNameChange = "Steyr AMR",
    },
    ["mag_48"] = {
        VMBodygroups = {{ind = 2, bg = 1}}
    },
    ["mag_12"] = {
        VMBodygroups = {{ind = 2, bg = 2}}
    },
    ["mag_762"] = {
        VMBodygroups = {{ind = 2, bg = 3}},
        AddSuffix = " 7.62",
    },
    ["mag_9mm"] = {
        VMBodygroups = {{ind = 2, bg = 7}},
        AddSuffix = " 9mm",
    },
    ["mag_75"] = {
        VMBodygroups = {{ind = 2, bg = 5}}
    },

    ["skin_fde"]  = { VMSkin = 1 },
    ["skin_dark"] = { VMSkin = 2 },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"uc_stacr_optic"},
        Bone = "OPTIC2",
        Offset = {
            vpos = Vector(1.557, 0.075, 1.049),
            vang = Angle(0, 0, 0),
        },
        VMScale = Vector(1, 1, 1),
        InstalledEles = {"no_irons"},
        MergeSlots = {15},
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_stacr_barrel"},
        DefaultAttIcon = Material("shit/steyr_acr_barrel.png","mips smooth"),
        DefaultAttName = "21.3\" Prototype Barrel",
        ExcludeFlags = {"conv_gl", "conv_50bmg"},
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "A_Suppressor",
        VMScale = Vector(1, 1, 1),
        WMScale = VMScale,
        Offset = {
            vpos = Vector(0, 0.075, 0),
            vang = Angle(0, 90, 0),
        },
        ExcludeFlags = {"barrel_sd", "barrel_sawnoff_sd", "barrel_machinegun_sd", "conv_gl", "conv_50bmg"},
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip","ubgl"},
        Bone = "A_Underbarrel",
        Offset = {
            vpos = Vector(-2.597, -2.151, 1),
            vang = Angle(0, 0, 90),
        },
        VMScale = Vector(1, 1, 1),
        MergeSlots = {16},
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "A_Underbarrel",
        Offset = {
            vpos = Vector(-1.558, -1.3, -0),
            vang = Angle(0, 0, 0),
        },
    },
    {
        PrintName = "Upper Receiver",
        Slot = {"uc_stacr_cal"},
        DefaultAttIcon = Material("entities/att/uc_bullets/556x45.png","mips smooth"),
        DefaultAttName = "5.56x45mm SCF Receiver",
    },
    {
        PrintName = "Lower Receiver",
        Slot = {"uc_stacr_lower"},
        DefaultAttIcon = Material("shit/steyr_acr_lower.png","mips smooth"),
        DefaultAttName = "Prototype Lower Receiver",
        ExcludeFlags = {"conv_gl", "conv_50bmg"},
    },
    {
        PrintName = "Magazine",
        Slot = {"uc_stacr_mag"},
        DefaultAttIcon = Material("entities/att/ur_g3/mag20.png","mips smooth"),
        DefaultAttName = "24-Round Magazine",
        ExcludeFlags = {"conv_gl", "mag_762", "conv_50bmg", "mag_9mm"},
    },
    {
        PrintName = "Furniture",
        Slot = {"uc_stacr_skin"},
        DefaultAttIcon = Material("shit/steyr_acr_olive.png","mips smooth"),
        DefaultAttName = "Default Olive Green",
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
        PrintName = "Charm",
        Slot = {"charm", "fml_charm"},
        FreeSlot = true,
        Bone = "A_Muzzle_Ironsight",
        Offset = {
            vpos = Vector(-28.571, 1.649, -2.951),
            vang = Angle(0, 0, 0),
        },
    },
    {
        PrintName = "Extra Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic","optic_sniper", "optic_lp"},
        Bone = "OPTIC2",
        Offset = {
            vpos = Vector(3.635, 0.075, 1.1),
            vang = Angle(0, 0, 0),
        },
        VMScale = Vector(1, 1, 1),
        InstalledEles = {"no_irons"},
        Hidden = true,
    },
    {
        PrintName = "M203 slot",
        Slot = "uc_ubgl",
        Bone = "A_Underbarrel",
        Offset = {
            vpos = Vector(-3.951, -0.519, 1),
            vang = Angle(0, 0, 90),
        },
        Hidden = true,
    }
}

SWEP.Animations = {
    ["idle"] = {
        Source = "base_idle",
        Time = 0,
    },
    ["ready"] = {
        Source = "base_ready",
        Time = 0.75,
        SoundTable = {
            {s = "uc_stacr/ready.wav", t = 0.25},
        },
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["ready_gl"] = {
        Source = "base_ready",
        Time = 0.75,
        SoundTable = {
            {s = "uc_stacr/ready_gl.wav", t = 0.25},
        },
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["ready_50bmg"] = {
        Source = "base_ready",
        Time = 0.75,
        SoundTable = {
            {s = "uc_stacr/ready_50bmg.wav", t = 0.25},
        },
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["draw"] = {
        SoundTable = {
        {s = rottle, t = 0},
        {s = common .. "grab.ogg", t = 0.22},
        {s = ratel, t = 0.52},
        },
        Source = "base_draw",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["holster"] = {
        SoundTable = {
        {s = rottle, t = 0},
        {s = ratel, t = 0.34},
        {s = common .. "grab.ogg", t = 0.60},
        },
        Source = "base_holster",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 1,
        LHIKOut = 1,
    },
    ["fire"] = {
        Source = {"base_fire"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_stacr/mech1.wav"}, t = 0.005},
        },
    },
    ["fire_empty"] = {
        Source = {"base_dryfire"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_stacr/shoot_empty.wav"}, t = 0.005},
        },
    },
    ["reload"] = {
        Source = "base_reload",
        Time = 90 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 79 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_new.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_new.wav", t = 48 / 35},
            {s = "uc_stacr/mag_hit.wav", t = 68 / 35},
        },
    },
    ["reload_empty"] = {
        Source = "base_reloadempty",
        Time = 95 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 84 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_new.wav", t = 12 / 35},
            {s = common .. "rifle_magdrop.ogg",  t = 19 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_new.wav", t = 51 / 35},
            {s = "uc_stacr/mag_hit.wav", t = 60 / 35},
            {s = "uc_stacr/bolt_pull.wav", t = 70 / 35},
            {s = "uc_stacr/bolt_release.wav", t = 77 / 35},
        },
    },
    ["reload_50bmg"] = {
        Source = "base_reload",
        Time = 90 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 79 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_50bmg.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_50bmg.wav", t = 48 / 35},
            {s = "uc_stacr/mag_hit_gl.wav", t = 68 / 35},
        },
    },
    ["reload_empty_50bmg"] = {
        Source = "base_reloadempty",
        Time = 95 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 84 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_50bmg.wav", t = 12 / 35},
            {s = common .. "rifle_magdrop.ogg",  t = 19 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_50bmg.wav", t = 51 / 35},
            {s = "uc_stacr/mag_hit_gl.wav", t = 60 / 35},
            {s = "uc_stacr/bolt_pull_50bmg.wav", t = 70 / 35},
            {s = "uc_stacr/bolt_release_50bmg.wav", t = 77 / 35},
        },
    },
    ["reload_762"] = {
        Source = "base_reload",
        Time = 90 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 79 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_762.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_762.wav", t = 48 / 35},
            {s = "uc_stacr/mag_hit_762.wav", t = 68 / 35},
        },
    },
    ["reload_empty_762"] = {
        Source = "base_reloadempty",
        Time = 95 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 84 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_762.wav", t = 12 / 35},
            {s = common .. "rifle_magdrop.ogg",  t = 19 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_762.wav", t = 51 / 35},
            {s = "uc_stacr/mag_hit_762.wav", t = 60 / 35},
            {s = "uc_stacr/bolt_pull.wav", t = 70 / 35},
            {s = "uc_stacr/bolt_release.wav", t = 77 / 35},
        },
    },
    ["reload_9mm"] = {
        Source = "base_reload",
        Time = 90 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 79 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_9mm.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_9mm.wav", t = 48 / 35},
            {s = "uc_stacr/mag_hit_9mm.wav", t = 68 / 35},
        },
    },
    ["reload_empty_9mm"] = {
        Source = "base_reloadempty",
        Time = 95 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 84 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_9mm.wav", t = 12 / 35},
            {s = common .. "rifle_magdrop.ogg",  t = 19 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_9mm.wav", t = 51 / 35},
            {s = "uc_stacr/mag_hit_9mm.wav", t = 60 / 35},
            {s = "uc_stacr/bolt_pull.wav", t = 70 / 35},
            {s = "uc_stacr/bolt_release.wav", t = 77 / 35},
        },
    },
    ["reload_gl"] = {
        Source = "base_reload",
        Time = 90 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 79 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_gl.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_gl.wav", t = 48 / 35},
            {s = "uc_stacr/mag_hit_gl.wav", t = 68 / 35},
        },
    },
    ["reload_empty_gl"] = {
        Source = "base_reloadempty",
        Time = 95 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 84 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/mag_out_gl.wav", t = 12 / 35},
            {s = common .. "rifle_magdrop.ogg",  t = 19 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/mag_in_gl.wav", t = 51 / 35},
            {s = "uc_stacr/mag_hit_gl.wav", t = 60 / 35},
            {s = "uc_stacr/bolt_pull_gl.wav", t = 70 / 35},
            {s = "uc_stacr/bolt_release_gl.wav", t = 77 / 35},
        },
    },
    ["reload_drum"] = {
        Source = "base_reload",
        Time = 90 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 79 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/drum_out.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/drum_in.wav", t = 48 / 35},
            {s = "uc_stacr/drum_hit.wav", t = 64 / 35},
        },
    },
    ["reload_empty_drum"] = {
        Source = "base_reloadempty",
        Time = 95 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 84 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_stacr/drum_out.wav", t = 12 / 35},
            {s = common .. "rifle_magdrop.ogg",  t = 19 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_stacr/drum_in.wav", t = 51 / 35},
            {s = "uc_stacr/drum_hit.wav", t = 60 / 35},
            {s = "uc_stacr/bolt_pull.wav", t = 70 / 35},
            {s = "uc_stacr/bolt_release.wav", t = 77 / 35},
        },
    },
    ["bash"] = {
        SoundTable = {
        {s = rottle, t = 0},
        {s = ratel, t = 0.30},
        },
        Source = "melee",
        Time = 0.85,
    },
    ["1_to_2"] = {
        Source = "base_fireselect",
        Time = 0.85,
    },
}

if CLIENT then
    function SWEP:DrawWorldModel()
        local owner = self:GetOwner()
        local welem = self.WElements and self.WElements["steyr_acr_w"]

        if IsValid(owner) and welem then
            local bone = owner:LookupBone(welem.bone or "ValveBiped.Bip01_R_Hand")
            if not bone then self:DrawModel() return end

            local pos, ang = owner:GetBonePosition(bone)
            if not pos then self:DrawModel() return end

            ang:RotateAroundAxis(ang:Forward(), welem.angle.y)
            ang:RotateAroundAxis(ang:Right(),    welem.angle.p)
            ang:RotateAroundAxis(ang:Up(),       welem.angle.r)

            pos = pos
                + ang:Right()   * welem.pos.x
                + ang:Forward() * welem.pos.y
                + ang:Up()      * welem.pos.z

            self:SetRenderOrigin(pos)
            self:SetRenderAngles(ang)
            self:DrawModel()
        else
            self:DrawModel()
        end
    end
end
