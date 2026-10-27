AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Tec-9"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.InvertShellEjectAngle = true
	SWEP.ShellPosOffset = {x = 2, y = 3, z = -2}
	SWEP.Shell = "smallshell"
	
	SWEP.IronsightPos = Vector(-3.155, 0, 1.799)
	SWEP.IronsightAng = Vector(-0.101, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(4.948, -2.366, 1.031)
	SWEP.CustomizeAng = Vector(0, 34.058, 0)
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_bfh_tec9.mdl"
    SWEP.WMPos = Vector(0.018, -1, -0.5)
    SWEP.WMAng = Vector(0, -10, 180)

	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_insight_x2"] = {model = "models/cw2/attachments/pistollaser.mdl", bone = "bfh_tec9", rel = "", pos = Vector(-0.03, 1.822, 3.448), angle = Angle(0, 90, 0), size = Vector(0.082, 0.082, 0.082)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "bfh_tec9", rel = "", pos = Vector(-0.03, -4.646, 2.456), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)}
		}
	
	SWEP.LaserPosAdjust = Vector(0, 0, -0.7)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 0, roll = 0, forward = 1.5, pitch = 0.6}
	
	SWEP.LuaViewmodelRecoil = false
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = false
end

SWEP.BoltBone = "bfhtec9_bolt"
SWEP.BoltShootOffset = Vector(0, 1.4, 0)

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.SightBGs = {main = 1, none = 2}

SWEP.Attachments = {[2] = {header = "Barrel", offset = {-500, -300}, atts = {"md_saker"}},
	[1] = {header = "Rail", offset = {0, 100}, atts = {"md_insight_x2"}},
	["+reload"] = {header = "Ammo", offset = {700, 200}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shot12", "shot13"},
	reload = "reload",
	idle = "idle1",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.32, sound = "CW_TEC_CLOTHMAGOUT"},
	[2] = {time = 0.32, sound = "CW_TEC_MAGOUT"},
	[3] = {time = 0.42, sound = "CW_TEC_CLOTHNEWMAG"},
	[4] = {time = 1.3, sound = "CW_TEC_IN"},
	[5] = {time = 1.3, sound = "CW_TEC_CLOTHMAGIN"},
	[6] = {time = 1.5, sound = "CW_TEC_IN2"},
	[7] = {time = 1.8, sound = "CW_TEC_CLOTHRANDOM"},
	[8] = {time = 2.3, sound = "CW_TEC_PULL"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
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
SWEP.ViewModel		= "models/weapons/v_bfh_tec9.mdl"
SWEP.WorldModel		= "models/weapons/w_bfh_tec9.mdl"
SWEP.UseHands       = false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 32
SWEP.Primary.DefaultClip	= 90
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.09
SWEP.FireSound = "CW_TEC_FIRE"
SWEP.FireSoundSuppressed = "CW_TEC_FIRE_SUPPRESSED"
SWEP.Recoil = 0.88

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.0025
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.040
SWEP.SpreadPerShot = 0.0060
SWEP.SpreadCooldown = 0.08
SWEP.Shots = 1
SWEP.Damage = 24
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 2.0
SWEP.ReloadTime_Empty = 2.9
SWEP.ReloadHalt = 1.5
SWEP.ReloadHalt_Empty = 2.9
SWEP.SnapToIdlePostReload = true