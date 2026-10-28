SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "SK-9 Seeker"
SWEP.TrueName = "Homing Grenade"
SWEP.Trivia_Class = "Guided Anti-Personnel Munition"
SWEP.Trivia_Desc = [[Unmarked, unlabelled, and it did not come with paperwork. A fragmentation charge wrapped around a seeker head and a small control drive, the sort of thing that turns up in a crate with no export stamp on it.

Whoever built it did not fit an IFF. It goes for the nearest warm body and does not check whose side that body is on.

STATS: 560 blast, 165 damage.

SEEK: acquires the nearest target once it leaves your hand and steers to it. Self-destructs after 5.5s if it never finds anything.
DUMB: seeker off. An ordinary timed frag that lands where you threw it.

It will follow you as readily as anyone else. Do not throw it into a room you are about to walk into.]]
SWEP.Trivia_Calibre = "PBX-9501"
SWEP.Trivia_Mechanism = "Seeker/Drive Assembly"
SWEP.Trivia_Country = "Unmarked"
SWEP.Trivia_Year = 2031

SWEP.ViewModel = "models/uc_grenades/c_synth_grenade.mdl"
SWEP.WorldModel = "models/uc_grenades/w_synth_grenade.mdl"
SWEP.ViewModelFOV = 62
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-3, 2, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 28

SWEP.ShootEntity = "arccw_uo_nade_homing"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.homing",
    },
    {
        Mode = 1,
        PrintName = "fcg.dumb",
        UO_NoSeek = true,
        Override_FuseTime = 3.2,
    },
}

SWEP.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    local fm = wep:GetCurrentFiremode()
    if !fm or !fm.UO_NoSeek then return end

    rocket.NoSeek = true
    rocket.SeekRange = 0
    rocket.ProximityKill = 0
end

SWEP.MuzzleVelocity = 1350
SWEP.MuzzleVelocityAlt = 430

SWEP.PullPinTime = 0.85
SWEP.FuseTime = 5.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0.9
SWEP.WindupMinimum = 0.5

SWEP.ShootEntityDelay = 0.2

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local arm = UO.Sound("uc_homing_grenade/tick1.wav", "buttons/button17.wav")
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
        Source = "activate",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = arm, t = 0.3, p = 80, v = 0.8},
            {s = arm, t = 0.45, p = 110, v = 0.8},
            {s = arm, t = 0.6, p = 140, v = 0.9},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
        },
    },

    ["pre_throw_alt"] = {
        Source = "activate low",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = arm, t = 0.3, p = 80, v = 0.8},
            {s = arm, t = 0.45, p = 110, v = 0.8},
            {s = arm, t = 0.6, p = 140, v = 0.9},
        },
    },
    ["throw_alt"] = {
        Source = "lob",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7},
        },
    },
}
