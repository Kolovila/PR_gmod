SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "DM-82"
SWEP.TrueName = "Gammon Bomb"
SWEP.Trivia_Class = "Impact Demolition Grenade"
SWEP.Trivia_Desc = [[The No. 82 grenade, universally called the Gammon bomb after the airborne officer who came up with it. It is a stockinette bag with an Allways fuze screwed into the neck, and it was issued empty. You filled it yourself with as much plastic explosive as the job needed.

Paratroopers loved it because one item covered everything from a door to a light tank, and because a bag has no casing, so you could use a big charge at close range without shredding yourself.

STATS: 620 blast, 280 damage, plus 320 driven straight into the surface it struck. No fragments at all.

Functions on the first thing it touches at any angle. A weighted tape arms it in flight, which takes about 0.9s, so it is useless at point blank. It cannot be cooked.

CHARGE slot: how much explosive went in the bag. Changes the blast, the surface damage and how far you can throw it.]]
SWEP.Trivia_Calibre = "Composition C"
SWEP.Trivia_Mechanism = "No. 247 Allways Fuze"
SWEP.Trivia_Country = "United Kingdom"
SWEP.Trivia_Year = 1943

SWEP.ViewModel = "models/weapons/v_gammon.mdl"
SWEP.WorldModel = "models/weapons/w_gammon.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 24

SWEP.ShootEntity = "arccw_uo_nade_gammon"

SWEP.Attachments = {
    {
        PrintName = "attslot.uo_charge",
        DefaultAttName = "attslot.uo_charge.default",
        Slot = "uo_charge",
    },
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.impact",
    },
}

SWEP.MuzzleVelocity = 1050
SWEP.MuzzleVelocityAlt = 340

SWEP.PullPinTime = 0.9
SWEP.FuseTime = 7
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.24

SWEP.SpeedMult = 0.98

local UO = ArcCW.UO

local rattle = UO.Sound("weapons/no69/handling/no69_armdraw.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/no77/handling/no77_capoff.wav", UO.Snd.PinPull)
local spoon = UO.Sound("weapons/no77/handling/no77_capoff.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/no77/handling/no77_throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]    = { Source = "base_draw",    SoundTable = { {s = rattle, t = 0} } },
    ["ready"]   = { Source = "base_draw",    SoundTable = { {s = rattle, t = 0} } },
    ["idle"]    = { Source = "base_idle" },
    ["holster"] = { Source = "base_holster" },

    ["pre_throw"] = {
        Source = "pullbackhigh",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.45},
        },
    },
    ["pre_throw_hold"] = { Source = "pullbackhigh" },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0},
            {s = spoon, t = 0.1},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pullbacklow",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.45},
        },
    },
    ["pre_throw_hold_alt"] = { Source = "pullbacklow" },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6},
            {s = spoon, t = 0.1},
        },
    },
}
