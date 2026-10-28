SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "Interdictor .408"
SWEP.TrueName = "CheyTac M200 Intervention"
SWEP.Trivia_Class = "Sniper Rifle"
SWEP.Trivia_Desc = [[Long-range bolt-action precision rifle developed in the early 2000s around the proprietary .408 CheyTac cartridge, which was engineered specifically to outperform standard .50 BMG at extreme distances. Built with a modular chassis, an integrated folding bipod, and a heavy free-floating barrel to maintain sub-MOA accuracy. It is heavy, cumbersome to transport in its tactical case, and requires careful calculation for long-range engagements, but it delivers unmatched kinetic energy when you need to hit a target past a mile.]]
SWEP.Trivia_Manufacturer = "CheyTac LLC"
SWEP.Trivia_Calibre = ".408 CheyTac"
SWEP.Trivia_Mechanism = "Bolt Action"
SWEP.Trivia_Country = "USA"
SWEP.Trivia_Year = 2001

SWEP.Slot = 3

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
end

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_ins2_warface_cheytac_m200_2.mdl"
SWEP.WorldModel = "models/weapons/w_ins2_warface_cheytac_m200.mdl"

SWEP.MirrorVMWM = true

SWEP.ViewModelFOV = 65

SWEP.WorldModelOffset = {
    pos = Vector(9.5, 1.1, -5.4),
    ang = Angle(170, 180, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
}

SWEP.DefaultBodygroups = "00000000"

SWEP.Damage = 88
SWEP.DamageMin = 158
SWEP.RangeMin = 150
SWEP.Range = 1500

SWEP.Penetration = 38
SWEP.DamageType = DMG_BULLET + DMG_ALWAYSGIB
SWEP.MuzzleVelocity = 910
SWEP.PhysBulletMuzzleVelocity = 910

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 7
SWEP.ExtendedClipSize = 7
SWEP.ReducedClipSize = 5

SWEP.Recoil = 2.6
SWEP.RecoilSide = 1.1
SWEP.RecoilRise = 1.2
SWEP.RecoilPunch = 2.2
SWEP.VisualRecoilMult = 1.4
SWEP.MaxRecoilBlowback = 1.2
SWEP.MaxRecoilPunch = 1.4
SWEP.RecoilPunchBack = 3

SWEP.Sway = 0.9

SWEP.ManualAction = true
SWEP.NoLastCycle = true

SWEP.Delay = 60 / 1000
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 180

SWEP.AccuracyMOA = 0.12
SWEP.HipDispersion = 1600
SWEP.MoveDispersion = 450

SWEP.Primary.Ammo = "SniperPenetratedRound"
SWEP.MagID = "m200"

SWEP.Bipod_Integral = true
SWEP.BipodDispersion = 0.15
SWEP.BipodRecoil = 0.1

SWEP.ShootVol = 140
SWEP.ShootPitch = 96

local snd = "weapons/cheytac_m200/"
local uc = "uc_m200/"

SWEP.FirstShootSound = snd .. "m200_shoot.wav"
SWEP.ShootSound = snd .. "m200_shoot.wav"
SWEP.ShootSoundSilenced = snd .. "m200_suppressed.wav"
SWEP.DistantShootSound = snd .. "m200_shoot.wav"

local common = ")/arccw_uc/common/"
local tail = ")/arccw_uc/common/50bmg/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-50bmg-rif-ext-01.ogg",
    tail .. "fire-dist-50bmg-rif-ext-02.ogg",
    tail .. "fire-dist-50bmg-rif-ext-03.ogg",
    tail .. "fire-dist-50bmg-rif-ext-04.ogg",
    tail .. "fire-dist-50bmg-rif-ext-05.ogg",
    tail .. "fire-dist-50bmg-rif-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    tail .. "fire-dist-50bmg-rif-int-01.ogg",
    tail .. "fire-dist-50bmg-rif-int-02.ogg",
    tail .. "fire-dist-50bmg-rif-int-03.ogg",
    tail .. "fire-dist-50bmg-rif-int-04.ogg",
    tail .. "fire-dist-50bmg-rif-int-05.ogg",
    tail .. "fire-dist-50bmg-rif-int-06.ogg"
}
SWEP.DistantShootSoundOutdoorsSilenced = {
    common .. "sup-tail-01.ogg",
    common .. "sup-tail-02.ogg",
    common .. "sup-tail-03.ogg",
    common .. "sup-tail-04.ogg",
    common .. "sup-tail-05.ogg",
    common .. "sup-tail-06.ogg"
}
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.MuzzleEffect = "muzzleflash_smg"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellPitch = 70
SWEP.ShellScale = 1.35
SWEP.ShellRotate = 0

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 4

