SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "PM-6"
SWEP.TrueName = "No. 6 Mine"
SWEP.Trivia_Class = "Blast Mine"
SWEP.Trivia_Desc = [[The No. 6, an Israeli anti-personnel blast mine. A wide steel pan holding six kilos of explosive under a pressure plate, laid on the ground and left there. There is nothing clever in it: no fragment sleeve, no bounding charge, no directional liner.

Blast mines like this are why mine clearance is slow, dangerous work decades after a war ends. It does not need to be sophisticated to keep a road closed.

STATS: 620 blast, 190 damage, 34 fragments thrown up and out of the crater. Trips at 90u, fires 0.15s later, arms in 2.5s.

The blast comes off the floor, so ordinary cover works against it. A low wall, a doorframe or a corner will take most of it. It denies ground rather than clearing it.

Beeps steadily once armed. Shooting it sets it off.]]
SWEP.Trivia_Calibre = "TNT"
SWEP.Trivia_Mechanism = "Pressure Plate"
SWEP.Trivia_Country = "Israel"
SWEP.Trivia_Year = 1970

SWEP.ViewModel = "models/uc_grenades/c_eq_mine.mdl"
SWEP.WorldModel = "models/uc_grenades/w_eq_landmines.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-4, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 48

SWEP.ShootEntity = "arccw_uo_dev_landmine"

SWEP.CamAttachment = 1

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.proximity",
    },
}

SWEP.MuzzleVelocity = 450
SWEP.MuzzleVelocityAlt = 200

SWEP.PullPinTime = 0.65
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.3

SWEP.SpeedMult = 0.97

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local click = UO.Sound("buttons/button17.wav", "buttons/blip1.wav")
local beep = UO.Sound("npc/roller/mine/rmine_blip1.wav", "buttons/blip1.wav")
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
        Source = "idle",
        Time = 0.65,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.25, p = 110},
            {s = beep, t = 0.45, p = 135},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.55, p = 92},
        },
    },

    ["pre_throw_alt"] = {
        Source = "idle",
        Time = 0.65,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.25, p = 110},
            {s = beep, t = 0.45, p = 135},
        },
    },
    ["throw_alt"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.45, p = 92},
        },
    },
}
