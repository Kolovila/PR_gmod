SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "Pipe Bomb"
SWEP.TrueName = "Pipe Bomb"
SWEP.Trivia_Class = "Improvised Explosive Device"
SWEP.Trivia_Desc = [[Crude explosive fashioned by hand out of a pipe segment, two end caps, a firework, and a homemade explosive concoction. Usually produced and used by criminals or demonstrators without access to military-grade explosives in a similar vein to Molotov cocktails.

STATS: 838 blast, 200 damage, 24 fragments out to 1400u. Very strong and heavy.

The fuse is cut by hand and varies by up to 1.5 seconds, the least predictable timer in the pack. As unsafe for the user as for the target.

The match is lit the moment you start the throw, so the clock is already running while it is still in your hand. It cannot be made safe once lit. A puddle will put it out.

FILLING slot: changes the blast, the shrapnel and how stable the fuse is.]]
SWEP.Trivia_Calibre = "Ammonium Nitrate/Fuel Oil"
SWEP.Trivia_Mechanism = "Black Match"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = nil

SWEP.ViewModel = "models/uc_grenades/v_pipebomb.mdl"
SWEP.WorldModel = "models/weapon/w_eq_pipebomb.mdl"
SWEP.ViewModelFOV = 62
SWEP.UseHands = true

SWEP.ActivePos = Vector(0, 0, 0)

SWEP.WorldModelOffset = {
    pos = Vector(-3, 2, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 21

SWEP.ShootEntity = "arccw_uo_nade_pipebomb"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.timer",
    },
}

SWEP.MuzzleVelocity = 1050
SWEP.MuzzleVelocityAlt = 320

SWEP.PullPinTime = 0.9
SWEP.FuseTime = 4.5
SWEP.CookPrimFire = true
SWEP.CookAltFire = true

SWEP.WindupTime = 0.8
SWEP.WindupMinimum = 0.5

SWEP.ShootEntityDelay = 0.25

SWEP.SpeedMult = 0.98

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local strike = UO.Sound("nades/molotov/molotov_lighter_strike.wav", UO.Snd.PinPull)
local lopen = UO.Sound("nades/molotov/molotov_lighter_open.wav", UO.Snd.PinPull)
local ignite = UO.Sound("nades/molotov/molotov_ignite.wav", "ambient/fire/gascan_ignite1.wav")
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"] = {
        Source = "pipebomb_deploy",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["ready"] = {
        Source = "pipebomb_deploy",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["idle"] = {
        Source = "pipebomb_idle",
    },

    ["pre_throw"] = {
        Source = "pipebomb_pullpin",
        MinProgress = 0.85,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = lopen, t = 0.15},
            {s = strike, t = 0.4},
            {s = ignite, t = 0.6, v = 0.6},
        },
    },
    ["throw"] = {
        Source = "pipebomb_throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0, p = 92},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pipebomb_pullpin",
        MinProgress = 0.85,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = lopen, t = 0.15},
            {s = strike, t = 0.4},
            {s = ignite, t = 0.6, v = 0.6},
        },
    },
    ["throw_alt"] = {
        Source = "pipebomb_throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7, p = 92},
        },
    },
}

SWEP.Attachments = {
    {
        PrintName = "attslot.uo_filling",
        DefaultAttName = "attslot.uo_filling.default",
        Slot = "uo_filling",
    },
}
