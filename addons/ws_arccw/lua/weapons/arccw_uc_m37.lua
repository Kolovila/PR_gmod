SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "8Urban Vintage"
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.PrintName = "Model 37"
SWEP.TrueName = "Ithaca Model 37"
SWEP.Trivia_Class = "Pump-Action Shotgun"
SWEP.Trivia_Desc =
    "A light, forged-steel pump shotgun descended from the Remington Model 17. Its single loading and ejection port underneath the receiver keeps debris out, works equally well from either shoulder, and permits the trigger-held slam-fire technique of early-production guns."
SWEP.Trivia_Manufacturer = "Ithaca Gun Company"
SWEP.Trivia_Calibre = "12 Gauge"
SWEP.Trivia_Mechanism = "Pump Action, Bottom Ejecting"
SWEP.Trivia_Country = "United States"
SWEP.Trivia_Year = 1937
SWEP.Slot = 3

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
end

SWEP.ViewModel = "models/weapons/uc/v_m37_mounts.mdl"
SWEP.WorldModel = "models/weapons/uc/v_m37_mounts.mdl"
SWEP.ViewModelFOV = 65
SWEP.MirrorVMWM = true
SWEP.DefaultBodygroups = "000000"
SWEP.DefaultSkin = 0

SWEP.WorldModelOffset = {
    pos = Vector(-5.5, 5, -5.5),
    ang = Angle(-12, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.825,
}

SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.MuzzleEffectAttachment = 4
SWEP.CaseEffectAttachment = 2
SWEP.CamAttachment = 3

SWEP.ShellEffect = "arccw_uc_shelleffect"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
SWEP.ShellPitch = 100
SWEP.ShellSounds = ArcCW.ShotgunShellSoundsTable
SWEP.ShellScale = 1
SWEP.UC_ShellColor = Color(0.7 * 255, 0.2 * 255, 0.2 * 255)

SWEP.Damage = ArcCW.UC.StdDmg["12g_p"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["12g_p"].min
SWEP.Penetration = ArcCW.UC.StdDmg["12g_p"].pen
SWEP.Num = ArcCW.UC.StdDmg["12g_p"].num
SWEP.Range = 55
SWEP.RangeMin = 5
SWEP.DamageType = DMG_BUCKSHOT
SWEP.MuzzleVelocity = 390
SWEP.PhysBulletMuzzleVelocity = 390
SWEP.HullSize = 0.5
SWEP.BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun

SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 7
SWEP.ExtendedClipSize = 7
SWEP.ReducedClipSize = 5
SWEP.Primary.Ammo = "buckshot"

SWEP.Recoil = 3.45
SWEP.RecoilSide = 0.8
SWEP.RecoilRise = 0.3
SWEP.VisualRecoilMult = 1.08
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 1.1
SWEP.Sway = 0.45

SWEP.Delay = 60 / 65
SWEP.Firemodes = {
    {
        PrintName = "fcg.slam",
        Mode = 2,

        Mult_RPM = 120 / 65,
        Hook_SelectFireAnimation = function(wep, anim)
            return anim .. "_slam"
        end,
    },
    {
        PrintName = "fcg.pump",
        Mode = 1,
    },
    {
        Mode = 0,
    },
}

SWEP.ManualAction = false
SWEP.ShotgunReload = true
SWEP.NoLastCycle = true
SWEP.ReloadInSights = true

SWEP.ShootVol = 160
SWEP.ShootPitch = 98
SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.NPCWeaponType = "weapon_shotgun"
SWEP.NPCWeight = 215

SWEP.AccuracyMOA = 27
SWEP.HipDispersion = 360
SWEP.MoveDispersion = 95
SWEP.JumpDispersion = 1000

SWEP.SpeedMult = 0.94
SWEP.SightedSpeedMult = 0.78
SWEP.SightTime = 0.34
SWEP.ShootSpeedMult = 0.78
SWEP.BarrelLength = 31
SWEP.ExtraSightDist = 2

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

SWEP.IronSightStruct = {
    Pos = Vector(-3.36, -0.976, 1.32),
    Ang = Angle(0, 0, 0),
    Magnification = 1.1,
    SwitchToSound = "",
}

SWEP.HolsterPos = Vector(2, 0, -2)
SWEP.HolsterAng = Angle(-5.5, 20, -20)
SWEP.SprintPos = Vector(-0.5, -3, -2.5)
SWEP.SprintAng = Angle(3.5, 8, -20)
SWEP.ActivePos = Vector(-0.75, -1, 0.75)
SWEP.ActiveAng = Angle(0, 0, -3)
SWEP.CrouchPos = Vector(-3.8, -2, 0)
SWEP.CrouchAng = Angle(0, 0, -30)
SWEP.CustomizePos = Vector(4.56, -0.976, -1.76)
SWEP.CustomizeAng = Angle(15.61, 23.415, 5.854)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(3, 0, -4)

SWEP.Malfunction = true
SWEP.MalfunctionTakeRound = true
SWEP.MalfunctionMean = 850
SWEP.MalfunctionVariance = 0.75

local path = ")uc_m37/"
local legacy = ")m37/"
local common = ")/arccw_uc/common/"
local tail = ")/arccw_uc/common/12ga/"

SWEP.ShootSound = {
    legacy .. "m37_1.wav",
    legacy .. "m37_2.wav",
    legacy .. "m37_3.wav",
}
SWEP.ShootSoundSilenced = { path .. "fire_sup.wav" }
SWEP.ShootDrySound = path .. "mech.wav"
SWEP.FiremodeSound = path .. "mech.wav"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-12ga-pasg-ext-01.ogg",
    tail .. "fire-dist-12ga-pasg-ext-02.ogg",
    tail .. "fire-dist-12ga-pasg-ext-03.ogg",
    tail .. "fire-dist-12ga-pasg-ext-04.ogg",
    tail .. "fire-dist-12ga-pasg-ext-05.ogg",
    tail .. "fire-dist-12ga-pasg-ext-06.ogg",
}
SWEP.DistantShootSoundIndoors = {
    common .. "fire-dist-int-shotgun-01.ogg",
    common .. "fire-dist-int-shotgun-02.ogg",
    common .. "fire-dist-int-shotgun-03.ogg",
    common .. "fire-dist-int-shotgun-04.ogg",
    common .. "fire-dist-int-shotgun-05.ogg",
    common .. "fire-dist-int-shotgun-06.ogg",
}
SWEP.DistantShootSoundOutdoorsSilenced = {
    common .. "sup-tail-01.ogg",
    common .. "sup-tail-02.ogg",
    common .. "sup-tail-03.ogg",
    common .. "sup-tail-04.ogg",
}
SWEP.DistantShootSoundIndoorsSilenced = {
    common .. "fire-dist-int-pistol-light-01.ogg",
    common .. "fire-dist-int-pistol-light-02.ogg",
    common .. "fire-dist-int-pistol-light-03.ogg",
}
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

local foregripRootPos = Vector(0.71, -2.274, 4.626)
local foregripRootAng = Angle(90, 0, -90)

SWEP.Hook_Think = function(wep)
    if ArcCW.UC.ADSReload then
        ArcCW.UC.ADSReload(wep)
    end
    if not CLIENT then
        return
    end
    local owner = wep:GetOwner()
    if not IsValid(owner) then
        return
    end
    local vm = owner:GetViewModel()
    if not IsValid(vm) then
        return
    end

    local key = wep.LastAnimKey
    if key ~= "holster" and key ~= "holster_stock" then
        return
    end
    if CurTime() >= wep.LastAnimFinishTime then
        return
    end
    if wep.M37HolsterStartTime ~= wep.LastAnimStartTime then
        vm:SetCycle(0.999)
        wep.M37HolsterStartTime = wep.LastAnimStartTime
    end
    vm:SetPlaybackRate(-1)
end

local cloth = {
    common .. "cloth_2.ogg",
    common .. "cloth_3.ogg",
    common .. "cloth_4.ogg",
    common .. "cloth_6.ogg",
    common .. "rattle.ogg",
}

local pumpSounds = {
    { s = path .. "mech.wav", t = 0 },
    { s = path .. "pumpback.wav", t = 0.36 },
    { s = legacy .. "m37_shell_eject.wav", t = 0.43 },
    { s = path .. "pumpforward.wav", t = 0.58 },
}

local slamPumpSounds = {
    { s = path .. "mech.wav", t = 0 },
    { s = path .. "pumpback.wav", t = 0.195 },
    { s = legacy .. "m37_shell_eject.wav", t = 0.233 },
    { s = path .. "pumpforward.wav", t = 0.314 },
}

local emptyPumpSounds = {
    { s = path .. "mech_empty.wav", t = 0 },
    { s = path .. "pumpback.wav", t = 0.36 },
    { s = legacy .. "m37_shell_eject.wav", t = 0.43 },
    { s = path .. "pumpforward.wav", t = 0.58 },
}

local emptySlamPumpSounds = {
    { s = path .. "mech_empty.wav", t = 0 },
    { s = path .. "pumpback.wav", t = 0.195 },
    { s = legacy .. "m37_shell_eject.wav", t = 0.233 },
    { s = path .. "pumpforward.wav", t = 0.314 },
}

local function fireAnim(source, time, sounds, shellEjectAt)
    time = time or (60 / 65)
    return {
        Source = source,
        Time = time,
        MinProgress = time,
        ShellEjectAt = shellEjectAt or 0.43,
        SoundTable = sounds or pumpSounds,
    }
end

local function emptyFinish(source, cycleMult)
    cycleMult = cycleMult or 1
    return {
        Source = source,
        Time = (41 / 27) * cycleMult,
        MinProgress = (14 / 27) * cycleMult,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.55 * cycleMult,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.55 * cycleMult,
        LHIKOut = 0.8 * cycleMult,
        SoundTable = {
            { s = path .. "pumpback.wav", t = (3 / 27) * cycleMult },
            { s = path .. "pumpforward.wav", t = (11 / 27) * cycleMult },
            { s = common .. "shoulder.ogg", t = 0.92 * cycleMult },
        },
    }
end

SWEP.Animations = {
    ["idle"] = { Source = "idle" },
    ["idle_stock"] = { Source = "idle_stock" },

    ["ready"] = emptyFinish("reload_end_empty"),
    ["ready_stock"] = emptyFinish("reload_end_empty_stock"),

    ["draw"] = {
        Source = "draw",
        Time = 20 / 30,
        SoundTable = ArcCW.UC.DrawSounds,
    },
    ["draw_stock"] = {
        Source = "draw_stock",
        Time = 20 / 30,
        SoundTable = ArcCW.UC.DrawSounds,
    },
    ["holster"] = {
        Source = "draw",
        Time = 20 / 30,
        SoundTable = ArcCW.UC.HolsterSounds,
    },
    ["holster_stock"] = {
        Source = "draw_stock",
        Time = 20 / 30,
        SoundTable = ArcCW.UC.HolsterSounds,
    },

    ["fire"] = fireAnim({ "shoot_1", "shoot_2" }),
    ["fire_stock"] = fireAnim({ "shoot_1_stock", "shoot_2_stock" }),
    ["fire_iron"] = fireAnim("shoot_aim"),
    ["fire_iron_stock"] = fireAnim("shoot_aim_stock"),
    ["fire_slam"] = fireAnim({ "shoot_1", "shoot_2" }, 60 / 120, slamPumpSounds, 0.233),
    ["fire_slam_stock"] = fireAnim({ "shoot_1_stock", "shoot_2_stock" }, 60 / 120, slamPumpSounds, 0.233),
    ["fire_iron_slam"] = fireAnim("shoot_aim", 60 / 120, slamPumpSounds, 0.233),
    ["fire_iron_slam_stock"] = fireAnim("shoot_aim_stock", 60 / 120, slamPumpSounds, 0.233),
    ["fire_empty"] = fireAnim({ "shoot_1", "shoot_2" }, nil, emptyPumpSounds),
    ["fire_empty_stock"] = fireAnim({ "shoot_1_stock", "shoot_2_stock" }, nil, emptyPumpSounds),
    ["fire_iron_empty"] = fireAnim("shoot_aim", nil, emptyPumpSounds),
    ["fire_iron_empty_stock"] = fireAnim("shoot_aim_stock", nil, emptyPumpSounds),
    ["fire_empty_slam"] = fireAnim({ "shoot_1", "shoot_2" }, 60 / 120, emptySlamPumpSounds, 0.233),
    ["fire_empty_slam_stock"] = fireAnim(
        { "shoot_1_stock", "shoot_2_stock" },
        60 / 120,
        emptySlamPumpSounds,
        0.233
    ),
    ["fire_iron_empty_slam"] = fireAnim("shoot_aim", 60 / 120, emptySlamPumpSounds, 0.233),
    ["fire_iron_empty_slam_stock"] = fireAnim("shoot_aim_stock", 60 / 120, emptySlamPumpSounds, 0.233),

    ["sgreload_start"] = {
        Source = "reload_start",
        Time = 17 / 27,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0,
        SoundTable = {
            { s = cloth, t = 0 },
            { s = common .. "shoulder.ogg", t = 0.1 },
        },
    },
    ["sgreload_start_stock"] = {
        Source = "reload_start_stock",
        Time = 17 / 27,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0.2,
        LHIKOut = 0,
        SoundTable = {
            { s = cloth, t = 0 },
            { s = common .. "shoulder.ogg", t = 0.1 },
        },
    },
    ["sgreload_insert"] = {
        Source = "reload_insert",
        Time = 28 / 27,
        MinProgress = 12 / 27,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.3,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
        SoundTable = {
            { s = cloth, t = 0 },

            { s = path .. "insert.wav", t = 10 / 27 },
        },
    },

    ["sgreload_insert_stock"] = {
        Source = "reload_insert",
        Time = 28 / 27,
        MinProgress = 12 / 27,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        TPAnimStartTime = 0.3,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
        SoundTable = {
            { s = cloth, t = 0 },
            { s = path .. "insert.wav", t = 10 / 27 },
        },
    },
    ["sgreload_finish"] = {
        Source = "reload_end",
        Time = 18 / 24,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.45,
        SoundTable = {
            { s = cloth, t = 0 },
            { s = common .. "shoulder.ogg", t = 0.42 },
        },
    },
    ["sgreload_finish_stock"] = {
        Source = "reload_end_stock",
        Time = 18 / 24,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.45,
        SoundTable = {
            { s = cloth, t = 0 },
            { s = common .. "shoulder.ogg", t = 0.42 },
        },
    },
    ["sgreload_finish_empty"] = emptyFinish("reload_end_empty"),
    ["sgreload_finish_empty_stock"] = emptyFinish("reload_end_empty_stock"),
    ["sgreload_finish_empty_pump_wood"] = emptyFinish("reload_end_empty", 0.96),
    ["sgreload_finish_empty_pump_wood_stock"] = emptyFinish("reload_end_empty_stock", 0.96),
    ["sgreload_finish_empty_pump_light"] = emptyFinish("reload_end_empty", 0.82),
    ["sgreload_finish_empty_pump_light_stock"] = emptyFinish("reload_end_empty_stock", 0.82),
    ["sgreload_finish_empty_pump_heavy"] = emptyFinish("reload_end_empty", 1.18),
    ["sgreload_finish_empty_pump_heavy_stock"] = emptyFinish("reload_end_empty_stock", 1.18),
}

SWEP.BulletBones = {
    [0] = "m37_shell",
}

SWEP.AttachmentElements = {
    ["m37_barrel_trench"] = {
        VMBodygroups = { { ind = 1, bg = 1 } },
    },
    ["m37_barrel_short"] = {
        VMBodygroups = { { ind = 1, bg = 2 } },
        AttPosMods = {
            [3] = { vpos = Vector(0.005, -2.925, 24.15) },
        },
    },
    ["m37_tube_medium"] = {
        VMBodygroups = { { ind = 2, bg = 1 } },
    },
    ["m37_tube_short"] = {
        VMBodygroups = { { ind = 2, bg = 2 } },
    },
    ["m37_stock_rifle"] = {
        VMBodygroups = { { ind = 3, bg = 1 } },
    },
    ["m37_stock_woodgrip"] = {
        VMBodygroups = { { ind = 3, bg = 3 } },
        WMBodygroups = { { ind = 3, bg = 3 } },
    },
    ["m37_pump_wood"] = {
        VMBodygroups = { { ind = 4, bg = 1 } },
        WMBodygroups = { { ind = 4, bg = 1 } },
    },
    ["m37_pump_light"] = {
        VMBodygroups = { { ind = 4, bg = 2 } },
        WMBodygroups = { { ind = 4, bg = 2 } },
    },
    ["m37_pump_heavy"] = {
        VMBodygroups = { { ind = 4, bg = 3 } },
        WMBodygroups = { { ind = 4, bg = 3 } },
    },
    ["m37_carryhandle"] = {
        VMBodygroups = { { ind = 5, bg = 1 } },
        WMBodygroups = { { ind = 5, bg = 1 } },
    },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = { "optic_lp", "optic" },
        Bone = "m37_root",
        Offset = {
            vpos = Vector(-0.02, -3.59, 3.787),
            vang = Angle(90, 0, -90),
        },
    },
    {
        DefaultAttIcon = Material("entities/att/uc_profiles/arccw_uc_m37/default_2.png", "mips smooth"),
        PrintName = "Barrel",
        DefaultAttName = "28\" Field Barrel",
        Slot = "uc_m37_barrel",
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = { "choke", "muzzle_shotgun", "muzzle" },
        Bone = "m37_root",
        Offset = {

            vpos = Vector(0.005, -2.925, 30.24),
            vang = Angle(90, 0, -90),
        },
    },
    {
        DefaultAttIcon = Material("entities/att/uc_profiles/arccw_uc_m37/default_4.png", "mips smooth"),
        PrintName = "Magazine Tube",
        DefaultAttName = "7-Round Tube",
        Slot = "uc_m37_tube",
    },
    {
        DefaultAttIcon = Material("entities/att/uc_profiles/arccw_uc_m37/default_5.png", "mips smooth"),
        PrintName = "Stock",
        DefaultAttName = "Stakeout Pistol Grip",
        Slot = "uc_m37_stock",
    },
    {
        DefaultAttIcon = Material("entities/att/uc_profiles/arccw_uc_m37/default_6.png", "mips smooth"),
        PrintName = "Fore-end",
        DefaultAttName = "Factory Pump",
        Slot = "uc_m37_pump",
    },
    {
        PrintName = "Foregrip",
        Slot = { "foregrip" },
        Bone = "m37_pumpmeharderdaddy",
        Offset = {

            vpos = Vector(0.000004, 0.477124, -2.955801),
            vang = Angle(90, 0, -90),
        },
    },
    {
        DefaultAttIcon = Material("entities/att/uc_profiles/arccw_uc_m37/default_8.png", "mips smooth"),
        PrintName = "Carry Handle",
        DefaultAttName = "No Carry Handle",
        Slot = "uc_m37_carryhandle",
    },
    {
        PrintName = "Caliber",
        DefaultAttName = "12 Gauge",
        Slot = "uc_m37_caliber",
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"BUCK\" #00 Buckshot",
        DefaultAttIcon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth"),
        Slot = "ud_ammo_shotgun",
    },
    {
        PrintName = "Powder Load",
        DefaultAttName = "Standard Load",
        Slot = "uc_powder",
    },
    {
        PrintName = "Training Package",
        DefaultAttName = "Basic Training",
        Slot = "uc_tp",
    },
    {
        PrintName = "Internals",
        DefaultAttName = "Standard Internals",
        Slot = "uc_fg",
    },
}

SWEP.AttachmentElements.m37_barrel_trench.AttPosMods = { [3] = { vpos = Vector(0.005, -2.925, 31.20) } }
