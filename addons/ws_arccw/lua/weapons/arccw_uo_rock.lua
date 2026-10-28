SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "Rock"
SWEP.TrueName = "Rock"
SWEP.Trivia_Class = "Improvised Distraction"
SWEP.Trivia_Desc = [[A rock.

Geologists put the invention of the thrown rock somewhere in the early Pleistocene, which makes it comfortably the oldest weapon in the pack and the only one nobody had to manufacture. Its adoption was universal, its supply is unlimited, and it has never been withdrawn from service.

Not covered by any arms treaty.

STATS: no damage, no fuse, no explosion.

It makes a noise where it lands, which is enough to pull attention somewhere you are not. Throws further than anything else in the pack, and you can pick it up and use it again.]]
SWEP.Trivia_Calibre = "-"
SWEP.Trivia_Mechanism = "None"
SWEP.Trivia_Country = "-"
SWEP.Trivia_Year = "Pleistocene"

SWEP.ViewModel = "models/uc_grenades/v_eq_rock.mdl"
SWEP.WorldModel = "models/uc_grenades/w_rock_thrown.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-3, 2, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 43

SWEP.ShootEntity = "arccw_uo_nade_rock"

SWEP.CamAttachment = 2

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1600
SWEP.MuzzleVelocityAlt = 500

SWEP.PullPinTime = 0.35
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0.9
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.2

SWEP.SpeedMult = 1.03

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {s = rattle, t = 0, v = 0.4},
        },
    },
    ["ready"] = {
        Source = "draw",
        SoundTable = {
            {s = rattle, t = 0, v = 0.4},
        },
    },
    ["idle"] = {
        Source = "idle",
    },
    ["holster"] = {
        Source = "holster",
    },

    ["pre_throw"] = {
        Source = "pullpin",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05, v = 0.4},
        },
    },
    ["pre_throw_hold"] = {
        Source = "idle_primed",
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pullpin",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05, v = 0.4},
        },
    },
    ["pre_throw_hold_alt"] = {
        Source = "idle_primed",
    },
    ["throw_alt"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6},
        },
    },
}
