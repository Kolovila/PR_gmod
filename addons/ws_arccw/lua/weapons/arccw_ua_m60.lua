SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "4Urban Anarchy"
SWEP.AdminOnly = false

SWEP.PrintName = "M60"
SWEP.Trivia_Class = "Machine Gun"
SWEP.Trivia_Desc = [[Classic machine gun with a beefy profile and a beefy cartridge. Despite glaring reliability issues, it is remembered fondly as an icon of the Vietnam War. Troops have affectionately nicknamed it "the Pig" for its bulkiness and demanding ammo consumption.

As one of the heaviest infantry weapons available, it handles the round's recoil quite well, especially when mounted.]]
SWEP.Trivia_Manufacturer = "U.S. Ordnance"
SWEP.Trivia_Calibre = "7.62x51mm NATO"
SWEP.Trivia_Mechanism = "Gas-Operated Open Bolt"
SWEP.Trivia_Country = "United States"
SWEP.Trivia_Year = 1957

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/arccw/c_ua_m60.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_ua_m60.mdl"
SWEP.ViewModelFOV = 85
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.DefaultBodygroups = "0000000000"

SWEP.Damage = ArcCW.UC.StdDmg["762_51"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["762_51"].min
SWEP.Range = 100
SWEP.Penetration = ArcCW.UC.StdDmg["762_51"].pen
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 100

SWEP.PhysBulletMuzzleVelocity = 853

SWEP.Recoil = 0.245
SWEP.RecoilSide = 0.245
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 5

SWEP.ShootPitchVariation = 0

SWEP.TriggerDelay = true

SWEP.Delay = 60 / 550
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
        Mult_TriggerDelayTime = 1,
    },
    {
        Mode = 0,
    },
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 20

SWEP.AccuracyMOA = 7
SWEP.HipDispersion = 450
SWEP.MoveDispersion = 250

SWEP.Primary.Ammo = "ar2"
SWEP.MagID = "m60"

SWEP.ShootVol = 110
SWEP.ShootPitch = 100

local path = ")^/arccw_ue/m60/"
local common = ")^/arccw_uc/common/"

SWEP.ShootSound = {
    path .. "fire-01.ogg",
    path .. "fire-02.ogg",
    path .. "fire-03.ogg",
    path .. "fire-04.ogg",
    path .. "fire-05.ogg",
    path .. "fire-06.ogg"
}
SWEP.ShootSoundSilenced = path .. "fire_supp.ogg"
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = common .. "sup_tail.ogg"
SWEP.ShootDrySound = path .. "dryfire.ogg"

local tail = ")^/arccw_uc/common/308/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-308-mg-ext-01.ogg",
    tail .. "fire-dist-308-mg-ext-02.ogg",
    tail .. "fire-dist-308-mg-ext-03.ogg",
    tail .. "fire-dist-308-mg-ext-04.ogg",
    tail .. "fire-dist-308-mg-ext-05.ogg",
    tail .. "fire-dist-308-mg-ext-06.ogg"
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

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellScale = 1.145
SWEP.ShellPitch = 90
SWEP.ShellRotateAngle = Angle(0, 0, 0)

SWEP.BulletBones = {
	[1] = {"BELT_BONE_01"},
	[2] = {"BELT_BONE_02"},
	[3] = {"BELT_BONE_03"},
	[4] = {"BELT_BONE_04"},
	[5] = {"BELT_BONE_05"},
	[6] = {"BELT_BONE_06"},
	[7] = {"BELT_BONE_07"},
	[8] = {"BELT_BONE_08"},
}

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2

SWEP.SpeedMult = 0.85
SWEP.SightedSpeedMult = 0.5
SWEP.SightTime = 0.425
SWEP.ShootSpeedMult = 0.5

SWEP.IronSightStruct = {
    Pos = Vector(-4.32, -0.976, -0.08),
    Ang = Angle(0, 0, 3.902),
    Magnification = 1,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.Bipod_Integral = true
SWEP.BipodDispersion = 0.1
SWEP.BipodRecoil = 0.05

SWEP.ActivePos = Vector(0, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(0.32, -2.439, 0.48)
SWEP.CrouchAng = Angle(0, 0, -2.927)

SWEP.HolsterPos = Vector(3, 3, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.CustomizePos = Vector(8, -0.488, 1)
SWEP.CustomizeAng = Angle(5, 30, 30)

SWEP.BarrelLength = 24

SWEP.AttachmentElements = {
     ["box_200"] = {
        VMBodygroups = {
            {ind = 4, bg = 1},
        },
    },
    ["box_50"] = {
        VMBodygroups = {
            {ind = 4, bg = 2},
        },
    },
    ["box_150"] = {
        VMBodygroups = {
            {ind = 4, bg = 3},
        },
    },
    ["barrel_short"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
        AttPosMods = {
            [5] = {
                vpos = Vector(-3.095, 0, 0.737),
                vang = Angle(0, 0, 0),
            }
        },
    },
    ["barrel_tac"] = {
        VMBodygroups = {
            {ind = 2, bg = 2},
            {ind = 0, bg = 1},
            {ind = 1, bg = 1},
            {ind = 3, bg = 1},
            {ind = 5, bg = 1},
            {ind = 8, bg = 1},
        },
        AttPosMods = {
            [5] = {
                vpos = Vector(1.425, 0, 0.716),
                vang = Angle(0, 0, 0),
            }
        },
    },
    ["stock_none"] = {
        VMBodygroups = {
            {ind = 5, bg = 2},
        },
    },
    ["cal_410"] = {
        VMBodygroups = {
            {ind = 7, bg = 1},
        },
    },
    ["cal_9mm"] = {
        VMBodygroups = {
            {ind = 7, bg = 2},
        },
    },
    ["cal_556"] = {
        VMBodygroups = {
            {ind = 7, bg = 3},
        },
    },
}

SWEP.GuaranteeLaser = true

SWEP.WorldModelOffset = {
    pos = Vector(-19, 8, -5),
    ang = Angle(-10, 0, 180)
}

SWEP.MirrorVMWM = true

SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = "optic",
        Bone = "MG_cover",
        DefaultAttName = "Iron Sights",
        Offset = {
            vpos = Vector(-5.548, 0.298, 1.191),
            vang = Angle(0, 0, 0),
        },
        RequireFlags = {"barrel_tac"},
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip", "m249_bipod"},
        Bone = "Barrel",
        Offset = {
            vpos = Vector(-10.576, 0, -2.6),
            vang = Angle(0, 0, 0),
        },
        RequireFlags = {"barrel_tac"},
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "Barrel",
        Offset = {
            vpos = Vector(-12.11948, -1.96827, 1.1),
            vang = Angle(0, 0, 90),
        },
        RequireFlags = {"barrel_tac"},
    },
    {
        PrintName = "Barrel",
        Slot = "uc_m60_barrel",
        DefaultAttName = "22\" Factory Barrel",
        Bone = "Barrel",
        Offset = {
            vpos = Vector(-10.55, 0, -3),
            vang = Angle(0, 0, 0),
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = "muzzle",
        Bone = "Barrel",
        Offset = {
            vpos = Vector(10.095, 0.039, 0.711),
            vang = Angle(0, 0, 0),
        },
    },
     {
        PrintName = "Caliber",
        Slot = "uc_m60_cal",
        DefaultAttName = "7.62x51mm",
        DefaultAttIcon = Material("entities/att/uc_bullets/762x51.png", "smooth mips"),
    },
    {
        PrintName = "Magazine",
        Slot = "uc_m60_mag",
        DefaultAttName = "100-Round Box"
    },
    {
        PrintName = "Stock",
        Slot = {"uc_m60_stock"},
        DefaultAttName = "Factory Stock",
        Bone = "v_weapon.m249_Parent",
        Offset = {
            vpos = Vector(0, -4, -3),
            vang = Angle(90, 0, -90),
        },
        VMScale = Vector(1, 1, 1),
        ExcludeFlags = {"barrel_tac"},
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
        Slot = {"uc_fg", "uc_m60_fg"},
        DefaultAttName = "Standard Internals"
    },
    {
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "Barrel",
        Offset = {
            vpos = Vector(-23.143, -0.874, -0.099),
            vang = Angle(0, 0, 0),
        },
    },
}

SWEP.Hook_Think = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    vm:SetPoseParameter( "sights", Lerp(wep:GetSightDelta(), 1, 0) )
end

SWEP.RejectAttachments = {
  ["lpak_polymer"] = true,
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
        Framerate = 60,
        Time = 330 / 60,
    },
    ["idle_empty"] = {
        Source = "idle",
        Framerate = 60,
        Time = 330 / 60,
    },
    ["ready"] = {
        Source = "ready",
        Framerate = 60,
        Time = 68 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.6,
        SoundTable = {
             { s = common .. "cloth_4.ogg", t = 6 / 30, c = ca },
            { s = path .. "chback.ogg", t = 10 / 30, c = ca },
            { s = path .. "chforward.ogg", t = 17 / 30, c = ca },
            { s = common .. "cloth_1.ogg", t = 18 / 30, c = ca },
        },
    },
    ["draw"] = {
        Source = "draw",
        Framerate = 60,
    },
    ["holster"] = {
        Source = "holster",
        Framerate = 60,
    },
    ["trigger"] = {
        Source = "idle",
        Time = 0.075,
        SoundTable = {
            {s = path .. "prefire.ogg",         t = 0, c = CHAN_WEAPON, v = 0.5},
        },
    },
    ["trigger_iron"] = {
        Source = "idle",
        Time = 0.075,
        SoundTable = {
            {s = path .. "prefire.ogg",         t = 0, c = CHAN_WEAPON},
        },
    },
    ["fire"] = {
        Source = {"fire1","fire2","fire3"},
        Framerate = 60,
        Time = 43 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {{ s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0, v = 0.25 }},
    },
    ["fire_iron"] = {
        Source = {"fire1","fire2","fire3"},
        Framerate = 60,
        Time = 43 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {
            {s = common .. "common_mech_light.ogg", t = 0, v = 0.2 },
            { s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0 }
        },
    },
    ["fire_empty"] = {
        Source = {"fire1","fire2","fire3"},
        Framerate = 60,
        Time = 43 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {{ s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0, v = 0.25 }},
    },
    ["fire_iron_empty"] = {
        Source = {"fire1","fire2","fire3"},
        Framerate = 60,
        Time = 43 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {
            {s = common .. "common_mech_light.ogg", t = 0, v = 0.2 },
            { s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0 }
        },
    },

    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 1,
        Time = 298 / 60,
        Framerate = 60,
        LastClip1OutTime = 2.4,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.62,
        SoundTable = {
            { s = common .. "cloth_4.ogg", t = 4 / 30, c = ca },
            { s = path .. "lidopen.ogg", t = 10 / 30, c = ca },
            { s = path .. "belt1.ogg", t =  31 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 30 / 30, c = ca },
            { s = path .. "boxremove.ogg", t = 35 / 30, c = ca },
            { s = common .. "cloth_3.ogg", t = 50 / 30, c = ca },
            { s = path .. "boxinsert.ogg", t = 76 / 30, c = ca },
            { s = common .. "cloth_1.ogg", t = 85 / 30, c = ca },
            { s = path .. "belt2.ogg", t =  90 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 110 / 30, c = ca },
            { s = path .. "lidclose.ogg", t = 115 / 30, c = ca },
            { s = path .. "grab.ogg", t = 130 / 30, c = ca, v = 0.25 },
            { s = common .. "shoulder.ogg", t = 135 / 30, c = ca },
        },
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 60,
        Time = 344 / 60,
        LastClip1OutTime = 3,
        LHIK = true,
        LHIKIn = 2.2,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.7,
        SoundTable = {
            { s = common .. "cloth_4.ogg", t = 4 / 30, c = ca },
            { s = path .. "chback.ogg", t = 15 / 30, c = ca },
            { s = path .. "chforward.ogg", t = 25 / 30, c = ca },
            { s = common .. "cloth_1.ogg", t = 26 / 30, c = ca },
            { s = path .. "lidopen.ogg", t = 39 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 40 / 30, c = ca },
            { s = path .. "boxremove.ogg", t = 55 / 30, c = ca },
            { s = common .. "cloth_3.ogg", t = 80 / 30, c = ca },
            { s = path .. "boxinsert.ogg", t = 100 / 30, c = ca },
            { s = path .. "belt2.ogg", t =  111 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 125 / 30, c = ca },
            { s = path .. "lidclose.ogg", t = 140 / 30, c = ca, v = 1 },
            { s = path .. "grab.ogg", t = 150 / 30, c = ca, v = 0.25 },
            { s = common .. "shoulder.ogg", t = 155 / 30, c = ca },
        },
    },
    ["reload_50"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 1,
        Time = 298 / 60,
        Framerate = 60,
        LastClip1OutTime = 2.4,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.62,
        SoundTable = {
            { s = common .. "cloth_4.ogg", t = 4 / 30, c = ca },
            { s = path .. "lidopen.ogg", t = 10 / 30, c = ca },
            { s = path .. "belt1.ogg", t =  31 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 30 / 30, c = ca },
            { s = path .. "boxremove_50_new.wav", t = 35 / 30, c = ca },
            { s = common .. "cloth_3.ogg", t = 50 / 30, c = ca },
            { s = path .. "boxinsert_50_new.wav", t = 76 / 30, c = ca },
            { s = common .. "cloth_1.ogg", t = 85 / 30, c = ca },
            { s = path .. "belt2.ogg", t =  90 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 110 / 30, c = ca },
            { s = path .. "lidclose.ogg", t = 115 / 30, c = ca },
            { s = path .. "grab.ogg", t = 130 / 30, c = ca, v = 0.25 },
            { s = common .. "shoulder.ogg", t = 135 / 30, c = ca },
        },
    },
    ["reload_empty_50"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 60,
        Time = 344 / 60,
        LastClip1OutTime = 3,
        LHIK = true,
        LHIKIn = 2.2,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.7,
        SoundTable = {
            { s = common .. "cloth_4.ogg", t = 4 / 30, c = ca },
            { s = path .. "chback.ogg", t = 15 / 30, c = ca },
            { s = path .. "chforward.ogg", t = 25 / 30, c = ca },
            { s = common .. "cloth_1.ogg", t = 26 / 30, c = ca },
            { s = path .. "lidopen.ogg", t = 39 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 40 / 30, c = ca },
            { s = path .. "boxremove_50_new.wav", t = 55 / 30, c = ca },
            { s = common .. "cloth_3.ogg", t = 80 / 30, c = ca },
            { s = path .. "boxinsert_50_new.wav", t = 100 / 30, c = ca },
            { s = path .. "belt2.ogg", t =  111 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 125 / 30, c = ca },
            { s = path .. "lidclose.ogg", t = 140 / 30, c = ca, v = 1 },
            { s = path .. "grab.ogg", t = 150 / 30, c = ca, v = 0.25 },
            { s = common .. "shoulder.ogg", t = 155 / 30, c = ca },
        },
    },
    ["reload_200"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 1,
        Time = 298 / 60,
        Framerate = 60,
        LastClip1OutTime = 2.4,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.62,
        SoundTable = {
            { s = common .. "cloth_4.ogg", t = 4 / 30, c = ca },
            { s = path .. "lidopen.ogg", t = 10 / 30, c = ca },
            { s = path .. "belt1.ogg", t =  31 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 30 / 30, c = ca },
            { s = path .. "boxremove_200.wav", t = 35 / 30, c = ca },
            { s = common .. "cloth_3.ogg", t = 50 / 30, c = ca },
            { s = path .. "boxinsert_200.wav", t = 76 / 30, c = ca },
            { s = common .. "cloth_1.ogg", t = 85 / 30, c = ca },
            { s = path .. "belt2.ogg", t =  90 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 110 / 30, c = ca },
            { s = path .. "lidclose.ogg", t = 115 / 30, c = ca },
            { s = path .. "grab.ogg", t = 130 / 30, c = ca, v = 0.25 },
            { s = common .. "shoulder.ogg", t = 135 / 30, c = ca },
        },
    },
    ["reload_empty_200"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 60,
        Time = 344 / 60,
        LastClip1OutTime = 3,
        LHIK = true,
        LHIKIn = 2.2,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.7,
        SoundTable = {
            { s = common .. "cloth_4.ogg", t = 4 / 30, c = ca },
            { s = path .. "chback.ogg", t = 15 / 30, c = ca },
            { s = path .. "chforward.ogg", t = 25 / 30, c = ca },
            { s = common .. "cloth_1.ogg", t = 26 / 30, c = ca },
            { s = path .. "lidopen.ogg", t = 39 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 40 / 30, c = ca },
            { s = path .. "boxremove_200.wav", t = 55 / 30, c = ca },
            { s = common .. "cloth_3.ogg", t = 80 / 30, c = ca },
            { s = path .. "boxinsert_200.wav", t = 100 / 30, c = ca },
            { s = path .. "belt2.ogg", t =  111 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 125 / 30, c = ca },
            { s = path .. "lidclose.ogg", t = 140 / 30, c = ca, v = 1 },
            { s = path .. "grab.ogg", t = 150 / 30, c = ca, v = 0.25 },
            { s = common .. "shoulder.ogg", t = 155 / 30, c = ca },
        },
    },
    ["reload_150"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        MinProgress = 1,
        Time = 298 / 60,
        Framerate = 60,
        LastClip1OutTime = 2.4,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.62,
        SoundTable = {
            { s = common .. "cloth_4.ogg", t = 4 / 30, c = ca },
            { s = path .. "lidopen.ogg", t = 10 / 30, c = ca },
            { s = path .. "belt1.ogg", t =  31 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 30 / 30, c = ca },
            { s = path .. "boxremove_150.wav", t = 35 / 30, c = ca },
            { s = common .. "cloth_3.ogg", t = 50 / 30, c = ca },
            { s = path .. "boxinsert_150.wav", t = 76 / 30, c = ca },
            { s = common .. "cloth_1.ogg", t = 85 / 30, c = ca },
            { s = path .. "belt2.ogg", t =  90 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 110 / 30, c = ca },
            { s = path .. "lidclose.ogg", t = 115 / 30, c = ca },
            { s = path .. "grab.ogg", t = 130 / 30, c = ca, v = 0.25 },
            { s = common .. "shoulder.ogg", t = 135 / 30, c = ca },
        },
    },
    ["reload_empty_150"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 60,
        Time = 344 / 60,
        LastClip1OutTime = 3,
        LHIK = true,
        LHIKIn = 2.2,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.7,
        SoundTable = {
            { s = common .. "cloth_4.ogg", t = 4 / 30, c = ca },
            { s = path .. "chback.ogg", t = 15 / 30, c = ca },
            { s = path .. "chforward.ogg", t = 25 / 30, c = ca },
            { s = common .. "cloth_1.ogg", t = 26 / 30, c = ca },
            { s = path .. "lidopen.ogg", t = 39 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 40 / 30, c = ca },
            { s = path .. "boxremove_150.wav", t = 55 / 30, c = ca },
            { s = common .. "cloth_3.ogg", t = 80 / 30, c = ca },
            { s = path .. "boxinsert_150.wav", t = 100 / 30, c = ca },
            { s = path .. "belt2.ogg", t =  111 / 30, c = ca },
            { s = common .. "cloth_2.ogg", t = 125 / 30, c = ca },
            { s = path .. "lidclose.ogg", t = 140 / 30, c = ca, v = 1 },
            { s = path .. "grab.ogg", t = 150 / 30, c = ca, v = 0.25 },
            { s = common .. "shoulder.ogg", t = 155 / 30, c = ca },
        },
    },

    ["enter_inspect"] = {
        Source = "inspect_enter",
        time = 70 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
        SoundTable = {
            { s = path .. "lowpolyfal_cloth2.ogg", t = 0 / 30, c = ca },
        },
    },
    ["idle_inspect"] = {
        Source = "inspect_loop",
        time = 120 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect"] = {
        Source = "inspect_exit",
        time = 143 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            { s = path .. "lowpolyfal_cloth1.ogg", t = 2 / 30, c = ca },
        },
    },

    ["enter_inspect_empty"] = {
        Source = "enter_inspect_empty",
        time = 70 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0.1,
        LHIKOut = 0,
        SoundTable = {
            { s = path .. "lowpolyfal_cloth2.ogg", t = 0 / 30, c = ca },
        },
    },
    ["idle_inspect_empty"] = {
        Source = "idle_inspect_empty",
        time = 120 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect_empty"] = {
        Source = "exit_inspect_empty",
        time = 143 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            { s = path .. "lowpolyfal_cloth1.ogg", t = 2 / 30, c = ca },
        },
    },
}
