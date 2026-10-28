SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "OC-12"
SWEP.TrueName = "M1912 Lantern Grenade"
SWEP.Trivia_Class = "Offensive Grenade"
SWEP.Trivia_Desc = [[The M1912 lantern grenade, so called because it looks like one. A tin cylinder on a wooden handle, made in Russian workshops during the First World War when demand for grenades far outran anybody's ability to make proper ones.

Thin body, large charge, and a fuse that was often no more than a length of burning cord. It was known for going off late, early, or not at all.

STATS: 720 blast, 215 damage, 5 second fuse. Far more blast than fragments.

The fuse is an exposed burning powder train. Water puts it out and the grenade is wasted.]]
SWEP.Trivia_Calibre = "Ammonal"
SWEP.Trivia_Mechanism = "Exposed Safety Fuse"
SWEP.Trivia_Country = "Russian Empire"
SWEP.Trivia_Year = 1912

SWEP.ViewModel = "models/weapons/v_ww1_tannenberg_m1912_lantern.mdl"
SWEP.WorldModel = "models/weapons/w_tannenberg_m1912_lantern_grenade.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 17

SWEP.ShootEntity = "arccw_uo_nade_lantern"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.timer",
    },
}

SWEP.MuzzleVelocity = 1250
SWEP.MuzzleVelocityAlt = 400

SWEP.PullPinTime = 1.1
SWEP.FuseTime = 5
SWEP.CookPrimFire = true
SWEP.CookAltFire = true

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.24

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Sound("nades/molotov/molotov_lighter_strike.wav", UO.Snd.PinPull)
local spoon = UO.Sound("nades/molotov/molotov_ignite.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_2.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]    = { Source = "draw", SoundTable = { {s = rattle, t = 0} } },
    ["ready"]   = { Source = "draw", SoundTable = { {s = rattle, t = 0} } },
    ["idle"]    = { Source = "idle" },
    ["holster"] = { Source = "holster" },

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
