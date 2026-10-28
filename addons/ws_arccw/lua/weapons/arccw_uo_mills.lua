SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-M/36"
SWEP.TrueName = "Mills Bomb No. 36M"
SWEP.Trivia_Class = "Defensive Grenade"
SWEP.Trivia_Desc = [[The Mills bomb, the first modern fragmentation grenade and the pattern for everything that followed. Cast iron, deeply segmented, with a lever and pin design that is still recognisable in grenades made a century later. Britain made something like seventy five million of them.

The segmentation on the outside is often said to be for fragmentation. It is not, particularly. It is mostly there for grip.

STATS: 560 blast, 150 damage, and a 7 second fuse, by far the longest in the pack. Few fragments, but enormous ones that carry to 2600u.

Seven seconds is long enough for anyone who watches it land to pick it up and throw it back. Thrown uncooked, it is very nearly a gift.

NADE: throw on a fixed fuse.
COOK: hold to burn the fuse down before throwing. This is the grenade the COOK firemode exists for. Hold past 7s and it goes off in your hand.]]
SWEP.Trivia_Calibre = "Baratol"
SWEP.Trivia_Mechanism = "Mills Pattern Lever"
SWEP.Trivia_Country = "United Kingdom"
SWEP.Trivia_Year = 1915

SWEP.ViewModel = "models/weapons/arc9_doi/c_mills.mdl"
SWEP.WorldModel = "models/weapons/arc9_doi/w_mills.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 3

SWEP.ShootEntity = "arccw_uo_nade_mills"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 35

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

SWEP.MuzzleVelocity = 1150
SWEP.MuzzleVelocityAlt = 370

SWEP.PullPinTime = 0.9
SWEP.FuseTime = 7
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1.2
SWEP.WindupMinimum = 0.35

SWEP.ShootEntityDelay = 0.22

SWEP.SpeedMult = 0.99

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
