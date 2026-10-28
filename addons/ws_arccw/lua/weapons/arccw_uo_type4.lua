SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-J/04"
SWEP.TrueName = "Type 4"
SWEP.Trivia_Class = "Ceramic Fragmentation Grenade"
SWEP.Trivia_Desc = [[The Type 4 ceramic grenade. By 1945 Japan had no steel to spare for something as disposable as a grenade, so civilian potteries at Arita, Seto and Bizen were put to work turning out fired clay pots by the hundred thousand. They were filled, plugged with a wooden bung and issued exactly as they came out of the kiln.

Peel the rubber cap off the neck, rub the match compound on the friction ring until it takes, and throw. There is no lever and no way back.

STATS: 380 blast, 105 damage, 4.5 second fuse, and 30 ceramic shards that die inside 420u.

Vicious in a room and nearly harmless across a street, since every other frag here reaches at least twice as far.

It also breaks. Throw it hard into a wall and the pot comes apart before the fuse finishes, firing the charge on contact at a fraction of the force with no shards at all. Lob it for the grenade, hurl it for a weak contact bomb.

Always cooking once struck. Hold past 4.5s and it goes off in your hand. Water puts it out.

FILLING slot: what went in the pot.
WARE slot: which kiln made it, which decides how easily it breaks.]]
SWEP.Trivia_Calibre = "Picric Acid"
SWEP.Trivia_Mechanism = "Friction Igniter"
SWEP.Trivia_Country = "Japan"
SWEP.Trivia_Year = 1945

SWEP.ViewModel = "models/uc_grenades/c_uc_type4.mdl"
SWEP.WorldModel = "models/uc_grenades/w_rock_thrown.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 8

SWEP.ShootEntity = "arccw_uo_nade_type4"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 25

SWEP.Attachments = {
    {
        PrintName = "attslot.uo_filling_type4",
        DefaultAttName = "attslot.uo_filling_type4.default",
        Slot = "uo_filling_type4",
    },
    {
        PrintName = "attslot.uo_ware",
        DefaultAttName = "attslot.uo_ware.default",
        Slot = "uo_ware",
    },
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.timer",
    },
}

SWEP.MuzzleVelocity = 1180
SWEP.MuzzleVelocityAlt = 400

SWEP.PullPinTime = 1.35
SWEP.FuseTime = 4.5

SWEP.CookPrimFire = true
SWEP.CookAltFire = true

SWEP.WindupTime = 0.85
SWEP.WindupMinimum = 0.45

SWEP.ShootEntityDelay = 0.22

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local cap = UO.Sound("weapons/no77/handling/no77_capoff.wav", UO.Snd.PinPull)
local strike = UO.Sound("nades/molotov/molotov_lighter_strike.wav", UO.Snd.PinPull)
local pop = UO.Snd.FusePop
local popheld = UO.Snd.FusePopHeld
local throw = UO.Sound("germany_ww2/explosives/gen_grenade_throw_1.wav", UO.Snd.Throw)

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
            {s = cap, t = 0.3},
            {s = strike, t = 0.62},
            {s = pop, t = 0.85, v = 0.7},
        },
    },
    ["pre_throw_hold"] = { Source = "pullbackhigh" },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = { {s = throw, t = 0} },
    },

    ["pre_throw_cook"] = {
        Source = "pullbackhighbake",
        MinProgress = 0.95,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = cap, t = 0.3},
            {s = strike, t = 0.62},
            {s = popheld, t = 0.85, v = 0.7},
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
            {s = cap, t = 0.3},
            {s = strike, t = 0.62},
            {s = pop, t = 0.85, v = 0.7},
        },
    },
    ["pre_throw_hold_alt"] = { Source = "pullbacklow" },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.6} },
    },
}
