SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "RD95/F"
SWEP.TrueName = "RGD-5"
SWEP.Trivia_Class = "Fragmentation Grenade"
SWEP.Trivia_Desc = [[Cheap Cold War era, TNT-based anti-personnel grenade. Saturates its surroundings with shrapnel with a short fuse and a narrow lethal radius.

STATS: 628 blast, 172 damage, 3.4 second fuse, the shortest of the ordinary frags. Thin body, so more blast than fragments, and safe enough to throw while advancing.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing, for a reduced time to detonation. Hold past 3.4s and it goes off in your hand.

Winding up before an overhand throw sends it further. Alt-fire lobs it underhand instead, for corners and low windows.]]
SWEP.Trivia_Calibre = "Trinitrotoluene"
SWEP.Trivia_Mechanism = "Pyrotechnic Delay Fuse"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1954

SWEP.ViewModel = "models/weapons/arccw/c_uo_rgd.mdl"
SWEP.WorldModel = "models/weapons/arccw/c_uo_rgd.mdl"
SWEP.ViewModelFOV = 65
SWEP.UseHands = true

SWEP.ActivePos = Vector(0, 0, 0)

SWEP.WorldModelOffset = {
    pos = Vector(-8, 8, -13),
    ang = Angle(35, 9, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 0

SWEP.ShootEntity = "arccw_uo_nade_rgd5"

SWEP.CamAttachment = 1

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

SWEP.MuzzleVelocity = 1500
SWEP.MuzzleVelocityAlt = 450

SWEP.PullPinTime = 0.8
SWEP.FuseTime = 3.4
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.5
SWEP.WindupMinimum = 0.25

SWEP.ShootEntityDelay = 0.2

local UO = ArcCW.UO
local path = "arccw_uo/common/"
local common = "arccw_uc/common/"

local rattle = UO.Snd.Rattle
local pop = UO.Snd.FusePop
local popheld = UO.Snd.FusePopHeld
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"] = {
        Source = "draw",
        Time = 28 / 40,
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["idle"] = {
        Source = "idle",
    },
    ["ready"] = {
        Source = "ready",
        Time = 63 / 40,
        SoundTable = {
            {s = rattle, t = 0},
            {s = common .. "revolver_trigger-02.ogg", t = 0.7},
        },
    },

    ["pre_throw"] = {
        Source = "throw_start",
        Time = 1,
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = path .. "pinpull.ogg", t = 0.4},
        },
    },
    ["pre_throw_hold"] = {
        Source = "throw_idle",
    },
    ["throw"] = {
        Source = "throw_end",
        Time = 1,
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
            {s = path .. "spooneject.ogg", t = 0.1},
            {s = pop, t = 0.15, v = 0.75},
        },
    },

    ["pre_throw_cook"] = {
        Source = "throw2_start",
        Time = 1,
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = path .. "pinpull.ogg", t = 0.4},
            {s = path .. "spooneject.ogg", t = 0.6},
            {s = popheld, t = 0.6},
        },
    },
    ["pre_throw_hold_cook"] = {
        Source = "throw2_idle",
        Time = 2.6,
    },
    ["throw_cook"] = {
        Source = "throw_end",
        Time = 1,
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0.15},
        },
    },

    ["pre_throw_alt"] = {
        Source = "lowthrow_start",
        Time = 1,
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = path .. "pinpull.ogg", t = 0.4},
        },
    },
    ["pre_throw_hold_alt"] = {
        Source = "lowthrow_idle",
    },
    ["throw_alt"] = {
        Source = "lowthrow_end",
        Time = 1,
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
            {s = path .. "spooneject.ogg", t = 0.1},
            {s = pop, t = 0.15, v = 0.75},
        },
    },

    ["pre_throw_alt_cook"] = {
        Source = "lowthrow2_start",
        Time = 1,
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = path .. "pinpull.ogg", t = 0.4},
            {s = path .. "spooneject.ogg", t = 0.6},
            {s = popheld, t = 0.6},
        },
    },
    ["pre_throw_hold_alt_cook"] = {
        Source = "lowthrow2_idle",
        MinProgress = 0.95,
    },
    ["throw_alt_cook"] = {
        Source = "lowthrow_end",
        Time = 1,
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0.15},
        },
    },
}
