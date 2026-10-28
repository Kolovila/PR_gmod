SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "4Urban Anarchy"
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.MuzzleEffect = "muzzleflash_1"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellScale = 1
SWEP.ShellPitch = 100

SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.TracerNum = 0
SWEP.TracerCol = Color(25, 255, 25)
SWEP.TracerWidth = 2

SWEP.PrintName = "XM422"

SWEP.TrueName = "M249 SAW"

SWEP.Trivia_Class = "Machine Gun"
SWEP.Trivia_Desc = "Compact, fast-firing light machine gun, adopted by the US Army in search of a more soldier-friendly alternative to the M60. Its huge ammo box can carry an unprecedented quantity of rounds, which are dispensed downrange at a rate that will force the enemy's heads to stay down. In emergencies, it can also accept STANAG magazines."
SWEP.Trivia_Manufacturer = "Héristal van Hoog-Zert"
SWEP.Trivia_Calibre = "5.56x45mm NATO"
SWEP.Trivia_Mechanism = "Gas-Operated Open Bolt"
SWEP.Trivia_Country = "Belgium"
SWEP.Trivia_Year = 1977

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
end

SWEP.Slot = 2

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "FN Herstal"
end

SWEP.ViewModel = "models/weapons/arccw/c_ua_m249.mdl"
SWEP.WorldModel = "models/weapons/c_ua_m249.mdl"
SWEP.ViewModelFOV = 65
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.Damage = ArcCW.UC.StdDmg["556"].max
SWEP.DamageMin = ArcCW.UC.StdDmg["556"].min
SWEP.Range = 150
SWEP.Penetration = ArcCW.UC.StdDmg["556"].pen
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.PhysBulletMuzzleVelocity = 915

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 200

SWEP.Recoil = 0.1
SWEP.RecoilSide = 0.14

SWEP.RecoilRise = 0.3
SWEP.VisualRecoilMult = 0.4
SWEP.MaxRecoilBlowback = 0.4
SWEP.MaxRecoilPunch = 1

SWEP.TriggerDelay = true

SWEP.Delay = 60 / 800
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0
    }
}

SWEP.ShootPitch = 100
SWEP.ShootVol = 114

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.ReloadInSights = true

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 60

SWEP.AccuracyMOA = 5.6
SWEP.HipDispersion = 600
SWEP.MoveDispersion = 800

SWEP.Primary.Ammo = "smg1"

SWEP.SpeedMult = 0.7
SWEP.SightedSpeedMult = 0.72
SWEP.SightTime = 0.6

SWEP.BarrelLength = 42
SWEP.ExtraSightDist = 7

SWEP.HolsterPos = Vector(4.623, -2.211, 1.004)
SWEP.HolsterAng = Angle(-8.443, 28.843, 0)

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.IronSightStruct = {
    Pos = Vector(-3.685, 0, 1.28),
    Ang = Angle(0.05, 0.005, 4),
    Magnification = 1,
    SwitchToSound = "",
}

