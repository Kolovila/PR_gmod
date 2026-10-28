local SWEP = { Primary = {}, Secondary = {} }

SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - Urban Coalition"
SWEP.UC_CategoryPack = "7Urban Resurgence"
SWEP.AdminOnly = false

SWEP.PrintName = "Kawara K-20"
SWEP.TrueName = "Howa Type 20"
SWEP.Trivia_Class = "Assault Rifle"
SWEP.Trivia_Desc = "This weapon possesses better environment durability, fire power and extensibility over the Type 89. This is needed as water-resistance is essential for amphibious operations in the southwestern islands of Japan. One key difference it has over the Type 89 is the addition of multiple rails, making it the first Japanese rifle to have this feature as a standard design. The magazine is also believed to be STANAG compatible. The rifle features a telescoping stock, vertical forward grip, an ambidextrous safety selector, and operates via short-stroke piston. Compared to its original design, the current design of the Type 20 retains much of the same characteristics with only some notable changes. The barrel length has been shortened slightly and the hand guard has been redesigned to feature an M-LOK rail design. The side rails have been extended, foldable iron sights were added and the stock features a shoulder pad similar to the one seen on the HK416."
SWEP.Trivia_Manufacturer = "Kawara Tactical Industries"
SWEP.Trivia_Calibre = "5.56x45mm NATO"
SWEP.Trivia_Mechanism = "Gas-Operated"
SWEP.Trivia_Country = "Japan"
SWEP.Trivia_Year = 2020

if GetConVar("arccw_truenames"):GetBool() then
    SWEP.PrintName = SWEP.TrueName
    SWEP.Trivia_Manufacturer = "Howa Machinery Ltd."
end

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/arccw/midnightwolf/type20_ux.mdl"
SWEP.WorldModel = "models/weapons/arccw/midnightwolf/type20_ux.mdl"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false

SWEP.DefaultBodygroups = "0000000000"

SWEP.Damage = 34
SWEP.DamageMin = 20
SWEP.Range = 100
SWEP.Penetration = 11
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil
SWEP.MuzzleVelocity = 975
SWEP.ChamberSize = 1
SWEP.Primary.ClipSize = 30

SWEP.PhysBulletMuzzleVelocity = 900

SWEP.Recoil = 0.6
SWEP.RecoilSide = 0.2

SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 1
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 1
SWEP.RecoilPunchBack = 1

SWEP.Delay = 60 / 800
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 100

SWEP.AccuracyMOA = 4.5
SWEP.HipDispersion = 650
SWEP.MoveDispersion = 100

SWEP.Primary.Ammo = "smg1"
SWEP.MagID = "stanag"

SWEP.ShootVol = 85
SWEP.ShootPitch = 100

local path = "weapons/arccw/midnightwolf/type20/"
local common = ")/arccw_uc/common/"
local misc = ")/weapons/misc/"

SWEP.ShootSound = path .. "fire.wav"
SWEP.ShootSoundSilenced = path .. "fire_sup.wav"
SWEP.DistantShootSound = path .. "fire_dist.wav"
SWEP.DistantShootSoundOutdoors = path .. "fire_dist.wav"
SWEP.DistantShootSoundIndoors = path .. "fire_dist.wav"
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
    common .. "fire-dist-int-pistol-light-06.ogg",
}

SWEP.MeleeSwingSound = "arccw_go/m249/m249_draw.wav"
SWEP.MeleeMissSound = "weapons/iceaxe/iceaxe_swing1.wav"
SWEP.MeleeHitSound = "arccw_go/knife/knife_hitwall1.wav"
SWEP.MeleeHitNPCSound = "physics/body/body_medium_break2.wav"

SWEP.MuzzleEffect = "muzzleflash_4"
SWEP.ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
SWEP.ShellEjectPosCorrection = Vector(0, 0, 0)
SWEP.ShellPitch = 95
SWEP.ShellScale = 1.25
SWEP.ShellRotateAngle = Angle(0, 180, 0)
SWEP.MuzzleEffectAttachment = 1
SWEP.CaseEffectAttachment = 2
SWEP.CamAttachment = 3

SWEP.SpeedMult = 0.93
SWEP.SightedSpeedMult = 0.7
SWEP.SightTime = 0.33

SWEP.IronSightStruct = {
	Pos = Vector(-3.39, 0, 0.6),
	Ang = Angle(0, 0, 0),
    Magnification = 1.1,
    SwitchToSound = misc .. "type20_ads.ogg",
    SwitchFromSound = misc .. "type20_ads_out.ogg",
    CrosshairInSights = false
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0.05, -4, 1.02)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(-8, -2, 1)
SWEP.CrouchAng = Angle(0, 0, -45)

