SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "OC-24"
SWEP.TrueName = "Stielhandgranate 24"
SWEP.Trivia_Class = "Offensive Grenade"
SWEP.Trivia_Desc = [[The Stielhandgranate 24, the stick grenade, the potato masher. The most recognisable grenade of both world wars. The handle is a lever: it lets a man throw it noticeably further than a ball grenade of the same weight.

Pull the porcelain bead at the base of the handle and a friction igniter lights the delay. There is no lever to release and nothing to hold, which is why it was often carried tucked into a belt.

STATS: 700 blast, 210 damage, 4.5 second fuse, and no fragment sleeve, so it is mostly blast.

Throws a very long way for the size of the charge.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. Hold past 4.5s and it goes off in your hand.]]
SWEP.Trivia_Calibre = "Ammonium Nitrate"
SWEP.Trivia_Mechanism = "Friction Igniter"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1924

SWEP.ViewModel = "models/uc_grenades/c_stielhandgranate.mdl"
SWEP.WorldModel = "models/uc_grenades/w_stielhandgranate24.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 19

SWEP.ShootEntity = "arccw_uo_nade_stiel"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 30

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

SWEP.MuzzleVelocity = 1750
SWEP.MuzzleVelocityAlt = 520

SWEP.PullPinTime = 1
SWEP.FuseTime = 4.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.3
SWEP.WindupMinimum = 0.3

SWEP.ShootEntityDelay = 0.24

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.Rattle)
local pin = UO.Sound("germany_ww2/explosives/m24_capoff.wav", UO.Snd.PinPull)
local spoon = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_1.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]   = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["ready"]  = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["idle"]   = { Source = "idle" },
    ["holster"]= { Source = "holster" },

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
