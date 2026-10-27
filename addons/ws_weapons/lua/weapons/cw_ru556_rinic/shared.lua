AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "RU-556"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.4
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_ar_ru556.mdl"
	SWEP.WMPos = Vector(-0.2, 0.4, 0)
	SWEP.WMAng = Vector(-4, 0, 180)

	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-2.093, -3.754, 0.379)

	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.112, -4.2, -0.047)

	SWEP.EoTechAng = Vector(1.697, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.103, -3.866, 0.398)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.116, -2.451, 0.307)

	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.087, -2.311, 0.16)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(4.57, 0, 1.154)

	SWEP.SprintAng = Vector(-18.71, 35.109, 0)

	SWEP.CustomizePos = Vector(4.385, -0.274, -0.527)
	SWEP.CustomizeAng = Vector(8.126, 26.811, 2.072)

	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.087, -2.312, -0.727), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "body", rel = "", pos = Vector(-1.969, 1.32, 0.221), angle = Angle(-90, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "body", rel = "", pos = Vector(-8.138, 7.487, -0.239), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "smdimport001", rel = "", pos = Vector(-0.452, -2.556, -1.428), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "body", rel = "", pos = Vector(1.904, -2.233, -2.09), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(2.552, -3.418, 0.009), angle = Angle(90, 90, 180), size = Vector(0.4, 0.4, 0.4)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "body", rel = "", pos = Vector(-2.171, 1.365, 0.3), angle = Angle(-90, 0, -90), size = Vector(0.8, 0.8, 0.8)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "body", rel = "", pos = Vector(9.409, -3.132, 0.067), angle = Angle(180, 0, -90), size = Vector(0.5, 0.5, 0.5)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "smdimport001", pos = Vector(2.299, -6.611, 4.138), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-2.76, 2.651, 1.386), angle = Angle(0, 0, 0) }
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
	
	SWEP.LaserPosAdjust = Vector(0.9, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acog"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_saker"}},
	[3] = {header = "Rail", offset = {250, 400}, atts = {"md_anpeq15"}},
	["+attack2"] = {header = "Perks", offset = {-400, -500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}
	
SWEP.AttachmentDependencies = {["md_m203"] = {"bg_longris"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.35, sound = "CW_RU556_RINIC_BOLTBACK"},
	[3] = {time = 0.57, sound = "CW_RU556_RINIC_BOLTFORWARD"}},

	reload = {[1] = {time = 0.35, sound = "CW_RU556_RINIC_MAGOUT"},
	[2] = {time = 1.49, sound = "CW_RU556_RINIC_MAGIN2"},
	[3] = {time = 1.88, sound = "CW_RU556_RINIC_MAGIN"}},

	reload_empty = {[1] = {time = 0.35, sound = "CW_RU556_RINIC_MAGOUT"},
	[2] = {time = 1.42, sound = "CW_RU556_RINIC_MAGIN2"},
	[3] = {time = 2.32, sound = "CW_RU556_RINIC_BOLTBACK"},
	[4] = {time = 2.57, sound = "CW_RU556_RINIC_BOLTFORWARD"}}}

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
SWEP.ViewModel		= "models/cw2/weapons/v_ar_ru556.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_ar_ru556.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.064034151547492
SWEP.FireSound = "CW_RU556_RINIC_FIRE"
SWEP.FireSoundSuppressed = "CW_RU556_RINIC_FIRE_SUPPRESSED"
SWEP.Recoil = 0.55

SWEP.HipSpread = 0.095
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.008
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.25
SWEP.ReloadTime = 1.96
SWEP.ReloadTime_Empty = 2.45
SWEP.ReloadHalt = 2.35
SWEP.ReloadHalt_Empty = 2.95
SWEP.SnapToIdlePostReload = false