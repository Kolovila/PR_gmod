SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "ATM-6"
SWEP.TrueName = "TMRP-6"
SWEP.Trivia_Class = "Anti-Tank Plate Charge"
SWEP.Trivia_Desc = [[The TMRP-6, a Yugoslav anti-tank mine built on the Misznay-Schardin effect. The explosive sits behind a dished copper plate, and when it fires the plate does not shatter: it turns itself inside out and folds into a slug travelling at roughly two kilometres a second.

The point is to punch up through the thin belly armour of a vehicle rather than trying to break its tracks. Yugoslav mines of this family turned up all over the Balkans in the nineties and are still being cleared.

STATS: 420 damage in a 15 degree column straight up, out to 700u, with very little falloff. Outside that column there is a 300u vent at 65 damage and nothing else.

The rod triggers on anything above the plate within 130u to the side and 150u up.

Walk past one and you will probably be fine. Walk over one and cover, armour and luck are all irrelevant. Where you put it decides everything.

Arms in 2s. Shooting it sets it off.]]
SWEP.Trivia_Calibre = "Composition B"
SWEP.Trivia_Mechanism = "Misznay-Schardin Plate"
SWEP.Trivia_Country = "Yugoslavia"
SWEP.Trivia_Year = 1970

SWEP.ViewModel = "models/weapons/c_uc_tmrp6.mdl"
SWEP.WorldModel = "models/weapons/w_tmrp6.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-4, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 52

SWEP.ShootEntity = "arccw_uo_dev_tmrp6"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.proximity",
    },
}

SWEP.MuzzleVelocity = 440
SWEP.MuzzleVelocityAlt = 200

SWEP.PullPinTime = 0.70
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
        Time = 0.70,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.25, p = 104},
            {s = beep, t = 0.45, p = 145},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.55, p = 92} },
    },

    ["pre_throw_alt"] = {
        Source = "idle",
        Time = 0.70,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.25, p = 104},
            {s = beep, t = 0.45, p = 145},
        },
    },
    ["throw_alt"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.45, p = 92} },
    },
}
