AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "RK95 (Sako-chan)"
	SWEP.CSMuzzleFlashes = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rif_rk95.mdl"
	SWEP.WMPos = Vector(-0.5, -1, 0.2)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.IronsightPos = Vector(3.272, -4.480, 1.83)
	SWEP.IronsightAng = Vector(0.754, 0.035, 0)

	SWEP.CoD4ReflexPos = Vector(3.282, -6.632, 1.1)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(3.286, -6.632, 0.92)
	SWEP.AimpointAng = Vector(0, 0, 0)

	SWEP.LeupoldPos = Vector(3.229, -6.12, 0.833)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(3.263, -6.632, 0.759)
	SWEP.EoTechAng = Vector(1.967, 0, 0)
	
	SWEP.KobraPos = Vector(3.342, -6.632, 0.796)
	SWEP.KobraAng = Vector(1.366, 0, 0)
	
	SWEP.ShortenedPos = Vector(-2.428, -4.005, 0.815)
	SWEP.ShortenedAng = Vector(0, -0.036, 0)

	SWEP.SprintPos = Vector(-0.805, 0, 0)
	SWEP.SprintAng = Vector(-14.775, -32.362, 30.25)

	SWEP.PronePos = Vector(-0.668, -10.417, -4.231)
	SWEP.ProneAng = Vector(3.262, -70, 29.052)

	SWEP.CustomizePos = Vector(-4.824, -1.005, -1.206)
	SWEP.CustomizeAng = Vector(21.809, -25.327, -21.81)

	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "b"
	killicon.AddFont("cw_ak74", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePsMod = {x = -2, y = 0, z = -3}
	SWEP.ShellScale = 0.3
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.BoltBone = "Bolt"
	SWEP.BoltShootOffset = Vector(3.5, 0, 0)
	SWEP.OffsetBoltOnBipodShoot = true

	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0

	SWEP.BaseArm = "R_Armdummy"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/wystan/attachments/akrailmount.mdl", bone = "Body", rel = "", pos = Vector(-2.513, -0.727, -0.064), angle = Angle(90, 90, 180), size = Vector(0.899, 0.899, 0.899)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Body", rel = "", pos = Vector(6.282, 6.23, 0.361), angle = Angle(180, 0, -90), size = Vector(0.8, 0.8, 0.8)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "Body", rel = "", pos = Vector(0.962, -0.029, 0.125), angle = Angle(0, 0, -90), size = Vector(0.699, 0.699, 0.699)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Body", rel = "", pos = Vector(2.664, 2.101, -0.076), angle = Angle(90, 0, -90), size = Vector(0.8, 0.8, 0.8)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "ak74_body", pos = Vector(4.151, -0.433, -2.721), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "Body", rel = "", pos = Vector(-20.859, 0.606, 0.057), angle = Angle(-90, 0, -90), size = Vector(0.699, 0.699, 0.699)},
		["md_kobra"] = {model = "models/cw2/attachments/kobra.mdl", bone = "Body", rel = "", pos = Vector(-3.983, 1.656, 0.561), angle = Angle(-90, 0, -90), size = Vector(0.649, 0.649, 0.649)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "Body", rel = "", pos = Vector(-0.992, -3.372, 0.19), angle = Angle(0, 180, 90), size = Vector(1.2, 1.2, 1.2)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "Body", rel = "", pos = Vector(-1.178, -3.359, 0.136), angle = Angle(0, 180, 90), size = Vector(1.399, 1.399, 1.399)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "Body", rel = "", pos = Vector(6.524, -2.958, 2.447), angle = Angle(180, 0, -90), size = Vector(1, 1, 1), animated = true},
		["md_pso1"] = {model = "models/cw2/attachments/pso.mdl", bone = "ak74_body", pos = Vector(5.521, -0.174, -1.107), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)}
	}

	SWEP.ForeGripHoldPos = {
		["Left12"] = {pos = Vector(0, 0, 0), angle = Angle(19.048, 0, 0) },
		["Left19"] = {pos = Vector(0, 0, 0), angle = Angle(7.56, -5.153, -33.453) },
		["Left3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 98.859, 0) },
		["Left8"] = {pos = Vector(0, 0, 0), angle = Angle(28.447, 0, 0) },
		["Left18"] = {pos = Vector(0, 0, 0), angle = Angle(31.268, 8.871, -34.725) },
		["Left17"] = {pos = Vector(0, 0, 0), angle = Angle(4.524, 0.3, -39.885) },
		["Left11"] = {pos = Vector(0, 0, 0), angle = Angle(17.864, 0, 0) },
		["Left9"] = {pos = Vector(0, 0, 0), angle = Angle(8.972, 0, 0) },
		["Left_L_Arm"] = {pos = Vector(1.231, 2.617, -1.206), angle = Angle(0, 0, 84.377) },
		["Left24"] = {pos = Vector(0, 0, 0), angle = Angle(31.447, -4.021, -22.029) },
		["Left16"] = {pos = Vector(0, 0, 0), angle = Angle(7.047, 11.637, -22.139) },
		["Left14"] = {pos = Vector(0, 0, 0), angle = Angle(14.432, -4.611, 0) },
		["Left2"] = {pos = Vector(0, 0, 0), angle = Angle(0, 40.631, 0) },
		["Left_U_Arm"] = {pos = Vector(2.54, 0.004, 0), angle = Angle(0, 0, 0) }}

	SWEP.M203HoldPos = {
		["R_Armdummy"] = { scale = Vector(1, 1, 1), pos = Vector(2.579, -0.493, -1.88), angle = Angle(0, 0, 0) }
	}
		
	SWEP.PSO1AxisAlign = {right = 0, up = 0.4, forward = -90}
	SWEP.LeupoldAxisAlign = {right = -0.020, up = -0.050, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
end

SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500},  atts = {"md_kobra", "md_eotech", "md_aimpoint"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_pbs1"}},
	[3] = {header = "Moar NoobTubz", offset = {-300, 200}, atts = {"md_m203"}},
	["+attack2"] = {header = "Perks", offset = {-300, -500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 5, "md_fas2_leupold")
end

SWEP.Animations = {fire = {"fire1", "fire2", "fire3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {	draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.33, sound = "CW_RK95_MAGOUT"},
	[2] = {time = 1.13, sound = "CW_RK95_MAGIN"},
	[3] = {time = 1.85, sound = "CW_RK95_BOLTPULL"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_rif_rk95.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rif_rk95.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_RK95_FIRE"
SWEP.FireSoundSuppressed = "CW_RK95_FIRE_SUPPRESSED"
SWEP.Recoil = 0.8

SWEP.HipSpread = 0.085
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.004
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = 0.4

SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 1.5
SWEP.ReloadTime_Empty = 1.5
SWEP.ReloadHalt = 1.7
SWEP.ReloadHalt_Empty = 2.6
SWEP.SnapToIdlePostReload = true