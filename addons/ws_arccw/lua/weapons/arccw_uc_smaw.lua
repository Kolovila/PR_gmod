SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "SML-153"
SWEP.TrueName = "Mk 153 SMAW"
SWEP.Trivia_Class = "Multi-Role Rocket Launcher"
SWEP.Trivia_Desc = [[Man-portable, multi-purpose rocket launcher originally conceptualized in Norway by Solmec Systems and underwent further refinement in the United States under the Dynamit Nobel division during the 1970s and 1980s. Its development was driven by the need for a lightweight, portable, and versatile anti-fortification and anti-armor weapon that infantry units, particularly the U.S. Marine Corps, could deploy independently without relying on heavier artillery systems. It also features an integrated 9x51mm spotting rifle.]]
SWEP.Trivia_Manufacturer = "Whitney Munitions Inc."
SWEP.Trivia_Calibre = "83MM Rocket"
SWEP.Trivia_Mechanism = "Electro-Mechanical"
SWEP.Trivia_Country = "United States"
SWEP.Trivia_Year = 1984

SWEP.Slot = 4

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Talley Defense Systems"
    SWEP.Trivia_Country = "United States"
 end

SWEP.UseHands = true

SWEP.ViewModel = "models/arc9/c_arc9_smaw.mdl"
SWEP.WorldModel = "models/arc9/c_arc9_smaw.mdl"

SWEP.MirrorVMWM = false

SWEP.ViewModelFOV = 76

SWEP.WorldModelOffset = {
    pos = Vector(7, 1, -3),
    ang = Angle(170, 180, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.DefaultBodygroups = "0000000000"

SWEP.Damage = 150
SWEP.DamageMin = 150
SWEP.Range = 900
SWEP.Penetration = 450

SWEP.ShootEntity = "arccw_uc_smaw_rocket"

SWEP.MuzzleVelocity = 8660

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 1

SWEP.Recoil = 3.2
SWEP.RecoilSide = 0.9

SWEP.RecoilRise = 1.1
SWEP.RecoilPunch = 4.5
SWEP.VisualRecoilMult = 1.6
SWEP.MaxRecoilBlowback = 0
SWEP.MaxRecoilPunch = 0
SWEP.RecoilPunchBack = 3.5

SWEP.Sway = 0.75

SWEP.Delay = 60 / 1000
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "Rocket",
    },
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 125

SWEP.AccuracyMOA = 2
SWEP.HipDispersion = 250
SWEP.MoveDispersion = 150

SWEP.Primary.Ammo = "RPG_Round"
SWEP.MagID = "smaw"

SWEP.ShootVol = 120
SWEP.ShootPitch = 100

SWEP.ShootSound = {"uc_smaw/fire1.wav", "uc_smaw/fire2.wav"}
SWEP.DistantShootSound = "uc_smaw/fire_dist.wav"
SWEP.ShootSoundSilenced = "at4/at4_dist.wav"

SWEP.MuzzleEffect = "muzzleflash_1"

SWEP.MuzzleEffectAttachment = 1

SWEP.ShellEffect = nil
SWEP.ShellMaterial = "null"

SWEP.SpeedMult = 0.72
SWEP.SightedSpeedMult = 0.55
SWEP.SightTime = 0.65

SWEP.BulletBones = {
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-4.015, 0, -0.28),
    Ang = Angle(0.976, 0, 3.902),
    Magnification = 1.1,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "rpg"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG

SWEP.ActivePos = Vector(0, 5.854, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(-2, 4.39, -2.32)
SWEP.CrouchAng = Angle(3.902, -1.951, -9.756)

SWEP.SprintPos = Vector(-0.76, 4.878, 0)
SWEP.SprintAng = Angle(-12.683, 1.951, -18.537)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.CustomizePos = Vector(1.88, 7.805, 0.88)
SWEP.CustomizeAng = Angle(4.878, 25.366, 7.805)

SWEP.BarrelLength = 22

SWEP.Bipod_Integral = true
SWEP.BipodDispersion = 0.1
SWEP.BipodRecoil = 0.05

SWEP.Hook_ModifyBodygroups = function(wep, data)
    local vm = data.vm

    if wep:InBipod() then
        vm:SetBodygroup(5, 1)
    end
end

SWEP.AttachmentElements = {
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic","optic_sniper", "optic_lp"},
        Bone = "SMAW",
        Offset = {
            vpos = Vector(2.719, 3.322, -5.069),
            vang = Angle(180, 90, 0),
        },
        CorrectivePos = Vector(0, 0, 0.0),
        CorrectiveAng = Angle(0, 180, 0),
        VMScale = Vector(1, 1, 1),
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "SMAW",
        Offset = {
            vpos = Vector(3.498, 3.25, -3.429),
            vang = Angle(0, 90, -90),
        },
    },
    {
        PrintName = "Spotting Rifle",
        DefaultAttName = "None",
        DefaultAttIcon = Material("", "smooth mips"),
        Slot = "uc_smaw_ranger",
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
}
local uc_common = ")^arccw_uc/common/"

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
        Time = 1
    },
    ["draw"] = {
        SoundTable = ArcCW.UC.DrawSounds,
        Source = "draw",
        Time = 2.0,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
	["holster"] = {
        SoundTable = ArcCW.UC.HolsterSounds,
        Source = "holster",
        Time = 2.0,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["ready"] = {
        SoundTable = {
            {s = uc_common .. "raise.ogg", t = 0},
            {s = uc_common .. "cloth_4.ogg", t = 0.35},
            {s = uc_common .. "rattle2.ogg", t = 0.9},
            {s = uc_common .. "shoulder.ogg", t = 1.5},
        },
        Source = "draw",
        Time = 2.0,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["fire"] = {
        Source = "fire",
        Time = 1,
        SoundTable = {{ s = {"uc_smaw/mech1.wav", "uc_smaw/mech2.wav"}, t = 0, v = 1.25 }},
        ShellEjectAt = 0,
    },
	["fire_iron"] = {
        Source = "fire",
        Time = 1,
        SoundTable = {{ s = {"uc_smaw/mech1.wav", "uc_smaw/mech2.wav"}, t = 0, v = 1.25 }},
        ShellEjectAt = 0,
    },
    ["fire_ranger"] = {
        Source = "fire_ranger",
        Time = 0.5,
        SoundTable = {{ s = {"uc_smaw/mech1_ranger.wav", "uc_smaw/mech2_ranger.wav"}, t = 0, v = 1.25 }},
        ShellEjectAt = 0,
    },
    ["reload"] = {
        Source = "reload",
        Time = 3.5,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {{ s = {"uc_smaw/tube_out.wav"}, t = 1.0, v = 1.25 },
        { s = {"uc_smaw/tube_in.wav"}, t = 1.90, v = 1.25 },
    },
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
    },
    ["reload_ranger"] = {
        Source = "reload_ranger",
        Time = 3.5,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {{ s = {"uc_smaw/magout_ranger.wav"}, t = 1.0, v = 1.25 },
        { s = {"uc_smaw/magin_ranger.wav"}, t = 2.0, v = 1.25 },
        { s = {"uc_smaw/boltback.wav"}, t = 2.40, v = 1.55 },
        { s = {"uc_smaw/boltforward.wav"}, t = 2.55, v = 1.55 },
    },
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
    },
}
