SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "HL-3"
SWEP.TrueName = "Hafthohlladung 3"
SWEP.Trivia_Class = "Magnetic Anti-Tank Charge"
SWEP.Trivia_Desc = [[The Hafthohlladung, a shaped charge with three magnets around the rim and a handle to carry it by. You had to walk up to the tank and put it on the tank. The Germans issued over half a million of them and the men who used them called the job what it was.

It is the reason Zimmerit paste exists: German crews assumed the Allies would copy the idea and coated their own tanks against it.

STATS: 900 damage in a 130u jet straight through whatever it is stuck to, with only 260u of splash at 90 damage.

Sticks only to things with a physics object, which means vehicles, crates and machinery. It will not stick to world geometry and it will not stick to people. Against anything it is not attached to it is nearly harmless.

Arms in 0.4s, then a 5 second fuse. Shooting it sets it off.]]
SWEP.Trivia_Calibre = "Shaped Charge"
SWEP.Trivia_Mechanism = "Magnetic Adhesion"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1942

SWEP.ViewModel = "models/vietnam/v_nam_hafthohlladung.mdl"
SWEP.WorldModel = "models/vietnam/w_hafthohlladung.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true
SWEP.ActivePos = Vector(0, 0, 0)

SWEP.WorldModelOffset = {
    pos = Vector(-4, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 26

SWEP.ShootEntity = "arccw_uo_dev_haft"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.timer",
    },
}

SWEP.MuzzleVelocity = 330
SWEP.MuzzleVelocityAlt = 150

SWEP.PullPinTime = 1.1
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.3

SWEP.SpeedMult = 0.94

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local click = UO.Sound("germany_ww2/explosives/m24_capoff.wav", UO.Snd.PinPull)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_underthrow_1.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]    = { Source = "base_draw",    SoundTable = { {s = rattle, t = 0} } },
    ["ready"]   = { Source = "base_draw",    SoundTable = { {s = rattle, t = 0} } },
    ["idle"]    = { Source = "base_idle" },
    ["holster"] = { Source = "base_holster" },

    ["pre_throw"] = {
        Source = "base_pullback",
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.5},
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
            {s = click, t = 0.5},
        },
    },
    ["pre_throw_hold_alt"] = { Source = "low_pullback" },
    ["throw_alt"] = {
        Source = "low_throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.6} },
    },
}
