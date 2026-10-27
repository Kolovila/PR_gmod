AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Mare's Leg"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "k"
	killicon.AddFont("cw_ump45", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	SWEP.ShellDelay = 0.3
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_bf4_maresleg.mdl"
	SWEP.WMPos = Vector(-1, 1.5, 0)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.ShellPosOffset = {x = -3, y = -1, z = 2}

	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = false
		
	SWEP.IronsightPos = Vector(4.56, 0, 2.4)
	SWEP.IronsightAng = Vector(0.1, 0, 0)
	
	SWEP.MicroT1Pos = Vector(4.579, 0, 1.495)
	SWEP.MicroT1Ang = Vector(0.1, 0.119, 0)
	
	SWEP.EoTechPos = Vector(-2.613, -4.803, -0.06)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(4.584, 0, 1.3)
	SWEP.AimpointAng = Vector(0.74, 0.05, 0)
			
	SWEP.ACOGPos = Vector(-2.599, -4.803, -0.109)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.NXSPos = Vector(4.559, 0, 1.32)
	SWEP.NXSAng = Vector(1.309, -0.141, 0)
	
	SWEP.SprintPos = Vector(-3.988, 0, 0)
	SWEP.SprintAng = Vector(-5.553, -25.365, 0)
		
	SWEP.CustomizePos = Vector(-5.54, -0.8, -0.764)
	SWEP.CustomizeAng = Vector(21.302, -28.997, -18.444)
	
	SWEP.PronePos = Vector(-2.905, 0, -1.89)
	SWEP.ProneAng = Vector(4.223, -19.925, 0)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.593, -4.803, -1.12), [2] = Vector(0, 0, 0)}}

	SWEP.NXSAlign = {right = 0.7, up = -0.1, forward = 0}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.016
	SWEP.ReticleInactivityPostFire = 0.78

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.AttachmentModelsVM = {
	    ["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "gun", rel = "", pos = Vector(-1.778, 2.352, 0.059), angle = Angle(0, 0, 90), size = Vector(1.123, 1.123, 1.123)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "gun", rel = "", pos = Vector(7.006, -5.474, 0.495), angle = Angle(-90, 0, 90.896), size = Vector(1.182, 1.182, 1.182)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "gun", rel = "", pos = Vector(-3.053, 1.32, 0.2), angle = Angle(-90, -0.178, 90), size = Vector(0.518, 0.518, 0.518)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "gun", rel = "", pos = Vector(-1.26, -0.097, 0.961), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)}
	}
	
end

SWEP.MuzzleVelocity = 381 -- in meter/s

--SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -100}, atts = {"md_microt1", "md_aimpoint"}},
	[2] = {header = "Rail", offset = {600, 400}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {-200, 300}, atts = {"am_slugrounds", "am_flechetterounds"}}}
	

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.05, sound = "CW_FOLEY_LIGHT"}},
	insert = {{time = 0.15, sound = "CW_MARESLEG_INSERT"}},
	
	after_reload = {{time = 0.1, sound = "CW_MARESLEG_PUMP"},
	{time = 0.6, sound = "CW_FOLEY_LIGHT"}},
	
	shoot1 = {{time = 0.4, sound = "CW_MARESLEG_PUMP"}},
	shoot2 = {{time = 0.4, sound = "CW_MARESLEG_PUMP"}},
	
	draw = {{time = 0.2, sound = "CW_MARESLEG_PUMP"}}}
	

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
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/v_bf4_maresleg.mdl"
SWEP.WorldModel		= "models/weapons/w_bf4_maresleg.mdl"
SWEP.UseHands = false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 12
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 1.0
SWEP.FireSound = "CW_MARESLEG_FIRE"
SWEP.Recoil = 1.2

SWEP.HipSpread = 0.00040
SWEP.AimSpread = 0.00010
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.0020
SWEP.ClumpSpread = 0.0060
SWEP.SpreadPerShot = 0.001
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 70
SWEP.DeployTime = 1

SWEP.ReloadStartTime = 0.3
SWEP.InsertShellTime = 0.5
SWEP.ReloadFinishWait = 1
SWEP.PumpMidReloadWait = 0.6
SWEP.ShotgunReload = true

SWEP.Chamberable = true