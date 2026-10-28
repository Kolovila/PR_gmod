SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "OC-14"
SWEP.TrueName = "RG-14"
SWEP.Trivia_Class = "Offensive Grenade"
SWEP.Trivia_Desc = [[The RG-14, a Russian stick grenade from the First World War. Offensive by design: a thin sheet metal body around a large charge, meant to be thrown by men advancing in the open who could not stop to take cover from their own grenade.

Every one was issued alongside a separate cast iron jacket. When you were defending a trench rather than crossing one, you slid the jacket on.

STATS: 560 blast, 175 damage, 4 second fuse, with only 8 token fragments. Light, and it throws a very long way.

SLEEVE slot: fits the cast iron jacket, which turns it into a defensive grenade at the cost of most of its reach.]]
SWEP.Trivia_Calibre = "Trinitrotoluene"
SWEP.Trivia_Mechanism = "Sliding Safety"
SWEP.Trivia_Country = "Russian Empire"
SWEP.Trivia_Year = 1914

SWEP.ViewModel = "models/weapons/v_tannenberg_rg14.mdl"
SWEP.WorldModel = "models/weapons/w_rg14.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 16

SWEP.ShootEntity = "arccw_uo_nade_rg14"

SWEP.Attachments = {
    {
        PrintName = "attslot.uo_sleeve",
        DefaultAttName = "attslot.uo_sleeve.default",
        Slot = "uo_sleeve",
    },
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1550
SWEP.MuzzleVelocityAlt = 470

SWEP.PullPinTime = 0.95
SWEP.FuseTime = 4
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.2
SWEP.WindupMinimum = 0.32

SWEP.ShootEntityDelay = 0.22

SWEP.SpeedMult = 1.01

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local pin = UO.Sound("germany_ww2/explosives/m24_capoff.wav", UO.Snd.PinPull)
local spoon = UO.Sound("germany_ww2/explosives/m24_screwcap.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_4.wav", UO.Snd.Throw)

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
