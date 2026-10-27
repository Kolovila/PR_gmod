AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "OTS-02 Kiparis"
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
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0} --{x = -1, y = -2, z = -1}
	
	SWEP.NoStockShells = true
	SWEP.ShellOffsetMul = 0
	
	SWEP.BoltBone = "Bolt"
	SWEP.BoltShootOffset = Vector(-1, 0, 0)
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_smg_mp5.mdl"
	SWEP.WMPos = Vector(0, 0, -1)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.48, 0, 0.81)
	SWEP.IronsightAng = Vector(-0.007, 0, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-3.201, 0, -0.913)
	SWEP.EoTechAng = Vector(0, -0.16, 0)
	
	SWEP.AimpointPos = Vector(3.18, 0, 0.6)
	SWEP.AimpointAng = Vector(-0.696, 0.059, 0)
	
	SWEP.MicroT1Pos = Vector(3.18, 0, 0.56)
	SWEP.MicroT1Ang = Vector(-0.281, 0.059, 0)
	
	SWEP.ACOGPos = Vector(-3.152, 0, -0.817)
	SWEP.ACOGAng = Vector(0.414, 0.07, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(3.012, 0, 0)
	SWEP.CustomizeAng = Vector(2.263, 16.429, 0)
	
	SWEP.SprintPos = Vector(2.884, -0.94, 0)
	SWEP.SprintAng = Vector(-3.747, 26.356, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-3.152, -1.566, -1.935), [2] = Vector(-0.129, -0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_cobram2"] = {model = "models/cw2/attachments/cobra_m2.mdl", bone = "body", rel = "", pos = Vector(-9.7, 0.25, 1.11), angle = Angle(0, 0, 0), size = Vector(0.89, 0.91, 0.89)}
		--["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "tag_weapon", rel = "", pos = Vector(-4.531, 0.317, -1.599), angle = Angle(-0, 90, 0), size = Vector(1.036, 1.036, 1.036)}
	}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0.5)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 0, roll = 0, forward = 1.5, pitch = 0.6}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = false
    SWEP.FullAimViewmodelRecoil = false
end

SWEP.MuzzleVelocity = 500 -- in meter/s

SWEP.SightBGs = {main = 1, none = 2}

SWEP.Attachments = {[1] = {header = "Barrel", offset = {-200, -200}, atts = {"md_cobram2"}},
	["+reload"] = {header = "Ammo", offset = {300, 200}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload1",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload1 = {[1] = {time = 0.15, sound = "CW_kiparis_MAGOUT"},
	[2] = {time = 0.2, sound = "CW_kiparis_MAGOUT2"},
	[3] = {time = 1.3, sound = "CW_kiparis_CLOTH"},
	[4] = {time = 1.45, sound = "CW_kiparis_MAGIN"},
	[5] = {time = 2, sound = "CW_kiparis_BOLT"}}}

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

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_smg_kiparis.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_mp5.mdl"
SWEP.UseHands       = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 280
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9X19MM"

SWEP.FireDelay = 0.055
SWEP.FireSound = "CW_kiparis_FIRE"
SWEP.FireSoundSuppressed = "CW_kiparis_FIRE_SUPPRESSED"
SWEP.Recoil = 0.6

SWEP.HipSpread = 0.060
SWEP.AimSpread = 0.0030
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.025
SWEP.SpreadPerShot = 0.035
SWEP.SpreadCooldown = 0.09
SWEP.Shots = 1
SWEP.Damage = 22
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 3.4
SWEP.ReloadTime_Empty = 3.4
SWEP.ReloadHalt = 3.4
SWEP.ReloadHalt_Empty = 3.4
SWEP.SnapToIdlePostReload = true