SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "AP-I/O"
SWEP.TrueName = "RGO"
SWEP.Trivia_Class = "Impact Fragmentation Grenade"
SWEP.Trivia_Desc = [[The RGO, a Soviet grenade with two fuses in it. A centrifugal lock arms a contact detonator shortly after the grenade leaves your hand, and a clockwork self-destruct sits behind it in case the contact fuze never gets its chance.

Developed alongside the offensive RGN for Afghanistan, where a grenade that goes off on arrival is worth a great deal in broken ground.

STATS: 600 blast, 180 damage, 40 fragments out to 1100u.

Unlike every other impact weapon here it still throws proper fragmentation. No bounce to plan around and no countdown.

IMP: contact fuse. Arms about 0.9s after the throw. It cannot be cooked, and a low ceiling on the way out is your problem.
TIME: locks the contact fuse out and throws it as an ordinary 4 second frag.]]
SWEP.Trivia_Calibre = "A-IX-1"
SWEP.Trivia_Mechanism = "Impact/Self-Destruct"
SWEP.Trivia_Country = "Soviet Union"
SWEP.Trivia_Year = 1981

SWEP.ViewModel = "models/weapons/c_uc_rgo.mdl"
SWEP.WorldModel = "models/weapons/w_rgo.mdl"
SWEP.ViewModelFOV = 58

SWEP.UseHands = true

SWEP.WorldModelOffset = {
    pos = Vector(-2.5, 1.5, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 11

SWEP.ShootEntity = "arccw_uo_nade_rgo"

SWEP.NotForNPCs = false
SWEP.NPCWeaponType = "weapon_frag"
SWEP.NPCWeight = 35

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.impact",
    },
    {
        Mode = 1,
        PrintName = "fcg.timer",
        UO_NoImpact = true,
    },
}

SWEP.Hook_PostFireRocket = function(wep, rocket)
    if !SERVER then return end
    if !IsValid(rocket) then return end

    local fm = wep:GetCurrentFiremode()
    if !fm or !fm.UO_NoImpact then return end

    rocket.ImpactFuse = false
end

SWEP.MuzzleVelocity = 1400
SWEP.MuzzleVelocityAlt = 440

SWEP.PullPinTime = 0.75
SWEP.FuseTime = 4
SWEP.CookPrimFire = false
SWEP.CookAltFire = false

SWEP.WindupTime = 1
SWEP.WindupMinimum = 0.35

SWEP.ShootEntityDelay = 0.2

local UO = ArcCW.UO

local rattle = UO.Sound("weapons/no69/handling/no69_armdraw.wav", UO.Snd.Rattle)
local pin = UO.Sound("weapons/mk2/handling/mk2_pinpull.wav", UO.Snd.PinPull)
local spoon = UO.Sound("nades/f1/m67_spooneject.wav", UO.Snd.SpoonEject)
local throw = UO.Sound("weapons/tfa_ins2_rgo/rgo_throw.wav", UO.Snd.Throw)

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
        MinProgress = 0.8,
        SoundTable = {
            {s = rattle, t = 0.05},
            {s = pin, t = 0.35},
        },
    },
    ["pre_throw_hold"] = {
        Source = "pullbackhigh",
    },
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
            {s = pin, t = 0.35},
        },
    },
    ["pre_throw_hold_alt"] = {
        Source = "pullbacklow",
    },
    ["throw_alt"] = {
        Source = "lowthrow",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6},
            {s = spoon, t = 0.1},
        },
    },
}
