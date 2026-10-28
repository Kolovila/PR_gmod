SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "4Urban Anarchy"
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.MuzzleEffect = "muzzleflash_m79"
SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/ud_shells/12.mdl"
SWEP.ShellPitch = 100
SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
SWEP.ShellScale = 0

SWEP.MuzzleEffectAttachment = 1

SWEP.PrintName = "ATG-9"

SWEP.TrueName = "RPG-7"

SWEP.Trivia_Class = "Rocket Launcher"
SWEP.Trivia_Desc = "Portable, reusable, shoulder-launched weapon that was developed by the Soviet Union in the late 1950s and entered service in 1961. It is well-respected among Russian forces and has gained recognition for its widespread use in numerous conflicts since the 1960s."
SWEP.Trivia_Manufacturer = "Bazor"
SWEP.Trivia_Calibre = "85mm Warhead"
SWEP.Trivia_Mechanism = "Fuze"
SWEP.Trivia_Country = "USSR"
SWEP.Trivia_Year = 1961

SWEP.Slot = 4

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Bazalt"
end

SWEP.ViewModel = "models/weapons/ins/rpg7/v_rpg.mdl"
SWEP.WorldModel = "models/weapons/ins/rpg7/v_rpg.mdl"
SWEP.ViewModelFOV = 75
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos        =    Vector(-8, 5.5, -4.5),
    ang        =    Angle(-12, 0, 180),
    bone    =    "ValveBiped.Bip01_R_Hand",
    scale = 1 - ( 0.35 * 0.5 )
}

SWEP.Damage = 170
SWEP.DamageMin = 170
SWEP.Range = 200
SWEP.RangeMin = 0

SWEP.Num = 1
SWEP.Penetration = 15

SWEP.ShootEntity = "arccw_ucex_rocket"
SWEP.MuzzleVelocity = 5000

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 1
SWEP.ExtendedClipSize = 1
SWEP.ReducedClipSize = 1

SWEP.Recoil = 2.8
SWEP.RecoilSide = 1.1

SWEP.RecoilRise = 0.9
SWEP.RecoilPunch = 3.2
SWEP.VisualRecoilMult = 1.4
SWEP.MaxRecoilBlowback = 0.8
SWEP.MaxRecoilPunch = 1.0

SWEP.Sway = 0.85

SWEP.Delay = 60 / 60
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.ShootVol = 175
SWEP.ShootPitch = 100

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.NPCWeaponType = "weapon_rpg"
SWEP.NPCWeight = 210

SWEP.AccuracyMOA = 45
SWEP.HipDispersion = 700
SWEP.MoveDispersion = 350
SWEP.JumpDispersion = 1050

SWEP.Primary.Ammo = "RPG_Round"

SWEP.SpeedMult = 0.80
SWEP.SightedSpeedMult = 0.45
SWEP.SightTime = 0.75
SWEP.ShootSpeedMult = 0.88

SWEP.BarrelLength = 48
SWEP.ExtraSightDist = 2

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.IronSightStruct = {
    Pos = Vector(-2.12, -2.927, -0.88),
    Ang = Angle(2.927, -0.3, 6.829),
    Magnification = 1,
    SwitchToSound = "",
    CrosshairInSights = false,
}

SWEP.HolsterPos = Vector(-0.5, -4, -3)
SWEP.HolsterAng = Angle(3.5, 7, -20)

SWEP.ActivePos = Vector(1.96, 1.951, -1.12)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(8.96, 1.608, 0.28)
SWEP.CustomizeAng = Angle(15.477, 34.472, 25.326)

SWEP.CrouchPos = Vector(-1.68, 3.216, -0.48)
SWEP.CrouchAng = Angle(0, -0.704, -10.554)

SWEP.BarrelOffsetSighted = Vector(0, 0, -4)
SWEP.BarrelOffsetHip = Vector(6, 0, -8)

local common = ")/arccw_uc/common/"
local path = ")/arccw_uc/common/40mm/"
local rottle = {common .. "cloth_1.ogg", common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}

SWEP.ShootSound = {
    "uc_rpg7/fire1.wav",
    "uc_rpg7/fire2.wav"
}
SWEP.DistantShootSound = {
    path .. "fire-dist-01.ogg",
    path .. "fire-dist-02.ogg",
    path .. "fire-dist-03.ogg",
    path .. "fire-dist-04.ogg",
    path .. "fire-dist-05.ogg",
    path .. "fire-dist-06.ogg"
}

