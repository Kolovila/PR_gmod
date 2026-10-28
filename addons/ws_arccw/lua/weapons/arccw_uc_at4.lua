SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "AT4"
SWEP.TrueName = "AT4"
SWEP.Trivia_Class = "Disposable Anti-Tank Rocket Launcher"
SWEP.Trivia_Desc = [[Designed in Sweden in the 1980s, The AT-4 would become Swedens main disposable anti-armour weapon in active service, Along side the heavier Carl-Gustav recoilless rifle. Even before this happened, The launcher would be entered, And win the United States competition to replace the M72 LAW, Being designated the M136 in US Service.

Used by the US, Sweden, Then later the United Kingdon, The AT-4 would prove itself to be an ergonomic and easy to use weapon.]]
SWEP.Trivia_Manufacturer = "Saab Bofors Dynamics"
SWEP.Trivia_Calibre = "84MM Rocket"
SWEP.Trivia_Mechanism = "Rocket Propeled Grenade"
SWEP.Trivia_Country = "Sweden"
SWEP.Trivia_Year = 1981

SWEP.Slot = 4

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Saab Bofors Dynamics"
    SWEP.Trivia_Country = "Sweden"
 end

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/chandstest/v_at4.mdl"
SWEP.WorldModel = "models/weapons/w_at4.mdl"

SWEP.MirrorVMWM = false

SWEP.ViewModelFOV = 76

SWEP.WorldModelOffset = {
    pos = Vector(7, 1, -3),
    ang = Angle(170, 180, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.DefaultBodygroups = "0000000000"

SWEP.Damage = 230
SWEP.DamageMin = 230
SWEP.RangeMin = 0
SWEP.Range = 300
SWEP.Penetration = 45
SWEP.ShootEntity = "arccw_uc_at4_rocket"
SWEP.MuzzleVelocity = 11220

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 1

SWEP.Recoil = 1.6
SWEP.RecoilSide = 0.5

SWEP.RecoilRise = 0.5
SWEP.RecoilPunch = 2.4
SWEP.VisualRecoilMult = 1.15
SWEP.MaxRecoilBlowback = 0
SWEP.MaxRecoilPunch = 0
SWEP.RecoilPunchBack = 2.6

SWEP.Sway = 0.5

SWEP.Delay = 60 / 100
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "Rocket",
    },
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 125

SWEP.AccuracyMOA = 3
SWEP.HipDispersion = 300
SWEP.MoveDispersion = 180

SWEP.Primary.Ammo = "at4_rocket"
SWEP.MagID = ""

SWEP.ShootVol = 120
SWEP.ShootPitch = 100

SWEP.ShootSound = "uc_at4/fire.wav"
SWEP.DistantShootSound = "at4/at4_dist.wav"
SWEP.ShootSoundSilenced = "at4/at4_dist.wav"

SWEP.MuzzleEffect = "muzzleflash_1"

SWEP.MuzzleEffectAttachment = 1

SWEP.ShellEffect = nil
SWEP.ShellMaterial = "null"

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.62
SWEP.SightTime = 0.35

SWEP.BulletBones = {
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-1.975, 3, 0.67),
    Ang = Angle(10.85, -11.35, 29.3),
    Magnification = 1.1,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "rpg"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG

SWEP.ActivePos = Vector(0, -3, 3.25)
SWEP.ActiveAng = Angle(11.5, -10.7, 29.3)

SWEP.CrouchPos = Vector(0, -3, 3.5)
SWEP.CrouchAng = Angle(11.7, -11, 25.3)

SWEP.SprintPos = Vector(1, -0, 3)
SWEP.SprintAng = Angle(11.7, -11, 25.3)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.CustomizePos = Vector(7.824, 0.5, -1.897)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.BarrelLength = 22

SWEP.AttachmentElements = {
}

SWEP.Attachments = {
    {
        PrintName = "Powder Load",
        Slot = "uc_powder",
        DefaultAttName = "Standard Load"
    },
    {
        PrintName = "Training Package",
        Slot = "uc_tp",
        DefaultAttName = "Basic Training"
    },
    {
        PrintName = "Internals",
        Slot = "uc_fg_singleshot",
        DefaultAttName = "Standard Internals",
    },
}
local uc_common = ")^arccw_uc/common/"

SWEP.Animations = {
    ["idle"] = {
        Source = "base_idle",
        Time = 1
    },
	["idle_sprint"] = {
        SoundTable = {{s = uc_common .. "movement-rifle-02.ogg", t = 0.2}},
        Source = "base_sprint",
        Time = 1
    },
	["enter_sprint"] = {
        SoundTable = {{s = uc_common .. "movement-rifle-01.ogg", t = 0.1}},
        Source = "base_sprint",
        Time = 1
    },
    ["exit_sprint"] = {
        SoundTable = {
            {s = uc_common .. "movement-rifle-04.ogg", t = 0.1},
            {s = uc_common .. "shoulder.ogg", t = 0.5},
        },
        Source = "base_idle",
        Time = 1
    },
    ["draw"] = {
        SoundTable = ArcCW.UC.DrawSounds,
        Source = "base_draw",
        Time = 1,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
	["holster"] = {
        SoundTable = ArcCW.UC.HolsterSounds,
        Source = "base_holster",
        Time = 0.75,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["ready"] = {
        SoundTable = {
            {s = uc_common .. "raise.ogg", t = 0},
            {s = uc_common .. "cloth_2.ogg", t = 0.4},
            {s = uc_common .. "grab.ogg", t = 1.1},
            {s = uc_common .. "rattle1.ogg", t = 1.8},
            {s = uc_common .. "cloth_6.ogg", t = 2.5},
            {s = uc_common .. "shoulder.ogg", t = 3.0},
        },
        Source = "base_ready",
        Time = 3.5,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["fire"] = {
        Source = "base_toss",
        Time = 1.6,
        SoundTable = {{ s = {"uc_rpg7/mech1.wav", "uc_rpg7/mech2.wav"}, t = 0, v = 1.25 }},
        SoundTable = {{ s = {"uc_at4/toss.wav"}, t = 0.9, v = 0.70 }},
        ShellEjectAt = 0,
    },
	["fire_iron"] = {
        Source = "base_toss",
        Time = 1.6,
        SoundTable = {{ s = {"uc_rpg7/mech1.wav", "uc_rpg7/mech2.wav"}, t = 0, v = 1.25 }},
        SoundTable = {{ s = {"uc_at4/toss.wav"}, t = 0.9, v = 0.70 }},
        ShellEjectAt = 0,
    },
}

function SWEP:Reload()
end

SWEP.Hook_PostFireBullets = function(wep)
    local ply = wep:GetOwner()

    if IsValid(ply) and ply:IsPlayer() then
        local dir = ply:GetAngles():Forward()
        dir.z = 0
        dir:Normalize()
        ply:SetVelocity(dir * (ply:IsOnGround() and -100 or -300))
    end

    timer.Simple(1.2, function()
        if not SERVER then return end
        if not IsValid(wep) then return end

        local owner = wep:GetOwner()
        if IsValid(owner) and owner:IsPlayer() then
            owner:StripWeapon(wep:GetClass())
        else
            wep:Remove()
        end
    end)
end
