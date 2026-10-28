SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-D/1"
SWEP.TrueName = "F-1"
SWEP.Trivia_Class = "Defensive Grenade"
SWEP.Trivia_Desc = [[The Soviet F-1, the limonka or little lemon. A cast iron body with deep square segmentation, based on a French design from the First World War and barely changed since. It is still in service, still being made, and still turning up in every conflict where somebody has an old Soviet armoury.

Its reputation is for fragments that go much further than anybody expects, which is why it is classed defensive: you are meant to throw it from behind something.

STATS: 500 blast, 130 damage, 3.8 second fuse. Few fragments, but heavy ones that carry well past the blast.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. Hold past 3.8s and it goes off in your hand.]]
SWEP.Trivia_Calibre = "Trinitrotoluene"
SWEP.Trivia_Mechanism = "UZRGM Delay Fuse"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1941

SWEP.ViewModel = "models/simpnades/v_f1.mdl"
SWEP.WorldModel = "models/simpnades/w_f1.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 4

SWEP.ShootEntity = "arccw_uo_nade_f1"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 30

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

SWEP.MuzzleVelocity = 1150
SWEP.MuzzleVelocityAlt = 380

SWEP.PullPinTime = 1
SWEP.FuseTime = 3.8
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.4
SWEP.WindupMinimum = 0.3

SWEP.ShootEntityDelay = 0.22

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Sound("nades/f1/f1_pinpull.wav", UO.Snd.PinPull)
local spoon = UO.Sound("nades/f1/m67_spooneject.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("nades/f1/m67_throw_01.wav", UO.Snd.Throw)
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
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4, p = 92},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0, p = 94},
            {s = spoon, t = 0.1, p = 90},
            {s = pop, t = 0.16, v = 0.8, p = 92},
        },
    },

    ["pre_throw_cook"] = {
        Source = "pullbackhighbake",
        MinProgress = 0.9,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4, p = 92},
            {s = spoon, t = 0.6, p = 90},
            {s = popheld, t = 0.65, p = 92},
        },
    },
    ["throw_cook"] = {
        Source = "bakethrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0.05, p = 94},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pullbacklow",
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4, p = 92},
        },
    },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7, p = 94},
            {s = spoon, t = 0.1, p = 90},
            {s = pop, t = 0.16, v = 0.8, p = 92},
        },
    },

    ["pre_throw_alt_cook"] = {
        Source = "pullbacklow",
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4, p = 92},
            {s = spoon, t = 0.55, p = 90},
            {s = popheld, t = 0.6, p = 92},
        },
    },
    ["throw_alt_cook"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7, p = 94},
        },
    },
}
