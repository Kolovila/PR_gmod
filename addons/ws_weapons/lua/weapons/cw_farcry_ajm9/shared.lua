AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AJM-9"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_SUPPRESSED"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "smallshell"
	SWEP.ShellPosOffset = {x = 5, y = 0, z = 0}
	
	SWEP.IronsightPos = Vector(2.322, 0, 0.72)
	SWEP.IronsightAng = Vector(-0.201, 0.2, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(-7.161, 0, 0)
	SWEP.CustomizeAng = Vector(3.283, -21.452, 0)
	
	SWEP.SprintPos = Vector(-3.457, -7.472, -11.86)
	SWEP.SprintAng = Vector(61.694, 4.276, 0)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-40.8947, 35.0455, -25.2273)
	
	SWEP.PronePos = Vector(-6.525, -3.544, -5.35)
	SWEP.ProneAng = Vector(2.714, -28.521, 16.284)
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_fc4_ajm9.mdl"
	SWEP.WMPos = Vector(-1, 1.5, 0)
	SWEP.WMAng = Vector(0, 0, 180)
	
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
end

SWEP.BoltBone = "j_bolt"
SWEP.BoltShootOffset = Vector(2, 0, 0)

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.SightBGs = {main = 1, none = 2}

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {700, 200}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"fire"},
	reload = "reload_2_1",
	idle = "idle_3_1",
	draw = "draw_2_1"}
	
SWEP.Sounds = {draw_2_1 = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},
    draw_2_1 = {{time = 0.6, sound = "CW_AJM9_SAFE"}},

	reload_2_1 = {[1] = {time = 0.2, sound = "CW_AJM9_CLOTH1"},
	[2] = {time = 0.3, sound = "CW_AJM9_MAGOUT"},
	[3] = {time = 0.4, sound = "CW_AJM9_CLOTH"},
	[4] = {time = 1.0, sound = "CW_AJM9_MAGIN"},
	[5] = {time = 1.6, sound = "CW_AJM9_SLIDE"},
	[6] = {time = 1.6, sound = "CW_AJM9_CLOTH2"}}}

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
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/v_fc4_ajm9.mdl"
SWEP.WorldModel		= "models/weapons/w_fc4_ajm9.mdl"
SWEP.UseHands       = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.06
SWEP.FireSound = "CW_AJM9_FIRE"
SWEP.FireSoundSuppressed = "CW_MP5_FIRE_SUPPRESSED"
SWEP.Recoil = 0.80

SWEP.HipSpread = 0.070
SWEP.AimSpread = 0.0060
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.060
SWEP.SpreadPerShot = 0.0070
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 17
SWEP.DeployTime = 1.0

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 2.1
SWEP.ReloadTime_Empty = 2.1
SWEP.ReloadHalt = 2.1
SWEP.ReloadHalt_Empty = 2.1
SWEP.SnapToIdlePostReload = true