SWEP.SpeedMult = 0.76
SWEP.SightedSpeedMult = 0.5
SWEP.ShootSpeedMult = 0.6

SWEP.ReloadInSights = false

SWEP.BulletBones = {
    ["bullet"] = 1
}

SWEP.CaseBones = {}

SWEP.IronSightStruct = {
    Pos = Vector(-2.635, -3.902, -0.08),
    Ang = Angle(1.5, 0, 0),
    Magnification = 1.35,
    SwitchToSound = "",
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0.6, 1.65, 0.1)
SWEP.ActiveAng = Angle(0.2, 0.4, 0)

SWEP.CrouchPos = Vector(0.4, 0.8, 1)
SWEP.CrouchAng = Angle(0.5, 0.5, -6)

SWEP.SprintPos = Vector(5.02, 4.1, 1.6)
SWEP.SprintAng = Angle(-11.707, 48.78, -35.122)

SWEP.HolsterPos = Vector(0.6, -6, 0)
SWEP.HolsterAng = Angle(-7, 30, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.CustomizePos = Vector(9, 0.6, -2)
SWEP.CustomizeAng = Angle(12, 30, 0)

SWEP.BarrelLength = 34

SWEP.AttachmentElements = {
    ["m200_skin_black"] = {
        VMSkin = 1,
        WMSkin = 1,
    },
    ["barrel_short"] = {
        VMBodygroups = {{ind = 1, bg = 1}},
        WMBodygroups = {{ind = 1, bg = 1}},
        AttPosMods = {[3] = {
            vpos = Vector(0, 5.235, 0),
        }},
    },
    ["m200_rail"] = {
        VMBodygroups = {{ind = 2, bg = 1}},
        WMBodygroups = {{ind = 2, bg = 1}},
    },
    ["barrel_obrez"] = {
        VMBodygroups = {{ind = 0, bg = 1}, {ind = 1, bg = 2}, {ind = 2, bg = 2}},
        WMBodygroups = {{ind = 1, bg = 1}},
        AttPosMods = {[3] = {
            vpos = Vector(0, 15.217, 0),
        }},
    },
    ["mag_5"] = {
        VMBodygroups = {{ind = 3, bg = 1}},
    },
    ["mag_10"] = {
        VMBodygroups = {{ind = 3, bg = 2}},
    },
    ["stock_collapsed"] = {
        VMBodygroups = {{ind = 4, bg = 1}},
    },
    ["stock_wood"] = {
        VMBodygroups = {{ind = 4, bg = 2}},
    },
    ["stock_none"] = {
        VMBodygroups = {{ind = 4, bg = 3}},
    },
    ["conv_12g"] = {
        VMBodygroups = {{ind = 5, bg = 1}},
    },
    ["no_irons"] = {
        VMBodygroups = {{ind = 6, bg = 1}},
    },
    ["barrel_long"] = {
        VMBodygroups = {{ind = 1, bg = 3}},
        AttPosMods = {[3] = {
            vpos = Vector(0, -20.954, 0),
        }},
    },
    ["barrel_sd"] = {
        VMBodygroups = {{ind = 1, bg = 4}},
        AttPosMods = {[3] = {
            vpos = Vector(0, 0.253, 0),
        }},
    },
    ["stock_m16"] = {
        VMBodygroups = {{ind = 4, bg = 4}},
    },
    ["handle_tac"] = {
        VMBodygroups = {{ind = 7, bg = 1}},
    },
    ["handle_light"] = {
        VMBodygroups = {{ind = 7, bg = 2}},
    },
}

SWEP.ExtraSightDist = 8

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic", "optic_sniper", "optic_lp"},
        Bone = "A_Optic",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(90, 0, 90),
        },
        VMScale = Vector(1, 1, 1),
        InstalledEles = {"no_irons"},
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_m200_barrel"},
        DefaultAttName = "Standard Barrel"
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        ExcludeFlags = {"m200_barrel_sd", "m200_barrel_long"},
        Bone = "A_Suppressor",
        Offset = {
            vpos = Vector(0, 0, 0),
            vang = Angle(0, 90, 0),
        },
    },
    {
        PrintName = "Mount",
        Slot = {"uc_m200_mount"},
        DefaultAttName = "Integrated Bipod",
        ExcludeFlags = {"m200_barrel_obrez"},
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip", "bipod", "ubgl"},
        Bone = "A_Underbarrel",
        Offset = {
            vpos = Vector(4.673, -1.09, 1.42),
            vang = Angle(0, 0, 90),
        },
        RequireFlags = {"m200_rail"},
        ExcludeFlags = {"m200_barrel_obrez"},
        MergeSlots = {18},
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "A_Underbarrel",
        Offset = {
            vpos = Vector(4.951, 0.097, 2.71588),
            vang = Angle(0, 0, 180),
        },
        RequireFlags = {"m200_rail"},
        ExcludeFlags = {"m200_barrel_obrez"},
    },
    {
        PrintName = "Calibre",
        Slot = {"uc_m200_cal"},
        DefaultAttIcon = Material("entities/att/uc_bullets/408cheytac.png", "smooth mips"),
        DefaultAttName = ".408 CheyTac"
    },
    {
        PrintName = "Magazine",
        Slot = {"uc_m200_mag"},
        DefaultAttName = "7-Round Magazine"
    },
    {
        PrintName = "Stock",
        Slot = {"uc_m200_stock"},
        DefaultAttName = "Folding Stock"
    },
    {
        PrintName = "Handle",
        Slot = {"uc_m200_handle"},
        DefaultAttName = "Standard Handle"
    },
    {
        PrintName = "Fire Group",
        Slot = "fcg",
        DefaultAttName = "Standard FCG"
    },
    {
        PrintName = "Training Package",
        Slot = "uc_tp",
        DefaultAttName = "Basic Training"
    },
    {
        PrintName = "Internals",
        Slot = "uc_fg",
        DefaultAttName = "Standard Internals"
    },
    {
        PrintName = "Powder Load",
        Slot = "uc_powder",
        DefaultAttName = "Standard Load"
    },
    {
        PrintName = "Ammo Type",
        Slot = "uc_ammo"
    },
    {
        PrintName = "Perk",
        Slot = "perk"
    },
    {
        PrintName = "Finish",
        Slot = "uc_m200_skin",
        DefaultAttName = "Factory"
    },
    {
        PrintName = "Underbarrel Weapon",
        Slot = {"uc_ubgl"},
        Bone = "A_Underbarrel",
        Offset = {
            vpos = Vector(2.753, 0.18, 1.58988),
            vang = Angle(0, 0, 90),
        },
        RequireFlags = {"m200_rail"},
        ExcludeFlags = {"m200_barrel_obrez"},
        Hidden = true,
    },
}

