SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "SC-18"
SWEP.TrueName = "M18"
SWEP.Trivia_Class = "Smoke Grenade"
SWEP.Trivia_Desc = [[The M18 coloured smoke grenade. Not a screening smoke but a signalling one: red, violet, green or yellow, burned for marking landing zones, targets and friendly positions.

In Vietnam the standard practice was for the man on the ground to pop smoke without saying which colour, and the pilot to call back what he could see, so the enemy could not answer a request with the same colour.

STATS: no damage. Vents for 18 seconds after a 1.5 second delay, laying a screen that blocks line of sight for players and NPCs alike.

Quick to build, middling duration. Use the RDG-1 when you need it to last and the No. 79 when you need it right now.]]
SWEP.Trivia_Calibre = "Terephthalic Acid"
SWEP.Trivia_Mechanism = "Pyrotechnic Delay Fuse"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 1943

SWEP.ViewModel = "models/weapons/arc9_doi/c_m18.mdl"
SWEP.WorldModel = "models/weapons/arc9_doi/w_m18.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 31

SWEP.ShootEntity = "arccw_uo_nade_m18"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.grenade",
    },
}

SWEP.MuzzleVelocity = 1150
SWEP.MuzzleVelocityAlt = 370

SWEP.PullPinTime = 0.7
SWEP.FuseTime = 1.5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.1
SWEP.WindupMinimum = 0.35

SWEP.ShootEntityDelay = 0.22

local UO = ArcCW.UO

local rattle = UO.Sound("weapons/tfa_csgo/smokegrenade/smokegrenade_draw.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/tfa_csgo/smokegrenade/pinpull.wav", UO.Snd.PinPull)
local spoon = UO.Snd.SpoonEject
local throw = UO.Sound("weapons/tfa_csgo/smokegrenade/grenade_throw.wav", UO.Snd.Throw)

SWEP.Animations = {
    ["draw"] = {
        Source = "base_draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["ready"] = {
        Source = "base_draw",
        SoundTable = {
            {s = rattle, t = 0},
        },
    },
    ["idle"] = {
        Source = "base_idle",
    },
    ["holster"] = {
        Source = "base_holster",
    },

    ["pre_throw"] = {
        Source = "pullbackhigh",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35, p = 90},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {s = throw, t = 0, p = 92},
            {s = spoon, t = 0.1, p = 88},
        },
    },

    ["pre_throw_alt"] = {
        Source = "pullbacklow",
        MinProgress = 0.7,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35, p = 90},
        },
    },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7, p = 92},
            {s = spoon, t = 0.1, p = 88},
        },
    },
}
