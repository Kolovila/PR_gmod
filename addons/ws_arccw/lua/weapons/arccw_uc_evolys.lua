SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.MuzzleEffect = "muzzleflash_6"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellScale = 1.145
SWEP.ShellPitch = 90
SWEP.ShellRotateAngle = Angle(0, 0, 0)
SWEP.UC_ShellColor = Color(0.7*255, 0.2*255, 0.2*255)

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.TracerNum = 0
SWEP.TracerCol = Color(25, 255, 25)
SWEP.TracerWidth = 2

SWEP.PrintName = "HZMG Evo"

SWEP.TrueName = "FN Evolys"

SWEP.Trivia_Class = "Machine Gun"
SWEP.Trivia_Desc = "The FN EVOLYS is a light machine gun designed by FN Herstal in 2021, chambered for 5.56×45mm NATO and 7.62×51mm NATO. The EVOLYS was designed to be lighter and more ergonomic than other machine guns, such as the FN Minimi."
SWEP.Trivia_Manufacturer = "Héristal van Hoog-Zert"
SWEP.Trivia_Calibre = "7.62x51mm"
SWEP.Trivia_Mechanism = "Gas-Operated Open Bolt"
SWEP.Trivia_Country = "Belgium"
SWEP.Trivia_Year = 	2021

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
end

SWEP.Slot = 2

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "FN Herstal"
end

