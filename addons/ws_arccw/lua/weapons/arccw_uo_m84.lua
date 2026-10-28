SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "SG-84"
SWEP.TrueName = "M84"
SWEP.Trivia_Class = "Stun Grenade"
SWEP.Trivia_Desc = [[The M84 stun grenade, the flashbang. A perforated steel tube with a magnesium and perchlorate charge that produces a bang of around 175 decibels and a flash bright enough to overload the eye for several seconds.

Developed for hostage rescue, where the point is to buy the entry team a couple of seconds without killing everybody in the room.

STATS: 200 blast, 25 damage, 1.6 second fuse. It is not meant to hurt anybody.

Blinds and deafens anything with line of sight to it. Walls work: anything with something solid in the way is unaffected, so it clears rooms rather than corridors.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. Hold past 1.6s and it goes off in your hand.]]
SWEP.Trivia_Calibre = "Magnesium/Ammonium Perchlorate"
SWEP.Trivia_Mechanism = "Pyrotechnic Delay Fuse"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1995

SWEP.ViewModel = "models/simpnades/v_m84.mdl"
SWEP.WorldModel = "models/simpnades/w_m84.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 29

SWEP.ShootEntity = "arccw_uo_nade_m84"

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

SWEP.MuzzleVelocity = 1500
SWEP.MuzzleVelocityAlt = 480

SWEP.PullPinTime = 0.6
SWEP.FuseTime = 1.6
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0.8
SWEP.WindupMinimum = 0.45

SWEP.ShootEntityDelay = 0.18

SWEP.SpeedMult = 1.02

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Snd.PinPull
local spoon = UO.Snd.SpoonEject
local throw = UO.Snd.Throw
local pop = UO.Snd.FusePop
local popheld = UO.Snd.FusePopHeld

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
        MinProgress = 0.6,
        SoundTable = {
            {s = rattle, t = 0.05, v = 0.7},
            {s = pin, t = 0.3, p = 115},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0, p = 110},
            {s = spoon, t = 0.08, p = 118},
            {s = pop, t = 0.12, v = 0.6, p = 120},
        },
    },

    ["pre_throw_cook"] = {
        Source = "pullbackhighbake",
        MinProgress = 0.85,
        SoundTable = {
            {s = rattle, t = 0.05, v = 0.7},
            {s = pin, t = 0.3, p = 115},
            {s = spoon, t = 0.5, p = 118},
            {s = popheld, t = 0.55, p = 120},
        },
    },
    ["throw_cook"] = {
        Source = "bakethrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0.05, p = 110},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pullbacklow",
        MinProgress = 0.6,
        SoundTable = {
            {s = rattle, t = 0.05, v = 0.7},
            {s = pin, t = 0.3, p = 115},
        },
    },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7, p = 110},
            {s = spoon, t = 0.08, p = 118},
            {s = pop, t = 0.12, v = 0.6, p = 120},
        },
    },

    ["pre_throw_alt_cook"] = {
        Source = "pullbacklow",
        MinProgress = 0.6,
        SoundTable = {
            {s = rattle, t = 0.05, v = 0.7},
            {s = pin, t = 0.3, p = 115},
            {s = spoon, t = 0.45, p = 118},
            {s = popheld, t = 0.5, p = 120},
        },
    },
    ["throw_alt_cook"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7, p = 110},
        },
    },
}
