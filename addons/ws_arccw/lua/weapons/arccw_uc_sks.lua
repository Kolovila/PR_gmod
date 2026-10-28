SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "SKS"
SWEP.TrueName = "SKS"
SWEP.Trivia_Class = "Battle Rifle"
SWEP.Trivia_Desc = [[Developed by the Soviet Union during and after WW2, the SKS was intended to become the Soviet Army's standard issue rifle, though it would not see use during the war. Designed for the Intermediate 7.62x39mm round, it's initial version was a stripper clip fed 10-Round capacity Battle Rifle, not unlike the other weapons that saw service during the war.

Unfortunately, The AK-47 came just as the SKS entered service, and it was phased out by the Kalashnikov within 5 years. Other countries like China and Yugoslava would go on to use and manufacture the SKS during the cold war, sometimes modifying them with detachable magazines.]]
SWEP.Trivia_Manufacturer = "Tula"
SWEP.Trivia_Calibre = "7.62x39mm"
SWEP.Trivia_Mechanism = "Gas-Operated Tilting Bolt"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1945

SWEP.Slot = 2

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Tula"
    SWEP.Trivia_Country = "Soviet Union"
 end

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/sksnew/c_sks_test_01.mdl"
SWEP.WorldModel = "models/weapons/sksnew/w_sks_01.mdl"

SWEP.MirrorVMWM = false

SWEP.ViewModelFOV = 70

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 3, -4.6),
    ang = Angle(168, 180, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1.125
}

SWEP.DefaultBodygroups = "0300000000"

SWEP.Damage = 50
SWEP.DamageMin = 25
SWEP.RangeMin = 50
SWEP.Range = 350

SWEP.Penetration = 16
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 730
SWEP.PhysBulletMuzzleVelocity = 730
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 20
SWEP.ExtendedClipSize = 30
SWEP.ReducedClipSize = 20

SWEP.Recoil = 0.76
SWEP.RecoilSide = 0.28

SWEP.RecoilRise = 0.7
SWEP.RecoilPunch = 1
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 0
SWEP.MaxRecoilPunch = 0
SWEP.RecoilPunchBack = 2

SWEP.Sway = 0.35

SWEP.Delay = 60 / 500
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
SWEP.NPCWeight = 125

SWEP.AccuracyMOA = 3
SWEP.HipDispersion = 750
SWEP.MoveDispersion = 200

SWEP.Primary.Ammo = "ar2"
SWEP.MagID = "sks"

SWEP.ShootVol = 120
SWEP.ShootPitch = 120

