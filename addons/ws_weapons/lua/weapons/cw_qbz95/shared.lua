AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Qbz-95"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_OTS"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_Qbz95.mdl"
	SWEP.WMPos = Vector(0, 0, 1)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.149, 0.46, 0.035)
	SWEP.IronsightAng = Vector(0.89, -0.955, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.03, 0, -0.959)
	SWEP.EoTechAng = Vector(-1.318, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.02, 0, -0.777)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.004, -1.005, -0.862)
	SWEP.MicroT1Ang = Vector(0,0,0)
	
	SWEP.ACOGPos = Vector(-2.067, 0, -0.977)
	SWEP.ACOGAng = Vector(0.25, -0.299, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(3.227, -1.2, -0)
    SWEP.CustomizeAng = Vector(8.199, 32.745, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.04, 0, -1.701), [2] = Vector(0.215, -0.018, 0)}}

	SWEP.ACOGAxisAlign = {right = 1, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	SWEP.SightWithRail = true
	
	SWEP.AttachmentModelsVM = {
	    ["md_rail"] = {model = "models/wystan/attachments/rail.mdl", bone = "Base", rel = "", pos = Vector(-3.517, 11.706, 41.737), angle = Angle(0, 90.696, 0), size = Vector(0.883, 0.883, 1.47)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Base", rel = "", pos = Vector(-3.491, -0.567, 34.23), angle = Angle(0, -90, 0), size = Vector(0.949, 0.949, 0.949)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Base", rel = "", pos = Vector(-3.911, 5.315, 40.377), angle = Angle(0, 0, 0), size = Vector(0.712, 0.712, 0.712)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "Base", rel = "", pos = Vector(-3.526, 24.827, 41.497), angle = Angle(0, 0, 180), size = Vector(0.629, 0.629, 0.629)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Base", rel = "", pos = Vector(-3.731, 10.909, 44.59), angle = Angle(0, 0, 0), size = Vector(0.351, 0.351, 0.351), color = Color(255, 255, 255, 255)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Base", rel = "", pos = Vector(-3.991, 6.196, 40.659), angle = Angle(0, 0, 0), size = Vector(0.66, 0.66, 0.66)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 1, roll = 2, forward = 2, pitch = 1}
	
	SWEP.CustomizationMenuScale = 0.0085
	
end

SWEP.BoltBone = "bolt"
SWEP.BoltShootOffset = Vector(-1, 0, 0)

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {
    [1] = {header = "Sight", offset = {800, -1200}, atts = {"md_microt1", "md_aimpoint", "md_eotech", "md_acog"}},
	[2] = {header = "Barrel", offset = {-700, -200}, atts = {"md_pbs1"}},
	["+reload"] = {header = "Ammo", offset = {1400, 750}, atts = {"am_magnum", "am_matchgrade"}}}
	

SWEP.Animations = {fire = {"fire1", "fire2", "fire3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.48, sound = "CW_QBZ_MAGOUT"},
	[2] = {time = 0.70, sound = "Foley"},
	[3] = {time = 1.25, sound = "CW_QBZ_MAGIN"},	
	[4] = {time = 1.65, sound = "magtap"},
	[5] = {time = 2.28, sound = "pull"}}}

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
SWEP.ViewModel		= "models/weapons/v_rif_Qbz95.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_Qbz95.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.088
SWEP.FireSound = "CW_QBZ_FIRE"
SWEP.FireSoundSuppressed = "CW_QBZ_FIRE_SUPPRESSED"
SWEP.Recoil = 1.1

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.0025
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.16
SWEP.Shots = 1
SWEP.Damage = 33
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 3.1
SWEP.ReloadTime_Empty = 3.1
SWEP.ReloadHalt = 3.1
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true