AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MSBS RADON"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_OTS"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellPosOffset = {x = 0, y = -1, z = 1.5}
	SWEP.ShellOffsetMul = 1
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_gho_msbs.mdl"
	SWEP.WMPos = Vector(-1, -3, 1)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.633, 0, -1.31)
	SWEP.IronsightAng = Vector(0.05, 0, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.58, 0, -1.685)
	SWEP.EoTechAng = Vector(-0.315, 0.35, 0)
	
	SWEP.AimpointPos = Vector(-2.61, -4.624, -1.25)
	SWEP.AimpointAng = Vector(-0.662, 0.14, 0)
	
	SWEP.MicroT1Pos = Vector(-2.641, 0, -1.16)
	SWEP.MicroT1Ang = Vector(0.1, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.59, 0, -0.681)
	SWEP.ACOGAng = Vector(-4.066, 0.279, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-2.622, -2.211, -0.967)
	SWEP.RMRAng = Vector(0, 0.1, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.651, -4.624, -2.208), [2] = Vector(-0.299, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = -10, forward = -30}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "gun", rel = "", pos = Vector(0.119, 0.5, -1.51), angle = Angle(0, 90, 0), size = Vector(0.893, 0.893, 0.893)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "gun", rel = "", pos = Vector(0.019, 3.151, -1.997), angle = Angle(0, -180, 0), size = Vector(0.981, 0.981, 0.981)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "gun", rel = "", pos = Vector(-0.556, 11.88, -10.4), angle = Angle(0, 90, 0), size = Vector(1.299, 1.299, 1.299)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "gun", rel = "", pos = Vector(-0.201, -3.263, 3.713), angle = Angle(0, -180, 0), size = Vector(0.358, 0.358, 0.358)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "gun", rel = "", pos = Vector(0.425, -8.186, 1.636), angle = Angle(-3.507, -90, -90), size = Vector(0.533, 0.533, 0.533)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "gun", rel = "", pos = Vector(-0.195, -2.939, 0.086), angle = Angle(0, -180, 0), size = Vector(0.533, 0.533, 0.533), color = Color(255, 255, 255, 255)}
	}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0.5)
	SWEP.LaserAngAdjust = Angle(0, 177, 0) 

	SWEP.LaserAngAdjustAim = Angle(-0.1, 180 - 0.5, 0)
	
    SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0.5, roll = 0.3, forward = 0.6, pitch = 0.3}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = false
end

--SWEP.BoltBone = ""
--SWEP.BoltShootOffset = Vector(-4, 0, 0)

SWEP.MuzzleVelocity = 700 -- in meter/s

SWEP.SightBGs = {main = 1, none = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -500}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech"}},
	[2] = {header = "Barrel", offset = {-400, -400}, atts = {"md_saker"}},
	[3] = {header = "Rail", offset = {-100, 200}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {800, 500}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload2",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload2 = {[1] = {time = 0.30, sound = "CW_MSBS_MAGOUT"},
	[2] = {time = 0.70, sound = "CW_SAIGA_CLOTH"},
	[3] = {time = 0.9, sound = "CW_MSBS_MAGIN"},
	[4] = {time = 1.38, sound = "CW_MSBS_MAGTAP"},
	[5] = {time = 2.0, sound = "CW_MSBS_BOLT"}}}

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
SWEP.ViewModel		= "models/weapons/v_gho_msbs.mdl"
SWEP.WorldModel		= "models/weapons/w_gho_msbs.mdl"
SWEP.UseHands       = true


SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.086
SWEP.FireSound = "CW_MSBS_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_LONGBARREL_FIRE_SUPPRESSED"
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.0015
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.028
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.65
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 1.8
SWEP.ReloadTime_Empty = 2.5
SWEP.ReloadHalt = 1.8
SWEP.ReloadHalt_Empty = 2.5
SWEP.SnapToIdlePostReload = true