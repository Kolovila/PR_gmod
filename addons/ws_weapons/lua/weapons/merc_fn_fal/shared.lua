AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Mercenary FN FAL"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.CustomizePos = Vector(6.936, -2.171, -2.711)
	SWEP.CustomizeAng = Vector(25.783, 29.309, 27.062) 
	
	SWEP.ReloadViewBobEnabled = true
	
	SWEP.RVBPitchMod = 0.5
	SWEP.RVBYawMod = 0.1
	SWEP.RVBRollMod = 0.2
	
	SWEP.SprintPos = Vector(-1.38, 1.223, -2.171)
	SWEP.SprintAng = Vector(-7.027, 26.375, -28.896)
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 3, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.IronsightPos = Vector(-2.925, -0.713, 0.56)
	SWEP.IronsightAng = Vector(0.744, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.911, -4.612, -1)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.945, -4.612, -0.52)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.948, 0, -0.561)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.941, -6.7, -0.601)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.928, -3.337, -0.52)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-1.5694, -0.8652, 0.0158)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_funny_fal.mdl"
	SWEP.WMPos = Vector(-1, -1, -0.5)
	SWEP.WMAng = Vector(-4, 0, 180)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.945, -7.091, -1.325), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.LuaVMRecoilAxisMod = {vert = -0.4, hor = 2, roll = 2, forward = 1, pitch = -1}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	SWEP.SightWithRail = true
	
	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/wystan/attachments/akrailmount.mdl", bone = "fnfal2", rel = "", pos = Vector(-0.601, 0.168, 0.953), angle = Angle(0, 0, 0), size = Vector(0.847, 0.847, 0.847), color = Color(255, 255, 255, 255)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "fnfal2", rel = "", pos = Vector(-0.588, -4.73, -1.487), angle = Angle(0, 0, 0), size = Vector(0.709, 0.709, 0.709), color = Color(255, 255, 255, 255)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "fnfal2", rel = "", pos = Vector(-0.097, -11.375, -8.431), angle = Angle(0, -90, 0), size = Vector(1.026, 1.026, 1.026)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "fnfal2", rel = "", pos = Vector(-0.408, 19.854, -1.206), angle = Angle(0, 180, 0), size = Vector(1.016, 1.016, 1.016), color = Color(255, 255, 255, 255)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "fnfal2", rel = "", pos = Vector(-0.403, -0.327, 2.653), angle = Angle(0, 180, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255)}, 
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "fnfal2", rel = "", pos = Vector(-0.662, -3.504, -1.392), angle = Angle(0, 0, 0), size = Vector(0.669, 0.669, 0.669), color = Color(255, 255, 255, 255)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "fnfal2", rel = "", pos = Vector(-1.183, 8.8, 0.771), angle = Angle(0.72, 87.948, -75.919), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "fnfal2", rel = "", pos = Vector(-0.653, -4.906, -1.402), angle = Angle(0, -90, 0), size = Vector(0.691, 0.691, 0.691)}
	}
	

	
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0) 
end

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.ADSFireAnim = true
SWEP.FullAimViewmodelRecoil = true
SWEP.ZoomAmount = 0

SWEP.Attachments = {[1] = {header = "Sight", offset = {1050, 250}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_acog"}},
	[2] = {header = "Barrel", offset = {-200, 100}, atts = {"md_pbs1"}},
	["+reload"] = {header = "Ammo", offset = {500, 1000}, atts = {"am_magnum", "am_matchgrade"}}}
	
--SWEP.AttachmentDependencies = {["md_m203"] = {"bg_longris"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	fire_aim = "shoot3",
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.1, sound = "CW_FAL_DRAW"},
	{time = 0.57, sound = "CW_FAL_BOLTBACK"},
	{time = 0.76, sound = "CW_FAL_FORWARD"}},

	reload = {[1] = {time = 0.59, sound = "CW_FAL_MAGOUT"},
	[2] = {time = 1.6, sound = "CW_FAL_MAGIN"},
	[3] = {time = 2.24, sound = "CW_FAL_MAGTAP"},
	[4] = {time = 2.71, sound = "CW_FAL_BOLTBACK"},
	[5] = {time = 2.86, sound = "CW_FAL_FORWARD"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_funny_fal.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_funny_fal.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 240
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.08571428571
SWEP.FireSound = "CW_FAL_FIRE"
SWEP.FireSoundSuppressed = "CW_FAL_SUPPRESSED"
SWEP.Recoil = 0.8

SWEP.HipSpread = 0.065
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = 1

SWEP.CanPenetrate = true

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.4
SWEP.ReloadTime_Empty = 3.70
SWEP.ReloadHalt = 1.6
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true