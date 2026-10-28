SWEP.Base = "arccw_uo_grenade_base"

SWEP.Spawnable = true

SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "6Urban Ordnance"

SWEP.PrintName = "Blasting Stick"
SWEP.TrueName = "TNT"
SWEP.Trivia_Class = "Commercial Demolition Charge"
SWEP.Trivia_Desc = [[A bundle of commercial blasting sticks on a length of safety fuse. Trinitrotoluene was a dye chemical for thirty years before anybody realised it was an explosive, and it is stable enough that you can set it alight without it detonating, which is why it took so long to notice.

Mining and quarrying charge rather than a weapon, used as one because it is what was to hand.

STATS: 1000 blast, 300 damage, 5 second fuse. No casing, so nothing comes off it.

Considerably more explosive than anything else you can throw by hand. Doors leave their frames from further out than the blast reaches.

It is a demolition charge, not a grenade, and the blast radius is larger than your throw. Water puts the fuse out.]]
SWEP.Trivia_Calibre = "Trinitrotoluene"
SWEP.Trivia_Mechanism = "Safety Fuse"
SWEP.Trivia_Country = "-"
SWEP.Trivia_Year = 1867

SWEP.ViewModel = "models/uc_grenades/v_exp_tnt.mdl"
SWEP.WorldModel = "models/uc_grenades/w_exp_tnt.mdl"
SWEP.ViewModelFOV = 58
SWEP.UseHands = true

SWEP.ActivePos = Vector(0, 0, 0)

SWEP.WorldModelOffset = {
    pos = Vector(-3, 2, -2),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1,
}

SWEP.SlotPos = 22

SWEP.ShootEntity = "arccw_uo_nade_tnt"

SWEP.CamAttachment = 1

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "fcg.timer",
    },
}

SWEP.MuzzleVelocity = 950
SWEP.MuzzleVelocityAlt = 300

SWEP.PullPinTime = 1.2
SWEP.FuseTime = 5
SWEP.CookPrimFire = true
SWEP.CookAltFire = true

SWEP.WindupTime = 0.7
SWEP.WindupMinimum = 0.55

SWEP.ShootEntityDelay = 0.26

SWEP.SpeedMult = 0.96

local UO = ArcCW.UO

local rattle = UO.Snd.Rattle
local lopen = UO.Sound("nades/molotov/molotov_lighter_open.wav", UO.Snd.PinPull)
local ignite = UO.Sound("weapons/tnt_ignite_01.wav", "nades/molotov/molotov_ignite.wav", "ambient/fire/gascan_ignite1.wav")
local pop = UO.Sound("weapons/tnt_pop_01.wav", UO.Snd.FusePop)
local burnloop = UO.Sound("weapons/tnt_spark_loop_02.wav",
    "nades/molotov/molotov_idle_burn_loop.wav", "ambient/fire/fire_small_loop1.wav")
local throw = UO.Snd.Throw

local function StopFuse(wep)
    if wep.UO_FuseSound then
        wep.UO_FuseSound:Stop()
        wep.UO_FuseSound = nil
    end
end

SWEP.Hook_PreThrow = function(wep)
    if !SERVER then return end

    StopFuse(wep)
    wep.UO_FuseSound = CreateSound(wep, UO.PickSound(burnloop))
    if wep.UO_FuseSound then wep.UO_FuseSound:PlayEx(0.6, 100) end
end

SWEP.Hook_PostThrow = function(wep)
    if SERVER then StopFuse(wep) end
end

SWEP.Hook_OnHolsterEnd = function(wep)
    if SERVER then StopFuse(wep) end
end

function SWEP:OnRemove()
    StopFuse(self)

    if engine.ActiveGamemode() != "terrortown" then return end
    if CLIENT and IsValid(self:GetOwner()) and self:GetOwner() == LocalPlayer() and self:GetOwner():Alive() then
        RunConsoleCommand("use", "weapon_ttt_unarmed")
    end
end

SWEP.Animations = {
    ["draw"] = {
        Source = "Draw",
        SoundTable = {
            {s = rattle, t = 0, v = 0.5},
        },
    },
    ["ready"] = {
        Source = "Draw",
        SoundTable = {
            {s = rattle, t = 0, v = 0.5},
        },
    },
    ["idle"] = {
        Source = "Idle",
    },
    ["holster"] = {
        Source = "Holster",
    },

    ["pre_throw"] = {
        Source = "Ignite",
        MinProgress = 0.85,
        SoundTable = {
            {s = lopen, t = 0.1},
            {s = ignite, t = 0.4},
            {s = pop, t = 0.9, v = 0.8},
        },
    },
    ["pre_throw_hold"] = {
        Source = "Idle",
    },
    ["throw"] = {
        Source = "Throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.7, p = 90},
        },
    },

    ["pre_throw_alt"] = {
        Source = "Ignite",
        MinProgress = 0.85,
        SoundTable = {
            {s = lopen, t = 0.1},
            {s = ignite, t = 0.4},
            {s = pop, t = 0.9, v = 0.8},
        },
    },
    ["pre_throw_hold_alt"] = {
        Source = "Idle",
    },
    ["throw_alt"] = {
        Source = "Throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM,
        SoundTable = {
            {s = throw, t = 0, v = 0.6, p = 90},
        },
    },
}
