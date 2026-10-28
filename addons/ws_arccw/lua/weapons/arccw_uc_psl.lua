SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "SR-54C"
SWEP.TrueName = "PSL-54C"
SWEP.Trivia_Class = "Designated Marksman Rifle"
SWEP.Trivia_Desc = "Romania’s designated marksman rifle, built in the 1970s to give infantry a long‑range, semi‑automatic weapon similar in role to the SVD Dragunov. It uses a strengthened Kalashnikov‑style long‑stroke gas system, fires the 7.62×54mmR cartridge, and typically mounts a 4× optic on a side rail. Despite its SVD‑like appearance, it is mechanically closer to an enlarged RPK."
SWEP.Trivia_Manufacturer = "Cugirra Industries"
SWEP.Trivia_Calibre = "7.62×54mmR"
SWEP.Trivia_Mechanism = "Long‑Stroke Gas‑Piston"
SWEP.Trivia_Country = "Romania"
SWEP.Trivia_Year = 1974

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "UM Cugir"
end

SWEP.DefaultBodygroups = "0000000"

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/romarm/psl/c_rom_psl.mdl"
SWEP.WorldModel = "models/romarm/psl/c_rom_psl.mdl"
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ProceduralIronFire = true

SWEP.Damage = 74
SWEP.DamageMin = 42
SWEP.Range = 580
SWEP.RangeMin = 140
SWEP.Penetration = 18
SWEP.MuzzleVelocity = 830
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.PhysBulletMuzzleVelocity = 830
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 10
SWEP.ExtendedClipSize = 20
SWEP.ReducedClipSize = 5

SWEP.Recoil = 1.9
SWEP.RecoilSide = 0.8
SWEP.RecoilRise = 0.75
SWEP.RecoilPunch = 1.3
SWEP.MaxRecoilBlowback = 0
SWEP.MaxRecoilPunch = 0
SWEP.RecoilPunchBack = 2.2
SWEP.Sway = 0.5

SWEP.MalfunctionMean = 100
SWEP.MalfunctionTakeRound = false

SWEP.Delay = 60 / 300
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
SWEP.NPCWeight = 15

SWEP.AccuracyMOA = 3.5
SWEP.HipDispersion = 700
SWEP.MoveDispersion = 220
SWEP.JumpDispersion = 370

SWEP.Primary.Ammo = "smg1"
SWEP.MagID = "psl"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

local path = ")uc_psl/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local ratel = {common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg"}
local rutle = {common .. "movement-pistol-01.ogg",common .. "movement-pistol-02.ogg",common .. "movement-pistol-03.ogg",common .. "movement-pistol-04.ogg"}
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.ShootDrySound = {path .. "dryfire.wav"}
SWEP.FiremodeSound = {path .. "fireselect.wav"}

SWEP.ShootSound = {
    path .. "fire.wav",
}
SWEP.ShootSoundSilenced = {
    path .. "fire_sup.wav",
}

local tail = ")/arccw_uc/common/762x39/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-762x39-rif-ext-01.ogg",
    tail .. "fire-dist-762x39-rif-ext-02.ogg",
    tail .. "fire-dist-762x39-rif-ext-03.ogg",
    tail .. "fire-dist-762x39-rif-ext-04.ogg",
    tail .. "fire-dist-762x39-rif-ext-05.ogg",
    tail .. "fire-dist-762x39-rif-ext-06.ogg"
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
SWEP.ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
SWEP.ShellPitch = 90
SWEP.ShellScale = .666
SWEP.ShellRotateAngle = Angle(0, 0, 0)
SWEP.UC_ShellColor = Color(0.7 * 255, 0.2 * 255, 0.2 * 255)

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2

SWEP.SpeedMult = 0.86
SWEP.SightedSpeedMult = 0.52
SWEP.SightTime = 0.62
SWEP.VisualRecoilMult = 1.0
SWEP.ShootSpeedMult = 1

