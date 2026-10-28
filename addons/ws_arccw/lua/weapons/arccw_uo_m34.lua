SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "WP-34"
SWEP.TrueName = "M34"
SWEP.Trivia_Class = "White Phosphorus Grenade"
SWEP.Trivia_Desc = [[The M34 white phosphorus grenade, the one American troops called Willie Pete. Phosphorus ignites on contact with air, burns at around eight hundred degrees, and cannot be put out by smothering or water while any of it remains exposed.

It was carried as a smoke grenade, an incendiary and a signalling device all at once, and it has a long and ugly reputation because of what it does to anything it lands on.

STATS: 340 blast and 70 damage on a 4 second fuse, then 14 burning patches over 340u for 26 seconds, plus enough smoke to screen with.

Its casualty radius is longer than you can throw it. Wrecks the room and everything in it, including whoever is still in the doorway.]]
SWEP.Trivia_Calibre = "White Phosphorus"
SWEP.Trivia_Mechanism = "M206A2 Fuze"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1955

SWEP.ViewModel = "models/vietnam/v_nam_m34.mdl"
SWEP.WorldModel = "models/vietnam/w_nam_m34.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 41

SWEP.ShootEntity = "arccw_uo_nade_m34"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1050
SWEP.MuzzleVelocityAlt = 350

SWEP.PullPinTime = 0.85
SWEP.FuseTime = 4
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.2
SWEP.WindupMinimum = 0.35

SWEP.ShootEntityDelay = 0.24

SWEP.SpeedMult = 0.97

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Sound("weapons/no77/handling/no77_capoff.wav", UO.Snd.PinPull)
local spoon = UO.Sound("weapons/no77/handling/no77_capoff.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/no77/handling/no77_throw.wav", UO.Snd.Throw)

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
