SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "SC-79"
SWEP.TrueName = "No. 79"
SWEP.Trivia_Class = "Smoke Grenade"
SWEP.Trivia_Desc = [[The No. 79, a bursting smoke grenade rather than a burning one. Instead of venting from a canister over half a minute, the whole filling is scattered at once, so the screen exists immediately and then thins out just as fast.

STATS: no damage. Full screen up instantly on a 1.2 second fuse, thinning inside ten seconds.

The opposite trade to every other smoke here. Cross now, because it will not hold.]]
SWEP.Trivia_Calibre = "Titanium Tetrachloride"
SWEP.Trivia_Mechanism = "Bursting Charge"
SWEP.Trivia_Country = "United Kingdom"
SWEP.Trivia_Year = 1941

SWEP.ViewModel = "models/weapons/arc9_doi/c_no79.mdl"
SWEP.WorldModel = "models/weapons/arc9_doi/w_no79.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 33

SWEP.ShootEntity = "arccw_uo_nade_no79"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1250
SWEP.MuzzleVelocityAlt = 400

SWEP.PullPinTime = 0.7
SWEP.FuseTime = 1.2
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0.9
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.2

SWEP.SpeedMult = 1.01

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("weapons/no69/handling/no69_armdraw.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/no77/handling/no77_capoff.wav", UO.Snd.PinPull)
local spoon = UO.Sound("weapons/no77/handling/no77_capoff.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/no77/handling/no77_throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]   = { Source = "base_draw",    SoundTable = { {s = draw, t = 0} } },
    ["ready"]  = { Source = "base_draw",    SoundTable = { {s = draw, t = 0} } },
    ["idle"]   = { Source = "base_idle" },
    ["holster"]= { Source = "base_holster" },

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

    ["pre_throw_cook"] = {
        Source = "pullbackhighbake",
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
            {s = spoon, t = 0.6},
        },
    },
    ["pre_throw_hold_cook"] = { Source = "pullbackhighbake" },
    ["throw_cook"] = {
        Source = "bakethrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = { {s = throw, t = 0.1} },
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
