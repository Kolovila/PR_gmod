SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "SN-1 Sensor"
SWEP.TrueName = "Sensor Grenade"
SWEP.Trivia_Class = "Reconnaissance Device"
SWEP.Trivia_Desc = [[An unmarked reconnaissance device, roughly grenade-sized, with a sensor package where the filling ought to be. It pings once on landing and then paints anything that moves nearby, feeding outlines to whoever threw it and anyone on their side.

There is no manufacturer stamp and no serial. Whoever is making these is not selling them openly.

STATS: no damage and no blast. Arms 1 second after landing.

Marks every target in range through walls for as long as it survives.

It only has 20 health and shooting it simply destroys it, so there is no risk in clearing one.]]
SWEP.Trivia_Calibre = "-"
SWEP.Trivia_Mechanism = "Active Acoustic Sensor"
SWEP.Trivia_Country = "-"
SWEP.Trivia_Year = 2029

SWEP.ViewModel = "models/uc_grenades/v_eq_sonar_bomb.mdl"
SWEP.WorldModel = "models/uc_grenades/w_eq_sensor_grenade.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-3, 2, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 45

SWEP.ShootEntity = "arccw_uo_dev_sensor"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1400
SWEP.MuzzleVelocityAlt = 440

SWEP.PullPinTime = 0.7
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0.8
SWEP.WindupMinimum = 0.5

SWEP.ShootEntityDelay = 0.2

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local click = UO.Sound("buttons/button17.wav", "buttons/blip1.wav")
local ping = UO.Sound("npc/scanner/scanner_blip1.wav", "buttons/blip1.wav")
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"] = {
        Source = "deploy",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["ready"] = {
        Source = "deploy",
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
        Source = "pullpin",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.3, p = 125},
            {s = ping, t = 0.5, p = 140, v = 0.6},
        },
    },
    ["pre_throw_hold"] = {
        Source = "idle_primed",
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0, p = 105},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pullpin",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.3, p = 125},
            {s = ping, t = 0.5, p = 140, v = 0.6},
        },
    },
    ["pre_throw_hold_alt"] = {
        Source = "idle_primed",
    },
    ["throw_alt"] = {
        Source = "underhand",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7, p = 105},
        },
    },
}
