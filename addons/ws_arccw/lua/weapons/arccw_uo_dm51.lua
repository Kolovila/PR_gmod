SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-D/51"
SWEP.TrueName = "DM51"
SWEP.Trivia_Class = "Defensive Grenade"
SWEP.Trivia_Desc = [[The Bundeswehr's answer to a long-standing argument about offensive versus defensive grenades: issue one grenade and let the soldier decide. The DM51 is a plastic body of high explosive with a sleeve of six thousand steel balls that clips over it in a few seconds.

Sleeve on, it is a defensive grenade for throwing from cover. Sleeve off, it is the DM51A1.

STATS: 600 blast, 165 damage, 4 second fuse with no variance at all.

The moulded sleeve bursts into an even sphere instead of tearing like a cast casing, so fragments go up, down and level at the same density. Low cover helps less against this than against anything else here.]]
SWEP.Trivia_Calibre = "PETN/TNT"
SWEP.Trivia_Mechanism = "DM82 Delay Fuze"
SWEP.Trivia_Country = "West Germany"
SWEP.Trivia_Year = 1970

SWEP.ViewModel = "models/weapons/v_ins2_dm51_remake_casgirl.mdl"
SWEP.WorldModel = "models/weapons/w_ins2_dm51_remake_casgirl.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 14

SWEP.ShootEntity = "arccw_uo_nade_dm51"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 40

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1180
SWEP.MuzzleVelocityAlt = 380

SWEP.PullPinTime = 0.75
SWEP.FuseTime = 4
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.15
SWEP.WindupMinimum = 0.35

SWEP.ShootEntityDelay = 0.2

SWEP.SpeedMult = 0.99

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Sound("nades/f1/f1_pinpull.wav", UO.Snd.PinPull)
local spoon = UO.Sound("nades/f1/m67_spooneject.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("nades/f1/m67_throw_01.wav", UO.Snd.Throw)

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
            {s = pin, t = 0.42},
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

    ["pre_throw_alt"] = {
        Source = "pullbacklow",
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.42},
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
