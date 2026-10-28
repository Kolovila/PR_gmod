SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-O/51"
SWEP.TrueName = "DM51A1"
SWEP.Trivia_Class = "Offensive Grenade"
SWEP.Trivia_Desc = [[The same grenade with the fragmentation sleeve taken off, which is how it was carried when the job was clearing rooms rather than holding ground. Without the sleeve there is nothing to throw but blast, so you can use it at ranges that would be suicidal with a cast frag.

STATS: 480 blast, 215 damage, no fragments. 4 second fuse with no variance.

Light enough to throw a long way and safe enough to throw from a doorway.

The sealed factory fuze is worth as much as the charge. In a pack where most timers are a gamble, this is the one you can count on to the second.]]
SWEP.Trivia_Calibre = "PETN/TNT"
SWEP.Trivia_Mechanism = "DM82 Delay Fuze"
SWEP.Trivia_Country = "West Germany"
SWEP.Trivia_Year = 1970

SWEP.ViewModel = "models/weapons/v_ins2_dm51_remake_casgirl_2.mdl"
SWEP.WorldModel = "models/weapons/w_ins2_dm51_remake_casgirl_2.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 15

SWEP.ShootEntity = "arccw_uo_nade_dm51a1"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 28

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1520
SWEP.MuzzleVelocityAlt = 470

SWEP.PullPinTime = 0.7
SWEP.FuseTime = 4
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.2

SWEP.SpeedMult = 1.02

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
