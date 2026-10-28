SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "Frame Charge"
SWEP.TrueName = "Breaching Charge"
SWEP.Trivia_Class = "Shaped Demolition Charge"
SWEP.Trivia_Desc = [[A linear shaped charge on a sticky backing, the sort carried by entry teams who expect to make their own doors. The charge is laid in a frame so the blast cuts along a line rather than spreading, dropping a man-sized panel out of a wall or popping a door off its hinges without bringing the room down.

Modern breaching doctrine is built around these. You do not go through the door somebody is watching, you make a new one somewhere else.

STATS: 260 damage out to 200u directly in front, 220u of blast to the sides. Arms in 0.4s. There is no timer in it.

RELOAD: fires every charge you have placed, oldest first. Lay several and they go together.

Stack up beside the charge, never in front of it. Shooting a placed charge sets it off.]]
SWEP.Trivia_Calibre = "PETN Linear Charge"
SWEP.Trivia_Mechanism = "Radio Detonator"
SWEP.Trivia_Country = "-"
SWEP.Trivia_Year = 1995

SWEP.ViewModel = "models/uc_grenades/v_eq_breach_charges.mdl"
SWEP.WorldModel = "models/uc_grenades/w_eq_charge.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true

SWEP.ActivePos = Vector(0, 0, 0)

SWEP.WorldModelOffset = {
    pos = Vector(-4, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 54

SWEP.ShootEntity = "arccw_uo_dev_breach"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.remote",
    },
}

SWEP.UO_Detonator = true

SWEP.MuzzleVelocity = 620
SWEP.MuzzleVelocityAlt = 260

SWEP.PullPinTime = 0.7
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.25

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local click = UO.Sound("buttons/button17.wav", "buttons/blip1.wav")
local beep = UO.Sound("npc/roller/mine/rmine_blip1.wav", "buttons/blip1.wav")
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"] = {
        Source = "deploy",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["draw_empty"] = {
        Source = "deploy_empty",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["ready"] = {
        Source = "deploy",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["idle"] = {
        Source = "idle",
    },
    ["idle_empty"] = {
        Source = "idle_empty",
    },
    ["holster"] = {
        Source = "holster",
    },

    ["pre_throw"] = {
        Source = "idle",
        Time = 0.7,
        MinProgress = 0.6,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.3, p = 115},
            {s = beep, t = 0.5, p = 140},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6, p = 95},
        },
    },
    ["throw_empty"] = {
        Source = "throw_empty",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6, p = 95},
        },
    },

    ["detonate"] = {
        Source = "detonate",
        SoundTable = {
            {s = click, t = 0.15, p = 105},
        },
    },
    ["detonate_empty"] = {
        Source = "detonate_empty",
        SoundTable = {
            {s = click, t = 0.15, p = 105},
        },
    },

    ["pre_throw_alt"] = {
        Source = "idle",
        Time = 0.7,
        MinProgress = 0.6,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.3, p = 115},
            {s = beep, t = 0.5, p = 140},
        },
    },
    ["throw_alt"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.5, p = 95},
        },
    },
}
