AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "FAD"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	--SWEP.M203OffsetCycle_Reload = 0.65
	--SWEP.M203OffsetCycle_Reload_Empty = 0.73
	--SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_fad.mdl"
	SWEP.WMPos = Vector(0, -1, 0.5)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.IronsightPos = Vector(-4.441, -2.211, 0.237)
	SWEP.IronsightAng = Vector(1.516, 0.029, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-4.391, -8, 0.437)
	SWEP.EoTechAng = Vector(0.0, 0.129, 0)
	
	SWEP.AimpointPos = Vector(-4.396, 0, 0.694)
	SWEP.AimpointAng = Vector(0.136, 0.11, 0)
	
	SWEP.MicroT1Pos = Vector(-4.44, 0, 0.967)
	SWEP.MicroT1Ang = Vector(0, 0.1, 0)
	
	SWEP.ACOGPos = Vector(-4.444, -8.457, 0.639)
	SWEP.ACOGAng = Vector(-3.422, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-4.401, -10.051, 1.598)
	SWEP.RMRAng = Vector(-0.8, 0.1, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(4.647, 0, -0.547)
	SWEP.CustomizeAng = Vector(6.801, 29.028, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-4.485, -8.643, -1.418), [2] = Vector(-0.267, -0.301, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "tag_weapon", rel = "", pos = Vector(12.76, 0, 3.823), angle = Angle(0, -90, 0), size = Vector(0.69, 0.69, 0.69)},
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "tag_weapon", rel = "", pos = Vector(6.086, 0.55, -5.22), angle = Angle(0, 0, 0), size = Vector(1.544, 1.544, 1.544)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "tag_weapon", rel = "", pos = Vector(2.209, 0.4, -5.661), angle = Angle(0, 90, 0), size = Vector(1.633, 1.633, 1.633)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "tag_weapon", rel = "", pos = Vector(-7.792, -0.28, -16.191), angle = Angle(0, 0.68, 0), size = Vector(1.845, 1.845, 1.845)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "tag_weapon", rel = "", pos = Vector(7.593, -0.044, -2.3), angle = Angle(0, 90.142, -0), size = Vector(1.126, 1.126, 1.126)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "tag_weapon", rel = "", pos = Vector(3.065, 0.6, -5.427), angle = Angle(0, 90.346, 0), size = Vector(1.577, 1.577, 1.577)}
	}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 2, roll = 0, forward = 1, pitch = 0}
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0) 
end

SWEP.MuzzleVelocity = 700 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech"}},
	[2] = {header = "Barrel", offset = {-300, -300}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {700, 150}, atts = {"am_magnum", "am_matchgrade"}}}
	

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.4, sound = "CW_FAD_MAGOUT"},
	[2] = {time = 1.65, sound = "CW_FAD_MAGIN"},
	[3] = {time = 2.1, sound = "CW_FAD_BOLT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_rif_fad.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_fad.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.070
SWEP.FireSound = "CW_FAD_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_FIRE_SUPPRESSED"
SWEP.Recoil = 0.85

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.006
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 1.9
SWEP.ReloadTime_Empty = 2.8
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 2.8
SWEP.SnapToIdlePostReload = true