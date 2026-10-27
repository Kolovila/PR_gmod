AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("9x19MM", "9x19MM Rounds", 5.7, 29)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MAB M1938"
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
	SWEP.ShellPosOffset = {x = 1.7, y = -1, z = -0.7}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_smg_ump45.mdl"
	SWEP.WMPos = Vector(-1, -2, -0.5)
	SWEP.WMAng = Vector(-10, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.307, 0, 0.519)
	SWEP.IronsightAng = Vector(0.375, 0.699, 0)
	
--	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
--	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
--	SWEP.EoTechPos = Vector(3.339, -2.5, -1)
--	SWEP.EoTechAng = Vector(-1.3, 0.068, 0)
	
--	SWEP.AimpointPos = Vector(3.33, -7.84, -0.681)
--	SWEP.AimpointAng = Vector(-0.45, -0, 0)
	
--	SWEP.MicroT1Pos = Vector(3.332, 0, -0.724)
--	SWEP.MicroT1Ang = Vector(-0.2, 0.05, 0)
	
--	SWEP.ACOGPos = Vector(3.42, -3.619, -1.053)
--	SWEP.ACOGAng = Vector(0.270, 0.486, 0)
	
--	SWEP.ShortDotPos = Vector(3.381, 0, -0.8)
--	SWEP.ShortDotAng = Vector(-0.491, 0.15, 0)
	
--	SWEP.RMRPos = Vector(3.4, -3.217, 0)
--	SWEP.RMRAng = Vector(-2.80, 0.4, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(4.811, -1.293, -1.009)
	SWEP.CustomizeAng = Vector(10.093, 28.846, 0)

	SWEP.SprintPos = Vector(4.515, 0, 0)
	SWEP.SprintAng = Vector(-4.785, 30.993, 0)
	
	SWEP.PronePos = Vector(3.167, -1.586, -1.767)
	SWEP.ProneAng = Vector(0.558, 29.205, 0)
	
--	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(3.40, -3.619, -1.999), [2] = Vector(-0.401, 0.439, 0)}}

--	SWEP.ACOGAxisAlign = {right = -0.21, up = 0.18, forward = 0}
--	SWEP.SchmidtShortDotAxisAlign = {right = 0.6, up = -0.2, forward = 0}
--	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
	}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0.5)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 0, roll = 0, forward = 1.5, pitch = 0.6}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = false
	
	SWEP.CustomizationMenuScale = 0.01
end

 -- SWEP.BoltBone = "j_bolt"
 -- SWEP.BoltShootOffset = Vector(1.7, 0, 0)

SWEP.MuzzleVelocity = 700 -- in meter/s

SWEP.SightBGs = {main = 1, none = 1}

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {500, 800}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload_full",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {
	
    draw = {[1] = {time = 0.05, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.1, sound = "CW_MAB38_DEPLOY"},
	[3] = {time = 0.28, sound = "CW_MAB38_BOLT"},
	[4] = {time = 0.35, sound = "CW_MAB38_BOLT_RELEASE"},
	[5] = {time = 0.8, sound = "CW_CLOTH2"}},

	reload_full = {[1] = {time = 0.65, sound = "CW_CLOTH2"},
	[2] = {time = 0.75, sound = "CW_MAB38_MAGOUT"},
	[3] = {time = 0.75, sound = "CW_CLOTH1"},
	[4] = {time = 1.85, sound = "CW_MAB38_MAGIN"},
	[5] = {time = 1.85, sound = "CW_CLOTH4"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_rif_itly.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_ump45.mdl"
SWEP.UseHands       = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 40
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.09
SWEP.FireSound = "CW_MAB38_FIRE"
SWEP.FireSoundSuppressed = "CW_MAB38_FIRE_SUPPRESSED"
SWEP.Recoil = 0.99

SWEP.HipSpread = 0.060
SWEP.AimSpread = 0.0020
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.025
SWEP.SpreadPerShot = 0.08
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 33
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 3
SWEP.ReloadTime_Empty = 3
SWEP.ReloadHalt = 3
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = true