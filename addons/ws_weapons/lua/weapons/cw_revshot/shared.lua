AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Auto-Shotgun"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.7
	
	SWEP.IconLetter = "q"
	killicon.AddFont("cw_ump45", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = -1, y = 15, z = 25}
	SWEP.SnapToGrip = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_revolvershotty.mdl"
	SWEP.WMPos = Vector(-1, 0.5, -0.5)
	SWEP.WMAng = Vector(-5, 5, 180)
	
	SWEP.NoShells = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
		
	SWEP.IronsightPos = Vector(-3.748, -5.716, 1.253)

	SWEP.IronsightAng = Vector(-0.097, 0.003, -0.26)
	
	SWEP.MicroT1Pos = Vector(-3.754, -8.452, 0.63)

	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-3.767, -8.886, 0.414)

	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.CoD4ReflexPos = Vector(-3.764, -8.718, 0.592)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)

	SWEP.LeupoldPos = Vector(-3.744, -7.163, 0.493)

	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-3.727, -8.761, 0.569)

	SWEP.AimpointAng = Vector(0, 0.142, 0)
			
	SWEP.CSGOACOGPos = Vector(-3.728, -7.839, 0.412)


	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)
		
	SWEP.CustomizePos = Vector(7.711, -0.482, -2)
	SWEP.CustomizeAng = Vector(16.364, 40.741, 15.277)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.274, -2.335, -1.85), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = true
	SWEP.CSGOACOGAxisAlign = {right = -1, up = 0, forward = -40}
	SWEP.LeupoldAxisAlign = {right = -0.020, up = -0.050, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.010
	SWEP.ReticleInactivityPostFire = 0.6

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "muzzleflash", rel = "", pos = Vector(0.321, -1.584, 0.134), angle = Angle(-90, 0, -90), size = Vector(0.6, 0.6, 0.6)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "muzzleflash", rel = "", pos = Vector(-3.274, 2.523, -0.172), angle = Angle(0, 0, -90), size = Vector(0.699, 0.699, 0.699)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "muzzleflash", rel = "", pos = Vector(8.89, -4.184, 2.378), angle = Angle(0, -90, 180), size = Vector(0.8, 0.8, 0.8)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "muzzleflash", rel = "", pos = Vector(1.771, -2.961, 0.007), angle = Angle(180, 0, -90), size = Vector(0.6, 0.6, 0.6)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "muzzleflash", rel = "", pos = Vector(3.336, -5.7, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "muzzleflash", rel = "", pos = Vector(3.536, -5.698, -0.01), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},
		["md_rail"] = {model = "models/wystan/attachments/rail.mdl", bone = "muzzleflash", rel = "", pos = Vector(4.736, -3.602, 0.184), angle = Angle(0, 0, -90), size = Vector(0.75, 0.75, 0.75)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "muzzleflash", rel = "", pos = Vector(3.845, -5.094, -0.008), angle = Angle(90, 0, -90), size = Vector(0.25, 0.25, 0.25)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "muzzleflash", rel = "", pos = Vector(-0.131, -2.291, -0.065), angle = Angle(0, 0, -90), size = Vector(0.6, 0.6, 0.6)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.ADSFireAnim = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {-100, -3000}, atts = {"md_microt1", "md_eotech", "md_aimpoint"}},
	[2] = {header = "Silencer", offset = {-600, -3000}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {500, -2500}, atts = {"am_slugrounds", "am_flechetterounds"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.01, sound = "CW_REVSHOT_OUT"}},
	insert = {{time = 0.02, sound = "CW_REVSHOT_INSERT"}},
	
	after_reload = {{time = 0.1, sound = "CW_REVSHOT_IN"}},
	
	draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"double"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Cold War"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_revolvershotty.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_revolvershotty.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 24
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.02
SWEP.FireSound = "CW_REVSHOT_FIRE"
SWEP.FireSoundSuppressed = "CW_REVSHOT_FIRE_SUPPRESSED"
SWEP.Recoil = 3

SWEP.HipSpread = 0.08
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.018
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 12
SWEP.Damage = 20
SWEP.DeployTime = 0.7

SWEP.ReloadStartTime = 0.25
SWEP.InsertShellTime = 0.35
SWEP.ReloadFinishWait = 0.5
SWEP.ShotgunReload = true

SWEP.Chamberable = false