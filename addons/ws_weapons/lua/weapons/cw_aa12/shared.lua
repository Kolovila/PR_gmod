AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AA-12"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.6
	
	SWEP.IconLetter = "q"
	killicon.AddFont("cw_ump45", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_shotgun"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_shot_aa12.mdl"
	SWEP.WMPos = Vector(-0.5, -4.7, -1)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = false
		
	SWEP.IronsightPos = Vector(-2.839, -3.266, 0.277)
	SWEP.IronsightAng = Vector(0.21, 0.187, 0)
	
	SWEP.MicroT1Pos = Vector(-2.866, -1.089, 0.246)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(-2.86, -1.089, 0.379)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.859, -3.136, 0.087)
	SWEP.EoTechAng = Vector(2.819, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.869, -2.268, 0.224)
	SWEP.AimpointAng = Vector(0, 0, 0)
			
	SWEP.CSGOACOGPos = Vector(-2.836, -0.737, 0.212)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.639, 0, -2.487)
	SWEP.SprintAng = Vector(-5.96, 34.479, -20.799)
		
	SWEP.CustomizePos = Vector(7.711, -0.482, -2)
	SWEP.CustomizeAng = Vector(16.364, 40.741, 15.277)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.274, -2.335, -1.85), [2] = Vector(0, 0, 0)}}

	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.016

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "MASTER", rel = "", pos = Vector(-0.051, -9.4, -2.642), angle = Angle(0, 0, 0), size = Vector(1.2, 1.2, 1.2)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "MASTER", rel = "", pos = Vector(0.537, -12.764, -6.545), angle = Angle(0, -90, 0)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "MASTER", rel = "", pos = Vector(0.25, -0.218, -0.352), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "MASTER", rel = "", pos = Vector(0.268, -6.296, 0.893), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "MASTER", rel = "", pos = Vector(-11.712, 6.267, -1.252), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "MASTER", rel = "", pos = Vector(0.34, -10.233, -0.345), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_rail"] = {model = "models/wystan/attachments/rail.mdl", bone = "Spas_Body", pos = Vector(-2.064, -11.19, 2.654), angle = Angle(0, -90, 180), size = Vector(0.6, 1.1, 1)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "MASTER", rel = "", pos = Vector(0.275, -2.004, 4.412), angle = Angle(0, 180, 0), size = Vector(0.55, 0.55, 0.55)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Spas_Body", pos = Vector(-2.646, -4.941, 5.907), angle = Angle(0, 0, 180), size = Vector(0.899, 0.899, 0.899)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = 1, forward = 2, pitch = 1}
	
	SWEP.ForeGripHoldPos = {
	["l-ring-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(4.318, 8.911, 0) },
	["l-thumb-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10.588, -16.872, 2.88) },
	["l-pinky-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-47.883, 12.588, 0) },
	["l-thumb-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(24.903, 0, 0) },
	["l-middle-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(42.594, -11.881, 0) },
	["l-pinky-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(23.885, 0, 0) },
	["l-ring-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(25.17, -1.884, 0) },
	["l-middle-tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(76.198, 0, 0) },
	["l-forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-6.921, -73.523, 0) },
	["l-index-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(105.025, 0, 0) },
	["l-middle-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(22.378, 0, 0) },
	["l-ring-tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50.422, 0, 0) },
	["l-thumb-tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(58.978, 0, 0) },
	["l-pinky-tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(20, 0, 0) },
	["lwrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-3.274, 23.788, 23.429) },
	["l-upperarm-movement"] = { scale = Vector(1, 1, 1), pos = Vector(-7.364, 2.226, 0.781), angle = Angle(-16.747, -48.945, 78.185) },
	["l-index-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(47.136, 7.512, 0) }
	}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = false
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_microt1", "md_eotech", "md_aimpoint"}},
	[2] = {header = "Silencer", offset = {-300, -500}, atts = {"md_saker"}},
	[3] = {header = "Grip", offset = {-300, 0}, atts = {"md_foregrip"}},
	["+reload"] = {header = "Ammo", offset = {800, 300}, atts = {"am_slugrounds", "am_flechetterounds"}}}
	
SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.35, sound = "CW_AA12_MAGOUT"},
	[2] = {time = 1.63, sound = "CW_AA12_MAGIN"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Cold War"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_shot_aa12.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_shot_aa12.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 24
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.15
SWEP.FireSound = "CW_AA12_FIRE"
SWEP.FireSoundSuppressed = "CW_AA12_FIRE_SUPPRESSED"
SWEP.Recoil = 2.03

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.045
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 12
SWEP.Damage = 17
SWEP.DeployTime = 0.7

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 1.75
SWEP.ReloadTime_Empty = 1.75
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 1.9

SWEP.Chamberable = false