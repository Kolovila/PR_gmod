SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "ST-74"
SWEP.TrueName = "No. 74 ST"
SWEP.Trivia_Class = "Adhesive Anti-Tank Grenade"
SWEP.Trivia_Desc = [[The No. 74, the sticky bomb. A glass flask of nitroglycerine in a stockinette bag, coated in birdlime, with a sheet metal casing you pulled off before throwing. British Home Guard and commando issue, produced when Britain expected to be fighting tanks in its own lanes.

It had a reputation for sticking to the thrower, to uniforms, and to anything except a wet or muddy tank, which is most tanks. Nobody remembers it fondly.

STATS: 620 blast, 260 damage, 5 second fuse, no fragments.

It sticks to whatever it touches, including armour plate, doorframes, crates and people, which nothing else in this pack does. A No. 74 stuck to somebody is a five second problem they cannot put down.

Arms almost instantly. It cannot be cooked.]]
SWEP.Trivia_Calibre = "Nitroglycerine"
SWEP.Trivia_Mechanism = "Adhesive/Timer"
SWEP.Trivia_Country = "United Kingdom"
SWEP.Trivia_Year = 1940

SWEP.ViewModel = "models/weapons/sticky_gren/c_sticky_gren.mdl"
SWEP.WorldModel = "models/weapons/sticky_gren/w_sticky_gren.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true
SWEP.CamAttachment = 2

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 25

SWEP.ShootEntity = "arccw_uo_nade_sticky"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.impact",
    },
}

SWEP.MuzzleVelocity = 1000
SWEP.MuzzleVelocityAlt = 330

SWEP.PullPinTime = 1.1
SWEP.FuseTime = 5
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0.9
SWEP.WindupMinimum = 0.45

SWEP.ShootEntityDelay = 0.26

SWEP.SpeedMult = 0.97

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Snd.Rattle
local pin = UO.Snd.PinPull
local spoon = UO.Snd.SpoonEject
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"]   = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["ready"]  = { Source = "draw",    SoundTable = { {s = draw, t = 0} } },
    ["idle"]   = { Source = "idle" },
    ["holster"]= { Source = "holster" },

    ["pre_throw"] = {
        Source = "pullpin",
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35},
        },
    },
    ["pre_throw_hold"] = { Source = "idle" },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0} },
    },

    ["pre_throw_alt"] = {
        Source = "pullpin",
        MinProgress = 0.75,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35},
        },
    },
    ["pre_throw_hold_alt"] = { Source = "idle" },
    ["throw_alt"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.6} },
    },
}