SWEP.Hook_Think = ArcCW.UC.ADSReload

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_empty"] = {
        Source = "empty_idle",
    },
    ["draw"] = {
        Source = "base_draw",
        Time = 1.30,
        SoundTable = ArcCW.UC.DrawSounds,
    },
    ["draw_empty"] = {
        Source = "empty_draw",
        Time = 1.20,
        SoundTable = ArcCW.UC.DrawSounds,
    },
    ["holster"] = {
        Source = "base_holster",
        SoundTable = ArcCW.UC.HolsterSounds,
    },
    ["holster"] = {
        Source = "empty_holster",
        SoundTable = ArcCW.UC.HolsterSounds,
    },
    ["fire"] = {
        Source = "base_fire",
        Time = 20 / 30,
        SoundTable = {{ s = {"uc_rpg7/mech1.wav", "uc_rpg7/mech2.wav"}, t = 0, v = 0.25 }},
    },
    ["fire_empty"] = {
        Source = "base_fire",
        Time = 20 / 30,
        SoundTable = {{ s = {"uc_rpg7/mech1.wav", "uc_rpg7/mech2.wav"}, t = 0}},
    },
    ["reload"] = {
        Source = "base_reload",
        Time = 101 / 30,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.6,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.5,
        LastClip1OutTime = 1.5,
        MinProgress = 2.2,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magpouch.ogg", t = 0.3},
            {s = "uc_rpg7/reload_new.wav",  t = 1.25},
            {s = rottle, t = 1.0},
            {s = rottle, t = 1.15},
        },
    },
    ["reload_shotshell"] = {
        Source = "base_reload",
        Time = 101 / 30,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.6,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.2,
        LHIKOut = 0.5,
        LastClip1OutTime = 1.5,
        MinProgress = 2.2,
        SoundTable = {
            {s = rottle, t = 0},
            {s = common .. "magpouch.ogg", t = 0.3},
            {s = "uc_rpg7/reload_shotshell_new.wav",  t = 1.80},
            {s = rottle, t = 1.0},
            {s = rottle, t = 1.15},
        },
    }
}

SWEP.AttachmentElements = {
    ["cal_tbg7"] = {
        VMBodygroups = {{ind = 1, bg = 4}},
    },
    ["cal_og7"] = {
        VMBodygroups = {{ind = 1, bg = 3}},
    },
    ["cal_shotshell"] = {
       VMBodygroups = {{ind = 0, bg = 2}, {ind = 1, bg = 2}, {ind = 2, bg = 2},{ind = 3, bg = 2}},
    },
    ["cal_shovel"] = {
        VMBodygroups = {{ind = 1, bg = 5}},
    },
    ["body_sawnoff"] = {
        VMBodygroups = {{ind = 0, bg = 2}, {ind = 1, bg = 1}, {ind = 2, bg = 2},{ind = 3, bg = 2}},
    },
    ["body_pistol"] = {
        VMBodygroups = {{ind = 0, bg = 4}, {ind = 1, bg = 1}, {ind = 2, bg = 2},{ind = 3, bg = 2}},
    },
    ["body_merc"] = {
        VMBodygroups = {{ind = 0, bg = 3}},
    },
    ["irons_none"] = {
        VMBodygroups = {{ind = 2, bg = 2}},
    },
    ["fg"] = {
        VMBodygroups = {{ind = 3, bg = 1}},
    },
    ["scope"] = {
        VMBodygroups = {{ind = 4, bg = 1}},
        Override_IronSightStruct = {
            Pos = Vector(1.64, -3.415, 2.16),
            Ang = Angle(0, 0, 0.976),
            Magnification = 1.1,
        },
    },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"uc_rpg_optic"},
        Bone = "RPG_Body",
        Offset = {
            vpos = Vector(2.66, -9.8, 2.21),
            vang = Angle(-0.129, -89.4, 4),
        },
        CorrectivePos = Vector(0, 0, 0.0),
        CorrectiveAng = Angle(0, 178.8, 0),
        InstalledEles = {"irons_none"},
        ExcludeFlags = {"body_pistol", "body_sawnoff", "cal_shotshell"},
    },
    {
        PrintName = "Warhead",
        DefaultAttName = "Standard Warhead",
        DefaultAttIcon = Material("shit/uc_rpg7_rocket.png", "smooth mips"),
        Slot = "uc_rpg7_cal",
        ExcludeFlags = {"body_pistol", "body_sawnoff"},
    },
    {
        PrintName = "Grip Position",
        DefaultAttName = "Back",
        Slot = {"uc_rpg_fg"},
        Bone = "RPG_Body",
        Offset = {
            vpos = Vector(0.9, 5.4, 0.413),
            vang = Angle(11.321, -90, -2.264),
        },
        ExcludeFlags = {"body_pistol", "body_sawnoff", "cal_shotshell"},
    },
    {
        PrintName = "Body",
        DefaultAttName = "Standard Body",
        DefaultAttIcon = Material("shit/uc_rpg7_body.png", "smooth mips"),
        Slot = "uc_rpg7_body",
        ExcludeFlags = {"cal_shotshell"},
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
        Slot = "uc_fg_singleshot",
        DefaultAttName = "Standard Internals",
    },
    {
        PrintName = "Charm",
        Slot = {"charm", "fml_charm"},
        FreeSlot = true,
        Bone = "Weapon_Main",
        Offset = {
            vpos = Vector(1, -3, 0.518),
            vang = Angle(90, 2, -90),
        },
    },
}
