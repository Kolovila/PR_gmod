SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-J/97"
SWEP.TrueName = "Type 97"
SWEP.Trivia_Class = "Fragmentation Grenade"
SWEP.Trivia_Desc = [[The Type 97, the standard Japanese fragmentation grenade. There is no lever on it. You pull the pin, then strike the fuze cap hard against something solid, usually your own helmet, a rifle butt or a rock, to light the delay.

Once struck it is burning and there is nothing you can do about it. Japanese instructions told men to count and throw rather than trust the delay, which tells you what they thought of the fuse.

STATS: 620 blast, 160 damage, nominally 4.5 seconds.

The fuse varies by up to 1.6 seconds either way, the least trustworthy in the pack.

It is always cooking whether you like it or not. Hold past the fuse and it goes off in your hand. Throw it promptly.]]
SWEP.Trivia_Calibre = "TNT"
SWEP.Trivia_Mechanism = "Percussion Cap"
SWEP.Trivia_Country = "Japan"
SWEP.Trivia_Year = 1937

SWEP.ViewModel = "models/weapons/v_type97.mdl"
SWEP.WorldModel = "models/weapons/w_type97.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 7

SWEP.ShootEntity = "arccw_uo_nade_type97"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 30

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.timer",
    },
}

SWEP.MuzzleVelocity = 1350
SWEP.MuzzleVelocityAlt = 420

SWEP.PullPinTime = 1.45
SWEP.FuseTime = 4.5
SWEP.CookPrimFire = true
SWEP.CookAltFire = true

SWEP.WindupTime = 0.9
SWEP.WindupMinimum = 0.45

SWEP.ShootEntityDelay = 0.22

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Sound("germany_ww2/explosives/mk2_pullpin_03.wav", UO.Snd.PinPull)
local spoon = UO.Sound("physics/metal/metal_grenade_impact_hard1.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_1.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]    = { Source = "draw", SoundTable = { {s = rattle, t = 0} } },
    ["ready"]   = { Source = "draw", SoundTable = { {s = rattle, t = 0} } },
    ["idle"]    = { Source = "idle" },
    ["holster"] = { Source = "holster" },

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
