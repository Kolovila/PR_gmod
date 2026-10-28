SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "SC-1"
SWEP.TrueName = "RDG-1"
SWEP.Trivia_Class = "Smoke Grenade"
SWEP.Trivia_Desc = [[The RDG-1, a Soviet smoke canister designed to screen a squad crossing open ground. It is slow to build and produces an enormous volume of smoke over a long period rather than a quick puff.

Soviet doctrine treated smoke as a manoeuvre tool rather than a signal, and the RDG was made in vast numbers to suit.

STATS: no damage. Slow to build and thin while it does, but once up it holds for 70 seconds, topping itself up every 9 seconds.

Three times the duration of anything else in the pack. The others let you cross a street. This one closes it.]]
SWEP.Trivia_Calibre = "Smoke Composition"
SWEP.Trivia_Mechanism = "Pull Igniter"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1950

SWEP.ViewModel = "models/weapons/v_nam_rdg1.mdl"
SWEP.WorldModel = "models/weapons/w_nam_rdg1.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.CamAttachment = 1

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 35

SWEP.ShootEntity = "arccw_uo_nade_rdg1"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1250
SWEP.MuzzleVelocityAlt = 400

SWEP.PullPinTime = 0.8
SWEP.FuseTime = 2.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.22

SWEP.SpeedMult = 1.01

local UO = ArcCW.UO

local rattle = UO.Sound("weapons/no69/handling/no69_armdraw.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/mk2/handling/mk2_pinpull.wav", UO.Snd.PinPull)
local throw = UO.Sound("weapons/tfa_ins2_rgo/rgo_throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"] = {
        Source = "base_draw",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["ready"] = {
        Source = "base_draw",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["idle"] = { Source = "base_idle" },
    ["holster"] = { Source = "base_idle" },

    ["pre_throw"] = {
        Source = "pullbackhigh",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
        },
    },
    ["pre_throw_hold"] = { Source = "pullbackhigh" },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = { {s = throw, t = 0} },
    },

    ["pre_throw_alt"] = {
        Source = "pullbacklow",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
        },
    },
    ["pre_throw_hold_alt"] = { Source = "pullbacklow" },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.6} },
    },
}
