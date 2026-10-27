AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Remington 870 MCS"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "k"
	killicon.AddFont("cw_ump45", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	SWEP.ShellPosOffset = {x = 0, y = 0, z = -1}
	SWEP.ShellDelay = 0.52
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_shot_870mcs.mdl"
	SWEP.WMPos = Vector(-1, 1.5, 0)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = false
		
	SWEP.IronsightPos = Vector(-2.656, 0, 0.929)
	SWEP.IronsightAng = Vector(-0.2, -0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.612, 0, 0.314)
	SWEP.MicroT1Ang = Vector(0, 0.268, 0)
	
	SWEP.EoTechPos = Vector(-2.744, 0, 0)
	SWEP.EoTechAng = Vector(-0.42, -0.6, 0)
	
	SWEP.AimpointPos = Vector(-2.649, -1.407, 0.182)
	SWEP.AimpointAng = Vector(0.349, 0, 0)

	SWEP.ACOGPos = Vector(-2.599, -4.803, -0.109)
	SWEP.ACOGAng = Vector(1, 0, 0)
	
	SWEP.RMRPos = Vector(-2.688, 0, 1.23)
	SWEP.RMRAng = Vector(-2.498, -0.253, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)
		
	SWEP.CustomizePos = Vector(7.711, -0.482, -2)
	SWEP.CustomizeAng = Vector(16.364, 35, 15.277)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.593, -3.803, -1), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.016
	SWEP.ReticleInactivityPostFire = 0.6

	SWEP.AttachmentModelsVM = {
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Spas_Body", rel = "", pos = Vector(-2.56, -9.084, -0.801), angle = Angle(4.267, 180, 0), size = Vector(0.911, 0.911, 0.911)},
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Spas_Body", rel = "", pos = Vector(-2.691, -7.139, 6.144), angle = Angle(0, 90, 180), size = Vector(0.906, 0.906, 0.906)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Spas_Body", rel = "", pos = Vector(-2.62, -5.235, 6.828), angle = Angle(0, 0, 180), size = Vector(1.031, 1.031, 1.031)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Spas_Body", rel = "", pos = Vector(-2, 2.848, 15.119), angle = Angle(0, 90, 180), size = Vector(1.312, 1.312, 1.312)},
		["md_microt1"] = {model =  "models/cw2/attachments/microt1.mdl", bone = "Spas_Body", rel = "", pos = Vector(-2.401, -11.566, 0.788), angle = Angle(0, 0, -180), size = Vector(0.448, 0.448, 0.448)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Spas_Body", pos = Vector(-0.646, -0.941, 0.007), angle = Angle(0, 0, 180), size = Vector(0.899, 0.899, 0.899)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.MuzzleVelocity = 381 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech"}},
	[2] = {header = "Barrel", offset = {-300, -300}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {-200, 300}, atts = {"am_slugrounds", "am_flechetterounds"}}}


SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.05, sound = "CW_FOLEY_LIGHT"}},
	insert = {{time = 0.1, sound = "CW_870mcs_INSERT"}},
	
	after_reload = {{time = 0.30, sound = "CW_870mcs_BACK"},
	{time = 0.45, sound = "CW_870mcs_RELEASE"},
	{time = 0.7, sound = "CW_FOLEY_LIGHT"}},
	
	shoot1 = {{time = 0.43, sound = "CW_870mcs_BACK"},
	{time = 0.60, sound = "CW_870mcs_RELEASE"},
	{time = 0.7, sound = "CW_FOLEY_LIGHT"}},
	
	shoot2 = {{time = 0.38, sound = "CW_870mcs_BACK"},
	{time = 0.60, sound = "CW_870mcs_RELEASE"},
	{time = 0.7, sound = "CW_FOLEY_LIGHT"}},
	
	draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"},
	{time = 0.65, sound = "CW_870mcs_BACK"},
    {time = 0.85, sound = "CW_870mcs_RELEASE"},
	{time = 0.7, sound = "CW_FOLEY_LIGHT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"pump"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_shot_870mcs.mdl"
SWEP.WorldModel		= "models/weapons/w_shot_870mcs.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.9
SWEP.FireSound = "CW_BO2_870MCS"
SWEP.FireSoundSuppressed = "CW_BO2_870MCS_SUPPRESSED"
SWEP.Recoil = 2.0

SWEP.HipSpread = 0.03
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.03
SWEP.ClumpSpread = 0.01
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.5
SWEP.Shots = 12
SWEP.Damage = 12
SWEP.DeployTime = 1

SWEP.ReloadStartTime = 0.35
SWEP.InsertShellTime = 0.6
SWEP.ReloadFinishWait = 1
SWEP.PumpMidReloadWait = 0.65
SWEP.ShotgunReload = true

SWEP.Chamberable = true