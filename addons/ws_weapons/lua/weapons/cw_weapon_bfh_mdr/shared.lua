AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("7.62x51MM", "7.62x51MM Rounds", 7.62, 51)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Deset Tech MDR"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_OTS"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellPosOffset = {x = -2, y = -3, z = -3}
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_aug.mdl"
	SWEP.WMPos = Vector(-1, -5, 1)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.764, 0, -0.044)
	SWEP.IronsightAng = Vector(0, -0.01, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.76, 0, -0.7)
	SWEP.EoTechAng = Vector(1.55, 0.02, 0)
	
	SWEP.AimpointPos = Vector(-2.754, 1, -0.5)
	SWEP.AimpointAng = Vector(2.1, 0.15, 0)
	
	SWEP.MicroT1Pos = Vector(-2.754, 0, -0.4)
	SWEP.MicroT1Ang = Vector(2.2, 0.018, 0)
	
	SWEP.ACOGPos = Vector(-2.741, 0, -0.55)
	SWEP.ACOGAng = Vector(1.562, 0.368, 0)
	
	SWEP.NXSPos = Vector(-2.76, 0, -0.25)
	SWEP.NXSAng = Vector(0.847, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.777, 0, -0.264)
	SWEP.ShortDotAng = Vector(1.197, -0.201, 0)
	
    SWEP.CustomizePos = Vector(2.319, 0.233, 0)
    SWEP.CustomizeAng = Vector(7.668, 28.166, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-2.763, 0, 0.162)
	SWEP.RMRAng = Vector(0.197, -0.05, 0)
	
	SWEP.PronePos = Vector(2.905, 0, 0)
	SWEP.ProneAng = Vector(-4.223, 19.925, 0)
	
	SWEP.CustomizationMenuScale = 0.01

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.76, 0, -1.45), [2] = Vector(1.9, 0.05, 0)}}

	SWEP.NXSAlign = {right = 1.15, up = -0, forward = 0}
	SWEP.ACOGAxisAlign = {right = 0.5, up = -0.4, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0.8, up = 0.2, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl ", bone = "gun", rel = "", pos = Vector(-0.355, -1.494, -1.331), angle = Angle(0, -90, 0), size = Vector(0.76, 0.76, 0.76)},
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "gun", rel = "", pos = Vector(-0.383, -0.932, -1.742), angle = Angle(1.031, -90, 0), size = Vector(0.828, 0.828, 0.828)},
	    ["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "gun", rel = "", pos = Vector(-0.156, 2.6, 3.956), angle = Angle(0, -90, 0), size = Vector(0.93, 0.93, 0.93)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "gun", rel = "", pos = Vector(-0.33, -2.434, -2.076), angle = Angle(0, 0, 0), size = Vector(0.893, 0.893, 0.893)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "gun", rel = "", pos = Vector(0.041, -9.879, -9.237), angle = Angle(0, -89.125, 0), size = Vector(1.139, 1.139, 1.139)},
	    ["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "gun", rel = "", pos = Vector(-0.101, 2.746, 3.157), angle = Angle(0, 0, 0), size = Vector(0.388, 0.388, 0.388)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "gun", rel = "", pos = Vector(0.555, 7.532, 2.023), angle = Angle(0, 90, 90), size = Vector(0.5, 0.5, 0.5)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "gun", rel = "", pos = Vector(-0.051, 1.5, 0.5), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "gun", rel = "", pos = Vector(-0.38, -2, -1.6), angle = Angle(0, 0, 0), size = Vector(0.801, 0.801, 0.801)}
	}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0)
	
	SWEP.LaserAngAdjustAim = Angle(0, 180 - 0.5, 0)

    SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0.5, roll = 0.3, forward = 0.6, pitch = 0.3}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = false
	
end

SWEP.BoltBone = "bolt"
SWEP.BoltShootOffset = Vector(0, 3, 0)

SWEP.MuzzleVelocity = 800 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {200, -700}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
	[2] = {header = "Barrel", offset = {-500, -350}, atts = {"md_saker"}},
	[3] = {header = "Rail", offset = {-100, 200}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {1400, 700}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shot1", "shot2", "shot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.40, sound = "CW_MDR_CLOTH"},
	[2] = {time = 1.1, sound = "CW_MDR_MAGOUT"},
	[3] = {time = 1.4, sound = "CW_MDR_CLOTH1"},
	[4] = {time = 1.9, sound = "CW_MDR_MAGIN"},
	[5] = {time = 1.8, sound = "CW_MDR_CLOTH2"},
	[6] = {time = 2.1, sound = "CW_FOLEY_MEDIUM"}}}


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
SWEP.ViewModel		= "models/weapons/v_bfh_mdc.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_aug.mdl"
SWEP.UseHands       = false


SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 280
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.095
SWEP.FireSound = "CW_MDR_FIRE"
SWEP.FireSoundSuppressed = "CW_MDR_SUPPRESSED"
SWEP.Recoil = 1.3

SWEP.HipSpread = 0.030
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.010
SWEP.SpreadPerShot = 0.001
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 1
SWEP.Damage = 48
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 3.4
SWEP.ReloadTime_Empty = 3.4
SWEP.ReloadHalt = 3.4
SWEP.ReloadHalt_Empty = 3.4
SWEP.SnapToIdlePostReload = true