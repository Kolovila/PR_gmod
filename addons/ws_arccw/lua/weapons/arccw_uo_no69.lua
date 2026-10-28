SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "OC-69"
SWEP.TrueName = "No. 69"
SWEP.Trivia_Class = "Offensive Impact Grenade"
SWEP.Trivia_Desc = [[The No. 69, a bakelite grenade built around the Allways fuze, which functions on impact from any angle rather than needing to land nose first. Britain issued it as an offensive grenade for assault troops.

The body is plastic specifically so that it does not throw fragments, which means you can use it at ranges where a Mills bomb would be a bad idea.

STATS: 430 blast, 240 damage, no fragments worth the name.

Functions on contact once the tape has armed it, which takes about 1 second of flight. There is no fuse to sit through: it goes off exactly when it lands.

Cannot be cooked, and it is useless thrown at something a metre away.]]
SWEP.Trivia_Calibre = "Lyddite"
SWEP.Trivia_Mechanism = "All-Ways Impact Fuse"
SWEP.Trivia_Country = "United Kingdom"
SWEP.Trivia_Year = 1940

SWEP.ViewModel = "models/weapons/arc9_doi/c_no69.mdl"
SWEP.WorldModel = "models/weapons/arc9_doi/w_no69.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 12

SWEP.ShootEntity = "arccw_uo_nade_no69"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.impact",
    },
}

SWEP.MuzzleVelocity = 1350
SWEP.MuzzleVelocityAlt = 430

SWEP.PullPinTime = 0.8
SWEP.FuseTime = 6
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.2

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("weapons/no69/handling/no69_armdraw.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/no77/handling/no77_capoff.wav", UO.Snd.PinPull)
local spoon = UO.Sound("weapons/no77/handling/no77_capoff.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/no77/handling/no77_throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]   = { Source = "base_draw",    SoundTable = { {s = draw, t = 0} } },
    ["ready"]  = { Source = "base_draw",    SoundTable = { {s = draw, t = 0} } },
    ["idle"]   = { Source = "base_idle" },
    ["holster"]= { Source = "base_holster" },

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
