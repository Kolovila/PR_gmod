AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Browning Auto-5"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "k"
	killicon.AddFont("cw_ump45", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.6
	SWEP.ShellOffsetMul = 9
	SWEP.Shell = "shotshell"
	SWEP.InvertShellEjectAngle = true
	SWEP.ShellDelay = 0.3
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_shot_xm1014.mdl"
	SWEP.WMPos = Vector(-1, 13, -2)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.ShellPosOffset = {x = 50, y = 20, z = 5}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = false
		
	SWEP.IronsightPos = Vector(1.945, 0, 1.401)
	SWEP.IronsightAng = Vector(-0.145, -0.051, 0)
	
	SWEP.MicroT1Pos = Vector(-2.618, 0, 0.25)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.613, -4.803, -0.06)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.613, -4.803, 0.064)
	SWEP.AimpointAng = Vector(0, 0, 0)
			
	SWEP.ACOGPos = Vector(-2.599, -4.803, -0.109)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-3.988, 0, 0)
	SWEP.SprintAng = Vector(-5.553, -25.365, 0)
		
	SWEP.CustomizePos = Vector(-5.54, 0.516, -0.764)
	SWEP.CustomizeAng = Vector(21.302, -28.997, -18.444)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.593, -4.803, -1.12), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.016
	SWEP.ReticleInactivityPostFire = 0.6

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.MuzzleVelocity = 381 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = true

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {-200, 300}, atts = {"am_slugrounds", "am_flechetterounds"}}}

SWEP.Animations = {fire = {"shoot1"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.05, sound = "CW_FOLEY_LIGHT"}},
	insert = {{time = 0.1, sound = "CW_auto5_INSERT"}},
	
	after_reload = {{time = 0.1, sound = ""},
	{time = 0.6, sound = "CW_FOLEY_LIGHT"}},
	
	draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"},
	{time = 0, sound = "CW_auto5_HANDLE"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/v_shot_auto5.mdl"
SWEP.WorldModel		= "models/weapons/w_shot_xm1014.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.2
SWEP.FireSound = "CW_SERBU_SHORTY_FIRE"
SWEP.Recoil = 2

SWEP.HipSpread = 0.06
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.05
SWEP.ClumpSpread = 0.014
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.4
SWEP.Shots = 12
SWEP.Damage = 11
SWEP.DeployTime = 1

SWEP.ReloadStartTime = 0.3
SWEP.InsertShellTime = 0.6
SWEP.ReloadFinishWait = 1
SWEP.PumpMidReloadWait = 0.6
SWEP.ShotgunReload = true

SWEP.Chamberable = true