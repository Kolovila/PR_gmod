SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "TG-1"
SWEP.TrueName = "TGG-1"
SWEP.Trivia_Class = "Riot Control Grenade"
SWEP.Trivia_Desc = [[A Bulgarian CS gas grenade of the sort sold worldwide for riot control. CS is not a gas but a fine powder dispersed by a burning charge, and it works on the eyes and airways rather than by poisoning anybody.

The standard tool for making people leave a building without shooting at them.

STATS: no charge and it cannot kill, doing 1 damage a tick out to 300u. Vents for 90 seconds, far longer than anything else in the pack.

Everyone inside the cloud is coughing, streaming and unable to hold a sight picture. Very few people stay in it voluntarily.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. Hold past 4s and it vents in your hand.]]
SWEP.Trivia_Calibre = "CS"
SWEP.Trivia_Mechanism = "Pyrotechnic Delay Fuse"
SWEP.Trivia_Country = "Bulgaria"
SWEP.Trivia_Year = 1985

SWEP.ViewModel = "models/uc_grenades/c_uc_tgg1.mdl"
SWEP.WorldModel = "models/uc_grenades/c_uc_tgg1.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 36

SWEP.ShootEntity = "arccw_uo_nade_tgg1"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
        Override_CookPrimFire = false,
        Override_CookAltFire = false,
    },
    {
        Mode = 1,
        PrintName = "fcg.cook",
        Override_CookPrimFire = true,
        Override_CookAltFire = true,
    },
}

SWEP.MuzzleVelocity = 1200
SWEP.MuzzleVelocityAlt = 400

SWEP.PullPinTime = 0.7
SWEP.FuseTime = 4
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.22

SWEP.SpeedMult = 1.01

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Snd.PinPull
local spoon = UO.Snd.SpoonEject
local pop = UO.Snd.FusePop
local popheld = UO.Snd.FusePopHeld
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"] = {
        Source = "base_draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["ready"] = {
        Source = "base_draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["idle"] = {
        Source = "base_idle",
    },
    ["holster"] = {
        Source = "base_holster",
    },

    ["pre_throw"] = {
        Source = "pullbackhigh",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
        },
    },
    ["pre_throw_hold"] = {
        Source = "pullbackhigh",
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
            {s = spoon, t = 0.1},
            {s = pop, t = 0.15, v = 0.7},
        },
    },

    ["pre_throw_cook"] = {
        Source = "pullbackhighbake",
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
            {s = spoon, t = 0.6},
            {s = popheld, t = 0.6},
        },
    },
    ["pre_throw_hold_cook"] = {
        Source = "pullbackhighbake",
    },
    ["throw_cook"] = {
        Source = "bakethrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0.1},
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
    ["pre_throw_hold_alt"] = {
        Source = "pullbacklow",
    },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6},
            {s = spoon, t = 0.1},
            {s = pop, t = 0.15, v = 0.7},
        },
    },

    ["pre_throw_alt_cook"] = {
        Source = "pullbackhighbake",
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
            {s = spoon, t = 0.6},
            {s = popheld, t = 0.6},
        },
    },
    ["pre_throw_hold_alt_cook"] = {
        Source = "pullbackhighbake",
    },
    ["throw_alt_cook"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0.1, v = 0.6},
        },
    },
}
