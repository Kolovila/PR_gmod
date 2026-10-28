SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"

SWEP.PrintName = "MARS"
SWEP.TrueName = "Barrett MARS"
SWEP.Trivia_Class = "Grenade Rifle"
SWEP.Trivia_Desc = "Unveiled in 2024, the Squad Support Rifle System was developed by Barrett and MARS Inc. as a shoulder-fired, magazine-fed 30x42mm grenade rifle. Its long-recoil action fires semi-automatically, while high-velocity rounds follow a flatter trajectory than conventional low-velocity grenades."
SWEP.Trivia_Manufacturer = "Barrett Firearms / MARS Inc."
SWEP.Trivia_Calibre = "30x42mm"
SWEP.Trivia_Mechanism = "Long-recoil operated, semi-automatic"
SWEP.Trivia_Country = "United States"
SWEP.Trivia_Year = 2024
if GetConVar("arccw_truenames") and GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
end

SWEP.Slot = 4
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/uc/c_uc_barrett_mars.mdl"
SWEP.WorldModel = SWEP.ViewModel
SWEP.MirrorVMWM = true
SWEP.ViewModelFOV = 60
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.WorldModelOffset = {
    pos = Vector(-7, 5, -6),
    ang = Angle(-8, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand"
}
SWEP.DefaultBodygroups = "0000"

SWEP.Damage = 130
SWEP.DamageMin = 130
SWEP.Num = 1
SWEP.Penetration = 0
SWEP.ShootEntity = "arccw_uc_mars_grenade"
SWEP.MuzzleVelocity = 7000
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 5
SWEP.ExtendedClipSize = 10
SWEP.ReducedClipSize = 5
SWEP.Primary.Ammo = "smg1_grenade"
SWEP.MagID = "uc_mars"

SWEP.Delay = 60 / 180
SWEP.Firemodes = {{Mode = 1}, {Mode = 0}}
SWEP.Recoil = 5
SWEP.RecoilSide = 1.5
SWEP.RecoilRise = 0.6
SWEP.VisualRecoilMult = 0.65
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 1
SWEP.Sway = 1.2
SWEP.AccuracyMOA = 8
SWEP.HipDispersion = 800
SWEP.MoveDispersion = 250
SWEP.JumpDispersion = 1100
SWEP.SpeedMult = 0.78
SWEP.SightedSpeedMult = 0.48
SWEP.ShootSpeedMult = 0.65
SWEP.SightTime = 0.58
SWEP.NPCWeaponType = "weapon_rpg"
SWEP.NPCWeight = 100
SWEP.ShootVol = 150
SWEP.ShootPitch = 100
SWEP.ShootSound = ")uc_bmars/fire.wav"
SWEP.ShootDrySound = ")uc_bmars/mech_empty.wav"
SWEP.MuzzleEffect = "muzzleflash_m79"
SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false
SWEP.BarrelLength = 52
SWEP.ExtraSightDist = 3
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.IronSightStruct = {
    Pos = Vector(-5.64, -8.293, -4.84),
    Ang = Angle(0, 0, 0),
    Magnification = 1,
    CrosshairInSights = false,
    SwitchToSound = ""
}
SWEP.HolsterPos = Vector(2.96, -9.268, -4.28)
SWEP.HolsterAng = Angle(-7.805, 14.634, 4.878)
SWEP.ActivePos = Vector(0.04, -8.293, -6.28)
SWEP.ActiveAng = Angle(0, 0, 0)
SWEP.CustomizePos = Vector(8.8, -6.829, -14.72)
SWEP.CustomizeAng = Angle(27.317, 25.366, 2.927)
                                     
                                   

local snd = ")uc_bmars/"
SWEP.Animations = {
    ["idle"] = {Source = "idle"},
    ["draw"] = {Source = "draw", Time = 52 / 30},
    ["ready"] = {Source = "ready", Time = 85 / 30, SoundTable = {
        {s = snd .. "bolt_back.wav", t = 1.35},
        {s = snd .. "bolt_release.wav", t = 1.9}
    }},
    ["holster"] = {Source = "holster", Time = 52 / 30},
    ["fire"] = {Source = "fire", Time = 27 / 30, SoundTable = {{s = snd .. "mech.wav", t = 0.08}}},
    ["fire_iron"] = {Source = "fire", Time = 27 / 30, SoundTable = {{s = snd .. "mech.wav", t = 0.08}}},
    ["reload"] = {
        Source = "reload", Time = 49 / 30, MinProgress = 1.1,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true, LHIKIn = 0.25, LHIKOut = 0.3,
        SoundTable = {
            {s = snd .. "mag_release.wav", t = 0.18},
            {s = snd .. "mag_out.wav", t = 0.42},
            {s = snd .. "mag_in.wav", t = 1.15}
        }
    },
    ["reload_empty"] = {
        Source = "reload_empty", Time = 67 / 30, MinProgress = 1.55,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true, LHIKIn = 0.25, LHIKOut = 0.35,
        SoundTable = {
            {s = snd .. "mag_release.wav", t = 0.18},
            {s = snd .. "mag_out.wav", t = 0.42},
            {s = snd .. "mag_in.wav", t = 1.15},
            {s = snd .. "bolt_back.wav", t = 1.55},
            {s = snd .. "bolt_release.wav", t = 1.83}
        }
    },
    ["enter_inspect"] = {Source = "inspect_in", Time = 22 / 30},
    ["idle_inspect"] = {Source = "inspect_idle"},
    ["exit_inspect"] = {Source = "inspect_out", Time = 22 / 30}
}

                                                                                         
SWEP.Animations["reload_caseless"] = SWEP.Animations["reload"]
SWEP.Animations["reload_empty_caseless"] = SWEP.Animations["reload_empty"]

SWEP.AttachmentElements = {
    ["mars_mag_10"] = {VMBodygroups = {{ind = 2, bg = 1}}},
    ["mars_mag_drum"] = {VMBodygroups = {{ind = 3, bg = 1}}}
}

SWEP.Attachments = {
    {
        PrintName = "Optic", DefaultAttName = "Iron Sights",
        Slot = {"optic_lp", "optic", "optic_sniper"},
        Bone = "Gun_Root",
        Offset = {vpos = Vector(0.55, -5.451, 0), vang = Angle(90, 0, -90)}
    },
    {
        PrintName = "Magazine", DefaultAttName = "5-Round Magazine",
        Slot = "uc_mars_mag"
    },
    {
        PrintName = "Grenade Type", DefaultAttName = "High Explosive",
        DefaultAttIcon = Material("entities/att/arccw_uc_40mm_generic.png", "smooth mips"),
        Slot = "uc_40mm"
    },
    {
        PrintName = "Underbarrel", Slot = {"foregrip", "ubgl"},
        Bone = "Gun_Root",
        Offset = {vpos = Vector(0.68, -1.401, 11.58012), vang = Angle(90, 0, -90)}
    },
    {
        PrintName = "Tactical", Slot = {"tac", "tac_pistol"},
        Bone = "Gun_Root",
        Offset = {vpos = Vector(0.96, -1.541, 19.68), vang = Angle(90, 0, -90)}
    },
    {
        PrintName = "Training Package", Slot = "uc_tp", DefaultAttName = "Basic Training"
    },
    {
        PrintName = "Internals", Slot = "uc_fg", DefaultAttName = "Standard Internals"
    }
}
