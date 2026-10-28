SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "ATM-1"
SWEP.TrueName = "M1A1 Mine"
SWEP.Trivia_Class = "Anti-Tank Mine"
SWEP.Trivia_Desc = [[An American anti-tank mine on a tilt rod. The rod is the whole idea: instead of waiting for a track to land squarely on a plate, it sticks up into the path of the hull and fires when anything leans on it, which means the mine catches vehicles that would otherwise straddle it.

The same principle is still used today, and it is why modern mine ploughs push a roller well out in front.

STATS: 900 blast, 300 damage. Reaches 260u, which covers a corridor rather than a spot.

It ignores people entirely and answers only to physics objects of 90kg or more.

Arms in 2s. The rod is exposed and the mine only has 32 health, making it the easiest placed device here to shoot off. Shooting it sets it off.]]
SWEP.Trivia_Calibre = "TNT"
SWEP.Trivia_Mechanism = "Tilt Rod"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1940

SWEP.ViewModel = "models/weapons/m1a1_mine/c_m1a1_mine.mdl"
SWEP.WorldModel = "models/weapons/m1a1_mine/w_m1a1_mine.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true
SWEP.CamAttachment = 2

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 49

SWEP.ShootEntity = "arccw_uo_dev_m1a1"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.proximity",
    },
}

SWEP.MuzzleVelocity = 400
SWEP.MuzzleVelocityAlt = 180

SWEP.PullPinTime = 0.9
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.32

SWEP.SpeedMult = 0.95

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("weapons/m1a1/wpn_m1a1_mine_pull_out_01.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/m1a1/wpn_m1a1_mine_pull_out_02.wav", UO.Snd.PinPull)
local spoon = UO.Sound("weapons/m1a1/wpn_m1a1_mine_land_default_01.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/m1a1/wpn_m1a1_mine_throw_01.wav", UO.Snd.Throw)

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
