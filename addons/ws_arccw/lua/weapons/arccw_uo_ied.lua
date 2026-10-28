SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "VBX-1"
SWEP.TrueName = "IED"
SWEP.Trivia_Class = "Improvised Explosive Device"
SWEP.Trivia_Desc = [[Two rusty gas cylinders wired together, a mobile phone taped to the side, and a bundle of cable running into the caps. Somebody emptied an artillery shell into a pair of bottles and worked out the rest from first principles.

This is the weapon that defined two decades of asymmetric warfare, and the reason every modern military vehicle has a V-shaped hull. It costs nothing, it is made from rubbish, and it does not care how much your armour cost.

STATS: 1050 blast, 340 damage, 26 fragments. The largest victim-operated charge in the pack. Arms 1.5s after placing.

RMT: the phone is the trigger. Put it down, walk away, ring it when the street is full.
TRIP: wired to a pressure switch instead. It waits on its own at 150u, you cannot fire it yourself, and it does not care who comes past first.

RELOAD: rings the phone. RMT only.

It was built in a shed and behaves like it. 12% of the time the call does not connect at all, and when it does it can hang for up to 1.4s before firing.

Shooting one sets it off.]]
SWEP.Trivia_Calibre = "Artillery Filler"
SWEP.Trivia_Mechanism = "Mobile Phone / Victim Operated"
SWEP.Trivia_Country = "-"
SWEP.Trivia_Year = "Undated"

SWEP.ViewModel = "models/weapons/ins/v_ied_ins.mdl"
SWEP.WorldModel = "models/weapons/ins/w_ied.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true
SWEP.ActivePos = Vector(0, 0, 0)

SWEP.WorldModelOffset = {
    pos = Vector(-4, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 27

SWEP.ShootEntity = "arccw_uo_dev_ied"

SWEP.KeepIfEmpty = true

SWEP.UO_Detonator = true

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.remote",
        Override_FuseTime = false,
    },
    {
        Mode = 1,
        PrintName = "fcg.tripwire",
        UO_Victim = true,
        Override_FuseTime = false,
    },
}

SWEP.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    local fm = wep:GetCurrentFiremode()
    rocket.VictimOperated = (fm and fm.UO_Victim) or false
end

SWEP.MuzzleVelocity = 360
SWEP.MuzzleVelocityAlt = 150

SWEP.PullPinTime = 1.2
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.35

SWEP.SpeedMult = 0.93

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local click = UO.Sound("weapons/ied/handling/ied_trigger_ins.wav", "buttons/button17.wav")
local throw = UO.Sound("weapons/ied/handling/ied_throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"] = {
        Source = "draw",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["ready"] = {
        Source = "draw",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["idle"] = { Source = "idle" },
    ["holster"] = { Source = "holster" },

    ["pre_throw"] = {
        Source = "base_pullback",
        MinProgress = 0.75,
        SoundTable = { {s = rattle, t = 0.05} },
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
        SoundTable = { {s = rattle, t = 0.05} },
    },
    ["pre_throw_hold_alt"] = { Source = "low_pullback" },
    ["throw_alt"] = {
        Source = "low_throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.6} },
    },

    ["detonate"] = {
        Source = "det_detonate",
        SoundTable = { {s = click, t = 0.1} },
    },
}