SWEP.ViewModel = "models/weapons/arccw/uc_evolys.mdl"
SWEP.WorldModel = "models/weapons/arccw/uc_evolys.mdl"
SWEP.ViewModelFOV = 65
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.Damage = ArcCW.UC.StdDmg["762_51"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["762_51"].min
SWEP.RangeMin = 50
SWEP.Range = 400
SWEP.Penetration = ArcCW.UC.StdDmg["762_51"].pen
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = ArcCW.UC.StdDmg["762_51"].vel
SWEP.PhysBulletMuzzleVelocity = ArcCW.UC.StdDmg["762_51"].vel

SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 100

SWEP.Recoil = 0.42
SWEP.RecoilSide = 0.35

SWEP.RecoilRise = 0.55
SWEP.RecoilPunch = 3.2
SWEP.VisualRecoilMult = 0.55
SWEP.MaxRecoilBlowback = 1.1
SWEP.MaxRecoilPunch = 1.2
SWEP.RecoilPunchBack = 1.1
SWEP.Sway = 0.6

SWEP.Delay = 60 / 750
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.ShootPitch = 100
SWEP.ShootVol = 114

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 60

SWEP.AccuracyMOA = 6
SWEP.HipDispersion = 550
SWEP.MoveDispersion = 700

SWEP.Primary.Ammo = "ar2"

SWEP.SpeedMult = 0.84
SWEP.SightedSpeedMult = 0.70
SWEP.SightTime = 0.45

SWEP.BarrelLength = 42
SWEP.ExtraSightDist = 7

SWEP.HolsterPos = Vector(4.623, -2.211, 1.004)
SWEP.HolsterAng = Angle(-8.443, 28.843, 0)

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.IronSightStruct = {
    Pos = Vector(-3.86, -1.463, 0.64),
    Ang = Angle(0, 0, 0),
    Magnification = 1,
    SwitchToSound = "",
}

SWEP.ActivePos = Vector(1.16, 1.951, 0.84)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(6.4, 0, -0.24)
SWEP.CustomizeAng = Angle(8.78, 25.366, 7.805)

SWEP.CrouchPos = Vector(-2, -2, 0)
SWEP.CrouchAng = Angle(0, 0, -8)

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(-9, 4.75, -7.5),
    ang = Angle(-6, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
}

local path = ")^uc_evolys/"
local common = ")^arccw_uc/common/"
local rottle = {common .. "cloth_1.ogg", common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local ratel = {common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg"}
local rutle = {common .. "movement-rifle-01.ogg", common .. "movement-rifle-02.ogg", common .. "movement-rifle-03.ogg", common .. "movement-rifle-04.ogg"}

SWEP.ShootSound = {
    path .. "fire1.wav",
    path .. "fire2.wav",
    path .. "fire3.wav",
    path .. "fire4.wav",
}
SWEP.ShootSoundSilenced = path .. "fire_sup.wav"
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = common .. "sup_tail.ogg"
SWEP.ShootDrySound = nil

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

SWEP.BulletBones = {
	[1] = {"Wep_MGZ_Belt1"},
	[2] = {"Wep_MGZ_Belt2"},
	[3] = {"Wep_MGZ_Belt3"},
	[4] = {"Wep_MGZ_Belt4"},
	[5] = {"Wep_MGZ_Belt5"},
	[6] = {"Wep_MGZ_Belt6"},
	[7] = {"Wep_MGZ_Belt7"},
	[8] = {"Wep_MGZ_Belt8"},
	[9] = {"Wep_MGZ_Belt9"},
	[10] = {"Wep_MGZ_Belt10"},
	[11] = {"Wep_MGZ_Belt11"},
	[12] = {"Wep_MGZ_Belt12"},

}

SWEP.DefaultBodygroups = "000000000"

local _FPS_RELOAD = 30

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
        Framerate = 60,
        Time = 330 / 60,
    },
    ["idle_empty"] = {
        Source = "idle_empty",
        Framerate = 60,
        Time = 330 / 60,
    },
    ["ready"] = {
        Source = "ready",
        Framerate = 30,
        Time = 59 / 30,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.6,
        SoundTable = {
            {s = common .. "raise.ogg", t = 3 / 30, c = ca},
            {s = rottle, t = 10 / 30, c = ca},
            {s = path .. "chback.wav", t = 36 / 30, c = ca},
            {s = path .. "chrelease.wav", t = 40 / 30, c = ca},
            {s = common .. "shoulder.ogg", t = 50 / 30, c = ca},
        },
    },
    ["draw"] = {
        Source = "draw",
        Framerate = 30,
        Time = 32 / 30,
        SoundTable = {
            {s = common .. "raise.ogg", t = 4 / 30, c = ca},
            {s = rottle, t = 10 / 30, c = ca},
            {s = common .. "shoulder.ogg", t = 22 / 30, c = ca},
        },
    },
    ["draw_empty"] = {
        Source = "draw_empty",
        Framerate = 30,
        Time = 58 / 30,
        SoundTable = {
            {s = common .. "raise.ogg", t = 4 / 30, c = ca},
            {s = rottle, t = 14 / 30, c = ca},
            {s = common .. "shoulder.ogg", t = 46 / 30, c = ca},
        },
    },
    ["holster"] = {
        Source = "holster",
        Framerate = 30,
        Time = 32 / 30,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0, c = ca},
            {s = ratel, t = 8 / 30, c = ca},
            {s = common .. "raise.ogg", t = 18 / 30, c = ca},
        },
    },
    ["holster_empty"] = {
        Source = "holster_empty",
        Framerate = 30,
        Time = 58 / 30,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0, c = ca},
            {s = ratel, t = 16 / 30, c = ca},
            {s = common .. "raise.ogg", t = 38 / 30, c = ca},
        },
    },
    ["fire"] = {
        Source = {"fire2"},
        Framerate = 60,
        Time = 10 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {{s = path .. "mech.wav", t = 0, v = 0.25}},
    },
    ["fire_empty"] = {
        Source = "fire_empty",
        Framerate = 60,
        Time = 43 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {{s = path .. "mech.wav", t = 0, v = 0.25}},
    },

    ["reload"] = {
        Source = "wet",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = _FPS_RELOAD,
        Time = 259 / _FPS_RELOAD,
        LastClip1OutTime = 46 / _FPS_RELOAD,
        LHIK = true,
        LHIKIn = 2.2,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.7,
        SoundTable = {
            {s = common .. "cloth_4.ogg", t = 2 / _FPS_RELOAD},
            {s = common .. "grab-polymer.ogg", t = 8 / _FPS_RELOAD},
            {s = rutle, t = 14 / _FPS_RELOAD},
            {s = path .. "cover_open_new.wav", t = 18 / _FPS_RELOAD},
            {s = path .. "inspect_boxgrab.wav", t = 43 / _FPS_RELOAD},
            {s = path .. "belt_pull.wav", t = 43 / _FPS_RELOAD},
            {s = path .. "magout_new.wav", t = 46 / _FPS_RELOAD},
            {s = ratel, t = 58 / _FPS_RELOAD},
            {s = common .. "m249_fetchmag.wav", t = 68 / _FPS_RELOAD},
            {s = common .. "magpouch.ogg", t = 123 / _FPS_RELOAD},
            {s = path .. "magin_struggle_new.wav", t = 123 / _FPS_RELOAD},
            {s = path .. "magin_soft.wav", t = 130 / _FPS_RELOAD},
            {s = path .. "inspect_box_letgo.wav", t = 132 / _FPS_RELOAD},
            {s = path .. "magin_struggle_new.wav", t = 134 / _FPS_RELOAD},
            {s = path .. "belt_pull_short.wav", t = 155 / _FPS_RELOAD},
            {s = rottle, t = 168 / _FPS_RELOAD},
            {s = path .. "belt_align.wav", t = 178 / _FPS_RELOAD},
            {s = ratel, t = 196 / _FPS_RELOAD},
            {s = path .. "cover_close_new.wav", t = 226 / _FPS_RELOAD},
            {s = common .. "grab-polymer.ogg", t = 236 / _FPS_RELOAD},
            {s = rutle, t = 246 / _FPS_RELOAD},
        },
    },
    ["reload_empty"] = {
        Source = "dry",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = _FPS_RELOAD,
        Time = 222 / _FPS_RELOAD,
        LastClip1OutTime = 66 / _FPS_RELOAD,
        LHIK = true,
        LHIKIn = 2.2,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.7,
        SoundTable = {
            {s = common .. "cloth_4.ogg", t = 2 / _FPS_RELOAD},
            {s = rutle, t = 8 / _FPS_RELOAD},
            {s = rottle, t = 16 / _FPS_RELOAD},
            {s = path .. "chback.wav", t = 21 / _FPS_RELOAD},
            {s = path .. "chrelease.wav", t = 31 / _FPS_RELOAD},
            {s = common .. "grab-polymer.ogg", t = 36 / _FPS_RELOAD},
            {s = path .. "inspect_boxgrab.wav", t = 63 / _FPS_RELOAD},
            {s = path .. "magout_new.wav", t = 66 / _FPS_RELOAD},
            {s = common .. "m249_fetchmag.wav", t = 82 / _FPS_RELOAD},
            {s = common .. "magpouch.ogg", t = 90 / _FPS_RELOAD},
            {s = path .. "magin_struggle_new.wav", t = 94 / _FPS_RELOAD},
            {s = path .. "magin_soft.wav", t = 102 / _FPS_RELOAD},
            {s = path .. "inspect_box_letgo.wav", t = 105 / _FPS_RELOAD},
            {s = path .. "cover_open_new.wav", t = 123 / _FPS_RELOAD},
            {s = path .. "belt_pull_short.wav", t = 131 / _FPS_RELOAD},
            {s = rottle, t = 140 / _FPS_RELOAD},
            {s = path .. "belt_pull.wav", t = 148 / _FPS_RELOAD},
            {s = path .. "belt_align.wav", t = 150 / _FPS_RELOAD},
            {s = ratel, t = 172 / _FPS_RELOAD},
            {s = path .. "cover_close_short.wav", t = 186 / _FPS_RELOAD},
            {s = common .. "grab-polymer.ogg", t = 198 / _FPS_RELOAD},
            {s = rutle, t = 208 / _FPS_RELOAD},
        },
    },

    ["enter_inspect"] = {
        Source = "inspect_in",
        Framerate = 30,
        Time = 34 / 30,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
        SoundTable = {
            {s = rottle, t = 2 / 30, c = ca},
            {s = common .. "grab-polymer.ogg", t = 2 / 30, c = ca},
            {s = ratel, t = 15 / 30, c = ca},
            {s = path .. "inspect_boxgrab.wav", t = 15 / 30, c = ca},
        },
    },
    ["idle_inspect"] = {
        Source = "inspect_loop",
        Framerate = 30,
        Time = 2 / 30,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect"] = {
        Source = "inspect_out",
        Framerate = 30,
        Time = 34 / 30,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            {s = ratel, t = 10 / 30, c = ca},
            {s = path .. "inspect_box_letgo.wav", t = 10 / 30, c = ca},
            {s = rottle, t = 24 / 30, c = ca},
            {s = common .. "grab-polymer.ogg", t = 28 / 30, c = ca},
        },
    },

    ["enter_inspect_empty"] = {
        Source = "inspect_in",
        Framerate = 30,
        Time = 34 / 30,
        LHIK = true,
        LHIKIn = 0.1,
        LHIKOut = 0,
        SoundTable = {
            {s = rottle, t = 2 / 30, c = ca},
            {s = common .. "grab-polymer.ogg", t = 2 / 30, c = ca},
            {s = ratel, t = 15 / 30, c = ca},
            {s = path .. "inspect_boxgrab.wav", t = 15 / 30, c = ca},
        },
    },
    ["idle_inspect_empty"] = {
        Source = "inspect_loop",
        Framerate = 30,
        Time = 2 / 30,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect_empty"] = {
        Source = "inspect_out",
        Framerate = 30,
        Time = 34 / 30,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            {s = ratel, t = 10 / 30, c = ca},
            {s = path .. "inspect_box_letgo.wav", t = 10 / 30, c = ca},
            {s = rottle, t = 24 / 30, c = ca},
            {s = common .. "grab-polymer.ogg", t = 28 / 30, c = ca},
        },
    },
}

