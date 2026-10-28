SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "IN-14"
SWEP.TrueName = "AN-M14"
SWEP.Trivia_Class = "Incendiary Grenade"
SWEP.Trivia_Desc = [[The AN-M14 TH3, the thermate grenade. Not an explosive at all: a can of iron oxide, aluminium and barium nitrate that burns at around two and a half thousand degrees and cuts through steel like a torch.

Standard demolition kit for destroying equipment you cannot carry away. The classic use is dropping one into the breech of a gun you are abandoning, which welds it shut permanently.

STATS: no blast, no fragments and no direct damage. Lights after 2s and burns in one small spot for 26 seconds.

It carries its own oxidiser, so water does nothing to it. It burns downwards through whatever it is standing on.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down. Hold past 2s and it lights in your hand.

VARIANT slot: swaps the thermate filler for plain ALS thermite.]]
SWEP.Trivia_Calibre = "Thermate-TH3"
SWEP.Trivia_Mechanism = "Pyrotechnic Delay Fuse"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1942

SWEP.ViewModel = "models/weapons/v_anm14.mdl"
SWEP.WorldModel = "models/weapons/w_anm14.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.AttachmentElements = {
    ["uo_als"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
}

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 39

SWEP.ShootEntity = "arccw_uo_nade_incendiary"

SWEP.Attachments = {
    {
        PrintName = "attslot.uo_variant",
        DefaultAttName = "attslot.uo_variant_m14.default",
        Slot = "uo_variant_m14",
    },
}

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

SWEP.MuzzleVelocity = 1100
SWEP.MuzzleVelocityAlt = 360

SWEP.PullPinTime = 0.8
SWEP.FuseTime = 2
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.1
SWEP.WindupMinimum = 0.35

SWEP.ShootEntityDelay = 0.22

SWEP.SpeedMult = 0.98

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
            {s = pop, t = 0.15, v = 0.75},
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
            {s = pop, t = 0.15, v = 0.75},
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
