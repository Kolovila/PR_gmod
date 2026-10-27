AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SMG9"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.2
	SWEP.MoveType = 1
	
	SWEP.IconLetter = "x"
	killicon.AddFont("cw_mp5", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 2, z = -1}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87
	
	SWEP.IronsightPos = Vector(-2.172, -2, 0.583)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.ZoomAmount = 0
	
	SWEP.ReloadViewBobEnabled = false
		
	SWEP.PronePos = Vector(-7.397, -2.497, -1.551)
	SWEP.ProneAng = Vector(5.618, -49.056, -15.311)
	
	SWEP.MicroT1Pos = Vector(-2.189, 3.447, 0.039)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
		
	SWEP.EoTechPos = Vector(-2.168, -0.375, -0.16)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.172, -0.375, -0.101)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.165, 0, -0.24)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-1.201, 0, -1.4)
	SWEP.SprintAng = Vector(-5.257, 15.923, -28.965)

	SWEP.CustomizePos = Vector(9.93, -4.309, 1.12)
	SWEP.CustomizeAng = Vector(35.691, 39.783, 47.401)
	
	SWEP.AlternativePos = Vector(-0.868, 0, -1.1989)
	SWEP.AlternativeAng = Vector(0, 0, 0)
		
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.165, 0, -1.144), [2] = Vector(0, 0, 0)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = 5, forward = 1, pitch = 0}
	--SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.SprintViewNormals = {x = 1, y = -1, z = 1}

	SWEP.AttachmentModelsVM = {
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "default", rel = "", pos = Vector(-0.189, -1.144, 3.082), angle = Angle(0, 0, 0), size = Vector(0.37, 0.37, 0.37)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "default", rel = "", pos = Vector(-0.445, 10.219, -7.023), angle = Angle(0, 90, 0), size = Vector(0.925, 0.925, 0.925)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "default", rel = "", pos = Vector(0.652, -10.158, 1.187), angle = Angle(0, -90, -90), size = Vector(0.5, 0.5, 0.5)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "default", rel = "", pos = Vector(0.048, 5.583, -2.316), angle = Angle(0, -180, 0), size = Vector(0.925, 0.925, 0.925)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "default", rel = "", pos = Vector(0.108, 4.433, -1.839), angle = Angle(0, 180, 0), size = Vector(0.832, 0.832, 0.832)},
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "default", rel = "", pos = Vector(-0.200, -13.971, 0.379), angle = Angle(0, 0, 0), size = Vector(0.85, 0.85, 0.85)},
		
	}
	
	SWEP.LaserPosAdjust = {x = -0.5, y = 0, z = 0.5}
	SWEP.LaserAngAdjust = {p = 0, y = 181, r = 0}
	SWEP.CustomizationMenuScale = 0.012
end

SWEP.MuzzleVelocity = 400 -- in meter/s

SWEP.BarrelBGs = {main = 2, sd = 1, k = 2, regular = 0}
SWEP.StockBGs = {main = 1, regular = 0, retractable = 1, none = 2}
SWEP.RailBGs = {main = 3, on = 1, off = 0}
SWEP.MagBGs = {main = 4, round15 = 0, round30 = 1}
SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.ADSFireAnim = true
SWEP.FullAimViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {1100, 300}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acog"}},
[2] = {header = "Barrel", offset = {-200, 0}, atts = {"md_tundra9mm"}, exclusions = {bg_mp5_sdbarrel = true}},
[3] = {header = "Rail", offset = {250, -100}, atts = {"md_anpeq15"}},
["+reload"] = {header = "Ammo", offset = {300, 500}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	--reload_empty = "reloadempty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_MP9_DEPLOY"},
	{time = 0.3, sound = "CW_MP9_CLOTH"},
	{time = 0.48, sound = "CW_MP9_RATTLE"}},

	reload = {[1] = {time = 0.0, sound = "CW_MP9_START"},
	[2]	= {time = 0.66, sound = "CW_MP9_MAGOUT"},
	[3] = {time = 1.30, sound = "CW_MP9_MAGSPIN"},
	[4] = {time = 2.39, sound = "CW_MP9_MAGIN"},
	[5] = {time = 2.6, sound = "CW_MP9_BOLTFORWAR"}}}

	
	--reloadempty = {[1] = {time = 0.4, sound = "CW_MP5_BOLTBACK"},
	--[2] = {time = 1.5, sound = "CW_MP5_MAGOUT"},
	--[3] = {time = 1.8, sound = "CW_MP5_MAGIN"},
	--[4] = {time = 2.6, sound = "CW_MP5_BOLTFORWARD"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW2.0 Halo"



SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 80
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_smg9.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_mp5.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 22
SWEP.Primary.DefaultClip	= 250
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.0666666666666667
SWEP.FireSound = "CW_MP9_FIRE"
SWEP.FireSoundSuppressed = "CW_MP9_FIRE_SUPPRESSED"
SWEP.Recoil = 0.4

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.9
SWEP.ReloadTime_Empty = 2.2
SWEP.ReloadHalt = 2.6
SWEP.ReloadHalt_Empty = 3.5