AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Groza 4"
	SWEP.CSMuzzleFlashes = true
	SWEP.SightWithRail = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_suppressed"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 3, z = 3}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_bf4_groza4.mdl"
	SWEP.WMPos = Vector(-0.5, -5, 0.5)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-3.161, 0, 0.4)
	SWEP.IronsightAng = Vector(-0.1, -0.0, 0)
		
	SWEP.EoTechPos = Vector(-1.805, -2.303, -0.171)
	SWEP.EoTechAng = Vector(-0.466, 0.14, 0)
	
	SWEP.AimpointPos = Vector(-3.161, 0.201, -1.441)
	SWEP.AimpointAng = Vector(2.763, 0.18, 0)
	
	SWEP.MicroT1Pos = Vector(-3.181, -0.805, -1.346)
	SWEP.MicroT1Ang = Vector(2.993, 0.13, 0)
	
	SWEP.ACOGPos = Vector(-3.175, -1.005, -1.739)
	SWEP.ACOGAng = Vector(3.164, 0.2, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(3.684, 0, -0.018)
	SWEP.CustomizeAng = Vector(9.784, 28.309, 0)

	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(4.602, 0.2, -0.371)
    SWEP.SprintAng = Vector(-3.335, 28.336, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-3.175, -1.005, -2.734), [2] = Vector(2.994, 0.109, 0)}}

	SWEP.ACOGAxisAlign = {right = -4, up = -0.2, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "M1", rel = "", pos = Vector(-6.193, 0.34, 2.13), angle = Angle(0, 90, 3.897), size = Vector(0.925, 0.925, 0.925)},
	    ["md_rail"] = {model = "models/cw2/attachments/lowerpistolrail.mdl", bone = "M1", rel = "", pos = Vector(3.151, -0, 6.717), angle = Angle(-2.938, 0, 180), size = Vector(0.238, 0.127, 0.157)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "M1", rel = "", pos = Vector(-6.584, 0.238, 2.236), angle = Angle(0, 90, 3.897), size = Vector(0.921, 0.921, 0.921)},
	--	["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "M1", rel = "", pos = Vector(0.157, 4.13, 2.686), angle = Angle(0, 90.26, 180), size = Vector(0.5, 0.5, 0.5)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "M1", rel = "", pos = Vector(0.479, 0.034, 7.189), angle = Angle(0, 90, 3.897), size = Vector(0.367, 0.367, 0.367)}
	}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0) 
	
	   SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0.9, roll = 0.8, forward = 0.7, pitch = 0.6}

	SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = false
end

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.Attachments = {[1] = {header = "Sight", offset = {500, -750}, atts = {"md_microt1", "md_aimpoint", "md_acog"}},
	["+reload"] = {header = "Ammo", offset = {1000, 600}, atts = {"am_magnum", "am_matchgrade"}}}
	
SWEP.Animations = {fire = {"shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.6, sound = "CW_Ots4_MAGOUT"},
	[2] = {time = 0.50, sound = "CW_OTS4_cloth"},
	[3] = {time = 2.2, sound = "CW_OTS4_MAGIN"},
	[4] = {time = 2.2, sound = "CW_OTS4_cloth2"}}}

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
SWEP.ViewModel		= "models/weapons/v_bf4_groza4.mdl"
SWEP.WorldModel		= "models/weapons/w_bf4_groza4.mdl"
SWEP.UseHands       = false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x39MM"

SWEP.FireDelay = 0.08006666666667
SWEP.FireSound = "CW_OTS4_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_FIRE_SUPPRESSED"
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.006
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.0
SWEP.ReloadTime = 3
SWEP.ReloadTime_Empty = 3
SWEP.ReloadHalt = 3
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = false



