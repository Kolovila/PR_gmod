SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "ATM-43"
SWEP.TrueName = "Tellermine 43"
SWEP.Trivia_Class = "Anti-Tank Mine"
SWEP.Trivia_Desc = [[The Tellermine 43, the plate mine. A steel dish holding nine kilos of TNT under a pressure plate, and the standard German anti-tank mine of the war. The 43 was the simplified version, made faster and with less steel than the models before it.

Its pressure fuze needs a genuine vehicle to set it off, which is deliberate: it will not be wasted on infantry walking over the minefield ahead of the tanks.

STATS: 1100 blast, 380 damage. The largest single charge in the pack.

It ignores people entirely and wants 200kg or more landing squarely on top, within 45u laterally. That is essentially "on the plate". A trap for vehicles rather than an area weapon.

Arms in 2s. Shooting it sets it off.]]
SWEP.Trivia_Calibre = "TNT"
SWEP.Trivia_Mechanism = "Crush Plate"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1943

SWEP.ViewModel = "models/weapons/t43_mine/c_t43_mine.mdl"
SWEP.WorldModel = "models/weapons/t43_mine/w_t43_mine.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true
SWEP.CamAttachment = 2

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 50

SWEP.ShootEntity = "arccw_uo_dev_t43"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.proximity",
    },
}

SWEP.MuzzleVelocity = 380
SWEP.MuzzleVelocityAlt = 170

SWEP.PullPinTime = 1
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.34

SWEP.SpeedMult = 0.94

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("weapons/t43_mine/wpn_teller_mine_land_default_01.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/t43_mine/wpn_teller_mine_land_default_02.wav", UO.Snd.PinPull)
local spoon = UO.Sound("weapons/t43_mine/wpn_teller_mine_land_default_03.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/t43_mine/wpn_teller_mine_throw_01.wav", UO.Snd.Throw)

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
