SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "RC-4 Satchel"
SWEP.TrueName = "Satchel Charge"
SWEP.Trivia_Class = "Remote Demolition Charge"
SWEP.Trivia_Desc = [[Composition C-4 with a radio detonator taped to the side. Plastic explosive is stable enough to be dropped, shot at or set on fire without going off, which is exactly why demolition teams like it and why it turns up in every insurgency since the sixties.

The satchel is the least elegant way to carry it and the most practical. Fill the bag, walk it to where it needs to be, leave, and choose the moment yourself.

STATS: 900 blast, 320 damage, the largest single charge in the pack. Sticks where it lands and arms in 0.75s.

RMT: no timer at all. It waits until you fire it.
TIME: 6 second countdown from the moment it sticks. The detonator still works in this mode, so a timed charge can always be brought forward.

RELOAD: fires every charge you have placed, oldest first.

Shooting a placed charge sets it off, which cuts both ways.]]
SWEP.Trivia_Calibre = "C-4"
SWEP.Trivia_Mechanism = "Radio Detonator / Timer"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1956

SWEP.ViewModel = "models/weapons/ins/c4/v_c4_sec.mdl"
SWEP.WorldModel = "models/weapons/ins/c4/w_c4.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true

SWEP.ActivePos = Vector(0, 0, 0)

SWEP.WorldModelOffset = {
    pos = Vector(-4, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 55

SWEP.ShootEntity = "arccw_uo_dev_c4"

SWEP.KeepIfEmpty = true

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.remote",
        Override_FuseTime = false,
    },
    {
        Mode = 1,
        PrintName = "fcg.timer",
        Override_FuseTime = 6,
    },
}

SWEP.MuzzleVelocity = 420
SWEP.MuzzleVelocityAlt = 160

SWEP.PullPinTime = 0.9
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.3

SWEP.SpeedMult = 0.96

local UO = ArcCW.UO

local rattle = UO.Sound("weapons/c4/c4_plant_armmovement.wav", UO.Snd.Rattle)
local click = UO.Sound("weapons/c4/c4_trigger_security.wav", "buttons/button17.wav")
local beep = UO.Sound("weapons/c4/c4_plant_place.wav", "npc/roller/mine/rmine_blip1.wav")
local throw = UO.Sound("weapons/c4/c4_throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"] = {
        Source = "base_draw",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["ready"] = {
        Source = "base_draw",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["idle"] = { Source = "base_idle" },
    ["holster"] = { Source = "base_holster" },

    ["pre_throw"] = {
        Source = "base_pullback",
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = beep, t = 0.45},
        },
    },
    ["pre_throw_hold"] = { Source = "base_pullback" },
    ["throw"] = {
        Source = "base_throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.7} },
    },

    ["pre_throw_alt"] = {
        Source = "low_pullback",
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = beep, t = 0.45},
        },
    },
    ["pre_throw_hold_alt"] = { Source = "low_pullback" },
    ["throw_alt"] = {
        Source = "low_throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.6} },
    },

    ["detonate"] = {
        Source = "det_detonate",
        SoundTable = { {s = click, t = 0.15} },
    },
}

SWEP.UO_Detonator = true
