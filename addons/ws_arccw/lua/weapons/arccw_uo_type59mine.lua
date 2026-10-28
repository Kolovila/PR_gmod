SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "PM-59"
SWEP.TrueName = "Type 59"
SWEP.Trivia_Class = "Blast Mine"
SWEP.Trivia_Desc = [[A Chinese anti-personnel blast mine, a pressed steel pan under a pressure plate, made in enormous numbers and exported almost everywhere. Nothing about it is sophisticated and it was never meant to be used on its own.

Chinese doctrine laid them in belts across an approach, close enough together that one going off would set off its neighbours. Minefields laid this way are still being cleared in half a dozen countries.

STATS: 560 blast, 165 damage, tripping at 110u. On its own it is the weakest mine in the pack, and someone who steps on one and gets behind cover has a fair chance.

When one fires it sets off every armed Type 59 within 420u, and those set off theirs in turn, rippling outward. Six in a corridor is not six small mines.

The chain does not ask who laid what. It runs through yours as readily as anyone else's.

Arms in 2s. Shooting one sets off the whole belt.]]
SWEP.Trivia_Calibre = "TNT"
SWEP.Trivia_Mechanism = "Pressure Plate"
SWEP.Trivia_Country = "China"
SWEP.Trivia_Year = 1959

SWEP.ViewModel = "models/weapons/c_uc_type59mine.mdl"
SWEP.WorldModel = "models/weapons/w_type59_mine.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-4, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 51

SWEP.ShootEntity = "arccw_uo_dev_type59"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.proximity",
    },
}

SWEP.MuzzleVelocity = 420
SWEP.MuzzleVelocityAlt = 190

SWEP.PullPinTime = 0.60
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
        SoundTable = { {s = rattle, t = 0} },
    },
    ["ready"] = {
        Source = "deploy",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["idle"] = {
        Source = "idle",
    },
    ["holster"] = {
        Source = "holster",
    },

    ["pre_throw"] = {
        Source = "idle",
        Time = 0.60,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.25, p = 108},
            {s = beep, t = 0.45, p = 130},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.55, p = 92} },
    },

    ["pre_throw_alt"] = {
        Source = "idle",
        Time = 0.60,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.25, p = 108},
            {s = beep, t = 0.45, p = 130},
        },
    },
    ["throw_alt"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.45, p = 92} },
    },
}
