SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "SG-Z"
SWEP.TrueName = "Zarya"
SWEP.Trivia_Class = "Multi-Burst Stun Grenade"
SWEP.Trivia_Desc = [[The Zarya, a Russian multi-burst stun grenade. Instead of one bang it fires a short string of them from a segmented body, on the theory that a single flash is something you can recover from and four in a row is not.

Russian police and special units carry variants of it, and the design has been widely copied.

STATS: 150 blast, 12 damage, 1.8 second fuse. It does not kill and does not pretend to.

Blinds and deafens anything with line of sight to it. Line of sight is the whole mechanic, and walls stop it completely.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. Hold past 1.8s and it goes off in your hand.]]
SWEP.Trivia_Calibre = "Magnesium/Perchlorate"
SWEP.Trivia_Mechanism = "Multi-Charge Delay"
SWEP.Trivia_Country = "Russia"
SWEP.Trivia_Year = 1999

SWEP.ViewModel = "models/weapons/eqp/arccw_r_clbr_zarya.mdl"
SWEP.WorldModel = "models/weapons/eqp/thrnw/w_arccw_r_clbr_zarya.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.CamAttachment = 1

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 30

SWEP.ShootEntity = "arccw_uo_nade_zarya"

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

SWEP.MuzzleVelocity = 1400
SWEP.MuzzleVelocityAlt = 450

SWEP.PullPinTime = 0.65
SWEP.FuseTime = 1.8
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0.85
SWEP.WindupMinimum = 0.45

SWEP.ShootEntityDelay = 0.2

SWEP.SpeedMult = 1.02

local UO = ArcCW.UO

local rattle = UO.Sound("grenades/zarya/draw.wav", UO.Snd.Rattle)
local pin = UO.Sound("grenades/zarya/pin.wav", UO.Snd.PinPull)
local spoon = UO.Sound("grenades/zarya/lever.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("grenades/zarya/throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"] = {
        Source = "draw",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["ready"] = {
        Source = "draw",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["idle"] = { Source = "idle" },
    ["holster"] = { Source = "holster" },

    ["pre_throw"] = {
        Source = "pull_pin",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
        },
    },
    ["pre_throw_hold"] = { Source = "pull_pin" },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
            {s = spoon, t = 0.1},
        },
    },

    ["pre_throw_cook"] = {
        Source = "pull_pin",
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
            {s = spoon, t = 0.6},
        },
    },
    ["pre_throw_hold_cook"] = { Source = "pull_pin" },
    ["throw_cook"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = { {s = throw, t = 0} },
    },

    ["pre_throw_alt"] = {
        Source = "pull_pin",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
        },
    },
    ["pre_throw_hold_alt"] = { Source = "pull_pin" },
    ["throw_alt"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6},
            {s = spoon, t = 0.1},
        },
    },
}
