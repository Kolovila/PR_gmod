SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "GA-1"
SWEP.TrueName = "Tabun Grenade"
SWEP.Trivia_Class = "Chemical Grenade"
SWEP.Trivia_Desc = [[Tabun, the first of the nerve agents, discovered by accident in 1936 by a German chemist looking for a better insecticide. Germany built stockpiles of it and never used it, apparently because they assumed the Allies had it too and would answer in kind. They did not have it.

STATS: bursts after 2.5s and vents for 30 seconds, doing 11 damage a tick out to 280u to anything with line of sight to it.

Same delivery and the same refusal to respect a doorway as the CS canister, except this one kills, and it follows you out of the room.

It vents for a third as long as the TGG-1, which is the only thing limiting it.]]
SWEP.Trivia_Calibre = "Tabun (GA)"
SWEP.Trivia_Mechanism = "Burster Charge"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1937

SWEP.ViewModel = "models/weapons/tabun_gas/c_tabun_gas.mdl"
SWEP.WorldModel = "models/weapons/tabun_gas/w_tabun_gas.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true
SWEP.CamAttachment = 2

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 37

SWEP.ShootEntity = "arccw_uo_nade_tabun"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1150
SWEP.MuzzleVelocityAlt = 380

SWEP.PullPinTime = 0.9
SWEP.FuseTime = 2.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.22

SWEP.SpeedMult = 0.99

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Snd.Rattle
local pin = UO.Snd.PinPull
local spoon = UO.Snd.SpoonEject
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"]   = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["ready"]  = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["idle"]   = { Source = "idle" },
    ["holster"]= { Source = "holster" },

    ["pre_throw"] = {
        Source = "pullpin",
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35},
        },
    },
    ["pre_throw_hold"] = { Source = "idle" },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0} },
    },

    ["pre_throw_alt"] = {
        Source = "pullpin",
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35},
        },
    },
    ["pre_throw_hold_alt"] = { Source = "idle" },
    ["throw_alt"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.6} },
    },
}
