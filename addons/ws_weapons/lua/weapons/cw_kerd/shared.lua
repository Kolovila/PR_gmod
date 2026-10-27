AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "PP-91 Kedr"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
    SWEP.BoltBone = "Slide"
	SWEP.BoltShootOffset = Vector(-0.8, 0, 0)
	SWEP.Shell = "smallshell"
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 1, y = -2, z = 0}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_smg_kerd.mdl"
	SWEP.WMPos = Vector(-1, 0, -0.5)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-3.04, -1.463, 1.993)
	SWEP.IronsightAng = Vector(0.349, 0.1, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.21, -4.686, 0.239)
	SWEP.EoTechAng = Vector(0, 0, -0.217)
	
	SWEP.AimpointPos = Vector(-2.194, -4.686, 0.338)
	SWEP.AimpointAng = Vector(-1.951, 0, -0.217)
	
	SWEP.MicroT1Pos = Vector(-2.208, 1, 0.83)
	SWEP.MicroT1Ang = Vector(-1.938, 0, -0.217)
	
	SWEP.ACOGPos = Vector(-2.211, -4, 0.146)
	SWEP.ACOGAng = Vector(-1.4, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "kedr", rel = "", pos = Vector(-3.931, 12.885, -4.047), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)}
	}
	
end

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[2] = {header = "Barrel", offset = {-300, -200}, atts = {"md_saker"}},	
	["+reload"] = {header = "Ammo", offset = {500, 0}, atts = {"am_magnum", "am_matchgrade"}}}
	
SWEP.AttachmentDependencies = {["md_m203"] = {"bg_longris"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_KERD_FOLEY"},
    [2] = {time = 0.3, sound = "CW_KERD_UNFOLD"}},

	reload = {[1] = {time = 0.65, sound = "CW_KERD_MAGOUT"},
	[2] = {time = 1.76, sound = "CW_KERD_CLIPDRAW"},
	[3] = {time = 1.85, sound = "CW_KERD_MAGIN"},
	[4] = {time = 1.95, sound = "CW_KERD_MAGSLAP"},
	[5] = {time = 3.15, sound = "CW_KERD_BOLT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_smg_kerd.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_kerd.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 280
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.065666666666667
SWEP.FireSound = "CW_KERD_FIRE"
SWEP.FireSoundSuppressed = "CW_kerd_FIRE_SUPPRESSED"
SWEP.Recoil = 0.70

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.004
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 24
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 3.0
SWEP.ReloadTime_Empty = 4.0
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true