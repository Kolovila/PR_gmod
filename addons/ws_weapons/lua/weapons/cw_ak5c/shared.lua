AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AK-5C"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.8
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 0
	SWEP.Shell = "mainshell"
	SWEP.ShellPosOffset = {x = 0, y = 0.5, z = -3}
	SWEP.SightWithRail = true
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(-1, 0, 0)
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.85
	SWEP.StopReloadBoneOffset = 0.9
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_ak_5c.mdl"
	SWEP.WMPos = Vector(-0.5, -0.3, -0.2)
	SWEP.WMAng = Vector(-5, -0.052, -180)
	
	SWEP.IronsightPos = Vector(-2.593, -1.234, 1.266)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0, -9.332, -7.321)
	SWEP.SprintAng = Vector(65.332, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.609, -2.753, 0.326)
	SWEP.MicroT1Ang = Vector(0, 0, -0)
	
	SWEP.WS_CMOREPos = Vector(-2.131, -1.964, 0.057)
	SWEP.WS_CMOREAng = Vector(0, 0, -0)
	
	SWEP.WS_BarskaPos = Vector(-2.133, -0.735, -0.044)
	SWEP.WS_BarskaAng = Vector(0, 0, -0)
	
	SWEP.EoTechPos = Vector(-2.606, -2.876, 0.151)
	SWEP.EoTechAng = Vector(0, 0, -0)
	
	SWEP.AimpointPos = Vector(-2.6, -2.74, 0.333)
	SWEP.AimpointAng = Vector(0, 0, -0)
	
	SWEP.ShortDotPos = Vector(-2.605, -2.347, 0.216)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.586, -1.818, 0.014)
	SWEP.ACOGAng = Vector(-0, 0, 0)
	
	SWEP.WS_LeupoldPos = Vector(-2.152, -1.139, 0.223)
	SWEP.WS_LeupoldAng = Vector(-0, 0, 0)
	
	SWEP.SprintPos = Vector(-0.168, 1.46, 0.605)
	SWEP.SprintAng = Vector(-14.646, 7.275, 0) 
	
	SWEP.CustomizePos = Vector(2.427, -1.295, 0)
	SWEP.CustomizeAng = Vector(5.354, 24.604, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.079, -1.336, 0.108)
	SWEP.AlternativeAng = Vector(1.419, 0.93, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.589, -3.378, -0.991), [2] = Vector(-0, 0, 0)}}

	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Dummy02"
	SWEP.BaseArmBoneOffset = Vector(0, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_microt1fovedit"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(1.335, -4.672, -0.025), angle = Angle(90, -90, 0), size = Vector(0.419, 0.419, 0.419)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "body", rel = "", pos = Vector(-9.521, 6.223, -0.294), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},
		["md_suppressor"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "body", rel = "", pos = Vector(4.497, -2.563, -2.56), angle = Angle(0, 90, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_foregrip"] = {"Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "body", rel = "", pos = Vector(21.424, 0.712, -0.389), angle = Angle(90, 0, -90), size = Vector(0.649, 0.649, 0.649)},
		["md_m203"] = {"Model", model = "models/cw2/attachments/m203.mdl", bone = "body", rel = "", pos = Vector(-4.975, -5.35, -2.368), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), animated = true},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "body", rel = "", pos = Vector(-3.498, 0.582, 0.209), angle = Angle(-90, 90, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "body", rel = "", pos = Vector(-3.235, 0.879, 0.326), angle = Angle(0, 0, -90), size = Vector(0.949, 0.949, 0.949)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "body", rel = "", pos = Vector(-2.768, 0.629, 0.305), angle = Angle(-90, 90, 0), size = Vector(0.899, 0.899, 0.899)},
	}

	
	SWEP.M203HoldPos = {
		["Dummy02"] = { scale = Vector(1, 1, 1), pos = Vector(2.956, -0.082, -1.928), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
	["Left7"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 9.939, 0) },
	["Left4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(64.055, 14.713, -0.728) },
	["Left1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(26.211, 22.816, -24.258) },
	["Left5"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 2.312, 0) },
	["Left_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(9.553, 1.769, 13.463) },
	["Left_L_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(0, -5.554, 0.172), angle = Angle(0, 37.236, 43.463) }


	}	
	
	SWEP.AttachmentPosDependency = {[""] = {[""] = Vector(-0.225, 13, 3.15)},
	[""] = {[""] = Vector(-0.042, 9, -0.1), [""] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(0.0, -75, -9.0)
	SWEP.LaserAngAdjust = Angle(0.0, 0, 4) 
end
SWEP.ACOGAxisAlign = {right = -0.9, up = 0, forward = 0}
SWEP.SchmidtShortDotAxisAlign = {right = -0.9, up = 0, forward = 0}
SWEP.WS_LeupoldAxisAlign = {right = 1.48, up = 0.95, forward = 0}

SWEP.SightBGs = {main = 4, carryhandle = 0, foldsight = 1, none = 0}
SWEP.MagBGs = {main = 0, regular = 0, ak5cmagazine = 1}

SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {500, -350}, atts = {"md_microt1fovedit", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_acog"}},
	[2] = {header = "Suppressor", offset = {100, -300}, atts = {"md_suppressor"}},
	[3] = {header = "Grip", offset = {-100, 50}, atts = {"md_foregrip"}},
	[4] = {header = "Magazine", offset = {400, 100}, atts = {"bg_ak5cmagazine"}},
	["+reload"] = {header = "Ammo", offset = {850, 450}, atts = {"am_magnum", "am_matchgrade"}}}
	

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1]= {time = 0.1, sound = "CW_FOLEY_NORMAL"}},
			
	reload = {[1] = {time = 0.2, sound = "CW_FOLEY_LIGHT"},
	[2] = {time = 0.41, sound = "CW_AK5C_MAGOUT"},
	[3] = {time = 0.7, sound = "CW_FOLEY_LIGHT"},
	[4] = {time = 1.42, sound = "CW_AK5C_MAGIN"},
	[5] = {time = 2, sound = "CW_AK5C_BOLTRELEASE"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 HeX"

SWEP.Author			= "HeX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_rif_ak_5c.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_ak_5c.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.ADSFireAnim = false
SWEP.FireDelay = 0.0811
SWEP.FireSound = "CW_AK5C_FIRE"
SWEP.FireSoundSuppressed = "CW_AK5C_FIRE_SUPPRESSED"
SWEP.Recoil = 1.05
SWEP.FullAimViewmodelRecoil = false
SWEP.RecoilToSpread = 1.2
SWEP.FireMoveMod = 1.5

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.1
SWEP.AimMobilitySpreadMod = 1
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.008
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 31
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 0.85
SWEP.ReloadTime = 1.83
SWEP.ReloadTime_Empty = 2.7
SWEP.ReloadHalt = 1.83
SWEP.ReloadHalt_Empty = 2.7
SWEP.SnapToIdlePostReload = true
