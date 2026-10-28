SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-M/32"
SWEP.TrueName = "M32"
SWEP.Trivia_Class = "Fragmentation Grenade"
SWEP.Trivia_Desc = [[A Hungarian cast fragmentation grenade of conventional design. Nothing about the mechanism is unusual, which in a pack full of oddities makes it something of a relief.

STATS: 660 blast, 175 damage, 4.2 second fuse.

Its one distinction is cosmetic and genuinely useful: it uses a separate world model once armed, so a live one lying on the floor looks different from a spent one. It is the only grenade here that tells you.

NADE: throw on a fixed fuse.]]
SWEP.Trivia_Calibre = "Trinitrotoluene"
SWEP.Trivia_Mechanism = "Percussion Striker"
SWEP.Trivia_Country = "Hungary"
SWEP.Trivia_Year = 1932

SWEP.ViewModel = "models/weapons/v_ww2_m32.mdl"
SWEP.WorldModel = "models/weapons/w_ww2_m32.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 9

SWEP.ShootEntity = "arccw_uo_nade_m32"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 35

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1380
SWEP.MuzzleVelocityAlt = 425

SWEP.PullPinTime = 0.9
SWEP.FuseTime = 4.2
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.1
SWEP.WindupMinimum = 0.35

SWEP.ShootEntityDelay = 0.22

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Sound("germany_ww2/explosives/mk2_pullpin_02.wav", UO.Snd.PinPull)
local spoon = UO.Sound("germany_ww2/explosives/m24_capoff.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_2.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"]    = { Source = "base_draw", SoundTable = { {s = rattle, t = 0} } },
    ["ready"]   = { Source = "base_draw", SoundTable = { {s = rattle, t = 0} } },
    ["idle"]    = { Source = "base_idle" },
    ["holster"] = { Source = "base_holster" },

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
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6},
            {s = spoon, t = 0.1},
        },
    },
}
