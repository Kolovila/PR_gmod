SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "WP-77"
SWEP.TrueName = "No. 77"
SWEP.Trivia_Class = "White Phosphorus Grenade"
SWEP.Trivia_Desc = [[The No. 77, a British white phosphorus grenade in a thin tinplate body. Issued for screening and for marking, and used as an incendiary because that is what phosphorus does whether you intended it or not.

STATS: 180 blast, 25 damage, 3 second fuse, then 9 burning patches over 100u for 20 seconds, plus heavy smoke.

Phosphorus does not care about water. It waits, dries out and starts again.

Burns whatever it lands on, including you.]]
SWEP.Trivia_Calibre = "White Phosphorus"
SWEP.Trivia_Mechanism = "Burster Charge"
SWEP.Trivia_Country = "United Kingdom"
SWEP.Trivia_Year = 1943

SWEP.ViewModel = "models/weapons/arc9_doi/c_no77.mdl"
SWEP.WorldModel = "models/weapons/arc9_doi/w_no77.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 40

SWEP.ShootEntity = "arccw_uo_nade_no77"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1150
SWEP.MuzzleVelocityAlt = 380

SWEP.PullPinTime = 0.8
SWEP.FuseTime = 3
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.22

SWEP.SpeedMult = 0.99

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
