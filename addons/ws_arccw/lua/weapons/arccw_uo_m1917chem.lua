SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "CG-17"
SWEP.TrueName = "M1917 Chemical Grenade"
SWEP.Trivia_Class = "Chemical Grenade"
SWEP.Trivia_Desc = [[A Russian chemical grenade from the last year of the First World War, on the same stick handle as their explosive types. The filling was a chloropicrin mixture, chosen because it is heavier than air and sinks into trenches, dugouts and cellars rather than blowing away.

Chemical grenades were never good killers. They were used to make a position untenable so the men in it had to come out.

STATS: bursts after 3s and vents for 45 seconds at 4 damage a tick.

The cloud starts at 150u and grows to 520u as it lasts, which is the widest area denial in the pack and also the slowest. It is thin where it matters early and only becomes genuinely dangerous once you have moved on.]]
SWEP.Trivia_Calibre = "Chloroacetone"
SWEP.Trivia_Mechanism = "Bursting Charge"
SWEP.Trivia_Country = "Russian Empire"
SWEP.Trivia_Year = 1917

SWEP.ViewModel = "models/weapons/v_ww1_tannenberg_m1917_chemical.mdl"
SWEP.WorldModel = "models/weapons/w_tannenberg_chemical_grenade.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 32

SWEP.ShootEntity = "arccw_uo_nade_m1917chem"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1200
SWEP.MuzzleVelocityAlt = 390

SWEP.PullPinTime = 0.8
SWEP.FuseTime = 3
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.22

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Snd.PinPull
local spoon = UO.Snd.SpoonEject
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_3.wav", UO.Snd.Throw)

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
