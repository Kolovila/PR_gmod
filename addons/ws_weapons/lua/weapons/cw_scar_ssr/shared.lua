AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MK 20 SSR"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_mk20ssr_cw.mdl"
	SWEP.WMPos = Vector(0, -0.5, 0.5)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.728, -1.241, 0.745)
	SWEP.IronsightAng = Vector(0.472, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.75, -0.872, 0.263)
	SWEP.EoTechAng = Vector(-1.27, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.738, 0, 0.179)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.754, -2.715, 0.395)
	SWEP.MicroT1Ang = Vector(-0.396, -0.053, 0)
	
	SWEP.ACOGPos = Vector(-2.77, 0, -0.08)
	SWEP.ACOGAng = Vector(-0.477, 0, 0)
	
	SWEP.NXSPos = Vector(-2.712, 0, 0.216)
	SWEP.NXSAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)
	
	SWEP.ShortDotPos = Vector(-2.741, 0, 0.15)
	SWEP.ShortDotAng = Vector(0.05, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] =Vector(-2.764, 0, -1.254), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = true
	SWEP.ACOGAxisAlign = {right = 0.45, up = 0, forward = 0}
	SWEP.NXSAlign = {right = 0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.M203OffsetCycle_Reload = 0.81
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}

	SWEP.BaseArm = "Left_U_Arm"
	SWEP.BaseArmBoneOffset = Vector(-500, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.02
	
	SWEP.M203HoldPos = {
		["Left_U_Arm"] = {pos = Vector(2.197, -2.123, -1.015), angle = Angle(0, 0, 0)}
	}
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "scar", pos = Vector(-1.328, -4.893, -2.978), angle = Angle(0, 0, 0), adjustment = {min = -7.753, max = -2.033, axis = "y", inverseOffsetCalc = true}, size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "scar", pos =  Vector(-0.829, -9.7, -8.577), angle = Angle(3.332, -90, 0), adjustment = {min = -12.253, max = -7.150, axis = "y", inverseOffsetCalc = true}, size = Vector(1, 1, 1)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "scar", pos = Vector(-1.124, 10.972, 2.461), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "scar", pos = Vector(-1.073, 1.43, 2.877), angle = Angle(0, -180, 0), adjustment = {min = -2.306, max = 5.182, axis = "y", inverseOffsetCalc = true}, size = Vector(0.4, 0.4, 0.4)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "scar", pos =  Vector(-1.05, 4.051, -0.945), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "scar", pos =  Vector(-1.022, 11.777, -0.239), angle = Angle(0, 0, 0), size = Vector(0.649, 0.649, 0.649)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "scar", pos = Vector(-1.471, -4.882, -2.99), angle = Angle(0, 0, 0), adjustment = {min = -7.480, max = -2.284, axis = "y", inverseOffsetCalc = true}, size = Vector(1, 1, 1)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "scar", pos = Vector(-1.471, -4.882, -2.99), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "scar", rel = "", pos = Vector(-1.157, 0.987, 3.838), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)}
	}

	SWEP.ForeGripHoldPos = {
		["Left12"] = {pos = Vector(0, 0, 0), angle = Angle(11.357, -2.181, 0) },
		["Left1"] = {pos = Vector(0, 0.74, 0), angle = Angle(0, -9.094, 0) },
		["Left3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 70.535, 0) },
		["Left8"] = {pos = Vector(0, 0, 0), angle = Angle(25.916, -11.879, 0) },
		["Left5"] = {pos = Vector(0, 0, 0), angle = Angle(46.38, -15.816, -10.117) },
		["Left11"] = {pos = Vector(0, 0, 0), angle = Angle(24.169, -5.834, 0) },
		["Left9"] = {pos = Vector(0, 0, 0), angle = Angle(20.329, 0, 0) },
		["Left_L_Arm"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 88.917) },
		["Left14"] = {pos = Vector(0, 0, 0), angle = Angle(19.552, -13.228, 0) },
		["Left2"] = {pos = Vector(0, 0.74, 0), angle = Angle(0.127, 45.395, 0) },
		["Left_Hand"] = {pos = Vector(0, 0, 0), angle = Angle(-19.973, 0, 25.535) },
		["Left_U_Arm"] = {pos = Vector(1.812, 0.024, -1.239), angle = Angle(0, 0, 0) }
	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	
	SWEP.BoltBone = "SCAR_Bolt"
	SWEP.BoltShootOffset = Vector(0, 3.752, 0)
	
	SWEP.LaserPosAdjust = Vector(0.5, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.MuzzleVelocity = 714 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {400, -400},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
	[2] = {header = "Barrel", offset = {-400, -300},  atts = {"md_saker"}},
	[3] = {header = "Rail", offset = {100, -300},  atts = {"md_anpeq15"}},
	[4] = {header = "Handguard", offset = {-400, 150}, atts = {"md_bipod"}},
	["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"fire", "fire2"},
	reload = "reload",
	reload_empty = "reloadempty",
	idle = "idle",
	draw = "ready"}
	
SWEP.Sounds = {ready = {[1] = {time = 0, sound = "CW_MK20_DRAW"},
	[2] = {time = 0.47, sound = "CW_MK20_BOLTBACK"},
	[3] = {time = 0.81, sound = "CW_MK20_BOLTFORWARD"},
	[4] = {time = 1.15, sound = "CW_MK20_RATTLE"}},

	reloadempty = {[1] = {time = 0.35, sound = "CW_MK20_MAGRELEASE"},
	[2] = {time = 0.5, sound = "CW_MK20_LEANIN"},
	[3] = {time = 0.61, sound = "CW_MK20_MAGOUT"},
	[4] = {time = 1.91, sound = "CW_MK20_MAGIN"},
	[5] = {time = 2.82, sound = "CW_MK20_BOLTBACK"},
	[6] = {time = 3.08, sound = "CW_MK20_BOLTFORWARD"},
	[7] = {time = 3.76, sound = "CW_MK20_RATTLE"},
	[8] = {time = 3.82, sound = "CW_MK20_SHOULDER"}},
	
	reload = {[1] = {time = 0.41, sound = "CW_MK20_MAGRELEASE"},
	[2] = {time = 1.52, sound = "CW_MK20_MAGOUT"},
	[3] = {time = 2.20, sound = "CW_MK20_MAGIN"},
	[4] = {time = 2.73, sound = "CW_MK20_RATTLE"},
	[5] = {time = 2.79, sound = "CW_MK20_SHOULDER"}}}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Samsung Galaxy S7 Edge"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_scar_ssr.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_mk20ssr_cw.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.1
SWEP.FireSound = "CW_MK20_FIRE"
SWEP.FireSoundSuppressed = "CW_MK20_FIRE_SUPPRESSED"
SWEP.Recoil = 2.3

SWEP.HipSpread = 0.048
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.065
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 55
SWEP.DeployTime = 1.3

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 3
SWEP.ReloadTime_Empty = 4
SWEP.ReloadHalt = 3
SWEP.ReloadHalt_Empty = 4

SWEP.SnapToIdlePostReload = true