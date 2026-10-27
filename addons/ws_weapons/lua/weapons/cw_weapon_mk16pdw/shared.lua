AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Mk16 PDW"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellPosOffset = {x = 2, y = -3, z = -3}
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_mohw_mk16pdw.mdl"
	SWEP.WMPos = Vector(-1, 2.5, -0.5)
	SWEP.WMAng = Vector(-10, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.711, 0, -0.534)
	SWEP.IronsightAng = Vector(0.6, 0.025, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.708, -1, -0.95)
	SWEP.EoTechAng = Vector(0.1, 0.1, 0)
	
	SWEP.AimpointPos = Vector(-2.714, -3.619, -0.28)
	SWEP.AimpointAng = Vector(-0.3, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.714, -0.5, -0.3)
	SWEP.MicroT1Ang = Vector(-0.25, 0.009, 0)
	
	SWEP.ACOGPos = Vector(-2.721, -3.619, -0.722)
	SWEP.ACOGAng = Vector(0.8, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.704, 0, -0.18)
	SWEP.ShortDotAng = Vector(-0.325, 0.15, 0)

	SWEP.RMRPos = Vector(-2.69, 0, 0)
	SWEP.RMRAng = Vector(0.55, 0.17, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
 	SWEP.CustomizePos = Vector(6.353, -3.191, -1.39)
 	SWEP.CustomizeAng = Vector(11.498, 44.113, 0)
	
	SWEP.SprintPos = Vector(5.173, 0, -1.55)
	SWEP.SprintAng = Vector(0, 32.174, 0)
	
	SWEP.CustomizationMenuScale = 0.01
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.71, -3.619, -1.769), [2] = Vector(0.93, 0, 0)}}

	SWEP.NXSAlign = {right = 0, up = 0, forward = 0}
	SWEP.ACOGAxisAlign = {right = -0.9, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0.35, up = -0.15, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "default", rel = "", pos = Vector(-0.355, -11.398, -1.57), angle = Angle(0, -90, 0), size = Vector(0.939, 0.939, 0.939)},
	    ["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "default", rel = "", pos = Vector(-0.38, -9.363, -1.63), angle = Angle(0, -90, 0), size = Vector(0.954, 0.954, 0.954)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "default", rel = "", pos = Vector(-0.271, -12.0, -2.06), angle = Angle(0, 0, 0), size = Vector(1.041, 1.041, 1.041)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "default", rel = "", pos = Vector(0.389, -22.9, -12.9), angle = Angle(0, -90, 0), size = Vector(1.557, 1.557, 1.557)},
	    ["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "default", rel = "", pos = Vector(-0.04, -5.162, 4.02), angle = Angle(0, 0, 0), size = Vector(0.518, 0.518, 0.518)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "default", rel = "", pos = Vector(-0.84, 0.326, 2.035), angle = Angle(0, 90, -90), size = Vector(0.5, 0.5, 0.5)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "default", rel = "", pos = Vector(0, -6.435, 0.639), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "default", rel = "", pos = Vector(-0.39, -10.594, -2.135), angle = Angle(0, 0, 0), size = Vector(1.041, 1.041, 1.041)}
	}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
    SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0.5, roll = 0.3, forward = 0.6, pitch = 0.3}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = false
	
end

  --SWEP.BoltBone = "bodymesh"
  --SWEP.BoltShootOffset = Vector(-4, 0, 0)

SWEP.MuzzleVelocity = 800 -- in meter/s

SWEP.SightBGs = {main = 1, none = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -700}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog"}},
    [2] = {header = "Barrel", offset = {-600, -400}, atts = {"md_saker"}},
	[3] = {header = "Rail", offset = {-400, 200}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {500, 400}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload_empty = {[1] = {time = 0.30, sound = "CW_MK16_MAGOUT"},
   [2] = {time = 0.8, sound = "CW_MK16_CLOTH"}, 
   [3] = {time = 1.0, sound = "CW_MK16_MAGIN"}, 
   [4] = {time = 1.3, sound = "CW_MK16_MAGIN2"},
   [5] = {time = 1.5, sound = "CW_MK16_CLOTH2"},
   [6] = {time = 1.95, sound = "CW_MK16_BOLTCLICK"}}}
   
SWEP.SpeedDec = 30

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
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
SWEP.ViewModel		= "models/weapons/v_mohw_mk16pdw.mdl"
SWEP.WorldModel		= "models/weapons/w_mohw_mk16pdw.mdl"
SWEP.UseHands       = false


SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 280
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_MK16_FIRE"
SWEP.FireSoundSuppressed = "CW_MK16_SUPPRESSED"
SWEP.Recoil = 0.95

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.0010
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.022
SWEP.SpreadPerShot = 0.003
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 0.95
SWEP.ReloadTime = 2.8
SWEP.ReloadTime_Empty = 2.8
SWEP.ReloadHalt = 2.8
SWEP.ReloadHalt_Empty = 2.8
SWEP.SnapToIdlePostReload = true