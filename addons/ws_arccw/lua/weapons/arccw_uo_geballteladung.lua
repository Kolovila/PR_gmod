SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "DM-24/7"
SWEP.TrueName = "Geballte Ladung"
SWEP.Trivia_Class = "Improvised Demolition Charge"
SWEP.Trivia_Desc = [[The Geballte Ladung, or bundled charge. Six stick grenade heads wired around a seventh that still has its handle. Entirely a field improvisation, never issued, and used when troops needed to deal with a bunker or a tank track and had nothing but grenades.

It shows up in almost every account of German infantry anti-tank work before proper weapons arrived, usually described as a last resort.

STATS: 950 blast, 320 damage, 5 second fuse, and no fragment sleeve anywhere in it, so everything goes into whatever it is sitting against.

Heavy. It does not go far, and the blast radius is larger than your throw. Place it rather than throw it.]]
SWEP.Trivia_Calibre = "Ammonium Nitrate"
SWEP.Trivia_Mechanism = "Friction Igniter"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1939

SWEP.ViewModel = "models/uc_grenades/c_stielhandgranate_geballteladung.mdl"
SWEP.WorldModel = "models/uc_grenades/w_stielhandgranate24_geballteladung.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 23

SWEP.ShootEntity = "arccw_uo_nade_geballte"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.timer",
    },
}

SWEP.MuzzleVelocity = 700
SWEP.MuzzleVelocityAlt = 250

SWEP.PullPinTime = 1.3
SWEP.FuseTime = 5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0.9
SWEP.WindupMinimum = 0.5

SWEP.ShootEntityDelay = 0.3

SWEP.SpeedMult = 0.93

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.Rattle)
local pin = UO.Sound("germany_ww2/explosives/m24_capoff.wav", UO.Snd.PinPull)
local spoon = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_underthrow_1.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]   = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["ready"]  = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["idle"]   = { Source = "idle" },
    ["holster"]= { Source = "holster" },

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
