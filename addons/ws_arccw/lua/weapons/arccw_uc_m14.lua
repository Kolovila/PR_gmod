SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "SR-14"
SWEP.TrueName = "M14"
SWEP.Trivia_Class = "Battle Rifle"
SWEP.Trivia_Desc = "Battle rifle adopted by the U.S. military in the late 1950s. It uses a gas‑operated, rotating‑bolt system and was designed as an improved successor to the M1 Garand. It served as the standard U.S. service rifle before being replaced by the M16, but it still remains in use today for designated marksman and ceremonial roles"
SWEP.Trivia_Manufacturer = "Westchester Arms"
SWEP.Trivia_Calibre = "7.62×51mm"
SWEP.Trivia_Mechanism = "Gas-Operated"
SWEP.Trivia_Country = "United States"
SWEP.Trivia_Year = 1957

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Springfield Armory"
end

SWEP.DefaultBodygroups = "0000000"

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/arccw/c_ud_m14.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_ud_m14.mdl"
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ProceduralIronFire = true

SWEP.Damage = 68
SWEP.DamageMin = 40
SWEP.RangeMin = 100
SWEP.Range = 550
SWEP.Penetration = 21
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 915
SWEP.PhysBulletMuzzleVelocity = 915

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 20

SWEP.Recoil = 1.35
SWEP.RecoilSide = 0.55

SWEP.RecoilRise = 0.85
SWEP.RecoilPunch = 1.3
SWEP.VisualRecoilMult = 1.15
SWEP.MaxRecoilBlowback = 1.0
SWEP.MaxRecoilPunch = 1.2
SWEP.RecoilPunchBack = 2.2

SWEP.Sway = 0.45

SWEP.MalfunctionMean = 100
SWEP.MalfunctionTakeRound = false