SWEP.HolsterPos = Vector(3, 3, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.CustomizePos = Vector(5.32, -2.211, 1.406)
SWEP.CustomizeAng = Angle(21.106, 19.697, 26.03)

SWEP.BarrelLength = 24

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.AttachmentElements = {
	["irons"] = {
		VMBodygroups = {{ind = 1, bg = 1}},
	},
    ["bkrail"] = {
     VMElements = {
        {
            Model = "models/weapons/arccw/atts/backup_rail_ux.mdl",
              Bone = "main",
             Offset = {
            pos = Vector(0, -2.2, 13),
            ang = Angle(0, 90, 0),
           },
		 },
      }
    },
    ["barrel_short"] = {
		VMBodygroups = {{ind = 2, bg = 1}},
        AttPosMods = {
            [8] = {
                vpos = Vector(-0.00064, -0.12793, -3.05273),
            },
        },
	},
    ["barrel_long"] = {
		VMBodygroups = {{ind = 2, bg = 2}},
        AttPosMods = {
            [8] = {
                vpos = Vector(0.04133, -0.16999, 5.6013),
            },
        },
	},
    ["mag_15"] = {
		VMBodygroups = {{ind = 4, bg = 1}},
	},
    ["mag_100"] = {
		VMBodygroups = {{ind = 4, bg = 2}},
	},
    ["mag_smg"] = {
		VMBodygroups = {{ind = 4, bg = 3}, {ind = 0, bg = 1}},
	},
    ["mag_smg_50"] = {
		VMBodygroups = {{ind = 4, bg = 4}},
	},
    ["mag_762"] = {
		VMBodygroups = {{ind = 4, bg = 5}},
	},
    ["stock_extended"] = {
		VMBodygroups = {{ind = 5, bg = 1}},
	},
}

SWEP.ExtraSightDist = 5
SWEP.GuaranteeLaser = true

SWEP.WorldModelOffset = {
    pos = Vector(-9, 6, -3.5),
    ang = Angle(-10, 0, 180),
	scale = 1.1
}

SWEP.MirrorVMWM = true

SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = {"optic", "optic_lp", "optic_sniper"},
        Bone = "main",
        DefaultAttName = "Iron Sights",
        Offset = {
            vpos = Vector(0, -2, 4.027),
            vang = Angle(90, 0, -90),
        },
        VMScale = Vector(1, 1, 1),
        CorrectivePos = Vector(-0.14, -0.2, 0),
        CorrectiveAng = Angle(-1.2, 0.8, -6.3),
		InstalledEles = {"irons"},
    },
    {
        PrintName = "Backup Optic",
        Slot = {"optic_lp", "optic", "optic_sniper"},
        Bone = "main",
        Offset = {
            vpos = Vector(-0.5, -2.5, 12.5),
            vang = Angle(90, 0, -45),
        },
        CorrectivePos = Vector(-0.15, -0.3, -0.25),
        CorrectiveAng = Angle(-1, 0.6, -7),
        InstalledEles = {"bkrail"},
        KeepBaseIrons = true,
		ExtraSightDist = 8
    },
    {
        PrintName = "Underbarrel",
        Slot = {"uc_ubgl", "ubgl"},
        Bone = "main",
        Offset = {
            vpos = Vector(0, -0.4, 10),
            vang = Angle(90, 0, -90),
        },
        CorrectivePos = Vector(-0.15, 0, 0),
        CorrectiveAng = Angle(-1, 0.6, -7),
        MergeSlots = {4}
    },
    {
        Hidden = true,
        PrintName = "Underbarrel",
        Slot = {"foregrip", "bipod"},
        Bone = "main",
        Offset = {
            vpos = Vector(0, 1, 12),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "main",
        Offset = {
            vpos = Vector(-1.1, -0.3, 13),
            vang = Angle(90, 0, 180),
        },
    },
    {
        PrintName = "Tactical 2",
        Slot = "tac",
        Bone = "main",
        Offset = {
            vpos = Vector(0, -2, 13),
            vang = Angle(90, 0, 90),
        },
    },
    {
        PrintName = "Barrel",
        Slot = {"uc_type20_barrel"},
        DefaultAttName = "13\" Factory Barrel",
    },
    {
        PrintName = "Muzzle",
        Slot = {"muzzle", "mw_muzzle"},
        Bone = "muzzle",
        Offset = {
            vpos = Vector(0, -0.1, -2),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Caliber",
        Slot = {"uc_type20_cal"},
        DefaultAttName = "5.56x45mm NATO",
        DefaultAttIcon = Material("entities/att/uc_bullets/556x45.png", "smooth mips"),
    },
     {
        PrintName = "Magazine",
        Slot = {"uc_type20_mag"},
        DefaultAttName = "30-Round Magazine",
        ExcludeFlags = {"mag_762"},
    },
    {
        PrintName = "Stock",
        Slot = {"uc_type20_stock"},
        DefaultAttName = "Collapsed Stock",
    },
    {
        PrintName = "Ammo Type",
        Slot = "uc_ammo",
        DefaultAttName = "Standard Ammo"
    },
    {
        PrintName = "Powder Load",
        Slot = {"uc_powder"},
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
        Slot = "charm",
        FreeSlot = true,
        Bone = "main",
        Offset = {
            vpos = Vector(0.776, -1.147, -1.237),
            vang = Angle(90, 0, -90),
        },
    },
 }

SWEP.Hook_Think = function(wep)
	local vm = wep:GetOwner():GetViewModel()
    vm:SetPoseParameter( "sights", Lerp(wep:GetSightDelta(), 1, 0) )
end

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["idle_empty"] = {
        Source = "idle_empty",
    },
    ["ready"] = {
        Source = "draw",
		SoundTable = {
            {s = "type20.draw", 	 t = 1/60},
		},
    },
    ["draw"] = {
        Source = "draw",
		SoundTable = {
            {s = "type20.draw", 	 t = 1/60},
		},
    },
    ["draw_empty"] = {
        Source = "draw_empty",
		SoundTable = {
            {s = "type20.draw", 	 t = 1/60},
		},
    },
    ["fire"] = {
        Source = "fire",
        ShellEjectAt = 0,
		SoundTable = {
            {s = "type20.mech", 	 t = 1/60},
		},
    },
	["fire_empty"] = {
        Source = "fire_empty",
        ShellEjectAt = 0,
		SoundTable = {
            {s = "type20.mech_empty", 	 t = 1/60},
		},
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		SoundTable = {
            {s = "type20.reload_start", 	 t = 1/60},
            {s = "type20.magout", 	 t = 18/60},
            {s = "type20.magdraw", 	 t = 39/60},
            {s = "type20.magin_fail",    t = 59/60},
            {s = "type20.magin", 	 t = 78/60},
            {s = "type20.backtoidle", 	 t = 97/60},
		},
        FrameRate = 60,
        LHIK = true,
        LHIKIn = 0.4,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.5,
    },
    ["reload_empty"] = {
        Source = "reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
		SoundTable = {
            {s = "type20.reload_empty_start", 	 t = 1/60},
            {s = "type20.magout", 	 t = 22/60},
            {s = "type20.magdraw", 	 t = 43/60},
            {s = "type20.magin_fail",    t = 56/60},
            {s = "type20.magin", 	 t = 76/60},
            {s = "type20.boltdrop", 	 t = 99/60},
            {s = "type20.backtoidle", 	 t = 111/60},
		},
        FrameRate = 60,
        LHIK = true,
        LHIKIn = 0.5,
        LHIKEaseIn = 0.2,
        LHIKEaseOut = 0.3,
        LHIKOut = 0.5,
    },
    ["fix"] = {
        Source = "unjam",
		SoundTable = {
            {s = "type20.reload_start", 	 t = 1/60},
            {s = "type20.boltpull", 	 t = 20/60},
            {s = "type20.chamber", 	 t = 37/60},
            {s = "type20.backtoidle", 	 t = 71/60},
		},
        ShellEjectAt = false,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKEaseIn = 0.4,
        LHIKEaseOut = 0.15,
        LHIKOut = 0.4,
    }
}

