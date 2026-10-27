AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Remington 870 Tactical"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "k"
	killicon.AddFont("cw_ump45", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
    SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = 1, y = 45, z = -1}
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	SWEP.ShellDelay = 0.3
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_shot_Remington_870_Tactical.mdl"
	SWEP.WMPos = Vector(-1, 1.5, 0)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = true
		
	SWEP.IronsightPos = Vector(-2.017, 4.829, 1.169)
	SWEP.IronsightAng = Vector(0.423, 0.039, 0)
	
	SWEP.MicroT1Pos = Vector(-2.03, 8, 0.649)
	SWEP.MicroT1Ang = Vector(0.1, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.01, -0.478, 0.296)
	SWEP.EoTechAng = Vector(0.05, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.03, -0.805, 0.56)
	SWEP.AimpointAng = Vector(-0.004, 0, 0)
			
	SWEP.ACOGPos = Vector(-2.599, -4.803, -0.109)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-2.01, 6, 0.963)
	SWEP.RMRAng = Vector(-0.61, 0, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)
		
	SWEP.CustomizePos = Vector(7.711, -0.482, -2)
	SWEP.CustomizeAng = Vector(16.364, 40.741, 15.277)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.593, -4.803, -1.12), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.016
	SWEP.ReticleInactivityPostFire = 0.76

	SWEP.AttachmentModelsVM = {
		--["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Gun", rel = "", pos = Vector(0, -6.659, -1.701), angle = Angle(0, 180, 0), size = Vector(0.823, 0.823, 0.823)},
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Gun", rel = "", pos = Vector(0.275, 1.289, -2.741), angle = Angle(0, 90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Gun", rel = "", pos = Vector(0, -1.558, 1.557), angle = Angle(0, 0, 0), size = Vector(0.367, 0.367, 0.367), color = Color(255, 255, 255, 255)},
        ["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Gun", rel = "", pos = Vector(-0.116, 8.517, -8.681), angle = Angle(0, 90.807, 0), size = Vector(0.95, 0.95, 0.95)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Gun", rel = "", pos = Vector(-0.18, -6.545, -2.75), angle = Angle(0, 0, 0), size = Vector(0.755, 0.755, 0.755)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.MuzzleVelocity = 381 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech"}},
	--[2] = {header = "Barrel", offset = {-600, -300}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {-200, 300}, atts = {"am_slugrounds", "am_flechetterounds"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.05, sound = "CW_FOLEY_LIGHT"}},
	insert = {{time = 0.1, sound = "CW_M3SUPER90_INSERT"}},
	
	after_reload = {{time = 0.15, sound = "CW_870_PUMP_FOLEY"},
	{time = 0.6, sound = "CW_FOLEY_LIGHT"}},
	
	draw = {{time = 0, sound = "CW_870_PUMP_FOLEY"}}}

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

SWEP.ViewModelFOV	= 75
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_shot_Remington_870_Tactical.mdl"
SWEP.WorldModel		= "models/weapons/w_shot_Remington_870_Tactical.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.9
SWEP.FireSound = "cw_Remington_870_Tactical-fire"
SWEP.FireSoundSuppressed = "CW_BO2_870MCS_SUPPRESSED"
SWEP.Recoil = 3

SWEP.HipSpread = 0.06
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.014
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.7
SWEP.Shots = 10
SWEP.Damage = 15
SWEP.DeployTime = 0.8

SWEP.ReloadStartTime = 0.3
SWEP.InsertShellTime = 0.5
SWEP.ReloadFinishWait = 1
SWEP.PumpMidReloadWait = 0.5
SWEP.ShotgunReload = true

SWEP.Chamberable = true