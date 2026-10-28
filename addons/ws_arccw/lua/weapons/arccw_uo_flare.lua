SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "Signal Flare"
SWEP.TrueName = "Signal Flare"
SWEP.Trivia_Class = "Pyrotechnic Signal"
SWEP.Trivia_Desc = [[A handheld pyrotechnic signal, the kind carried in lifeboats and survival kits. Strontium nitrate burns red at a temperature that will not go out in wind or rain, which is the entire design brief.

Useless as a weapon and never intended as one, but a burning flare thrown into a dark room tells you what is in it without you having to walk in first.

STATS: no damage and no blast. Lights after 0.4s and burns for 75 seconds where it lands, throwing coloured light and smoke.

Nothing else in the pack lasts anywhere near this long. Good for marking, signalling, and seeing.]]
SWEP.Trivia_Calibre = "Strontium Nitrate"
SWEP.Trivia_Mechanism = "Friction Cap"
SWEP.Trivia_Country = "-"
SWEP.Trivia_Year = 1962

SWEP.ViewModel = "models/uc_grenades/c_flare.mdl"
SWEP.WorldModel = "models/uc_grenades/w_flare.mdl"
SWEP.ViewModelFOV = 62
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-3, 2, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 42

SWEP.ShootEntity = "arccw_uo_dev_flare"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1100
SWEP.MuzzleVelocityAlt = 220

SWEP.PullPinTime = 0.55
SWEP.FuseTime = 0.4
SWEP.CookPrimFire = true
SWEP.CookAltFire = true

SWEP.UO_CookOff = false

SWEP.WindupTime = 0.7
SWEP.WindupMinimum = 0.5

SWEP.ShootEntityDelay = 0.2

SWEP.SpeedMult = 1.02

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local strike = UO.Sound("nades/molotov/molotov_lighter_strike.wav", UO.Snd.PinPull)
local ignite = UO.Sound("nades/molotov/molotov_ignite.wav", "ambient/fire/gascan_ignite1.wav")
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["ready"] = {
        Source = "draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["idle"] = {
        Source = "idle",
    },
    ["holster"] = {
        Source = "holster",
    },

    ["pre_throw"] = {
        Source = "idle",
        Time = 0.55,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.02},
            {s = strike, t = 0.15},
            {s = ignite, t = 0.35},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0, v = 0.7},
        },
    },

    ["pre_throw_alt"] = {
        Source = "idle",
        Time = 0.55,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.02},
            {s = strike, t = 0.15},
            {s = ignite, t = 0.35},
        },
    },
    ["throw_alt"] = {
        Source = "drop",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.4},
        },
    },
}
