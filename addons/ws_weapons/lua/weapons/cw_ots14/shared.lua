AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("7.62x39MM", "7.62x39 Rounds", 7.62, 39)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Ots-14 Groza"
	SWEP.CSMuzzleFlashes = true
	SWEP.SightWithRail = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 2, z = 3}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_ak47.mdl"
	SWEP.WMPos = Vector(0, 0, 1)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-1.823, 0, 0.319)
	SWEP.IronsightAng = Vector(-0.129, -0.01, 0)
		
	SWEP.EoTechPos = Vector(-1.805, -2.303, -0.171)
	SWEP.EoTechAng = Vector(-0.466, 0.14, 0)
	
	SWEP.AimpointPos = Vector(-1.811, 0, -0.332)
	SWEP.AimpointAng = Vector(-0.207, 0.136, 0)
	
	SWEP.MicroT1Pos = Vector(-1.797, 0.009, -0.302)
	SWEP.MicroT1Ang = Vector(-0.262, 0.208, 0)
	
	SWEP.ACOGPos = Vector(-1.793, 0, -0.456)
	SWEP.ACOGAng = Vector(-0.76, 0.109, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-1.788, 0, 0)
	SWEP.RMRAng = Vector(-1.453, 0.22, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(3.888, 0, -0.137)
    SWEP.CustomizeAng = Vector(7.803, 33.21, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-1.793, -2.211, -1.055), [2] = Vector(-0.561, 0.1, 0)}}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.3, hor = 0.3, roll = 0.5, forward = 0, pitch = 0}

	SWEP.ACOGAxisAlign = {right = -40, up = -90, forward = 40}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "base", rel = "", pos = Vector(-0.1555, 1.519, -0.44), angle = Angle(0, 90, 180), size = Vector(0.432, 0.432, 0.432)},
		--["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "base", rel = "", pos = Vector(-0.171, 2.619, -0.015), angle = Angle(0, 0, -180), size = Vector(0.5, 0.5, 0.5)},
	    ["md_rail"] = {model = "models/cw2/attachments/lowerpistolrail.mdl", bone = "base", rel = "", pos = Vector(-0, -2.559, -2.81), angle = Angle(0, 90, 0), size = Vector(0.143, 0.067, 0.09)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "base", rel = "", pos = Vector(-0.13, 2.575, -0.099), angle = Angle(0, 0, -180), size = Vector(0.488, 0.488, 0.488), color = Color(255, 255, 255, 255)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "base", rel = "", pos = Vector(0.157, 4.13, 2.686), angle = Angle(0, 90.26, 180), size = Vector(0.5, 0.5, 0.5)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "base", rel = "", pos = Vector(-0.01, -0.667, -2.971), angle = Angle(0, 0, -180), size = Vector(0.212, 0.212, 0.212)},
	}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0) 
	
	SWEP.CustomizationMenuScale = 0.0075
end

SWEP.BoltBone = "Bolt"
SWEP.BoltShootOffset = Vector(0, -3.5, 0)

SWEP.MuzzleVelocity = 800 -- in meter/s

SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {
    [1] = {header = "Sight", offset = {300, -700}, atts = {"md_rmr", "md_microt1", "md_aimpoint"}},
	["+reload"] = {header = "Ammo", offset = {950, 500}, atts = {"am_magnum", "am_matchgrade"}}}
	
SWEP.Animations = {fire = {"fire1", "fire2", "fire3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.5, sound = "CW_Ots_MAGOUT"},
	[2] = {time = 0.50, sound = "CW_OTs_cloth"},
	[3] = {time = 1.45, sound = "CW_Ots_MAGIN"},
	[4] = {time = 1.6, sound = "CW_OTs_cloth2"},
	[5] = {time = 2, sound = "CW_Ots_BOLT"},
	[6] = {time = 2.125, sound = "CW_Ots_BACK"}}}

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
SWEP.ViewModel		= "models/weapons/v_rif_Ots.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_ak47.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x39MM"

SWEP.FireDelay = 0.085
SWEP.FireSound = "CW_Ots_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_FIRE_SUPPRESSED"
SWEP.Recoil = 1.15

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.0025
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.08
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.0
SWEP.ReloadTime = 2.65
SWEP.ReloadTime_Empty = 2.65
SWEP.ReloadHalt = 2.65
SWEP.ReloadHalt_Empty = 2.65
SWEP.SnapToIdlePostReload = false