SWEP.BulletBones = {
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(0.04, 0, -0.16),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
    CrosshairInSights = false,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(3.76, 4.39, -0.4)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(7.55, 4.878, 0.24)
SWEP.CustomizeAng = Angle(12.683, 25.366, 8.78)

SWEP.HolsterPos = Vector(0.72, 0.402, 0.56)
SWEP.HolsterAng = Angle(-11.961, 10.553, -7.739)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.BarrelLength = 27.2
SWEP.ExtraSightDist = 10

SWEP.WElements = {
	["psl_w"] = { type = "Model", model = "models/romarm/psl/c_rom_psl.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-3, 0, 5), angle = Angle(90, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} }
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
    ["dustcover_alpha"] = {
        VMBodygroups = {
            {ind = 5, bg = 1},
        },
    },
    ["stock_alpha"] = {
        VMBodygroups = {
            {ind = 4, bg = 1},
        },
    },
    ["stock_skel"] = {
        VMBodygroups = {
            {ind = 4, bg = 3},
        },
    },
    ["stock_none"] = {
        VMBodygroups = {
            {ind = 4, bg = 2},
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
            {ind = 0, bg = 2},
            {ind = 1, bg = 2},
            {ind = 2, bg = 1},
        },
        AttPosMods = {[3] = {
            vpos = Vector(27, 0, 0.55),
            vang = Angle(0, 0, 0),
        }},
    },
    ["barrel_short"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 1},
        },
        AttPosMods = {[3] = {
            vpos = Vector(33.5, 0, 0.45),
            vang = Angle(0, 0, 0),
        }},
    },
    ["barrel_alpha"] = {
        VMBodygroups = {
            {ind = 1, bg = 3},
            {ind = 2, bg = 2},
        },
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
            {ind = 3, bg = 3},
        },
        NameChange = "SR-54 AMR",
        TrueNameChange = "PSL AMR",
    },
    ["mag_20"] = {
        VMBodygroups = {{ind = 3, bg = 2}}
    },
    ["mag_5"] = {
        VMBodygroups = {{ind = 3, bg = 1}}
    },
    ["mag_762"] = {
        VMBodygroups = {{ind = 2, bg = 3}},
        AddSuffix = " 7.62",
    },
    ["mag_9mm"] = {
        VMBodygroups = {{ind = 3, bg = 5}, {ind = 6, bg = 1}},
        AddSuffix = " 9mm",
    },
    ["mag_50"] = {
        VMBodygroups = {{ind = 3, bg = 4}}
    },

    ["skin_fde"]  = { VMSkin = 1 },
    ["skin_dark"] = { VMSkin = 2 },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic","optic_sniper", "optic_lp"},
        Bone = "VC_AK",
        Offset = {
            vpos = Vector(3.5, 0, 2.85),
            vang = Angle(0, 0, 0),
        },
        VMScale = Vector(1, 1, 1),
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_psl_barrel"},
        DefaultAttName = "24.5\" Factory Barrel",
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "VC_AK",
        VMScale = Vector(1, 1, 1),
        WMScale = VMScale,
        Offset = {
            vpos = Vector(39, 0, 0.25),
            vang = Angle(0, 0, 0),
        },
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip","ubgl"},
        Bone = "VC_AK",
        Offset = {
            vpos = Vector(15.094, 0, -0.15),
            vang = Angle(0, 0, 0),
        },
        VMScale = Vector(1, 1, 1),
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "VC_AK",
        Offset = {
            vpos = Vector(13, 0.67, 1.25),
            vang = Angle(0, 0, -90),
        },
    },
    {
        PrintName = "Upper Receiver",
        Slot = {"uc_psl_cal"},
        DefaultAttIcon = Material("entities/att/uc_bullets/762x39.png","mips smooth"),
        DefaultAttName = "7.62×54mmR",
    },
    {
        PrintName = "Lower Receiver",
        Slot = {"uc_psl_lower"},
        DefaultAttName = "Semi-Auto Lower Receiver",
        ExcludeFlags = {"conv_gl", "conv_50bmg"},
    },
    {
        PrintName = "Magazine",
        Slot = {"uc_psl_mag"},
        DefaultAttName = "10-Round Magazine",
        ExcludeFlags = {"conv_gl", "mag_762", "conv_50bmg", "mag_9mm"},
    },
    {
        PrintName = "Stock",
        Slot = {"uc_psl_stock"},
        DefaultAttName = "Factory Stock",
    },
    {
        PrintName = "Dust Cover",
        Slot = {"uc_psl_dustcover"},
        DefaultAttName = "Factory Dust Cover",
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
    }
}

