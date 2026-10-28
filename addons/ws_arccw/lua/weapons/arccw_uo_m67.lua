SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-F/67"
SWEP.TrueName = "M67"
SWEP.Trivia_Class = "Fragmentation Grenade"
SWEP.Trivia_Desc = [[The US Army's grenade of choice. Its baseball-shaped form is designed to aid conventional throwing. A bit heavy and slow to detonate, but has very potent fragmentation.

STATS: 838 blast, 200 damage, 5 second fuse. The heaviest charge and longest fuse of the ordinary frags.

Dead weight: it lands where you put it and stays there instead of skittering back down the hallway.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing, for a reduced time to detonation. Hold past 5s and it goes off in your hand.

VARIANT slot: swaps in the M69 practice round.]]
SWEP.Trivia_Calibre = "Composition B"
SWEP.Trivia_Mechanism = "Pyrotechnic Delay Fuse"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1968

SWEP.ViewModel = "models/uc_grenades/c_uc_m67.mdl"
SWEP.WorldModel = "models/simpnades/w_m67.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.AttachmentElements = {
    ["uo_m69"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
        },
    },
}

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 1

SWEP.ShootEntity = "arccw_uo_nade_m67"

SWEP.Attachments = {
    {
        PrintName = "attslot.uo_variant",
        DefaultAttName = "attslot.uo_variant.default",
        Slot = "uo_variant",
    },
}

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 40

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

SWEP.MuzzleVelocity = 1300
SWEP.MuzzleVelocityAlt = 400

SWEP.PullPinTime = 0.9
SWEP.FuseTime = 5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.2
SWEP.WindupMinimum = 0.35

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
        Source = "draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["ready"] = {
        Source = "draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["idle"] = {
        Source = "idle",
    },
    ["holster"] = {
        Source = "holster",
    },

    ["pre_throw"] = {
        Source = "pullbackhigh",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
            {s = spoon, t = 0.1},
            {s = pop, t = 0.16, v = 0.75},
        },
    },

    ["pre_throw_cook"] = {
        Source = "pullbackhighbake",
        MinProgress = 0.9,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35},
            {s = spoon, t = 0.55},
            {s = popheld, t = 0.6},
        },
    },
    ["throw_cook"] = {
        Source = "bakethrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0.05},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pullbacklow",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35},
        },
    },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7},
            {s = spoon, t = 0.1},
            {s = pop, t = 0.16, v = 0.75},
        },
    },

    ["pre_throw_alt_cook"] = {
        Source = "pullbacklow",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35},
            {s = spoon, t = 0.5},
            {s = popheld, t = 0.55},
        },
    },
    ["throw_alt_cook"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7},
        },
    },
}
