SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "UB-24"
SWEP.TrueName = "Übungsstielhandgranate 24"
SWEP.Trivia_Class = "Practice Grenade"
SWEP.Trivia_Desc = [[The Übungsstielhandgranate, the practice stick grenade. Same handle, same weight, same feel, with an inert head and a small charge that makes a bang and a puff of smoke so an instructor can see where it landed.

Reusable: the head unscrews and takes a fresh charge. Recruits threw these until the motion was automatic.

STATS: 170 blast, 10 damage. It makes the noise and does essentially nothing else.

Useful for training, for marking, and for making people react to a grenade that was never going to hurt them.]]
SWEP.Trivia_Calibre = "Black Powder"
SWEP.Trivia_Mechanism = "Friction Igniter"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1924

SWEP.ViewModel = "models/uc_grenades/c_ubungsstielhandgranate24.mdl"
SWEP.WorldModel = "models/uc_grenades/w_ubungsstielhandgranate24.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 44

SWEP.ShootEntity = "arccw_uo_nade_ubung"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1800
SWEP.MuzzleVelocityAlt = 540

SWEP.PullPinTime = 0.9
SWEP.FuseTime = 4.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.3
SWEP.WindupMinimum = 0.3

SWEP.ShootEntityDelay = 0.24

SWEP.SpeedMult = 1.02

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.Rattle)
local pin = UO.Sound("germany_ww2/explosives/m24_capoff.wav", UO.Snd.PinPull)
local spoon = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_1.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]   = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["ready"]  = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["idle"]   = { Source = "idle" },
    ["holster"]= { Source = "holster" },

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
