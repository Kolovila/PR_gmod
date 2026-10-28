SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "DM-70"
SWEP.TrueName = "Directional Mine"
SWEP.Trivia_Class = "Directional Anti-Personnel Mine"
SWEP.Trivia_Desc = [[The M18A1. A curved slab of C-4 behind roughly seven hundred steel balls, with FRONT TOWARD ENEMY stamped on the face because early users kept getting it wrong. The curve is what makes it work: it throws the balls into a fan rather than a cone.

Designed for ambushes and perimeter defence in Vietnam, where it was usually command-detonated on a wire. Here it watches for itself.

STATS: 190 damage plus 40 fragments inside a 62 degree arc out to 700u, tapering to a third at the far edge. Behind it there is only a 260u backblast at 60 damage.

Cover inside the arc genuinely stops it, and standing behind the mine is safe.

Arms in 2s, then gives a 0.35s warning beep before firing. Shooting it does not set it off.]]
SWEP.Trivia_Calibre = "Composition C-4"
SWEP.Trivia_Mechanism = "Passive Infrared"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1960

SWEP.ViewModel = "models/uc_grenades/c_claymore.mdl"
SWEP.WorldModel = "models/uc_grenades/w_claymore.mdl"
SWEP.ViewModelFOV = 62
SWEP.UseHands = true

SWEP.ActivePos = Vector(0, 0, 0)

SWEP.WorldModelOffset = {
    pos = Vector(-4, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 46

SWEP.ShootEntity = "arccw_uo_dev_claymore"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.tripwire",
    },
}

SWEP.MuzzleVelocity = 380
SWEP.MuzzleVelocityAlt = 180

SWEP.PullPinTime = 0.5
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.4

SWEP.SpeedMult = 0.97

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local click = UO.Sound("buttons/button17.wav", "buttons/blip1.wav")
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
        Time = 0.5,
        MinProgress = 0.4,
        SoundTable = {
            {s = rattle, t = 0.05},
        },
    },
    ["throw"] = {
        Source = "plant",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.5, p = 95},
            {s = click, t = 0.45, p = 110},
        },
    },

    ["pre_throw_alt"] = {
        Source = "idle",
        Time = 0.5,
        MinProgress = 0.4,
        SoundTable = {
            {s = rattle, t = 0.05},
        },
    },
    ["throw_alt"] = {
        Source = "plant",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.4, p = 95},
            {s = click, t = 0.45, p = 110},
        },
    },
}
