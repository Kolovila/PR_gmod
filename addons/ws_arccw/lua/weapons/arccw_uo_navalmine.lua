SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "NM-1"
SWEP.TrueName = "Naval Mine"
SWEP.Trivia_Class = "Moored Contact Mine"
SWEP.Trivia_Desc = [[A moored contact mine, the type that made whole seas impassable in both world wars. A steel sphere of explosive on a cable and a sinker, floating at a set depth and studded with soft lead horns. Bend a horn, the glass cell inside it breaks, the acid runs onto the plates, and the battery it has just become fires the detonator.

Mines like these sank more shipping than submarines did in the First World War, and a great many were still being cleared decades after the wars ended.

STATS: 1050 blast, 340 damage, 26 fragments. Trips on contact at 85u with no minimum weight at all. Arms in 3.5s, the slowest in the pack.

On dry land it is a poor bargain: the heaviest thing here, it barely leaves your hand, and a Tellermine still hits harder.

Submerged it doubles its radius and gains 40% damage, because water does not compress and the shock front travels out intact. Everything else in this pack simply drowns.

SINK: goes to the bottom and waits there. Hidden, and it covers anything moving at depth.
FLOAT: rises and moors just under the surface, the way a real one sits. Visible, but it covers where people actually swim.

On dry land the two modes are identical. Shooting it sets it off.]]
SWEP.Trivia_Calibre = "Amatol"
SWEP.Trivia_Mechanism = "Hertz Horn"
SWEP.Trivia_Country = "Germany"
SWEP.Trivia_Year = 1912

SWEP.ViewModel = "models/weapons/c_uc_navalmine.mdl"
SWEP.WorldModel = "models/weapons/w_navalmine.mdl"
SWEP.ViewModelFOV = 60
SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-4, 2, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 53

SWEP.ShootEntity = "arccw_uo_dev_navalmine"

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.sink",
    },
    {
        Mode = 2,
        PrintName = "fcg.float",
        UO_Float = true,
    },
}

SWEP.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    local fm = wep:GetCurrentFiremode()
    rocket.Floats = (fm and fm.UO_Float) and true or false
end

SWEP.MuzzleVelocity = 300
SWEP.MuzzleVelocityAlt = 150

SWEP.PullPinTime = 1.20
SWEP.FuseTime = false
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 0
SWEP.WindupMinimum = 1

SWEP.ShootEntityDelay = 0.3

SWEP.SpeedMult = 0.90

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local click = UO.Sound("buttons/button17.wav", "buttons/blip1.wav")
local beep = UO.Sound("npc/roller/mine/rmine_blip1.wav", "buttons/blip1.wav")
local throw = UO.Snd.Throw

SWEP.Animations = {
    ["draw"] = {
        Source = "deploy",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["ready"] = {
        Source = "deploy",
        SoundTable = { {s = rattle, t = 0} },
    },
    ["idle"] = {
        Source = "idle",
    },
    ["holster"] = {
        Source = "holster",
    },

    ["pre_throw"] = {
        Source = "idle",
        Time = 1.20,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.25, p = 96},
            {s = beep, t = 0.45, p = 112},
        },
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.55, p = 92} },
    },

    ["pre_throw_alt"] = {
        Source = "idle",
        Time = 1.20,
        MinProgress = 0.5,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = click, t = 0.25, p = 96},
            {s = beep, t = 0.45, p = 112},
        },
    },
    ["throw_alt"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = { {s = throw, t = 0, v = 0.45, p = 92} },
    },
}
