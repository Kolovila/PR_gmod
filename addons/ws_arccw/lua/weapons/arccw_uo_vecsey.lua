SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "OC-36"
SWEP.TrueName = "36M Vécsey"
SWEP.Trivia_Class = "Offensive Grenade"
SWEP.Trivia_Desc = [[The 36M, designed by Hungarian engineer Vécsey. A stick grenade built around a short delay, on the reasoning that the main danger of a grenade is the enemy having time to do something about it.

The fuse is under three seconds, roughly half what most contemporaries used. It gives the thrower less room for error too, which was considered an acceptable trade.

STATS: 640 blast, 185 damage, 2.7 second fuse, the shortest of any stick grenade here.

It arrives and then it goes off. Nobody gets to pick it up and send it back, and the handle still throws it most of the way down a street.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. With 2.7 seconds there is very little room for it. Hold past the fuse and it goes off in your hand.]]
SWEP.Trivia_Calibre = "Trinitrotoluene"
SWEP.Trivia_Mechanism = "Sealed Delay Train"
SWEP.Trivia_Country = "Hungary"
SWEP.Trivia_Year = 1936

SWEP.ViewModel = "models/weapons/v_ww2_36m_vecsey.mdl"
SWEP.WorldModel = "models/weapons/w_ww2_36m_vecsey.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 18

SWEP.ShootEntity = "arccw_uo_nade_vecsey"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 32

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

SWEP.PullPinTime = 0.85
SWEP.FuseTime = 2.7
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.2
SWEP.WindupMinimum = 0.32

SWEP.ShootEntityDelay = 0.22

SWEP.SpeedMult = 1.01

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Sound("weapons/mk2/handling/mk2_pinpull.wav", UO.Snd.PinPull)
local spoon = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_4.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]    = { Source = "base_draw", SoundTable = { {s = rattle, t = 0} } },
    ["ready"]   = { Source = "base_draw", SoundTable = { {s = rattle, t = 0} } },
    ["idle"]    = { Source = "base_idle" },
    ["holster"] = { Source = "base_holster" },

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
