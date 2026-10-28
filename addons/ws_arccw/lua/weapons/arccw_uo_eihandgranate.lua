SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-E/39"
SWEP.TrueName = "Eihandgranate 39"
SWEP.Trivia_Class = "Fragmentation Grenade"
SWEP.Trivia_Desc = [[The Eihandgranate 39, the little egg. German industry spent the war looking for grenades that used less steel and less time, and this was the answer: two pressed halves, a friction igniter, and a coloured cap telling you the delay.

Cheap enough to hand out by the crate. Soldiers liked it because you could carry twice as many as a stick grenade and throw them further.

STATS: 420 blast, 120 damage, 4.5 second fuse. The smallest frag in the pack.

Tiny lethal radius, but it is light and it will reach rooms nothing else here reaches.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. Hold past 4.5s and it goes off in your hand.]]
SWEP.Trivia_Calibre = "Ammonium Nitrate"
SWEP.Trivia_Mechanism = "Friction Igniter"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1939

SWEP.ViewModel = "models/uc_grenades/c_eihandgranate39.mdl"
SWEP.WorldModel = "models/uc_grenades/w_eihandgranate39_thrown.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 10

SWEP.ShootEntity = "arccw_uo_nade_ei"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 32

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

SWEP.MuzzleVelocity = 1650
SWEP.MuzzleVelocityAlt = 500

SWEP.PullPinTime = 0.7
SWEP.FuseTime = 4.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.1
SWEP.WindupMinimum = 0.4

SWEP.ShootEntityDelay = 0.2

SWEP.SpeedMult = 1.02

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("germany_ww2/explosives/mk2_pullpin_01.wav", UO.Snd.Rattle)
local pin = UO.Sound("germany_ww2/explosives/mk2_pullpin_02.wav", UO.Snd.PinPull)
local spoon = UO.Sound("germany_ww2/explosives/m24_capoff.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_2.wav", UO.Snd.Throw)

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
        Source = "throwlow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6},
            {s = spoon, t = 0.1},
        },
    },
}
