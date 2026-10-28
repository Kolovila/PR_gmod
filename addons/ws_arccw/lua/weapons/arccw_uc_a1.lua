SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "5Urban One-offs"
SWEP.AdminOnly = false
SWEP.UseHands = true

-- Muzzle and shell effects --

SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
SWEP.ShellScale = 0.5
SWEP.ShellPitch = 100
SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
SWEP.UC_ShellColor = Color(0.7*255, 0.2*255, 0.2*255)

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.CamAttachment = 3
SWEP.TracerNum = 1
SWEP.TracerCol = Color(25, 255, 25)
SWEP.TracerWidth = 2

-- Fake name --

SWEP.PrintName = "AMSAS-12"
SWEP.TrueName = "USAR-120"

-- Trivia --

SWEP.Trivia_Class = "Automatic Shotgun"
SWEP.Trivia_Desc = "Happy April Fools' Day!\n\nScrapped total conversion kit for the M16 that turns the rifle into an automatic combat shotgun, based on the USAS-12.\n\nOversized and unwieldy, it heavily slows you down while using it, but with an unparalleled magazine capacity, you can really put the hurt on."
SWEP.Trivia_Manufacturer = "Stoner's Legacy Ltd."
SWEP.Trivia_Calibre = "12 Gauge"
SWEP.Trivia_Mechanism = "Gas-Operated Rotating Bolt"
SWEP.Trivia_Country = "United States of America"
SWEP.Trivia_Year = 1959

-- Weapon slot --

SWEP.Slot = 2

-- Weapon's manufacturer real name --

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Colt's Manufacturing Company"
end

-- Viewmodel / Worldmodel / FOV --

SWEP.ViewModel = "models/uc/a1.mdl"
SWEP.WorldModel = "models/uc/a1.mdl"
SWEP.ViewModelFOV = 70
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

-- Damage --

SWEP.Damage = ArcCW.UC.StdDmg["12g_s"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["12g_s"].min
SWEP.Penetration = ArcCW.UC.StdDmg["12g_s"].pen
SWEP.Num = ArcCW.UC.StdDmg["12g_s"].num
SWEP.Range = 40
SWEP.RangeMin = 5
SWEP.DamageType = DMG_BULLET + DMG_BUCKSHOT
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 400

-- Mag size --

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 10

-- Recoil --

SWEP.Recoil = 6
SWEP.RecoilSide = 4

SWEP.RecoilRise = 0.5
SWEP.RecoilPunch = 1
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 1
SWEP.RecoilPunchBack = 1

SWEP.Sway = 0.5

-- Firerate / Firemodes --

SWEP.Delay = (1/3)
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.ShootPitch = 100
SWEP.ShootVol = 120
SWEP.ShootPitchVariation = 0

SWEP.ReloadInSights = true

-- NPC --

SWEP.NPCWeaponType = "weapon_shotgun"
SWEP.NPCWeight = 60

-- Accuracy --

SWEP.AccuracyMOA = 60
SWEP.HipDispersion = 800
SWEP.MoveDispersion = 200
SWEP.JumpDispersion = 1000

SWEP.Primary.Ammo = "buckshot"

SWEP.HeatCapacity = 150
SWEP.HeatDissipation = 10
SWEP.HeatDelayTime = 3

SWEP.MalfunctionMean = 200

-- Speed multipliers --

SWEP.SpeedMult = 0.85
SWEP.SightedSpeedMult = 0.75
SWEP.SightTime = 0.4
SWEP.ShootSpeedMult = 0.5

-- Length --

SWEP.BarrelLength = 48
SWEP.ExtraSightDist = 2

-- Ironsights / Customization / Poses --

SWEP.HolsterPos = Vector(0.5, -1, 1.2)
SWEP.HolsterAng = Angle(-8.5, 8, -10)

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.IronSightStruct = {
	Pos = Vector(-2.81, -3, 0.8),
	Ang = Angle(0.1, 0, 0),
	Magnification = 1.1,
	SwitchToSound = "",
}

SWEP.ActivePos = Vector(0.2, -1, 1.2)
SWEP.ActiveAng = Angle(0, 0, -3)

SWEP.CustomizePos = Vector(5, -2, -2)
SWEP.CustomizeAng = Angle(15, 25, 0)

SWEP.CrouchPos = Vector(-5, -2, 1)
SWEP.CrouchAng = Angle(0, 0, -25)

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-7.8, 3.5, -7),
    ang        =    Angle(-6, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
}

-- Firing sounds --

local path = ")uc/a1/"
local common = ")arccw_uc/common/"
SWEP.ShootSound = path .. "fire.ogg"
SWEP.DistantShootSound = path .. "fire_dist.ogg"
SWEP.ShootSoundSilenced = path .. "fire_supp.ogg"

-- Bodygroups --

SWEP.BulletBones = {
    [2] = "m16_bullets1",    [3] = "m16_bullets2"
}

SWEP.DefaultBodygroups = "0000000000"
SWEP.UC_CanManualAction = true

