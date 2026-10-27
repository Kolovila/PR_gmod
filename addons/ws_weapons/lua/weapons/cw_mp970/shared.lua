AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MP-970"
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
	SWEP.ShellPosOffset = {x = 4, y = -6, z = 0}
	
	SWEP.IronsightPos = Vector(-4.04, -3.32, 0.699)
	SWEP.IronsightAng = Vector(-0.7, 0.05, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(3.339, -4.624, -0.88)
	SWEP.EoTechAng = Vector(-1.93, 0.068, 0)
	
	SWEP.AimpointPos = Vector(3.279, -7.84, -0.681)
	SWEP.AimpointAng = Vector(-0.341, -0.281, 0)
	
	SWEP.MicroT1Pos = Vector(-4, 0, -0.48)
	SWEP.MicroT1Ang = Vector(-0.036, 0.053, 0)

	SWEP.ACOGPos = Vector(3.42, -3.619, -1.053)
	SWEP.ACOGAng = Vector(0.273, 0.486, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(5.995, 0, -1.372)
	SWEP.CustomizeAng = Vector(9.418, 20.614, 0)
	
	SWEP.SprintPos = Vector(1.546, -0.74, -10.5)
	SWEP.SprintAng = Vector(40.273, -9.16, 0)
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_f3ar_mp970.mdl"
    SWEP.WMPos = Vector(0.018, 0.079, 0)
    SWEP.WMAng = Vector(0, -10, 180)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(3.42, -3.619, -1.999), [2] = Vector(-0.401, 0.439, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.2, up = 0.15, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "tag_weapon", rel = "", pos = Vector(1.909, 0.2, 3.526), angle = Angle(0, 90, 0), size = Vector(0.532, 0.532, 0.532)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "tag_weapon", rel = "", pos = Vector(3.711, -1.124, 1.277), angle = Angle(0, -180, 90), size = Vector(0.5, 0.5, 0.5)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "tag_weapon", rel = "", pos = Vector(-3.833, 0.1, -0.76), angle = Angle(0, 90, 0), size = Vector(0.754, 0.754, 0.754)}
	}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, -0.1)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 0, roll = 0, forward = 1.5, pitch = 0.6}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = false
	SWEP.ADSFireAnim = true

end

SWEP.BoltBone = "tag_ads"
SWEP.BoltShootOffset = Vector(-1, 0, 0)

SWEP.MuzzleVelocity = 660 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {500, -500}, atts = {"md_microt1"}},
	[3] = {header = "Rail", offset = {-100, 200}, atts = {"md_anpeq15"}},
	[2] = {header = "Barrel", offset = {-500, -200}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {700, 500}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"mac10_fire", "mac10_fire2"},
	reload = "mac10_reload",
	idle = "mac10_idle",
	draw = "mac10_draw"}
	
SWEP.Sounds = {mac10_draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	mac10_reload = {[1] = {time = 0.2, sound = "CW_WEEVIL_CLOTH2"},
	[2] = {time = 0.2, sound = "CW_mp970_MAGOUT"},
	[3] = {time = 0.90, sound = "CW_mp970_CLOTH"},
	[4] = {time = 1.7, sound = "CW_mp970_MAGIN"},
	[5] = {time = 1.7, sound = "CW_mp970_CLOTH1"},
	[6] = {time = 1.8, sound = "CW_mp970_CLOTH4"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_f3ar_mp970.mdl"
SWEP.WorldModel		= "models/weapons/w_f3ar_mp970.mdl"
SWEP.UseHands       = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 35
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.075
SWEP.FireSound = "CW_mp970_FIRE"
SWEP.FireSoundSuppressed = "CW_mp970_FIRE_SUPPRESSED"
SWEP.Recoil = 0.7

SWEP.HipSpread = 0.060
SWEP.AimSpread = 0.0030
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.060
SWEP.SpreadPerShot = 0.0080
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 26
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 2.3
SWEP.ReloadTime_Empty = 2.3
SWEP.ReloadHalt = 2.3
SWEP.ReloadHalt_Empty = 2.3
SWEP.SnapToIdlePostReload = true