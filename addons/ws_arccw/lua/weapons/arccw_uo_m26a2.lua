SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-C/26A2"
SWEP.TrueName = "M26A2"
SWEP.Trivia_Class = "Impact Fragmentation Grenade"
SWEP.Trivia_Desc = [[The M26 body fitted with the M217 impact fuze, an attempt to give infantry a grenade that went off when it arrived rather than on a count. It used a battery and an inertia switch, and it worked well enough that it was fielded in numbers.

It was then withdrawn, because a proportion of them functioned early. Accounts differ on how many, but the fuze is remembered less for what it did right than for what it occasionally did in somebody's hand.

STATS: 640 blast, 165 damage. Functions on contact once armed, roughly 0.45s after it leaves your hand.

No bounce to plan around and no countdown, with the same excellent fragmentation as the standard M26.

There is a 7% chance it functions early, within half a second of the throw, and that half second is usually still your problem. It cannot be cooked.]]
SWEP.Trivia_Calibre = "Composition B"
SWEP.Trivia_Mechanism = "M217 Electric Impact Fuze"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1966

SWEP.ViewModel = "models/vietnam/v_nam_m26a2.mdl"
SWEP.WorldModel = "models/vietnam/w_nam_m26a2.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 6

SWEP.ShootEntity = "arccw_uo_nade_m26a2"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.impact",
    },
}

SWEP.MuzzleVelocity = 1400
SWEP.MuzzleVelocityAlt = 430

SWEP.PullPinTime = 0.8
SWEP.FuseTime = 5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.1
SWEP.WindupMinimum = 0.35

SWEP.ShootEntityDelay = 0.22

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Sound("weapons/mk2/handling/mk2_pinpull.wav", UO.Snd.PinPull)
local spoon = UO.Sound("nades/f1/m67_spooneject.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/no77/handling/no77_throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]    = { Source = "draw", SoundTable = { {s = rattle, t = 0} } },
    ["ready"]   = { Source = "draw", SoundTable = { {s = rattle, t = 0} } },
    ["idle"]    = { Source = "idle" },
    ["holster"] = { Source = "holster" },

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
        SoundTable = {
            {s = throw, t = 0},
            {s = spoon, t = 0.1},
        },
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
        SoundTable = {
            {s = throw, t = 0, v = 0.6},
            {s = spoon, t = 0.1},
        },
    },
}
