SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-T/67"
SWEP.TrueName = "Type 67"
SWEP.Trivia_Class = "Stick Fragmentation Grenade"
SWEP.Trivia_Desc = [[A Chinese stick grenade with a serrated cast iron head. It is the design that settles an argument most grenades cannot: stick grenades throw further, ball grenades fragment better, and this one does both because the handle is wood and the head is cast iron.

Made in vast numbers and exported widely, with the finish and the fuse quality varying enormously depending on where and when it was made.

STATS: 700 blast, 180 damage. Stick grenade reach with a head that genuinely fragments.

Paid for with the slowest prime in the pack and a fuse that varies by up to 1.1 seconds.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. Hold past the fuse and it goes off in your hand, and you will not know exactly when that is.]]
SWEP.Trivia_Calibre = "TNT"
SWEP.Trivia_Mechanism = "Friction Igniter"
SWEP.Trivia_Country = "China"
SWEP.Trivia_Year = 1967

SWEP.ViewModel = "models/vietnam/c_uc_type67.mdl"
SWEP.WorldModel = "models/uc_grenades/w_stielhandgranate24.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 20

SWEP.ShootEntity = "arccw_uo_nade_type67"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 34

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

SWEP.MuzzleVelocity = 1600
SWEP.MuzzleVelocityAlt = 480

SWEP.PullPinTime = 1.3
SWEP.FuseTime = 4.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.25
SWEP.WindupMinimum = 0.3

SWEP.ShootEntityDelay = 0.24

SWEP.SpeedMult = 0.99

local UO = ArcCW.UO

local rattle = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.Rattle)
local pin = UO.Sound("germany_ww2/explosives/m24_capoff.wav", UO.Snd.PinPull)
local spoon = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_3.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]    = { Source = "base_draw",    SoundTable = { {s = rattle, t = 0} } },
    ["ready"]   = { Source = "base_draw",    SoundTable = { {s = rattle, t = 0} } },
    ["idle"]    = { Source = "base_idle" },
    ["holster"] = { Source = "base_holster" },

    ["pre_throw"] = {
        Source = "pullbackhigh",
        MinProgress = 0.85,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.55},
        },
    },
    ["pre_throw_hold"] = { Source = "pullbackhigh" },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
            {s = spoon, t = 0.12},
        },
    },

    ["pre_throw_cook"] = {
        Source = "pullbackhighbake",
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.55},
            {s = spoon, t = 0.75},
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
        MinProgress = 0.85,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.55},
        },
    },
    ["pre_throw_hold_alt"] = { Source = "pullbacklow" },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6},
            {s = spoon, t = 0.12},
        },
    },
}