sound.Add({
	name = 			"type20.boltdrop",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "boltdrop_new.ogg"
})

sound.Add({
	name = 			"type20.magout",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "magout_new.ogg"
})

sound.Add({
	name = 			"type20.magdraw",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "magdraw.ogg"
})

sound.Add({
	name = 			"type20.magin_fail",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "maginfail_new.ogg"
})

sound.Add({
	name = 			"type20.reload_start",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "reload_start.ogg"
})

sound.Add({
	name = 			"type20.reload_empty_start",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "reload_empty_start.ogg"
})

sound.Add({
	name = 			"type20.magin",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "magin_new.ogg"
})

sound.Add({
	name = 			"type20.backtoidle",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "backtoidle.ogg"
})

sound.Add({
	name = 			"type20.draw",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "draw.ogg"
})

sound.Add({
	name = 			"type20.mech",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "mech.wav"
})

sound.Add({
	name = 			"type20.mech_empty",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "mech_last.wav"
})

sound.Add({
	name = 			"type20.boltpull",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "chback.ogg"
})

sound.Add({
	name = 			"type20.chamber",
	channel = 		CHAN_STATIC,
	volume = 		1.0,
	sound = 			path .. "boltdrop_new.ogg"
})

UCExtras_RegisterWeapon(SWEP, "arccw_uc_unofficial_type20")
