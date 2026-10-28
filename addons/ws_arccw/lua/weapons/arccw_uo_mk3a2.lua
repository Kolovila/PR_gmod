SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "OC-3"
SWEP.TrueName = "Mk 3A2"
SWEP.Trivia_Class = "Offensive Grenade"
SWEP.Trivia_Desc = [[The Mk 3A2 concussion grenade, known as the offensive grenade. A cardboard tube around half a pound of TNT, with no metal casing at all, so it kills by blast overpressure rather than fragments.

That is what makes it offensive: a fragmentation grenade thrown into a room can kill the man who threw it, and this one cannot. It was the standard grenade for clearing buildings and bunkers.

STATS: 440 blast, 260 damage, 4.5 second fuse. The highest damage of any ordinary frag here, in the smallest radius, with almost nothing coming off it.

You can throw this into a room from the doorway you are standing in.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. Hold past 4.5s and it goes off in your hand.]]
SWEP.Trivia_Calibre = "Trinitrotoluene"
SWEP.Trivia_Mechanism = "Pyrotechnic Delay Fuse"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1918

SWEP.ViewModel = "models/uc_grenades/c_grenade.mdl"
SWEP.WorldModel = "models/uc_grenades/w_grenade.mdl"
SWEP.ViewModelFOV = 62
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-3, 2, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 13

SWEP.ShootEntity = "arccw_uo_nade_mk3a2"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 20

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

SWEP.MuzzleVelocity = 1450
SWEP.MuzzleVelocityAlt = 460

SWEP.PullPinTime = 0.75
SWEP.FuseTime = 4.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.2

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Snd.PinPull
local spoon = UO.Snd.SpoonEject
local throw = UO.Snd.Throw
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
        Source = "pullpin",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35, p = 105},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
            {s = spoon, t = 0.1, p = 105},
            {s = pop, t = 0.15, v = 0.7},
        },
    },

    ["pre_throw_cook"] = {
        Source = "pullpin",
        MinProgress = 0.9,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35, p = 105},
            {s = spoon, t = 0.6, p = 105},
            {s = popheld, t = 0.65},
        },
    },
    ["throw_cook"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pullpin low",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35, p = 105},
        },
    },
    ["throw_alt"] = {
        Source = "lob",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7},
            {s = spoon, t = 0.1, p = 105},
            {s = pop, t = 0.15, v = 0.7},
        },
    },

    ["pre_throw_alt_cook"] = {
        Source = "pullpin low",
        MinProgress = 0.9,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35, p = 105},
            {s = spoon, t = 0.6, p = 105},
            {s = popheld, t = 0.65},
        },
    },
    ["throw_alt_cook"] = {
        Source = "lob",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7},
        },
    },
}
