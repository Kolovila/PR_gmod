AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "GRU AKM"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_akm.mdl"
	SWEP.WMPos = Vector(-1, 3, -0.5)
	SWEP.WMAng = Vector(-5, 1, 180)
	
	SWEP.IronsightPos = Vector(-1.903, 0, 0.162)
	SWEP.IronsightAng = Vector(0, 0, 5)
	
	SWEP.AimpointPos = Vector(-1.782, 0, -1.196)
	SWEP.AimpointAng = Vector(0, 0, 5)
	
	SWEP.EoTechPos = Vector(-1.721, 0, -1.528)
	SWEP.EoTechAng = Vector(0, 0, 5)
	
	SWEP.PSOPos = Vector(-1.542, -1, -0.091)
	SWEP.PSOAng = Vector(0, 0, 4.088)
	
	SWEP.KobraPos = Vector(-1.711, 0, -0.452)
	SWEP.KobraAng = Vector(0.744, 0, 4.652)
	
	SWEP.SprintPos = Vector(0.629, -1.03, -0.991)
	SWEP.SprintAng = Vector(-17.885, 32.701, -20.88)
	
	SWEP.ShortenedPos = Vector(-2.428, -4.005, 0.815)
	SWEP.ShortenedAng = Vector(0, -0.036, 0)
	
	SWEP.CustomizePos = Vector(0.865, -1.68, -1.44)
	SWEP.CustomizeAng = Vector(8.413, 11.576, -0.816)
	
	SWEP.RMRPos = Vector(-1.79, 0, -0.828)
	SWEP.RMRAng = Vector(0, 0, 5)
	
	SWEP.AlternativePos = Vector(-0.267, 0, -0.662)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 1.15
	SWEP.MoveType = 2
	
	SWEP.IconLetter = "b"
	killicon.AddFont("cw_ak74", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.PosBasedMuz = false
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 3, y = 1, z = -0.5}
	SWEP.SightWithRail = true
	
	SWEP.LaserPosAdjust = Vector(0.5, 0, -1)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 

	SWEP.LuaVMRecoilAxisMod = {vert = 0.1, hor = 0, roll = 0, forward = 0.4, pitch = 0}
	
	SWEP.RVBPitchMod = 1.25
	SWEP.RVBYawMod = 0.6
	SWEP.RVBRollMod = 2.8
	
	
	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/wystan/attachments/akrailmount.mdl", bone = "akm", rel = "", pos = Vector(-0.211, -2.487, 0.324), angle = Angle(0, 0, 0), size = Vector(1.006, 1.006, 1.006)},
		["md_insight_x2"] = { model = "models/cw2/attachments/pistollaser.mdl", bone = "akm", rel = "", pos = Vector(0.03, 7.817, 0.939), angle = Angle(0, 90, -90), size = Vector(0.101, 0.101, 0.101)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "akm", rel = "", pos = Vector(0.344, -15.12, -9.568), angle = Angle(0, -90, 0), size = Vector(1.093, 1.093, 1.093), adjustment = {min = -15.3, max = -13.7, axis = "y", inverse = false, inverseOffsetCalc = false, index = 1}},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "akm", rel = "", pos = Vector(-0.204, -7.591, -2.566), angle = Angle(0, 0, 0), size = Vector(0.837, 0.837, 0.837), adjustment = {min = -8.5, max = -5.5, axis = "y", inverse = false, inverseOffsetCalc = false, index = 1}},
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "akm", rel = "", pos = Vector(-0.239, -6.4, -1.928), angle = Angle(0, -90, 0), size = Vector(0.722, 0.722, 0.722), adjustment = {min = -7.3, max = -4, axis = "y", inverse = false, inverseOffsetCalc = false, index = 1}},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "akm", rel = "", pos = Vector(0, 18.127, -0.937), angle = Angle(0, -180, 0), size = Vector(0.773, 0.773, 0.773)},
		["md_kobra"] = {model = "models/cw2/attachments/kobra.mdl", bone = "akm", rel = "", pos = Vector(0.526, -3.586, -1.547), angle = Angle(0, 180, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_pso1"] = {model = "models/cw2/attachments/pso.mdl", bone = "akm", rel = "", pos = Vector(0.275, -5.176, -0.644), angle = Angle(0, 180, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "ak74_body", pos = Vector(4.558, -0.302, -1.67), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)}
	}

	SWEP.ShortDotPos = Vector(-2.428, -4.107, -0.721)
	SWEP.ShortDotAng = Vector(0, 0, 0)
		
	SWEP.PSO1AxisAlign = {right = 0, up = 0, forward = 90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = -0.4, forward = 0}
	SWEP.AttachmentPosDependency = {["md_pbs1"] = {["bg_ak74_rpkbarrel"] = Vector(-28, 0, -0.816), ["bg_ak74_ubarrel"] = Vector(-14, 0, -0.88)}}
end

SWEP.MuzzleVelocity = 715 -- in meter/s

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.ADSFireAnim = true
SWEP.FullAimViewmodelRecoil = true
SWEP.CanRestOnObjects = true

--SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -50},  atts = {"md_kobra", "md_eotech", "md_aimpoint"}},
--	[2] = {header = "Barrel", offset = {-175, -100}, atts = {"md_pbs1"}},
--	[3] = {header = "Handguard", offset = {-100, 200}, atts = {"md_foregrip"}}}


SWEP.Attachments = {[1] = {header = "Sight", offset = {940, -150},  atts = {"md_kobra", "md_eotech", "md_aimpoint", "md_pso1"}},
	[2] = {header = "Barrel", offset = {-400, -150}, atts = {"md_pbs1"}},
	["+reload"] = {header = "Ammo", offset = {200, 600}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"ak47_fire1", "ak47_fire2", "ak47_fire3"},
	reload = "ak47_reload",
	idle = "ak47_idle",
	draw = "ak47_draw"}
	
SWEP.Sounds = {	ak47_draw = {{time = 0, sound = "CW_FOLEY_HEAVY"},
							{time = 0.53, sound = "CW_AKM1_BOLTPULL"},
							{time = 0.87, sound = "CW_AKM1_BOLTFORWARD"}},

	ak47_reload = {[1] = {time = 0.1, sound = "CW_FOLEY_HEAVY"},
	[2] = {time = 0.82, sound = "CW_AKM1_MAGOUT"},
	[3] = {time = 1.47, sound = "CW_AKM1_MAGIN"},
	[4] = {time = 1.7, sound = "CW_FOLEY_HEAVY"},
	[5] = {time = 2.1, sound = "CW_AKM1_BOLTPULL"},
	[6] = {time = 2.45, sound = "CW_AKM1_BOLTFORWARD"},
	[7] = {time = 2.6, sound = "CW_AKM1_CLOTH"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_akm.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_akm.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x39MM"

SWEP.FireDelay = 60/600
SWEP.FireSound = "CW_AKM1_FIRE"
SWEP.FireSoundSuppressed = "CW_AKM1_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.34
SWEP.SpreadPerShot = 0.009
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 38
SWEP.DeployTime = 1.1
SWEP.Chamberable = true

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 3.2
SWEP.ReloadTime_Empty = 3
SWEP.ReloadHalt = 0.2
SWEP.ReloadHalt_Empty = 2.6
SWEP.SnapToIdlePostReload = false