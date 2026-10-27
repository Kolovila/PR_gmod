AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("5.7x29MM", "5.7x29MM Rounds", 5.7, 29)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Weevil"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "smallshell"
	SWEP.ShellPosOffset = {x = 0, y = 1, z = -9}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_bo3_weevil.mdl"
	SWEP.WMPos = Vector(-1, -2, -0.5)
	SWEP.WMAng = Vector(-10, 0, 180)
	
	SWEP.IronsightPos = Vector(3.362, -5 -0.12)
	SWEP.IronsightAng = Vector(0.08, 0.27, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(3.339, -2.5, -1)
	SWEP.EoTechAng = Vector(-1.3, 0.068, 0)
	
	SWEP.AimpointPos = Vector(3.33, -7.84, -0.681)
	SWEP.AimpointAng = Vector(-0.45, -0, 0)
	
	SWEP.MicroT1Pos = Vector(3.332, 0, -0.724)
	SWEP.MicroT1Ang = Vector(-0.2, 0.05, 0)
	
	SWEP.ACOGPos = Vector(3.42, -3.619, -1.053)
	SWEP.ACOGAng = Vector(0.270, 0.486, 0)
	
	SWEP.ShortDotPos = Vector(3.381, 0, -0.8)
	SWEP.ShortDotAng = Vector(-0.491, 0.15, 0)
	
	SWEP.RMRPos = Vector(3.4, -3.217, 0)
	SWEP.RMRAng = Vector(-2.80, 0.4, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(-1.56, -1.407, 0.33)
	SWEP.CustomizeAng = Vector(7, -25.664, -1.704)
	
	SWEP.SprintPos = Vector(-7.151, 0, 0)
	SWEP.SprintAng = Vector(-7.035, -38.67, 0)
	
	SWEP.PronePos = Vector(-4.206, -3.609, -1.723)
	SWEP.ProneAng = Vector(2.358, -26.247, 0)
	
	--SWEP.IronSightsPos = Vector(-4.206, -3.609, -1.723)
    --SWEP.IronSightsAng = Vector(2.358, -26.247, 0)

	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(3.40, -3.619, -1.999), [2] = Vector(-0.401, 0.439, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.21, up = 0.18, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0.6, up = -0.2, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "tag_weapon", rel = "", pos = Vector(0.314, -0.355, -1.861), angle = Angle(0, 180, 0), size = Vector(1.07, 1.07, 1.07)},
	    ["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "tag_weapon", rel = "", pos = Vector(0.542, -0.401, -2.346), angle = Angle(0, 180, 0), size = Vector(1.159, 1.159, 1.159)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "tag_weapon", rel = "", pos = Vector(0.305, -0.22, -1.272), angle = Angle(0, -90, 0), size = Vector(0.976, 0.976, 0.976)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "tag_weapon", rel = "", pos = Vector(9.25, 0.4, -10.48), angle = Angle(0.18, 180, 0), size = Vector(1.368, 1.368, 1.368)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "tag_weapon", rel = "", pos = Vector(-6.114, 0.009, 4.4), angle = Angle(0.18, -90, 0), size = Vector(0.495, 0.495, 0.495)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "tag_weapon", rel = "", pos = Vector(-9.08, -0.905, -0.482), angle = Angle(0, 0, -90), size = Vector(0.5, 0.5, 0.5)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "tag_weapon", rel = "", pos = Vector(3.5, 0.05, -1.976), angle = Angle(0.18, -90, 0), size = Vector(0.944, 0.944, 0.944)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "tag_weapon", rel = "", pos = Vector(-0.552, -0.301, -1.176), angle = Angle(0.18, -90, 0), size = Vector(0.944, 0.944, 0.944)}
	}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0.5)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 0, roll = 0, forward = 1.5, pitch = 0.6}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = false
	
	SWEP.CustomizationMenuScale = 0.01
end

SWEP.BoltBone = "j_bolt"
SWEP.BoltShootOffset = Vector(1.7, 0, 0)

SWEP.MuzzleVelocity = 900 -- in meter/s

SWEP.SightBGs = {main = 1, none = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {0, -1000}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog"}},
	[2] = {header = "Barrel", offset = {-600, -300}, atts = {"md_saker"}},
	[3] = {header = "Rail", offset = {-400, 200}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {1000, 100}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.2, sound = "CW_WEEVIL_CLOTH2"},
	[2] = {time = 0.2, sound = "CW_WEEVIL_MAGOUT"},
	[3] = {time = 0.90, sound = "CW_SAIGA_CLOTH"},
	[4] = {time = 1.5, sound = "CW_WEEVIL_MAGIN"},
	[5] = {time = 1.5, sound = "CW_WEEVIL_CLOTH1"},
	[6] = {time = 1.8, sound = "CW_WEEVIL_TAP"},
	[7] = {time = 1.8, sound = "CW_WEEVIL_CLOTH4"},
	[8] = {time = 2.3, sound = "CW_WEEVIL_BOLT"}}}

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
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/v_bo3_weevil.mdl"
SWEP.WorldModel		= "models/weapons/w_bo3_weevil.mdl"
SWEP.UseHands       = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 50
SWEP.Primary.DefaultClip	= 350
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.7x29MM"

SWEP.FireDelay = 0.078
SWEP.FireSound = "CW_WEEVIL_FIRE"
SWEP.FireSoundSuppressed = "CW_WEEVIL_FIRE_SUPPRESSED"
SWEP.Recoil = 0.8

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.0010
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.020
SWEP.SpreadPerShot = 0.08
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 2.2
SWEP.ReloadTime_Empty = 3.3
SWEP.ReloadHalt = 2.2
SWEP.ReloadHalt_Empty = 3.3
SWEP.SnapToIdlePostReload = true