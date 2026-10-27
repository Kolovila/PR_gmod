AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Model 1887/1901"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.5
	
	SWEP.IconLetter = "q"
	killicon.AddFont("cw_ump45", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	SWEP.ShellDelay = 0.5
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_shot_model1887.mdl"
	SWEP.WMPos = Vector(-0.5, 3, -0.3)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.ShellPosOffset = {x = -1, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = true
		
	SWEP.IronsightPos = Vector(4.514, -5.996, 0.861)
	SWEP.IronsightAng = Vector(1.391, -0.124, 0.479)
	
	SWEP.MicroT1Pos = Vector(-2.618, -4.803, 0.25)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.613, -4.803, -0.06)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.613, -4.803, 0.064)
	SWEP.AimpointAng = Vector(0, 0, 0)
			
	SWEP.ACOGPos = Vector(-2.599, -4.803, -0.109)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-2.01, -2.412, -0.202)

	SWEP.SprintAng = Vector(-19.698, -28.844, 24.622)
		
	SWEP.CustomizePos = Vector(-7.437, -1.206, -1.407)
	SWEP.CustomizeAng = Vector(13.317, -28.67, -18.292)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.274, -2.335, -1.85), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = true
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.016
	SWEP.ReticleInactivityPostFire = 0.6

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Spas_Body", pos = Vector(-2.589, -4.256, 6.44), angle = Angle(0, 0, 180), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Spas_Body", pos = Vector(-2.053, 0.184, 12.067), angle = Angle(-3.333, 90, 180), size = Vector(1, 1, 1)},
		["md_rail"] = {model = "models/wystan/attachments/rail.mdl", bone = "Spas_Body", pos = Vector(-2.064, -11.19, 2.654), angle = Angle(0, -90, 180), size = Vector(0.6, 1.1, 1)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Spas_Body", pos = Vector(-2.32, -10.438, 0.635), angle = Angle(0, -180, -180), size = Vector(0.4, 0.4, 0.4)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Spas_Body", pos = Vector(-2.646, -4.941, 5.907), angle = Angle(0, 0, 180), size = Vector(0.899, 0.899, 0.899)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 2, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = true

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {800, -300}, atts = {"am_slugrounds", "am_flechetterounds"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.05, sound = "CW_MODEL1887_OPEN"}},
	insert = {{time = 0.1, sound = "CW_MODEL1887_INSERT"}},
	
	after_reload = {{time = 0.15, sound = "CW_MODEL1887_CLOSE"},
	{time = 0.3, sound = "CW_FOLEY_LIGHT"}},

	shoot1 = {{time = 0.4, sound = "CW_MODEL1887_PUMP"}},

	shoot2 = {{time = 0.4, sound = "CW_MODEL1887_PUMP"}},
	
	draw = {{time = 0.1, sound = "CW_MODEL1887_PUMP"}}}
	
SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"pump"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] WW1"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_shot_model1887.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_shot_model1887.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 28
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 1
SWEP.FireSound = "CW_MODEL1887_FIRE"
SWEP.Recoil = 3

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.04
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 12
SWEP.Damage = 24
SWEP.DeployTime = 0.7

SWEP.ReloadStartTime = 0.3
SWEP.InsertShellTime = 0.5
SWEP.ReloadFinishWait = 1
SWEP.ShotgunReload = true

SWEP.Chamberable = true