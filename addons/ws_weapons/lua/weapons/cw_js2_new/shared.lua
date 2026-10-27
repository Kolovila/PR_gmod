AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "JS-2 9mm"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = -2}
	SWEP.Shell = "smallshell"
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_bf4_js2_new.mdl"
	SWEP.WMPos = Vector(-1, 0, 0.5)
	SWEP.WMAng = Vector(-10, 0, 180)
	
	SWEP.IronsightPos = Vector(3.165, -0.5, 0.518)
	SWEP.IronsightAng = Vector(0.2, -0.03, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-3.201, 0, -0.913)
	SWEP.EoTechAng = Vector(0, -0.16, 0)
	
	SWEP.AimpointPos = Vector(3.171, 0, 0.674)
	SWEP.AimpointAng = Vector(-0, -0.12, 0)
	
	SWEP.MicroT1Pos = Vector(3.18, 0, 0.56)
	SWEP.MicroT1Ang = Vector(0.65, 0.059, 0)
	
	SWEP.ACOGPos = Vector(-3.152, 0, -0.817)
	SWEP.ACOGAng = Vector(0.414, 0.07, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(3.16, 0, 1.309)
	SWEP.RMRAng = Vector(0.1, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(-1.56, -1.407, 0.33)
	SWEP.CustomizeAng = Vector(13.553, -25.664, -1.704)
	
	SWEP.SprintPos = Vector(-2.794, 0, 0)
	SWEP.SprintAng = Vector(-3.49, -32.895, 0)
	
	SWEP.PronePos = Vector(-4.206, -3.609, -1.723)
	SWEP.ProneAng = Vector(2.358, -26.247, 0)
	
	SWEP.CustomizationMenuScale = 0.01
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-3.152, -1.566, -1.935), [2] = Vector(-0.129, -0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "tag_weapon", rel = "", pos = Vector(4.313, -0.361, -3.36), angle = Angle(0, -180, 0), size = Vector(1.095, 1.095, 1.095)},
		["md_aimpoint"] = {model =  "models/wystan/attachments/aimpoint.mdl", bone = "tag_weapon", rel = "", pos = Vector(7.748, -0.33, -4.789), angle = Angle(0, -90, 0), size = Vector(1.348, 1.348, 1.348)},
		--["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "tag_weapon", rel = "", pos = Vector(-13.902, -0.401, -9.938), angle = Angle(0, 0, 0), size = Vector(1.335, 1.335, 1.335)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "tag_weapon", rel = "", pos = Vector(-1.129, 0.019, 3.15), angle = Angle(0, -90, 0), size = Vector(0.595, 0.595, 0.595)},
		--["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "tag_weapon", rel = "", pos = Vector(5.407, -1.002, 1.8), angle = Angle(-180, 0, -90), size = Vector(0.73, 0.73, 0.73)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "tag_weapon", rel = "", pos = Vector(1.723, 0, -0.01), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5)},
		--["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "tag_weapon", rel = "", pos = Vector(-4.531, 0.317, -1.599), angle = Angle(-0, 90, 0), size = Vector(1.036, 1.036, 1.036)}
	}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0.5)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 0, roll = 0, forward = 1.5, pitch = 0.6}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = false
end

SWEP.BoltBone = "j_bolt"
SWEP.BoltShootOffset = Vector(4, 0, 0)

SWEP.MuzzleVelocity = 700 -- in meter/s

SWEP.SightBGs = {main = 1, none = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -700}, atts = {"md_rmr", "md_microt1", "md_aimpoint"}},
	[2] = {header = "Barrel", offset = {-400, -200}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {800, 300}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw1"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.37, sound = "CW_JS_MAGOUT"},
	[2] = {time = 0.70, sound = "CW_SAIGA_CLOTH"},
	[3] = {time = 1.6, sound = "CW_JS_MAGIN"},
	[4] = {time = 2.3, sound = "CW_JS_BOLT"}}}

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
SWEP.ViewModel		= "models/weapons/v_bf4_js2_new.mdl"
SWEP.WorldModel		= "models/weapons/w_bf4_js2_new.mdl"
SWEP.UseHands       = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 90
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.05
SWEP.FireSound = "CW_JS_FIRE"
SWEP.FireSoundSuppressed = "CW_MP5_FIRE_SUPPRESSED"
SWEP.Recoil = 0.7

SWEP.HipSpread = 0.060
SWEP.AimSpread = 0.0025
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.040
SWEP.SpreadPerShot = 0.0060
SWEP.SpreadCooldown = 0.08
SWEP.Shots = 1
SWEP.Damage = 24
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 2.1
SWEP.ReloadTime_Empty = 3.2
SWEP.ReloadHalt = 2.1
SWEP.ReloadHalt_Empty = 3.2
SWEP.SnapToIdlePostReload = true