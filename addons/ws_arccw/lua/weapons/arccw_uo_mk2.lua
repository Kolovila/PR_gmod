SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-P/2"
SWEP.TrueName = "Mk 2"
SWEP.Trivia_Class = "Fragmentation Grenade"
SWEP.Trivia_Desc = [[The Mk 2, the pineapple. American, in service from the First World War to Vietnam, and probably the most recognisable grenade ever made purely from how often it turns up in film.

The fuses were made by the million across dozens of contractors and the quality varied accordingly. The nominal delay was four to five seconds. What you actually got was a matter of opinion.

STATS: 760 blast, 185 damage, nominally 4.5 seconds.

The fuse varies by up to 0.9 seconds either way, the second least predictable in the pack. Count it out and throw early rather than trusting it.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. Hold past the fuse and it goes off in your hand, and with this one you will not know exactly when that is.]]
SWEP.Trivia_Calibre = "Flaked TNT"
SWEP.Trivia_Mechanism = "M10 Powder Train"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1918

SWEP.ViewModel = "models/weapons/arc9_doi/c_mk2.mdl"
SWEP.WorldModel = "models/weapons/arc9_doi/w_mk2.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 2

SWEP.ShootEntity = "arccw_uo_nade_mk2"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 38

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
        Override_CookPrimFire = false,
        Override_CookAltFire = false,
    },
    {
        Mode = 1,
        PrintName = "fcg.cook",
        Override_CookPrimFire = true,
        Override_CookAltFire = true,
    },
}

SWEP.MuzzleVelocity = 1300
SWEP.MuzzleVelocityAlt = 410

SWEP.PullPinTime = 0.85
SWEP.FuseTime = 4.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.1
SWEP.WindupMinimum = 0.35

SWEP.ShootEntityDelay = 0.22

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("weapons/no69/handling/no69_armdraw.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/mk2/handling/mk2_pinpull.wav", UO.Snd.PinPull)
local spoon = UO.Sound("nades/f1/m67_spooneject.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/no77/handling/no77_throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]   = { Source = "base_draw",    SoundTable = { {s = draw, t = 0} } },
    ["ready"]  = { Source = "base_draw",    SoundTable = { {s = draw, t = 0} } },
    ["idle"]   = { Source = "base_idle" },
    ["holster"]= { Source = "base_holster" },

    ["pre_throw"] = {
        Source = "pullbackhigh",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
        },
    },
    ["pre_throw_hold"] = { Source = "pullbackhigh" },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0},
            {s = spoon, t = 0.1},
        },
    },

    ["pre_throw_cook"] = {
        Source = "pullbackhighbake",
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
            {s = spoon, t = 0.6},
        },
    },
    ["pre_throw_hold_cook"] = { Source = "pullbackhighbake" },
    ["throw_cook"] = {
        Source = "bakethrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = { {s = throw, t = 0.1} },
    },

    ["pre_throw_alt"] = {
        Source = "pullbacklow",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.4},
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
