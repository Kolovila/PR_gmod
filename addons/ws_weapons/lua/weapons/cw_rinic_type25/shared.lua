AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Type 25"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = -1, y = -25, z = -1.2}
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = -25, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_rinic_type25.mdl"
	SWEP.WMPos = Vector(-0.65, -1.7, 0.5)
	SWEP.WMAng = Vector(-5, 0, 180)

	SWEP.BoltBone = "j_reload"
	SWEP.BoltShootOffset = Vector(-3, 0, 0)
	SWEP.OffsetBoltOnBipodShoot = true
	
	SWEP.IronsightPos = Vector(-2.658, -1.39, 0.833)
	SWEP.IronsightAng = Vector(0.057, 0.028, 0)
		
	SWEP.EoTechPos = Vector(-2.688, -4.625, 0.029)

	SWEP.EoTechAng = Vector(0.504, 0, 0)

	SWEP.CoD4ReflexPos = Vector(-2.685, -3, -0.055)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)

	SWEP.CoD4TascoPos = Vector(-2.652, -4.085, 0.317)
	SWEP.CoD4TascoAng = Vector(0, 0.368, 0)
	
	SWEP.MicroT1Pos = Vector(-2.675, -2.376, -0.068)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(-2.638, -2.733, -0.098)

	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(0, 0, -1.497)
	SWEP.M203Ang = Vector(6.39, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(1.886, 0, 1.639)

	SWEP.SprintAng = Vector(-20.997, 22.072, 0)
		
	SWEP.CustomizePos = Vector(2.408, 0, 0)
	SWEP.CustomizeAng = Vector(8.258, 22.082, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "j_elbow_le"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)

	SWEP.CustomizationMenuScale = 0.035
	
	SWEP.AttachmentModelsVM = {
		["md_cod4_aimpoint_v2"] = {model = "models/v_cod4_aimpoint.mdl", bone = "j_gun", rel = "", pos = Vector(-7.364, 0.008, 0.086), angle = Angle(0, 180, 0), size = Vector(1.2, 1.2, 1.2)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "j_gun", rel = "", pos = Vector(-13.869, -0.253, -6.729), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "j_gun", rel = "", pos = Vector(-6.423, 0.014, 0.432), angle = Angle(0, 180, 0), size = Vector(1.1, 1.1, 1.1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "smdimport001", rel = "", pos = Vector(-0.452, -2.556, -1.428), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "j_gun", rel = "", pos = Vector(2.279, 0, -1.18), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "j_gun", rel = "", pos = Vector(-1.958, -0.014, 4.265), angle = Angle(0, -90, 0), size = Vector(0.55, 0.55, 0.55)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "j_gun", rel = "", pos = Vector(-9.957, -0.08, -0.477), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_lasersight"] = {model = "models/rageattachments/anpeqbf.mdl", bone = "j_gun", rel = "", pos = Vector(8.562, -0.932, 3.391), angle = Angle(0, 0, 90), size = Vector(0.8, 0.8, 0.8)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "j_gun", rel = "", pos = Vector(-12.36, -3.07, 3.903), angle = Angle(0, 0, 0), size = Vector(1.299, 1.299, 1.299), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["j_elbow_le"] = { scale = Vector(1, 1, 1), pos = Vector(4.734, -1.172, -1.382), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 42.713, 0) },
		["Bip01 L Clavicle"] = {pos = Vector(-3.299, 1.235, -1.79), angle = Angle(-55.446, 11.843, 0) },
		["Bip01 L Forearm"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 42.41) },
		["Bip01 L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 71.308, 0) },
		["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.795, 0) },
		["Bip01 L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(0, 26.148, 0) },
		["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(6.522, 83.597, 0) },
		["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(23.2, 16.545, 0) },
		["Bip01 L Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 31.427, 0) },
		["Bip01 L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 29.565, 0) },
		["Bip01 L Hand"] = {pos = Vector(0, 0, 0), angle = Angle(9.491, 14.793, -15.926) },
		["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, -9.195, 0) },
		["Bip01 L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10.164, 0) },
		["Bip01 L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 18.395, 0) },
		["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(2.411, 57.007, 0) }
	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(-0.1, 0, 1.2)
	SWEP.LaserAngAdjust = Angle(0, 0.5, 0)
end

SWEP.SightBGs = {main = 1, none = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_microt1", "md_eotech", "md_csgo_acog"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_saker"}},
	[3] = {header = "NoobTube", offset = {-400, 0}, atts = {"md_m203"}},
	[4] = {header = "Rail", offset = {250, 400}, atts = {"md_lasersight"}},
	["+attack2"] = {header = "Perks", offset = {-400, -500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 4, "md_cod4_aimpoint_v2")		
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.55, sound = "CW_TYPE_25_MAGOUT"},
	[2] = {time = 1.73, sound = "CW_TYPE_25_MAGIN"}},

	reload_empty = {[1] = {time = 0.55, sound = "CW_TYPE_25_MAGOUT"},
	[2] = {time = 1.73, sound = "CW_TYPE_25_MAGIN"},
	[3] = {time = 2.67, sound = "CW_TYPE_25_BOLTBACK"},
	[4] = {time = 2.84, sound = "CW_TYPE_25_BOLTFORWARD"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_rinic_type25.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_rinic_type25.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 60/937
SWEP.FireSound = "CW_TYPE_25_FIRE"
SWEP.FireSoundSuppressed = "CW_TYPE_25_FIRE_SUPPRESSED"
SWEP.Recoil = 0.35

SWEP.HipSpread = 0.085
SWEP.AimSpread = 0.02
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 33
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 1.97
SWEP.ReloadTime_Empty = 2.83
SWEP.ReloadHalt = 2.37
SWEP.ReloadHalt_Empty = 3.13
SWEP.SnapToIdlePostReload = false