SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "BM-44"
SWEP.TrueName = "S-Mine 44"
SWEP.Trivia_Class = "Bounding Anti-Personnel Mine"
SWEP.Trivia_Desc = [[The Schrapnellmine 35, better known to the men who had to clear them as the Bouncing Betty. A steel pot buried to the collar with three prongs showing, and a second charge underneath the main body to throw it into the air before it fires.

It was designed specifically to beat the thing soldiers do by reflex, which is to hit the dirt. Allied engineers in Normandy hated it more than any other mine they came across, and most of the lore around minefields being unclearable comes from this one design.

STATS: 640 blast, 195 damage, 44 fragments in every direction. Trips at 120u and arms in 2.5s.

Because it detonates at waist height, going prone does not help and neither does low cover. It is the only mine here that a knee wall will not stop.

Beeps steadily once armed. Shooting it sets it off where it stands.]]
SWEP.Trivia_Calibre = "TNT"
SWEP.Trivia_Mechanism = "Proximity/Bounding"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1944

SWEP.ViewModel = "models/weapons/smi44_betty/c_smi44_betty.mdl"
SWEP.WorldModel = "models/weapons/smi44_betty/w_smi44_betty.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true
SWEP.CamAttachment = 2

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 47

SWEP.ShootEntity = "arccw_uo_dev_betty"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.proximity",
    },
}

SWEP.MuzzleVelocity = 450
SWEP.MuzzleVelocityAlt = 200

SWEP.PullPinTime = 0.7
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.3

SWEP.SpeedMult = 0.97

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local draw = UO.Sound("weapons/smi44_betty/wpn_bouncing_betty_pull_out_01.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/smi44_betty/wpn_betty_activate_01.wav", UO.Snd.PinPull)
local spoon = UO.Sound("weapons/smi44_betty/wpn_betty_activate_02.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/smi44_betty/wpn_bouncing_betty_land_default_01.wav", UO.Snd.Throw)

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