SWEP.AttachmentElements = {

    ["box_50"] = {
        VMBodygroups = {
            {ind = 4, bg = 1},
        },
    },
    ["barrel_long"] = {
        VMBodygroups = {
            {ind = 2, bg = 2},
            {ind = 3, bg = 3},
        },
        AttPosMods = {
            [3] = {
                vpos = Vector(0, -4.661, 31.98),
            },
        }
    },
    ["barrel_short"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
            {ind = 3, bg = 2},
        },
        AttPosMods = {
            [3] = {
                vpos = Vector(0, -4.661, 22.88),
            },
        }
    },
    ["nors"] = {
        VMBodygroups = {
            {ind = 1, bg = 1},
        },
    },

    ["nofh"] = {
        VMBodygroups = {
            {ind = 3, bg = 1},
        },
    },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = {"optic_lp", "optic", "sniper_optic"},
        DefaultAttName = "Iron Sights",
        Bone = "Wep_Align",
        Offset = {
            vpos = Vector(0, -6.96, 1.54),
            vang = Angle(90, 0, -90),
        },
        ExtraSightDist = 10,
        InstalledEles = {"nors"},
        CorrectivePos = Vector(0, 0, 0),
        CorrectiveAng = Angle(0, 0, 0),
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_evolys_barrel"},
        DefaultAttIcon = Material(""),
        DefaultAttName = "21' Standard Issue Barrel",
        Bone = "Wep_Align",
        Offset = {
            vpos = Vector(0, -4.62, 23.0),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "Wep_Align",
        Offset = {
            vpos = Vector(0, -4.661, 24.74),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"nofh"},
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip","bipod","ubgl"},
        Bone = "Wep_Align",
        Offset = {
            vpos = Vector(0, -2.24, 13.24),
            vang = Angle(90, 0, -90),
        },
        ExcludeFlags = {"fnchand"},
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "Wep_Align",
        Offset = {
            vpos = Vector(-0.95, -4.583, 15.31),
            vang = Angle(-90, -180, 0),
        },
    },
    {
        PrintName = "Upper Receiver",
        Slot = {"uc_evolys_cal"},
        DefaultAttIcon = Material("entities/att/uc_bullets/762x51.png","mips smooth"),
        DefaultAttName = "7.62×51mm",
    },
    {
        PrintName = "Mag Type",
        Slot = {"uc_evolys_mag"},
        DefaultAttIcon = Material(""),
        DefaultAttName = "100-Round Standard Box",
        ExcludeFlags = {"mag_smg", "mag_762"},
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
}