SWEP.AttachmentElements = {
    ["uc_a1_mag_20"] = {
        VMBodygroups = {{ind = 2, bg = 1}},
    },
    ["optic"] = {
        VMBodygroups = {
			{ind = 1, bg = 1},
			{ind = 3, bg = 1},
			{ind = 10, bg = 1},
		},
    },
    ["uc_a1_rs"] = {
        VMBodygroups = {
			{ind = 8, bg = 1},
			{ind = 10, bg = 0},
		},
    },
    ["tac"] = {
        VMBodygroups = {
			{ind = 7, bg = 1},
		},
    },
    ["uc_a1_rail_fg"] = {
        VMBodygroups = {{ind = 9, bg = 1}},
    },
    ["uc_a1_grip_ergo"] = {
        VMBodygroups = {{ind = 6, bg = 1}},
    },
    ["uc_a1_grip_skel"] = {
        VMBodygroups = {{ind = 6, bg = 2}},
    },
    ["uc_a1_grip_wood"] = {
        VMBodygroups = {{ind = 6, bg = 3}},
    },
    ["uc_a1_stock_wood"] = {
        VMBodygroups = {{ind = 5, bg = 1}},
    },
    ["stock_carbine_ex"] = {
        VMBodygroups = {{ind = 5, bg = 3}},
    },
    ["stock_carbine_in"] = {
        VMBodygroups = {{ind = 5, bg = 2}},
    },
    ["uc_a1_stock_buffer"] = {
        VMBodygroups = {{ind = 5, bg = 4}},
    },
}

-- Animations --

SWEP.Hook_Think = ArcCW.UC.ADSReload

local rottle = {common .. "cloth_1.ogg", common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_5.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_empty"] = {
        Source = "idle_empty",
    },
    ["draw"] = {
        Source = "draw",
    },
    ["draw_empty"] = {
        Source = "draw_empty",
        Time = 20 / 30,
    },
    ["holster"] = {
        Source = "holster",
    },
    ["holster_empty"] = {
        Source = "holster_empty",
        Time = 20 / 30,
    },
    ["fire"] = {
        Source = "fire",
        Time = 20 / 30,
        ShellEjectAt = 0.01,
        SoundTable = {
            {s = path .. "mech.ogg", t = 0}, -- Temporary
        },
    },
    ["fire_empty"] = {
        Source = "fire_empty",
        Time = 20 / 30,
        ShellEjectAt = 0.01,
        SoundTable = {
            {s = path .. "mech_last.ogg", t = 0}, -- Temporary
        },
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Time = 71 / 30,
        MinProgress = 1.5,
        LastClip1OutTime = 0.9,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.4,
        LHIKOut = 0.6,
        SoundTable = {
            {s = rottle, t = 0.0},
            {s = path .. "magout.ogg", 	 t = 0.35},
            {s = rottle, t = 0.75},
            {s = path .. "magin.ogg",    t = 1.05},
            {s = rottle, t = 1.1},
            {s = common .. "shoulder.ogg", t = 1.85},
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Time = 79 / 30,
        MinProgress = 2,
        LastClip1OutTime = 0.7,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle,  t = 0.0},
            {s = path .. "magout.ogg", 	 t = 0.35},
            {s = rottle,  t = 0.75},
            {s = path .. "magin.ogg",    t = 1.05},
            {s = rottle,  t = 1.475},
            {s = path .. "boltdrop.ogg", t = 1.73},
            {s = common .. "shoulder.ogg", t = 2.2},
        },
    },
    ["reload_empty_20"] = {
        Source = "reload_empty_20",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Time = 86 / 30,
        MinProgress = 2.5,
        LastClip1OutTime = 0.7,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
        SoundTable = {
            {s = rottle, t = 0.0},
            {s = path .. "magout.ogg", 	 t = 0.2},
            {s = rottle, t = 0.75},
            {s = path .. "magin.ogg",    t = 1.05},
            {s = rottle, t = 1.75},
            {s = path .. "usas_chback.ogg",   t = 1.9},
            {s = common .. "cloth_4.ogg",  t = 2.0},
            {s = path .. "usas_chamber.ogg",  t = 2.14},
            {s = common .. "shoulder.ogg", t = 2.55},
        },
    },
}
SWEP.Animations["reload_20"] = SWEP.Animations["reload_empty_20"]

SWEP.Hook_ModifyBodygroups = function(wep, data)
    local vm = data.vm
end

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic", "optic_sniper", "uc_a1_rs"},
        Bone = "m16_parent",
        Offset = {
            vpos = Vector(-0.02, -1.65, 3),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"optic"},
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"choke", "muzzle_shotgun"},
        Bone = "m16_parent",
        Offset = {
            vpos = Vector(0, -0.35, 25.25),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"sd", "m16_usas"},
    },
    {
        PrintName = "Underbarrel",
        Slot = "foregrip",
        Bone = "m16_parent",
        Offset = {
            vpos = Vector(0, 1.6, 11),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"uc_a1_rail_fg"},
        ExcludeFlags = {"m16_lmg"},
        MergeSlots = {13}
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "m16_parent",
        Offset = {
            vpos = Vector(0, 0.8, 20.4),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"tac"}
    },
    {
        PrintName = "Grip Type",
        Slot = "uc_a1_grip",
        DefaultAttName = "A2 Pistol Grip",
    },
    {
        PrintName = "Stock",
        Slot = "uc_a1_stock",
        DefaultAttName = "Full Stock",
    },
    {
        PrintName = "Magazine",
        Slot = "uc_a1_mag",
        DefaultAttName = "10-Round Mag",
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"BUCK\" #00 Buckshot",
        DefaultAttIcon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth"),
        Slot = "ud_ammo_shotgun",
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
        Slot = "uc_fg", -- Fire group
        DefaultAttName = "Standard Internals"
    },
    {
        PrintName = "Charm",
        Slot = {"charm", "fml_charm"},
        FreeSlot = true,
        Bone = "m16_parent",
        Offset = {
            vpos = Vector(0.6, 1, 5),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "M203 slot",
        Slot = "uc_ubgl",
        Bone = "m16_parent",
        Offset = {
            vpos = Vector(0, 0.5, 8.8),
            vang = Angle(90, 0, -90),
        },
        Hidden = true,
        InstalledEles = {"uc_a1_rail_fg"},
        ExcludeFlags = {"m16_lmg", "m16_stub"},
    }
}