local path = ")^uc_evolys/"
local common = ")^arccw_uc/common/"
local rutle = {common .. "movement-rifle-01.ogg", common .. "movement-rifle-02.ogg", common .. "movement-rifle-03.ogg", common .. "movement-rifle-04.ogg"}
local rottle = {common .. "cloth_1.ogg", common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local ratel = {common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg"}

SWEP.ShootSound = {
    "weapons/arccw_sks/sks/sks_core_01.wav",
	"weapons/arccw_sks/sks/sks_core_02.wav",
	"weapons/arccw_sks/sks/sks_core_03.wav",
	"weapons/arccw_sks/sks/sks_core_04.wav"
}

SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = common .. "sup_tail.ogg"
SWEP.ShootDrySound = nil

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

SWEP.ShootSoundSilenced = "weapons/arccw_sks/sks/sks_suppressed_fp.wav"

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.ShellModel = "models/shells/shell_762nato.mdl"
SWEP.ShellPitch = 90
SWEP.ShellRotate = 0
SWEP.ShellScale = 1.1

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 3

SWEP.SpeedMult = 0.925
SWEP.SightedSpeedMult = 0.8

SWEP.BulletBGs = {
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-2.34, 2.5, 1.5),
    Ang = Angle(-0.1, 0.00, 0),
    Magnification = 1.1,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0.1, 1, 1)
SWEP.ActiveAng = Angle(0.1, 0.25, 0)

SWEP.CrouchPos = Vector(0.2, 0.5, 1)
SWEP.CrouchAng = Angle(0.5, 0.5, -7.5)

SWEP.SprintPos = Vector(3, 2, -0.5)
SWEP.SprintAng = nil

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.CustomizePos = Vector(7, 0.45, -1.2)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.BarrelLength = 26

SWEP.DefaultElements = {"bayonetsks"}

SWEP.AttachmentElements = {
    ["barrel_short"] = {
        VMBodygroups = {{ind = 0, bg = 1}},
        AttPosMods = {[2] = {
            vpos = Vector(-0.1, 16.01, 0.19),
        }},
    },
    ["conv_556"] = {
        VMBodygroups = {{ind = 1, bg = 0}, {ind = 2, bg = 4}},
        WMBodygroups = {{ind = 1, bg = 1}},
    },
    ["conv_545"] = {
        VMBodygroups = {{ind = 1, bg = 0}, {ind = 2, bg = 5}},
        WMBodygroups = {{ind = 1, bg = 1}},
    },
    ["conv_9mm"] = {
        VMBodygroups = {{ind = 1, bg = 0}, {ind = 2, bg = 6}},
        WMBodygroups = {{ind = 1, bg = 1}},
    },
    ["sksmag_extended"] = {
        VMBodygroups = {{ind = 2, bg = 1}},
        WMBodygroups = {{ind = 1, bg = 1}},
    },
    ["mag_5"] = {
        VMBodygroups = {{ind = 2, bg = 2}},
    },
    ["mag_30_poly"] = {
        VMBodygroups = {{ind = 2, bg = 3}},
    },
    ["stock_poly"] = {
        VMBodygroups = {{ind = 4, bg = 1}},
    },
    ["sksmount_optic"] = {
		VMElements = {
             {
                 Model = "models/weapons/upgrades/c_sks_rail_gmod.mdl",
                 Bone = "b_wpn",
                 Offset = {
                    pos = Vector(-0.1, -1.9, 1.5),
                    ang = Angle(0, -90, 0),
                 },
                 ModelSkin = 0,
                 ModelBodygroups = "",
                 Scale = Vector(1, 1, 1),
                 IsMuzzleDevice = false
            }
        },
		WMElements = {
             {
                 Model = "models/weapons/upgrades/c_sks_rail_gmod.mdl",
                 Offset = {
                     pos = Vector(6.8, 0.65, -5.2),
                     ang = Angle(-192, -180, -0),
                 },
				 Scale = Vector(1.1, 1, 1),
                 IsMuzzleDevice = false
             }
        },
    },
	["bayonetsks"] = {
	    ExcludeFlags = {"sks_bayonet_deployed", "barrel_short"},
		VMElements = {
             {
                 Model = "models/weapons/upgrades/c_sks_bayonet_gmod.mdl",
                 Bone = "b_wpn",
                 Offset = {
                    pos = Vector(2.25, -11.13, 2.8),
                    ang = Angle(0, -90, 0),
                 },
                 ModelSkin = 0,
                 ModelBodygroups = "",
                 Scale = Vector(1, 1, 1),
                 IsMuzzleDevice = false
            }
        },
		WMElements = {
             {
                 Model = "models/weapons/upgrades/c_sks_bayonet_gmod.mdl",
                 Offset = {
                     pos = Vector(0.445, 2.75, -5.22),
                     ang = Angle(-11, -0, -180),
                 },
                 IsMuzzleDevice = false
             }
        },
    },
	["bayonet_sks_deploy"] = {
	    RequireFlags = "sks_bayonet_deployed",
	    ExcludeFlags = {"barrel_short"},
		VMElements = {
             {
                 Model = "models/weapons/upgrades/c_sks_bayonet_gmod.mdl",
                 Bone = "b_wpn",
                 Offset = {
                    pos = Vector(2.25, 42.6, -4.18),
                    ang = Angle(180, 90, 0),
                 },
                 ModelSkin = 0,
                 ModelBodygroups = "",
                 Scale = Vector(1, 1, 1),
                 IsMuzzleDevice = false
            }
        },
		WMElements = {
             {
                 Model = "models/weapons/upgrades/c_sks_bayonet_gmod.mdl",
                 Offset = {
                     pos = Vector(50.9, 2.74, -8.8),
                     ang = Angle(-11, -180, -0),
                 },
				 Scale = Vector(1.1, 1, 1),
                 IsMuzzleDevice = false
             }
        },
    }

}

SWEP.ExtraSightDist = 6

SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = {"optic_lp", "optic", "sniper_optic"},
		DefaultAttName = "Iron Sights",
        Bone = "b_wpn",
        Offset = {
            vpos = Vector(-0.1, -2.5, 1.6),
            vang = Angle(0, -90, 0),
			wpos = Vector(8, 0.65, -5.5),
            wang = Angle(168, 180, 0)
        },
		VMScale = Vector(0.9, 0.9, 0.9),
		WMScale = Vector(0.9, 0.9, 0.9),
        InstalledEles = {"sksmount_optic"},
        CorrectivePos = Vector(0, 0, 0),
        CorrectiveAng = Angle(0, -180, 0),
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle", "uc_sks_bayonet"},
        Bone = "b_wpn",
        Offset = {
            vpos = Vector(-0.1, 17.5, 0.19),
            vang = Angle(-0, -90, 0),
            wpos = Vector(26, 0.7, -7.9),
            wang = Angle(-12, 0, 180)
        },
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_sks_barrel"},
        DefaultAttName = "20\" Factory Barrel",
    },
	{
        PrintName = "Magazine",
        Slot = {"uc_sks_mag"},
        DefaultAttName = "20-Round Mag",
        ExcludeFlags = {"conv_556", "conv_545", "conv_9mm"},
    },
    {
        PrintName = "Conversion",
        Slot = {"uc_sks_cal"},
        DefaultAttIcon = Material("entities/att/uc_bullets/762x39.png", "mips smooth"),
        DefaultAttName = "7.62x39mm",
    },
    {
        PrintName = "Stock",
        Slot = {"uc_sks_stock"},
        DefaultAttName = "Factory Stock",
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip", "ubgl", "bipod"},
        Bone = "b_wpn",
        Offset = {
		    vpos = Vector(-0.1, 5, -0.9),
            vang = Angle(-0, -90, 0),
			wpos = Vector(14, 0.66, -4.2),
            wang = Angle(-12, 0, 180)
        },
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "b_wpn",
        Offset = {
            vpos = Vector(-0.1, 10.5, 0.1),
            vang = Angle(-90, -90, 0),
			wpos = Vector(19, 0.65, -6.4),
            wang = Angle(-12, 0, 90)
        },
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"FMJ\" Full Metal Jacket",
        DefaultAttIcon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth"),
        Slot = "uc_ammo",
    },
    {
        PrintName = "Powder Load",
        Slot = "uc_powder",
        DefaultAttName = "Standard Load"
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
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "b_wpn",
        Offset = {
            vpos = Vector(1, -5.25, 1),
            vang = Angle(-90, 270, -270),
            wpos = Vector(7.3, 2, -3.2),
            wang = Angle(-10.393, 0, 180)
        },
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "base_idle",
        Time = 1
    },
	["idle_empty"] = {
        Source = "empty_idle",
        Time = 0.001
    },
	["idle_iron_empty"] = {
        Source = "iron_empty_idle",
        Time = 1
    },
    ["draw"] = {
        SoundTable = {
        {s = rottle, t = 0},
        {s = common .. "grab.ogg", t = 0.30},
        {s = ratel, t = 0.70},
        },
        Source = "base_draw",
        Time = 1,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
	["draw_empty"] = {
        SoundTable = {
        {s = rottle, t = 0},
        {s = common .. "grab.ogg", t = 0.30},
        {s = ratel, t = 0.70},
        },
        Source = "empty_draw",
        Time = 1,
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
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
	["holster_empty"] = {
        SoundTable = {
        {s = rottle, t = 0},
        {s = ratel, t = 0.34},
        {s = common .. "grab.ogg", t = 0.60},
        },
        Source = "empty_holster",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["ready"] = {
        Source = "base_ready",
        Time = 4,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
		SoundTable = {
			{s = "uc_sks/mag_in.wav", t = 38/30},
			{s = "weapons/arccw_sks/sks/sks_foley_arm_movement.wav", t = 50/30},
			{s = "uc_sks/bolt_pull.wav", t = 74/30},
			{s = "uc_sks/bolt_release.wav", t = 80.5/30},
			{s = "weapons/arccw_sks/sks/ak74_foley_hand_grab.wav", t = 88/30},
		},
    },
    ["fire"] = {
        Source = {"base_fire_1", "base_fire_2", "base_fire_3"},
        Time = 1.1,
        SoundTable = {
			{s = {"uc_sks/mech.wav"}, t = 0.005},
		},
        ShellEjectAt = 0,
    },
	["fire_iron"] = {
        Source = {"iron_fire_1", "iron_fire_2", "iron_fire_3"},
        Time = 1.1,
        SoundTable = {
			{s = {"uc_sks/mech.wav"}, t = 0.005},
		},
        ShellEjectAt = 0,
    },
    ["fire_empty"] = {
        Source = "base_fire_last",
        Time = 1.1,
        SoundTable = {
			{s = {"uc_sks/dryfire.wav"}, t = 0.005},
		},
        ShellEjectAt = 0,
    },
    ["fire_iron_empty"] = {
        Source = "iron_fire_last",
        Time = 1.1,
        SoundTable = {
			{s = {"uc_sks/dryfire.wav"}, t = 0.005},
		},
        ShellEjectAt = 0,
    },
    ["reload"] = {
        Source = "base_reload",
        Time = 3.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
		    {s = rottle, t = 0.00},
		    {s = common .. "magpouch.ogg", t = 1.17},
		    {s = common .. "magpouchin.ogg", t = 2.34, v = 0.7},
		    {s = ratel, t = 1.79},
		    {s = rottle, t = 2.86},
            {s = "weapons/arccw_sks/sks/sks_foley_arm_movement.wav", t = 10/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_release.wav", t = 17/30},
			{s = "uc_sks/mag_out.wav", t = 25/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_out_arm_movement.wav", t = 30/30},
			{s = "uc_sks/mag_in.wav", t = 54/30},
			{s = "weapons/arccw_sks/sks/ak74_foley_hand_grab.wav", t = 105/30},
		},
    },
    ["reload_empty"] = {
        Source = "base_reloadempty",
        Time = 4.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
	    SoundTable = {
		    {s = rottle, t = 0.00},
		    {s = common .. "magpouch.ogg", t = 1.53},
		    {s = common .. "magpouchin.ogg", t = 3.06, v = 0.7},
		    {s = ratel, t = 2.34},
		    {s = rottle, t = 3.74},
            {s = "weapons/arccw_sks/sks/sks_foley_arm_movement.wav", t = 10/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_release.wav", t = 17/30},
			{s = "uc_sks/mag_out.wav", t = 25/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_out_arm_movement.wav", t = 30/30},
			{s = "uc_sks/mag_in.wav", t = 51.5/30},
			{s = "weapons/arccw_sks/sks/ak74_foley_hand_grab.wav", t = 105/30},
			{s = "uc_sks/bolt_release_reload.wav", t = 95/30},
		},
    },
    ["reload_30"] = {
        Source = "base_reload",
        Time = 3.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
		    {s = rottle, t = 0.00},
		    {s = common .. "magpouch.ogg", t = 1.17},
		    {s = common .. "magpouchin.ogg", t = 2.34, v = 0.7},
		    {s = ratel, t = 1.79},
		    {s = rottle, t = 2.86},
            {s = "weapons/arccw_sks/sks/sks_foley_arm_movement.wav", t = 10/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_release.wav", t = 17/30},
			{s = "uc_sks/mag_out_30.wav", t = 25/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_out_arm_movement.wav", t = 30/30},
			{s = "uc_sks/mag_in_30.wav", t = 54/30},
			{s = "weapons/arccw_sks/sks/ak74_foley_hand_grab.wav", t = 105/30},
		},
    },
    ["reload_empty_30"] = {
        Source = "base_reloadempty",
        Time = 4.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
	    SoundTable = {
		    {s = rottle, t = 0.00},
		    {s = common .. "magpouch.ogg", t = 1.53},
		    {s = common .. "magpouchin.ogg", t = 3.06, v = 0.7},
		    {s = ratel, t = 2.34},
		    {s = rottle, t = 3.74},
            {s = "weapons/arccw_sks/sks/sks_foley_arm_movement.wav", t = 10/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_release.wav", t = 17/30},
			{s = "uc_sks/mag_out_30.wav", t = 25/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_out_arm_movement.wav", t = 30/30},
			{s = "uc_sks/mag_in_30.wav", t = 51.5/30},
			{s = "weapons/arccw_sks/sks/ak74_foley_hand_grab.wav", t = 105/30},
			{s = "uc_sks/bolt_release_reload.wav", t = 95/30},
		},
    },
    ["reload_poly"] = {
        Source = "base_reload_speed",
        Time = 3.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
		    {s = rottle, t = 0.00},
		    {s = common .. "magpouch.ogg", t = 1.17},
		    {s = common .. "magpouchin.ogg", t = 2.34, v = 0.7},
		    {s = ratel, t = 1.79},
		    {s = rottle, t = 2.86},
            {s = "weapons/arccw_sks/sks/sks_foley_arm_movement.wav", t = 10/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_release.wav", t = 17/30},
			{s = "uc_sks/mag_out_poly.wav", t = 25/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_out_arm_movement.wav", t = 30/30},
			{s = "uc_sks/mag_in_poly_wet.wav", t = 54/30},
			{s = "weapons/arccw_sks/sks/ak74_foley_hand_grab.wav", t = 105/30},
		},
    },
    ["reload_empty_poly"] = {
        Source = "base_reloadempty_speed",
        Time = 4.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
	    SoundTable = {
		    {s = rottle, t = 0.00},
		    {s = common .. "magpouch.ogg", t = 1.53},
		    {s = common .. "magpouchin.ogg", t = 3.06, v = 0.7},
		    {s = ratel, t = 2.34},
		    {s = rottle, t = 3.74},
            {s = "weapons/arccw_sks/sks/sks_foley_arm_movement.wav", t = 10/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_release.wav", t = 17/30},
			{s = "uc_sks/mag_out_poly.wav", t = 25/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_out_arm_movement.wav", t = 30/30},
			{s = "uc_sks/mag_in_poly.wav", t = 51.5/30},
			{s = "weapons/arccw_sks/sks/ak74_foley_hand_grab.wav", t = 105/30},
			{s = "uc_sks/bolt_release_fast.wav", t = 95/30},
		},
    },
    ["reload_5"] = {
        Source = "base_reload",
        Time = 3.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
		SoundTable = {
		    {s = rottle, t = 0.00},
		    {s = common .. "magpouch.ogg", t = 1.17},
		    {s = common .. "magpouchin.ogg", t = 2.34, v = 0.7},
		    {s = ratel, t = 1.79},
		    {s = rottle, t = 2.86},
            {s = "weapons/arccw_sks/sks/sks_foley_arm_movement.wav", t = 10/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_release.wav", t = 17/30},
			{s = "uc_sks/mag_out_5.wav", t = 25/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_out_arm_movement.wav", t = 30/30},
			{s = "uc_sks/mag_in_5.wav", t = 54/30},
			{s = "weapons/arccw_sks/sks/ak74_foley_hand_grab.wav", t = 105/30},
		},
    },
    ["reload_empty_5"] = {
        Source = "base_reloadempty",
        Time = 4.25,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
	    SoundTable = {
		    {s = rottle, t = 0.00},
		    {s = common .. "magpouch.ogg", t = 1.53},
		    {s = common .. "magpouchin.ogg", t = 3.06, v = 0.7},
		    {s = ratel, t = 2.34},
		    {s = rottle, t = 3.74},
            {s = "weapons/arccw_sks/sks/sks_foley_arm_movement.wav", t = 10/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_release.wav", t = 17/30},
			{s = "uc_sks/mag_out_5.wav", t = 25/30},
			{s = "weapons/arccw_sks/sks/sks_foley_mag_out_arm_movement.wav", t = 30/30},
			{s = "uc_sks/mag_in_5.wav", t = 51.5/30},
			{s = "weapons/arccw_sks/sks/ak74_foley_hand_grab.wav", t = 105/30},
			{s = "uc_sks/bolt_release_reload.wav", t = 95/30},
		},
    },
}