SWEP.ActivePos = Vector(0, 0, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(0, 0, 0)
SWEP.CustomizeAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(-2, -2, 0)
SWEP.CrouchAng = Angle(0, 0, -8)

SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(-9, 4.75, -7.5),
    ang = Angle(-6, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
}

local path = ")^weapons/arccw_ue/m249/"
local common = ")^arccw_uc/common/"
local rottle = {common .. "cloth_1.ogg", common .. "cloth_2.ogg", common .. "cloth_3.ogg", common .. "cloth_4.ogg", common .. "cloth_6.ogg", common .. "rattle.ogg"}
local ratel = {common .. "rattle1.ogg", common .. "rattle2.ogg", common .. "rattle3.ogg"}

SWEP.ShootSound = {
    path .. "fire-01.ogg",
    path .. "fire-02.ogg",
    path .. "fire-03.ogg",
    path .. "fire-04.ogg",
    path .. "fire-05.ogg",
    path .. "fire-06.ogg"
}
SWEP.ShootSoundSilenced = path .. "fire_supp.ogg"
SWEP.DistantShootSound = nil
SWEP.DistantShootSoundSilenced = common .. "sup_tail.ogg"
SWEP.ShootDrySound = nil

local tail = ")^/arccw_uc/common/556x45/"

SWEP.DistantShootSoundOutdoors = {
    tail .. "fire-dist-556x45-mg-ext-01.ogg",
    tail .. "fire-dist-556x45-mg-ext-02.ogg",
    tail .. "fire-dist-556x45-mg-ext-03.ogg",
    tail .. "fire-dist-556x45-mg-ext-04.ogg",
    tail .. "fire-dist-556x45-mg-ext-05.ogg",
    tail .. "fire-dist-556x45-mg-ext-06.ogg"
}
SWEP.DistantShootSoundIndoors = {
    tail .. "fire-dist-556x45-rif-int-01.ogg",
    tail .. "fire-dist-556x45-rif-int-02.ogg",
    tail .. "fire-dist-556x45-rif-int-03.ogg",
    tail .. "fire-dist-556x45-rif-int-04.ogg",
    tail .. "fire-dist-556x45-rif-int-05.ogg",
    tail .. "fire-dist-556x45-rif-int-06.ogg"
}
SWEP.DistantShootSoundOutdoorsSilenced = {
    common .. "sup-tail-01.ogg",
    common .. "sup-tail-02.ogg",
    common .. "sup-tail-03.ogg",
    common .. "sup-tail-04.ogg",
    common .. "sup-tail-05.ogg",
    common .. "sup-tail-06.ogg",
    common .. "sup-tail-07.ogg",
    common .. "sup-tail-08.ogg",
    common .. "sup-tail-09.ogg",
    common .. "sup-tail-10.ogg"
}
SWEP.DistantShootSoundIndoorsSilenced = {
    common .. "fire-dist-int-pistol-light-01.ogg",
    common .. "fire-dist-int-pistol-light-02.ogg",
    common .. "fire-dist-int-pistol-light-03.ogg",
    common .. "fire-dist-int-pistol-light-04.ogg",
    common .. "fire-dist-int-pistol-light-05.ogg",
    common .. "fire-dist-int-pistol-light-06.ogg"
}
SWEP.DistantShootSoundOutdoorsVolume = 1
SWEP.DistantShootSoundIndoorsVolume = 1
SWEP.Hook_AddShootSound = ArcCW.UC.InnyOuty

SWEP.BulletBones = {
	[1] = {"bullet1", "belt1"},
	[2] = {"bullet2", "belt2"},
	[3] = {"bullet3", "belt3"},
	[4] = {"bullet4", "belt4"},
	[5] = {"bullet5", "belt5"},
	[6] = {"bullet6", "belt6"},
	[7] = {"bullet7", "belt7"},
	[8] = {"bullet8", "belt8"},
	[9] = {"bullet9", "belt9"},
	[10] = {"bullet10", "belt10"},
	[11] = {"bullet11", "belt11"},
}

SWEP.DefaultBodygroups = "000000000"

local _FPS_RELOAD = 70

SWEP.Animations = {
    ["idle"] = {
        Source = "beltfed_idle",
        Framerate = 60,
        Time = 330 / 60,
    },
    ["idle_empty"] = {
        Source = "beltfed_idle_empty",
        Framerate = 60,
        Time = 330 / 60,
    },
    ["ready"] = {
        Source = "beltfed_idle",
        Framerate = 60,
        Time = 68 / 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.6,
        SoundTable = {
        },
    },
    ["draw"] = {
        Source = "beltfed_draw",
        Framerate = 60,
		SoundTable = {
			{s = common .. "raise.ogg", t = 10 / 65, c = ca},
			{s = rottle, t = 20 / 65, c = ca},
			{s = common .. "shoulder.ogg", t = 40 / 65, c = ca},
		},
    },
    ["draw_empty"] = {
        Source = "beltfed_draw_empty",
        Framerate = 60,
		SoundTable = {
			{s = common .. "raise.ogg", t = 10 / 65, c = ca},
			{s = rottle, t = 20 / 65, c = ca},
			{s = common .. "shoulder.ogg", t = 40 / 65, c = ca},
		},
    },
    ["holster"] = {
        Source = "beltfed_holster",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.5,
        SoundTable = {
			{s = rottle, t = 0, c = ca},
			{s = ratel, t = 20 / 65, c = ca},
			{s = common .. "raise.ogg", t = 30 / 65, c = ca},
        },
    },
    ["holster_empty"] = {
        Source = "beltfed_holster_empty",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.5,
        SoundTable = {
			{s = rottle, t = 0, c = ca},
			{s = ratel, t = 20 / 65, c = ca},
			{s = common .. "raise.ogg", t = 30 / 65, c = ca},
        },
    },
    ["trigger"] = {
        Source = "beltfed_dryfire",
        Time = 0.075,
        SoundTable = {
			{s = path .. "prefire.ogg", t = 0, c = CHAN_WEAPON, v = 0.5},
        },
    },
    ["trigger_iron"] = {
        Source = "beltfed_dryfire",
        Time = 0.075,
        SoundTable = {
			{s = path .. "prefire.ogg", t = 0, c = CHAN_WEAPON},
        },
    },
    ["fire"] = {
        Source = {"beltfed_fire01", "beltfed_fire02"},
        Framerate = 60,
        Time = 43 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {{s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0, v = 0.25}},
    },
    ["fire_iron"] = {
        Source = {"beltfed_fire01_ads", "beltfed_fire02_ads"},
        Framerate = 60,
        Time = 43 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {
            {s = common .. "common_mech_light.ogg", t = 0, v = 0.2},
            {s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0},
        },
    },
    ["fire_empty"] = {
        Source = "beltfed_fire01_empty",
        Framerate = 60,
        Time = 43 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {{ s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0, v = 0.25 }},
    },
    ["fire_iron_empty"] = {
        Source = "beltfed_fire01_empty",
        Framerate = 60,
        Time = 43 / 60,
        ShellEjectAt = 0.01,
        SoundTable = {
            {s = common .. "common_mech_light.ogg", t = 0},
            { s = {path .. "mech-01.ogg", path .. "mech-02.ogg", path .. "mech-03.ogg", path .. "mech-04.ogg", path .. "mech-05.ogg", path .. "mech-06.ogg"}, t = 0 }
        },
    },

    ["reload"] = {
		Source = "beltfed_reload",
		TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		Framerate = _FPS_RELOAD,
		Time = 560 / _FPS_RELOAD,
		MinProgress = 7,
		LastClip1OutTime = 2,
		LHIK = true,
		LHIKIn = 0.2,
		LHIKEaseIn = 0.2,
		LHIKEaseOut = 0.2,
		LHIKOut = 0.2,
		SoundTable = {
			{s = rottle, t = 0, c = ca},
			{s = path .. "lidopen.ogg", t = 30 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 40 / _FPS_RELOAD, c = ca},
			{s = path .. "belt1.ogg", t =  85 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 120 / _FPS_RELOAD, c = ca},
            {s = ratel, t = 140 / _FPS_RELOAD, c = ca},
            {s = ratel, t = 165 / _FPS_RELOAD, c = ca},
            {s = path .. "boxremove.ogg", t = 195 / _FPS_RELOAD, c = ca},
			{s = common .. "m249_fetchmag.wav", t = 211 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 200 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 210 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 220 / _FPS_RELOAD, c = ca},
			{s = common .. "magpouch_gear.ogg", t = 230 / _FPS_RELOAD, c = ca, v = 0.5},
            {s = rottle, t = 270 / _FPS_RELOAD, c = ca},
            {s = path .. "boxstruggle.ogg", t = 290 / _FPS_RELOAD, c = ca},
            {s = path .. "boxinsert.ogg", t = 305 / _FPS_RELOAD, c = ca},
            {s = rottle, t = 325 / _FPS_RELOAD, c = ca},
            {s = path .. "belt2.ogg", t =  358 / _FPS_RELOAD, c = ca},
            {s = path .. "beltadjust.ogg", t =  390 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 425 / _FPS_RELOAD, c = ca},
            {s = path .. "lidclose.ogg", t = 432 / _FPS_RELOAD, c = ca},
            {s = path .. "lidtap.ogg", t = 475 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 455 / _FPS_RELOAD, c = ca},
            {s = path .. "grab.ogg", t = 505 / _FPS_RELOAD, c = ca},
			{s = common .. "shoulder.ogg", t = 511 / _FPS_RELOAD, c = ca, v = 0.5},
        },
    },
    ["reload_empty"] = {
        Source = "beltfed_reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = _FPS_RELOAD,
        Time = 560 / _FPS_RELOAD,
		MinProgress = 7,
        LastClip1OutTime = 2,
        LHIK = true,
        LHIKIn = 2.2,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.7,
        SoundTable = {
			{s = common .. "cloth_4.ogg", t = 1 / _FPS_RELOAD, c = ca},
			{s = path .. "chback.ogg", t = 25 / _FPS_RELOAD, c = ca},
			{s = path .. "chforward.ogg", t = 50 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 60 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 70 / _FPS_RELOAD, c = ca},
			{s = common .. "cloth_1.ogg", t = 80 / _FPS_RELOAD, c = ca},
			{s = path .. "lidopen.ogg", t = 140 / _FPS_RELOAD, c = ca},
			{s = common .. "cloth_2.ogg", t = 175 / _FPS_RELOAD, c = ca},
			{s = path .. "boxremove.ogg", t = 200 / _FPS_RELOAD, c = ca},
			{s = common .. "m249_fetchmag.wav", t = 201 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 210 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 225 / _FPS_RELOAD, c = ca},
			{s = common .. "magpouch_gear.ogg", t = 230 / _FPS_RELOAD, c = ca, v = 0.5},
			{s = path .. "boxstruggle.ogg", t = 290 / _FPS_RELOAD, c = ca},
			{s = path .. "boxinsert.ogg", t = 325 / _FPS_RELOAD, c = ca},
			{s = path .. "belt1.ogg", t =  368 / _FPS_RELOAD, c = ca},
			{s = path .. "beltadjust.ogg", t =  403 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 435 / _FPS_RELOAD, c = ca},
			{s = path .. "lidclose.ogg", t = 450 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 495 / _FPS_RELOAD, c = ca, v = 1},
			{s = path .. "grab.ogg", t = 510 / _FPS_RELOAD, c = ca},
        },
    },

    ["reload_box100"] = {
		Source = "beltfed_100_reload",
		TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		Framerate = _FPS_RELOAD,
		Time = 560 / _FPS_RELOAD,
		MinProgress = 7,
		LastClip1OutTime = 2,
		LHIK = true,
		LHIKIn = 0.2,
		LHIKEaseIn = 0.2,
		LHIKEaseOut = 0.2,
		LHIKOut = 0.2,
		SoundTable = {
			{s = rottle, t = 0, c = ca},
			{s = path .. "lidopen.ogg", t = 30 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 40 / _FPS_RELOAD, c = ca},
			{s = path .. "belt1.ogg", t =  85 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 120 / _FPS_RELOAD, c = ca},
            {s = ratel, t = 140 / _FPS_RELOAD, c = ca},
            {s = ratel, t = 165 / _FPS_RELOAD, c = ca},
            {s = path .. "boxremove_100.wav", t = 195 / _FPS_RELOAD, c = ca},
			{s = common .. "m249_fetchmag.wav", t = 211 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 200 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 210 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 220 / _FPS_RELOAD, c = ca},
			{s = common .. "magpouch_gear.ogg", t = 230 / _FPS_RELOAD, c = ca, v = 0.5},
            {s = rottle, t = 270 / _FPS_RELOAD, c = ca},
            {s = path .. "boxstruggle_100.wav", t = 290 / _FPS_RELOAD, c = ca},
            {s = path .. "boxinsert_100.wav", t = 305 / _FPS_RELOAD, c = ca},
            {s = rottle, t = 325 / _FPS_RELOAD, c = ca},
            {s = path .. "belt2.ogg", t =  358 / _FPS_RELOAD, c = ca},
            {s = path .. "beltadjust.ogg", t =  390 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 425 / _FPS_RELOAD, c = ca},
            {s = path .. "lidclose.ogg", t = 432 / _FPS_RELOAD, c = ca},
            {s = path .. "lidtap.ogg", t = 475 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 455 / _FPS_RELOAD, c = ca},
            {s = path .. "grab.ogg", t = 505 / _FPS_RELOAD, c = ca},
			{s = common .. "shoulder.ogg", t = 511 / _FPS_RELOAD, c = ca, v = 0.5},
        },
    },
    ["reload_empty_box100"] = {
        Source = "beltfed_100_reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = _FPS_RELOAD,
        Time = 560 / _FPS_RELOAD,
		MinProgress = 7,
        LastClip1OutTime = 2,
        LHIK = true,
        LHIKIn = 2.2,
        LHIKEaseIn = 0.1,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.7,
        SoundTable = {
			{s = common .. "cloth_4.ogg", t = 1 / _FPS_RELOAD, c = ca},
			{s = path .. "chback.ogg", t = 25 / _FPS_RELOAD, c = ca},
			{s = path .. "chforward.ogg", t = 50 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 60 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 70 / _FPS_RELOAD, c = ca},
			{s = common .. "cloth_1.ogg", t = 80 / _FPS_RELOAD, c = ca},
			{s = path .. "lidopen.ogg", t = 140 / _FPS_RELOAD, c = ca},
			{s = common .. "cloth_2.ogg", t = 175 / _FPS_RELOAD, c = ca},
			{s = path .. "boxremove_100.wav", t = 200 / _FPS_RELOAD, c = ca},
			{s = common .. "m249_fetchmag.wav", t = 201 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 210 / _FPS_RELOAD, c = ca},
			{s = ratel, t = 225 / _FPS_RELOAD, c = ca},
			{s = common .. "magpouch_gear.ogg", t = 230 / _FPS_RELOAD, c = ca, v = 0.5},
			{s = path .. "boxstruggle_100.wav", t = 290 / _FPS_RELOAD, c = ca},
			{s = path .. "boxinsert_100.wav", t = 325 / _FPS_RELOAD, c = ca},
			{s = path .. "belt1.ogg", t =  368 / _FPS_RELOAD, c = ca},
			{s = path .. "beltadjust.ogg", t =  403 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 435 / _FPS_RELOAD, c = ca},
			{s = path .. "lidclose.ogg", t = 450 / _FPS_RELOAD, c = ca},
			{s = rottle, t = 495 / _FPS_RELOAD, c = ca, v = 1},
			{s = path .. "grab.ogg", t = 510 / _FPS_RELOAD, c = ca},
        },
    },

    ["cycle"] = {
        Source = "cycle",
        Framerate = 90,
        Time = 220 / 90,
        LHIK = true,
        ShellEjectAt = 0.65,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.6,
        SoundTable = {
            {s = path .. "chback.ogg", t = 65 / _FPS_RELOAD, c = ca},
			{s = path .. "chforward.ogg", t = 100 / _FPS_RELOAD, c = ca},
        },
    },

    ["reload_mag"] = {
        Source = "magfed_reload",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_in_struggle.wav", t = 36 / 35},
            {s = path .. "mag_out_60.wav", t = 39 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 34 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 70 / 35 },
            {s = path .. "mag_in_60.wav", t = 87 / 35},
            {s = path .. "mag_in_struggle.wav", t = 90 / 35},
            {s = path .. "mag_hit.wav", t = 95 / 35},
            {s = path .. "mag_hit.wav", t = 105 / 35},
            {s = rottle, t = 110},
        },
    },
    ["reload_empty_mag"] = {
        Source = "magfed_reload_empty",
        Time = 230 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg", t = 40 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 23 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 45 / 35 },
            {s = path .. "chforward.ogg", t = 55 / 35},
            {s = path .. "mag_in_struggle.wav", t = 137 / 35},
            {s = path .. "mag_out_60.wav", t = 139 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 145 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 155 / 35 },
            {s = path .. "mag_in_60.wav", t = 177 / 35},
            {s = path .. "mag_in_struggle.wav", t = 180 / 35},
            {s = path .. "mag_hit.wav", t = 185 / 35},
            {s = path .. "mag_hit.wav", t = 195 / 35},
            {s = rottle, t = 200},
        },
    },

    ["reload_mag30"] = {
        Source = "magfed_30_reload",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_in_struggle.wav", t = 36 / 35},
            {s = path .. "mag_out.wav", t = 39 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 34 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 70 / 35 },
            {s = path .. "mag_in.wav", t = 87 / 35},
            {s = path .. "mag_in_struggle.wav", t = 90 / 35},
            {s = path .. "mag_hit.wav", t = 95 / 35},
            {s = path .. "mag_hit.wav", t = 105 / 35},
            {s = rottle, t = 110},
        },
    },
    ["reload_empty_mag30"] = {
        Source = "magfed_30_reload_empty",
        Time = 230 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg", t = 40 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 23 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 45 / 35 },
            {s = path .. "chforward.ogg", t = 55 / 35},
            {s = path .. "mag_in_struggle.wav", t = 137 / 35},
            {s = path .. "mag_out.wav", t = 139 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 145 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 155 / 35 },
            {s = path .. "mag_in.wav", t = 177 / 35},
            {s = path .. "mag_in_struggle.wav", t = 180 / 35},
            {s = path .. "mag_hit.wav", t = 185 / 35},
            {s = path .. "mag_hit.wav", t = 195 / 35},
            {s = rottle, t = 200},
        },
    },

    ["reload_smg"] = {
        Source = "magfed_smg_reload",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_in_struggle.wav", t = 36 / 35},
            {s = path .. "mag_out_smg.wav", t = 39 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "magpouch_pull_small.ogg", t = 34 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 70 / 35 },
            {s = path .. "mag_in_smg.wav", t = 70 / 35},
            {s = path .. "mag_in_struggle.wav", t = 80 / 35},
            {s = path .. "mag_hit_smg.wav", t = 95 / 35},
            {s = path .. "mag_hit_smg.wav", t = 105 / 35},
            {s = rottle, t = 110},
        },
    },
    ["reload_empty_smg"] = {
        Source = "magfed_smg_reload_empty",
        Time = 230 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg", t = 40 / 35},
            {s = rutle, t = 20 / 35},
            {s = path .. "chforward.ogg", t = 55 / 35},
            {s = path .. "mag_in_struggle.wav", t = 137 / 35},
            {s = path .. "mag_out_smg.wav", t = 139 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "magpouch_pull_small.ogg", t = 145 / 35 },
            { s = common ..  "magpouch_replace_small.ogg", t = 155 / 35 },
            {s = path .. "mag_in_smg.wav", t = 170 / 35},
            {s = path .. "mag_in_struggle.wav", t = 180 / 35},
            {s = path .. "mag_hit_smg.wav", t = 185 / 35},
            {s = path .. "mag_hit_smg.wav", t = 195 / 35},
            {s = rottle, t = 200},
        },
    },

    ["reload_762"] = {
        Source = "magfed_762_reload",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_in_struggle.wav", t = 36 / 35},
            {s = path .. "mag_out_762.wav", t = 44 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 42 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 70 / 35 },
            {s = path .. "mag_in_762_fast.wav", t = 109 / 35},
            {s = path .. "mag_in_struggle.wav", t = 111 / 35},
            {s = rottle, t = 110},
        },
    },
    ["reload_empty_762"] = {
        Source = "magfed_762_reload_empty",
        Time = 230 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg", t = 40 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 23 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 45 / 35 },
            {s = path .. "chforward.ogg", t = 55 / 35},
            {s = path .. "mag_in_struggle.wav", t = 137 / 35},
            {s = path .. "mag_out_762.wav", t = 139 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 145 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 155 / 35 },
            {s = path .. "mag_in_762.wav", t = 193 / 35},
            {s = path .. "mag_in_struggle.wav", t = 195 / 35},
            {s = rottle, t = 200},
        },
    },

    ["reload_mag10"] = {
        Source = "magfed_10_reload",
        Time = 145 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_in_struggle.wav", t = 36 / 35},
            {s = path .. "mag_out_10.wav", t = 39 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 34 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 70 / 35 },
            {s = path .. "mag_in_10.wav", t = 100 / 35},
            {s = path .. "mag_in_struggle.wav", t = 102 / 35},
            {s = rottle, t = 110},
        },
    },
    ["reload_empty_mag10"] = {
        Source = "magfed_10_reload_empty",
        Time = 230 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg", t = 40 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 23 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 45 / 35 },
            {s = path .. "chforward.ogg", t = 55 / 35},
            {s = path .. "mag_in_struggle.wav", t = 137 / 35},
            {s = path .. "mag_out_10.wav", t = 139 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "m249_fetchmag.wav", t = 145 / 35 },
            { s = common ..  "magpouch_gear.ogg", t = 155 / 35 },
            {s = path .. "mag_in_10.wav", t = 190 / 35},
            {s = path .. "mag_in_struggle.wav", t = 193 / 35},
            {s = rottle, t = 200},
        },
    },

    ["reload_mag100"] = {
        Source = "magfed_100_reload",
        Time = 180 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "mag_out_drum.wav", t = 50 / 35},
            {s = rutle, t = 20 / 35},
            {s = path .. "mag_drum_throw.wav", t = 85 / 35},
            {s = path .. "mag_drum_catch.wav", t = 97 / 35},
            {s = path .. "mag_in_drum.wav", t = 116 / 35},
            {s = path .. "mag_in_struggle.wav", t = 115 / 35},
            {s = path .. "mag_hit_drum.wav", t = 135 / 35},
            {s = rottle, t = 110},
        },
    },
    ["reload_empty_mag100"] = {
        Source = "magfed_100_reload_empty",
        Time = 300 / 35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Framerate = 35,
        Checkpoints = {28, 38, 69},
        LHIK = true,
        LHIKIn = 0.5,
        LHIKOut = 0.5,
        SoundTable = {
            {s = rottle, t = 0},
            {s = path .. "chback.ogg", t = 65 / 35},
            {s = rutle, t = 20 / 35},
            {s = path .. "chforward.ogg", t = 72 / 35},
            {s = path .. "mag_out_drum.wav", t = 174 / 35},
            {s = rutle, t = 20 / 35},
            { s = common .. "mag_drum_throw.wav", t = 195 / 35 },
            { s = common ..  "mag_drum_catch.wav", t = 210 / 35 },
            {s = path .. "mag_in_drum.wav", t = 230 / 35},
            {s = path .. "mag_in_struggle.wav", t = 229 / 35},
            {s = path .. "mag_hit_drum.wav", t = 250 / 35},
            {s = rottle, t = 200},
        },
    },

    ["enter_inspect"] = {
        Source = "enter_inspect",
        time = 70 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0,
        SoundTable = {
            { s = path .. "lowpolyfal_cloth2.ogg", t = 0 / 30, c = ca },
        },
    },
    ["idle_inspect"] = {
        Source = "idle_inspect",
        time = 120 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect"] = {
        Source = "inspect",
        time = 143 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            { s = path .. "lowpolyfal_cloth1.ogg", t = 2 / 30, c = ca },
        },
    },

    ["enter_inspect_empty"] = {
        Source = "enter_inspect_empty",
        time = 70 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0.1,
        LHIKOut = 0,
        SoundTable = {
            { s = path .. "lowpolyfal_cloth2.ogg", t = 0 / 30, c = ca },
        },
    },
    ["idle_inspect_empty"] = {
        Source = "idle_inspect_empty",
        time = 120 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0,
    },
    ["exit_inspect_empty"] = {
        Source = "exit_inspect_empty",
        time = 143 / 60,
        Framerate = 60,
        LHIK = true,
        LHIKIn = 0,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.84,
        SoundTable = {
            { s = path .. "lowpolyfal_cloth1.ogg", t = 2 / 30, c = ca },
        },
    },
}

