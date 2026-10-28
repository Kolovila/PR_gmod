SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "SC-39"
SWEP.TrueName = "Nebelhandgranate 39"
SWEP.Trivia_Class = "Smoke Grenade"
SWEP.Trivia_Desc = [[The Nebelhandgranate 39, the German smoke stick. Same handle as the explosive Stielhandgranate, filled with a smoke composition instead of TNT, and issued for screening movement rather than signalling.

STATS: no damage. Builds over 20 seconds after a 2 second delay, then holds.

The handle is what you are paying for. It throws further than any other smoke here, so the screen can go most of the way down a street instead of at your own feet.]]
SWEP.Trivia_Calibre = "Zinc/Hexachloroethane"
SWEP.Trivia_Mechanism = "Friction Igniter"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1939

SWEP.ViewModel = "models/uc_grenades/c_nebelhandgranate39.mdl"
SWEP.WorldModel = "models/uc_grenades/w_nebelhandgranate39.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 34

SWEP.ShootEntity = "arccw_uo_nade_nebel"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1700
SWEP.MuzzleVelocityAlt = 510

SWEP.PullPinTime = 0.9
SWEP.FuseTime = 2
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.3
SWEP.WindupMinimum = 0.3

SWEP.ShootEntityDelay = 0.24

SWEP.SpeedMult = 1.01

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