SWEP.Delay = 60 / 725
SWEP.Num = 1
SWEP.Firemodes = {
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

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 15

SWEP.AccuracyMOA = 2.5
SWEP.HipDispersion = 600
SWEP.MoveDispersion = 250
SWEP.JumpDispersion = 370

SWEP.Primary.Ammo = "ar2"
SWEP.MagID = "m14"

SWEP.ShootPitch = 100
SWEP.ShootVol = 120

local path = ")uc_m14/"
local common = ")/arccw_uc/common/"
local rottle = {common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local rutle = {common .. "movement-pistol-01.ogg",common .. "movement-pistol-02.ogg",common .. "movement-pistol-03.ogg",common .. "movement-pistol-04.ogg"}
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = nil
SWEP.ShootDrySound = {path .. "dryfire.wav"}
SWEP.FiremodeSound = {path .. "fireselect.wav"}

SWEP.ShootSound = {
    path .. "fire1.wav",
    path .. "fire2.wav",
    path .. "fire3.wav",
    path .. "fire4.wav",
    path .. "fire5.wav",
    path .. "fire6.wav",
    path .. "fire7.wav",
    path .. "fire8.wav",
}
SWEP.ShootSoundSilenced = {
    path .. "fire1_sup.wav",
    path .. "fire2_sup.wav",
    path .. "fire3_sup.wav",
    path .. "fire4_sup.wav",
    path .. "fire5_sup.wav",
    path .. "fire6_sup.wav",
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
    common .. "sup_tail.ogg"
}
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.MuzzleEffect = "muzzleflash_6"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellScale = 1.145
SWEP.ShellPitch = 90
SWEP.ShellScale = 1
SWEP.ShellRotateAngle = Angle(0, 0, 0)
SWEP.UC_ShellColor = Color(0.7*255, 0.2*255, 0.2*255)

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2

SWEP.SpeedMult = 0.87
SWEP.SightedSpeedMult = 0.80
SWEP.SightTime = 0.52
SWEP.ShootSpeedMult = 1

SWEP.BulletBones = {
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-2.255, 0, 0.76),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
    CrosshairInSights = false,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0.4, 0.976, 0.32)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(3.01, 0.488, -1.72)
SWEP.CustomizeAng = Angle(25.366, 25.366, -1.951)

SWEP.HolsterPos = Vector(0.72, 0.402, 0.56)
SWEP.HolsterAng = Angle(-11.961, 10.553, -7.739)

SWEP.CrouchPos = Vector(-0.68, 0, -0.72)
SWEP.CrouchAng = Angle(1.7, 0, -8.78)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.BarrelLength = 27.2
SWEP.ExtraSightDist = 10

SWEP.WElements = {
	["m14_w"] = { type = "Model", model = "models/weapons/arccw/c_ud_m14.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-5, 0, 7), angle = Angle(90, 25, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} }
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
            {ind = 0, bg = 1},
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
            {ind = 2, bg = 2},
        },
        AttPosMods = {[3] = {
            vpos = Vector(0, 14, 1.45),
            vang = Angle(0, -90, 0),
        }},
    },
    ["barrel_short"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
        AttPosMods = {[3] = {
            vpos = Vector(0, 21.8, 1.45),
            vang = Angle(0, -90, 0),
        }},
    },
    ["rail"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
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
        VMBodygroups = {{ind = 3, bg = 2},{ind = 4, bg = 2}},
        NameChange = "SR-1 Garand",
        TrueNameChange = "M1 Garand",
        AddSuffix = " .410",
    },
    ["conv_50bmg"] = {
        VMBodygroups = {
            {ind = 3, bg = 3},
        },
        NameChange = "SR-54 AMR",
        TrueNameChange = "PSL AMR",
    },
    ["mag_10"] = {
        VMBodygroups = {{ind = 3, bg = 1}}
    },
    ["garand"] = {
        VMBodygroups = {{ind = 3, bg = 2},{ind = 4, bg = 1}},
        NameChange = "SR-1 Garand",
        TrueNameChange = "M1 Garand",
    },
    ["m21"] = {
        VMBodygroups = {{ind = 5, bg = 1},{ind = 6, bg = 1}},
        NameChange = "SR-21",
        TrueNameChange = "M21",
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
        VMBodygroups = {{ind = 3, bg = 3}}
    },

    ["skin_poly"]  = { VMSkin = 1 },
    ["skin_olive"] = { VMSkin = 2 },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic","optic_sniper", "optic_lp"},
        Bone = "J_Gun",
        Offset = {
            vpos = Vector(0, 4.5, 2.95),
            vang = Angle(0, -90, 0),
        },
        CorrectivePos = Vector(0, 0, 0.0),
        CorrectiveAng = Angle(0, 180, 0),
        VMScale = Vector(1, 1, 1),
        InstalledEles = {"rail"},
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_m14_barrel"},
        DefaultAttName = "22\" Factory Barrel",
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "J_Gun",
        VMScale = Vector(1, 1, 1),
        WMScale = VMScale,
        Offset = {
            vpos = Vector(0, 29, 1.45),
            vang = Angle(0, -90, 0),
        },
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip","ubgl"},
        Bone = "J_Gun",
        Offset = {
            vpos = Vector(0, 10, 0),
            vang = Angle(0, -90, 0),
        },
        VMScale = Vector(1, 1, 1),
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "J_Gun",
        Offset = {
            vpos = Vector(0.8, 0, 0.7),
            vang = Angle(0, -90, 90),
        },
    },
    {
        PrintName = "Receiver",
        Slot = {"uc_m14_cal"},
        DefaultAttIcon = Material("entities/att/uc_bullets/762x51.png","mips smooth"),
        DefaultAttName = "7.62×51mm",
    },
    {
        PrintName = "Magazine",
        Slot = {"uc_m14_mag"},
        DefaultAttName = "20-Round Magazine",
        ExcludeFlags = {"conv_gl", "mag_762", "conv_50bmg", "mag_9mm"},
    },
    {
        PrintName = "Stock",
        Slot = {"uc_m14_stock"},
        DefaultAttName = "Factory Stock",
        ExcludeFlags = {"m21"},
    },
    {
        PrintName = "Furniture",
        Slot = {"uc_m14_skin"},
        DefaultAttName = "Wood",
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
        Source = "idle",
        Time = 0,
    },
    ["ready"] = {
        Source = "deploy",
        Time = 0.75,
        SoundTable = {
        },
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["draw"] = {
        Source = "draw",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["fire"] = {
        Source = {"fire"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_m14/mech1.wav","uc_m14/mech2.wav","uc_m14/mech3.wav","uc_m14/mech4.wav","uc_m14/mech5.wav","uc_m14/mech6.wav"}, t = 0.005},
        },
    },
    ["fire_empty"] = {
        Source = {"fire_empty"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_m14/mech1.wav","uc_m14/mech2.wav","uc_m14/mech3.wav","uc_m14/mech4.wav","uc_m14/mech5.wav","uc_m14/mech6.wav"}, t = 0.005},
        },
    },
    ["fire_iron"] = {
        Source = {"fire_ads"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_m14/mech1.wav","uc_m14/mech2.wav","uc_m14/mech3.wav","uc_m14/mech4.wav","uc_m14/mech5.wav","uc_m14/mech6.wav"}, t = 0.005},
        },
    },
    ["fire_empty_iron"] = {
        Source = {"fire_empty"},
        Time = 0.5,
        SoundTable = {
            {s = {"uc_m14/mech1.wav","uc_m14/mech2.wav","uc_m14/mech3.wav","uc_m14/mech4.wav","uc_m14/mech5.wav","uc_m14/mech6.wav"}, t = 0.005},
        },
    },
    ["reload"] = {
        Source = "wet",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_m14/mag_release.wav", t = 10 / 35},
            {s = "uc_m14/mag_out_new.wav", t = 14 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_m14/mag_in_new.wav", t = 73 / 35},
        },
    },
    ["reload_empty"] = {
        Source = "dry",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_m14/mag_release.wav", t = 10 / 35},
            {s = "uc_m14/mag_out_new.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_m14/mag_in_new.wav", t = 73 / 35},
            {s = "uc_m14/forward_assist.wav", t = 95 / 35},
            {s = "uc_m14/bolt_release.wav", t = 104 / 35},
        },
    },
    ["reload_50"] = {
        Source = "wet",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_m14/mag_release.wav", t = 10 / 35},
            {s = "uc_m14/mag_out_50_new.wav", t = 14 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_m14/mag_in_50_new.wav", t = 73 / 35},
        },
    },
    ["reload_empty_50"] = {
        Source = "dry",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_m14/mag_release.wav", t = 10 / 35},
            {s = "uc_m14/mag_out_50_new.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_m14/mag_in_50_new.wav", t = 73 / 35},
            {s = "uc_m14/forward_assist.wav", t = 95 / 35},
            {s = "uc_m14/bolt_release.wav", t = 104 / 35},
        },
    },
    ["reload_10"] = {
        Source = "wet_10",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_m14/mag_release.wav", t = 10 / 35},
            {s = "uc_m14/mag_out_10_new.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_m14/mag_in_10_new.wav", t = 73 / 35},
        },
    },
    ["reload_empty_10"] = {
        Source = "dry_10",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_m14/mag_release.wav", t = 10 / 35},
            {s = "uc_m14/mag_out_10_new.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_m14/mag_in_10_new.wav", t = 73 / 35},
            {s = "uc_m14/forward_assist.wav", t = 95 / 35},
            {s = "uc_m14/bolt_release.wav", t = 104 / 35},
        },
    },
    ["reload_garand"] = {
        Source = "garand",
        Time = 100 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_m14/bolt_pull.wav", t = 3.75 / 35},
            {s = "uc_m14/mag_release.wav", t = 4 / 35},
            {s = {"uc_m14/ping_1.wav", "uc_m14/ping_2.wav", "uc_m14/ping_3.wav", "uc_m14/ping_4.wav", "uc_m14/ping_5.wav"}, t = 4 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_m14/mag_in_garand.wav", t = 57 / 35},
            {s = "uc_m14/forward_assist.wav", t = 60 / 35},
            {s = "uc_m14/bolt_release.wav", t = 68 / 35},
        },
    },
    ["reload_empty_garand"] = {
        Source = "garand",
        Time = 100 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_m14/bolt_pull.wav", t = 3.75 / 35},
            {s = "uc_m14/mag_release.wav", t = 4 / 35},
            {s = {"uc_m14/ping_1.wav", "uc_m14/ping_2.wav", "uc_m14/ping_3.wav", "uc_m14/ping_4.wav", "uc_m14/ping_5.wav"}, t = 4 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_m14/mag_in_garand.wav", t = 57 / 35},
            {s = "uc_m14/forward_assist.wav", t = 60 / 35},
            {s = "uc_m14/bolt_release.wav", t = 68 / 35},
        },
    },
    ["reload_garand10"] = {
        Source = "garand_10",
        Time = 125 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_20.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_20.wav", t = 73 / 35},
        },
    },
    ["reload_empty_garand10"] = {
        Source = "garand_10",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = "uc_stacr/mag_release.wav", t = 10 / 35},
            {s = "uc_psl/mag_out_20.wav", t = 12 / 35},
            { s = common .. "magpouch_gear.ogg", t = 25 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 39 / 35 },
            {s = "uc_psl/mag_in_20.wav", t = 71 / 35},
            {s = "uc_psl/bolt_pull.wav", t = 110 / 35},
            {s = "uc_psl/bolt_release.wav", t = 117 / 35},
        },
    },
    ["enter_inspect"] = {
        Source = "inspect_enter",
        time = 35 / 60,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
       SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "movement-rifle-02.ogg", t = 0.1},
        },
    },
    ["idle_inspect"] = {
        Source = "inspect_idle",
        time = 72 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect"] = {
        Source = "inspect_exit",
        LHIK = false,
        LHIKIn = 0,
        LHIKOut = 999,
       SoundTable = {
            {s = common .. "movement-rifle-04.ogg", t = 0.2},
            {s = rottle, t = 0.25},
            {s = rottle, t = 1.2},
            {s = path .. "rattle.wav", t = 1.25},
            {s = common .. "movement-rifle-03.ogg", t = 1.25},
        },
    },
    ["cycle"] = {
        Source = "bolt",
        Time = 0.85,
    },
    ["unjam"] = {
        Source = "bolt",
        Time = 0.9,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "unjam.ogg", t = .4}
        },
        LHIK = true,
        LHIKIn = .2,
        LHIKOut = .2,
        LHIKEaseOut = .75,
    },
}

if CLIENT then
    function SWEP:DrawWorldModel()
        local owner = self:GetOwner()
        local welem = self.WElements and self.WElements["m14_w"]

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