local SOLVE_TIME = 1.4
local SOLVE_STILL = 24

local RAIL = "m200_rail"
local OBREZ = "barrel_obrez"
local UBGL = "uc_ubgl"

local ACTIVE_UBGL = Vector(0.6, -5.6, -1.55)

local function hasElement(wep, name)
    local eles = wep:GetActiveElements()

    if not istable(eles) then return false end

    for i = 1, #eles do
        if eles[i] == name then return true end
    end

    return false
end

SWEP.O_Hook_Override_ActivePos = function(wep, data)
    if not hasElement(wep, UBGL) then return end

    data.current = ACTIVE_UBGL

    return data
end

SWEP.Hook_Think = function(wep)
    wep.Bipod_Integral = not (hasElement(wep, RAIL) or hasElement(wep, OBREZ))

    local owner = wep:GetOwner()

    if not IsValid(owner) then
        wep.M200_Solution = 0
        return
    end

    local sighted = wep:GetState() == ArcCW.STATE_SIGHTS
    local still = owner:GetVelocity():Length() <= SOLVE_STILL
    local gain = FrameTime() / SOLVE_TIME

    if sighted and still then
        wep.M200_Solution = math.min((wep.M200_Solution or 0) + gain, 1)
    else
        wep.M200_Solution = math.max((wep.M200_Solution or 0) - gain * 2.5, 0)
    end