SWEP.Animations = {
    ["idle"] = {
        Source = "AK47_shoulder_idle",
        Time = 0,
    },
    ["idle_iron"] = {
        Source = "AK47_iron_idle",
        Time = 0,
    },
    ["ready"] = {
        Source = "AK47_pullout",
        Time = 0.75,
        SoundTable = {
        },
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["exit_inspect"] = {
        Source = "AK47_ammocheck",
        time = 125 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            { s = rottle, t = 0 / 60, c = ca },
            { s = common .. "magrelease.ogg", t = 7 / 60, c = ca },
            { s = path .. "mag_out.wav", t = 8 / 60, c = ca },
            { s = rottle, t = 100 / 60, c = ca },
            { s = path .. "mag_in.wav", t = 70 / 60, c = ca },
            { s = rottle, t = 75 / 60, c = ca },
            { s = rottle, t = 90 / 60, c = ca },
        },
    },
    ["draw"] = {
        SoundTable = {
        {s = rottle, t = 0},
        {s = common .. "grab.ogg", t = 0.22},
        {s = ratel, t = 0.52},
        },
        Source = "AK47_pullout",
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
        Source = "AK47_putaway",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 1,
        LHIKOut = 1,
    },
    ["fire"] = {
        Source = {"AK47_shoot"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_psl/mech.wav"}, t = 0.005},
        },
    },
    ["fire_empty"] = {
        Source = {"AK47_shootLAST"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_psl/mech.wav"}, t = 0.005},
        },
    },
    ["fire_iron"] = {
        Source = {"AK47_iron_shoot"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_psl/mech.wav"}, t = 0.005},
        },
    },
    ["fire_empty_iron"] = {
        Source = {"AK47_iron_shootLAST"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_psl/mech.wav"}, t = 0.005},
        },
    },
    ["reload"] = {
        Source = "AK47_reloadhalf",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 110 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in.wav", t = 73 / 35},
        },
    },
    ["reload_empty"] = {
        Source = "AK47_reloadempty",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 128 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in.wav", t = 71 / 35},
            {s = "uc_psl/bolt_pull.wav", t = 110 / 35},
            {s = "uc_psl/bolt_release.wav", t = 117 / 35},
        },
    },
    ["reload_5"] = {
        Source = "AK47_reloadhalf",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 110 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_5.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_5.wav", t = 73 / 35},
        },
    },
    ["reload_empty_5"] = {
        Source = "AK47_reloadempty",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 128 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_5.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_5.wav", t = 71 / 35},
            {s = "uc_psl/bolt_pull.wav", t = 110 / 35},
            {s = "uc_psl/bolt_release.wav", t = 117 / 35},
        },
    },
    ["reload_9mm"] = {
        Source = "AK47_reloadhalf",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 110 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_9mm.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_9mm.wav", t = 73 / 35},
        },
    },
    ["reload_empty_9mm"] = {
        Source = "AK47_reloadempty",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 128 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_9mm.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_9mm.wav", t = 71 / 35},
            {s = "uc_psl/bolt_pull.wav", t = 110 / 35},
            {s = "uc_psl/bolt_release.wav", t = 117 / 35},
        },
    },
    ["reload_20"] = {
        Source = "AK47_reloadhalf",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 110 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_20.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_20.wav", t = 73 / 35},
        },
    },
    ["reload_empty_20"] = {
        Source = "AK47_reloadempty",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 128 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_20.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_20.wav", t = 71 / 35},
            {s = "uc_psl/bolt_pull.wav", t = 110 / 35},
            {s = "uc_psl/bolt_release.wav", t = 117 / 35},
        },
    },
    ["reload_50"] = {
        Source = "AK47_reloadhalf",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 110 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_50.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_50.wav", t = 73 / 35},
        },
    },
    ["reload_empty_50"] = {
        Source = "AK47_reloadempty",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 128 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_50.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_50.wav", t = 71 / 35},
            {s = "uc_psl/bolt_pull.wav", t = 110 / 35},
            {s = "uc_psl/bolt_release.wav", t = 117 / 35},
        },
    },
    ["reload_50bmg"] = {
        Source = "AK47_reloadhalf",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 110 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_50bmg.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_50bmg.wav", t = 73 / 35},
        },
    },
    ["reload_empty_50bmg"] = {
        Source = "AK47_reloadempty",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0 / 35},
            {s = rottle, t = 128 / 35},
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_50bmg.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_50bmg.wav", t = 71 / 35},
            {s = "uc_psl/bolt_pull.wav", t = 110 / 35},
            {s = "uc_psl/bolt_release.wav", t = 117 / 35},
        },
    },
    ["bash"] = {
        SoundTable = {
        {s = rottle, t = 0},
        {s = ratel, t = 0.30},
        },
        Source = "AK47_bash",
        Time = 0.85,
    },
}

if CLIENT then
    function SWEP:DrawWorldModel()
        local owner = self:GetOwner()
        local welem = self.WElements and self.WElements["psl_w"]

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