SWEP.Hook_Think = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    vm:SetPoseParameter( "sights", Lerp(wep:GetSightDelta(), 1, 0) )
end

SWEP.CamAttachment = 3

SWEP.RejectAttachments = {
  ["lpak_polymer"] = true,
}

SWEP.AttachmentElements = {

    ["mag_60"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 1},
            {ind = 6, bg = 3},
        },
    },
    ["mag_30"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 1},
            {ind = 6, bg = 1},
        },
    },
    ["mag_smg"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 1},
            {ind = 6, bg = 6},
        },
    },
    ["mag_762"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 1},
            {ind = 6, bg = 5},
        },
    },
    ["mag_10"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 1},
            {ind = 6, bg = 2},
        },
    },
    ["mag_100"] = {
        VMBodygroups = {
            {ind = 0, bg = 1},
            {ind = 1, bg = 1},
            {ind = 6, bg = 4},
        },
    },
    ["box_100"] = {
        VMBodygroups = {
            {ind = 6, bg = 7},
        },
    },
    ["stock_stilt"] = {
        VMBodygroups = {
            {ind = 7, bg = 3},
        },
    },
    ["stock_stilt_retracted"] = {
        VMBodygroups = {
            {ind = 7, bg = 4},
        },
    },
     ["stock_none"] = {
        VMBodygroups = {
            {ind = 7, bg = 1},
        },
    },
     ["stock_wood"] = {
        VMBodygroups = {
            {ind = 7, bg = 2},
        },
    },
     ["stock_carbine"] = {
        VMBodygroups = {
            {ind = 7, bg = 5},
        },
    },
    ["grip_wood"] = {
        VMBodygroups = {
            {ind = 5, bg = 1},
        },
    },
    ["heatshield_wood"] = {
        VMBodygroups = {
            {ind = 3, bg = 2},
        },
    },
    ["barrel_short"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
        AttPosMods = {
            [5] = {
                vpos = Vector(0, -22, 0),
            },
        }
    },
    ["barrel_long"] = {
        VMBodygroups = {
            {ind = 2, bg = 2},
        },
        AttPosMods = {
            [5] = {
                vpos = Vector(0, -33, 0),
            },
        }
    },
    ["barrel_none"] = {
        VMBodygroups = {
            {ind = 2, bg = 3},
        },
        AttPosMods = {
            [5] = {
                vpos = Vector(0, -17, 0),
            },
        }
    },
    ["bipod_open"] = {
        VMBodygroups = {
            {ind = 4, bg = 1},
        },
    },
}

SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = {"optic_lp", "optic", "sniper_optic"},
        DefaultAttName = "Iron Sights",
        Bone = "top_hinge",
        Offset = {
            vpos = Vector(-0.7, 5, 0),
            vang = Angle(90, 90, 0),
        },
        ExtraSightDist = 10,
        InstalledEles = {"nors"},
        CorrectivePos = Vector(0, 0, 0),
		CorrectiveAng = Angle(0, 180, 0),
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_m249_barrel"},
		DefaultAttIcon = Material(""),
        DefaultAttName = "21' Standard Issue Barrel",
        Bone = "parent",
        Offset = {
            vpos = Vector(3.07, -3.8, -27),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Handguard",
        Slot = {"uc_m249_hg"},
		DefaultAttIcon = Material(""),
        DefaultAttName = "Standard Handguard",
        Bone = "parent",
        Offset = {
            vpos = Vector(3.07, -3.8, -27),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Bipod",
        Slot = {"uc_m249_bipod"},
		DefaultAttIcon = Material(""),
        DefaultAttName = "Closed Bipod",
        Bone = "parent",
        Offset = {
            vpos = Vector(3.07, -3.8, -27),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = {"muzzle"},
        Bone = "parent",
        Offset = {
            vpos = Vector(-0.025, -27.8, 0),
            vang = Angle(0, 90, 90),
        },
        InstalledEles = {"nofh"},
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip","bipod","ubgl"},
        Bone = "parent",
        Offset = {
            vpos = Vector(3.7, -8, 0),
            vang = Angle(90, 90, 0),
        },
        ExcludeFlags = {"fnchand"},
    },
    {
        PrintName = "Tactical",
        Slot = {"tac"},
        Bone = "parent",
        Offset = {
            vpos = Vector(0, -22, -0.2),
            vang = Angle(0, 90, 0),
        },
    },
     {
        PrintName = "Upper Receiver",
        Slot = {"uc_m249_cal"},
		DefaultAttIcon = Material("entities/att/uc_bullets/556x45.png"),
        DefaultAttName = "5.56x45mm NATO",
    },
    {
        PrintName = "Mag Type",
        Slot = {"uc_m249_mag"},
		DefaultAttIcon = Material(""),
        DefaultAttName = "200-Round Standard Box",
        ExcludeFlags = {"mag_smg", "mag_762"},
    },
    {
        PrintName = "Grip",
        Slot = {"uc_m249_grip"},
		DefaultAttIcon = Material(""),
        DefaultAttName = "Standard Pistol Grip",
    },
    {
        PrintName = "Stock",
        Slot = {"uc_m249_stock"},
		DefaultAttIcon = Material(""),
        DefaultAttName = "Standard Polymer Stock",
    },
    {
        PrintName = "Ammo Type",
        DefaultAttName = "\"FMJ\" Full Metal Jacket",
        DefaultAttIcon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth"),
        Slot = "uc_ammo",
    },
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
        Slot = "uc_fg",
        DefaultAttName = "Standard Internals"
    },
    {
        PrintName = "Charm",
        Slot = {"charm","fml_charm"},
        FreeSlot = true,
        Bone = "parent",
        Offset = {
            vpos = Vector(0.2, 4, -0.8),
            vang = Angle(90, 90, 0),
        },
    },
}