end

SWEP.Hook_ModDispersion = function(wep, hip)
    local solved = wep.M200_Solution or 0

    if solved <= 0.01 then return end

    return hip * Lerp(solved, 1, 0.35)
end

SWEP.Hook_ModifyRecoil = function(wep, rec)
    local solved = wep.M200_Solution or 0

    if solved <= 0.01 then return end

    local mult = Lerp(solved, 1, 0.85)

    rec.Recoil = rec.Recoil * mult
    rec.RecoilSide = rec.RecoilSide * mult

    return rec
end

SWEP.Hook_PostFireBullets = function(wep)
    wep.M200_Solution = 0
end

local BASE_DESC = SWEP.Trivia_Desc

SWEP.Hook_DescChange = function(wep, desc)
    local solved = math.Round((wep.M200_Solution or 0) * 100)

    return BASE_DESC .. "\n\nBallistic computer: solution at " .. solved .. " percent."
end

SWEP.Animations = {
    ["idle"] = {
        Source = "base_idle",
        Time = 0.001
    },
    ["draw"] = {
        Source = "base_draw",
        Time = 1.1,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
        SoundTable = {
            {s = snd .. "m200_draw.wav", t = 0},
        },
    },
    ["holster"] = {
        Source = "base_holster",
        Time = 0.8,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["ready"] = {
        Source = "base_ready",
        Time = 1.4,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.25,
    },
    ["fire"] = {
        Source = "base_fire_start",
        Time = 0.35,
    },
    ["fire_iron"] = {
        Source = "iron_fire_start",
        Time = 0.35,
    },
    ["cycle"] = {
        Source = "base_fire_end",
        Time = 1.3,
        ShellEjectAt = 0.433,
        MinProgress = 1.15,
        SoundTable = {
            {s = uc .. "bolt_up.wav", t = 0.267},
            {s = uc .. "bolt_back.wav", t = 0.433},
            {s = uc .. "bolt_forward.wav", t = 0.633},
            {s = uc .. "bolt_down.wav", t = 0.8},
        },
    },
    ["cycle_iron"] = {
        Source = "iron_fire_end",
        Time = 1.3,
        ShellEjectAt = 0.433,
        MinProgress = 1.15,
        SoundTable = {
            {s = uc .. "bolt_up.wav", t = 0.267},
            {s = uc .. "bolt_back.wav", t = 0.433},
            {s = uc .. "bolt_forward.wav", t = 0.633},
            {s = uc .. "bolt_down.wav", t = 0.8},
        },
    },
    ["fire_empty"] = {
        Source = "base_fire_last",
        Time = 0.35,
    },
    ["dryfire"] = {
        Source = "base_dryfire",
        Time = 0.5,
        SoundTable = {
            {s = snd .. "m200_empty.wav", t = 0},
        },
    },
    ["dryfire_iron"] = {
        Source = "iron_dryfire",
        Time = 0.5,
        SoundTable = {
            {s = snd .. "m200_empty.wav", t = 0},
        },
    },
    ["reload"] = {
        Source = "base_reload",
        Time = 3.433,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = snd .. "m200_magrelease.wav", t = 0.6, c = CHAN_ITEM},
            {s = uc .. "mag_out.wav", t = 1, c = CHAN_ITEM},
            {s = uc .. "mag_in.wav", t = 2.433, c = CHAN_ITEM},
        },
    },
    ["reload_empty"] = {
        Source = "base_reloadempty",
        Time = 5,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKOut = 0.5,
        SoundTable = {
            {s = snd .. "m200_magrelease.wav", t = 0.6, c = CHAN_ITEM},
            {s = uc .. "mag_out.wav", t = 1, c = CHAN_ITEM},
            {s = uc .. "mag_in.wav", t = 2.433, c = CHAN_ITEM},
            {s = uc .. "bolt_up.wav", t = 3.467, c = CHAN_ITEM},
            {s = uc .. "bolt_back.wav", t = 3.667, c = CHAN_ITEM},
            {s = uc .. "bolt_forward.wav", t = 3.867, c = CHAN_ITEM},
            {s = uc .. "bolt_down.wav", t = 4.133, c = CHAN_ITEM},
        },
    },
    ["sprint"] = {
        Source = "base_sprint",
        Time = 1,
    },
}
