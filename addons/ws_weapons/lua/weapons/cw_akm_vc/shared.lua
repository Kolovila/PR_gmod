AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "NVA AKM"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IronsightPos = Vector(-2, 0, 0.28)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.035, 0, -1.3265)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.025, 0, -1.127)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.KobraPos = Vector(-2.05, 0, -0.6215)
	SWEP.KobraAng = Vector(0.0, 0, 0)
	
	SWEP.ShortenedPos = Vector(-2.428, -4.005, 0.815)
	SWEP.ShortenedAng = Vector(0, -0.036, 0)
	
	SWEP.RPKPos = Vector(-2.418, -3.481, 0.93)
	SWEP.RPKAng = Vector(0.125, -0.25, 0)
	
	SWEP.PSOPos = Vector(-2.5, 0.65, -0.101)
	SWEP.PSOAng = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "b"
	killicon.AddFont("cw_ak74", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.PosBasedMuz = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.BoltBone = "bolt"
	SWEP.BoltShootOffset = Vector(0, -1, -1)
	SWEP.OffsetBoltOnBipodShoot = true

	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/wystan/attachments/akrailmount.mdl", bone = "muzzle", pos = Vector(-0.25, -15, 0.15), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "muzzle", pos = Vector(0.25, -26.378, -8.995), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "muzzle", pos = Vector(-0.285, -21, -3.65), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "ak74_body", pos = Vector(4.151, -0.433, -2.721), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "muzzle", pos = Vector(0, 2.45, -1), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_kobra"] = {model = "models/cw2/attachments/kobra.mdl", bone = "muzzle", pos = Vector(0.415, -15.25, -2.25), angle = Angle(0, 180, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_pso1"] = {model = "models/cw2/attachments/pso.mdl", bone = "ak74_body", pos = Vector(5.521, -0.174, -1.107), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "muzzle", pos = Vector(-0.30, -19.5, -2.6), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)}
	}

	SWEP.ShortDotPos = Vector(-2, 0, -1.15)
	SWEP.ShortDotAng = Vector(0, 0, 0)

	SWEP.ForeGripHoldPos = {
		["Left12"] = {pos = Vector(0, 0, 0), angle = Angle(19.048, 0, 0) },
		["Left19"] = {pos = Vector(0, 0, 0), angle = Angle(7.56, -5.153, -33.453) },
		["Left3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 98.859, 0) },
		["Left8"] = {pos = Vector(0, 0, 0), angle = Angle(28.447, 0, 0) },
		["Left18"] = {pos = Vector(0, 0, 0), angle = Angle(31.268, 8.871, -34.725) },
		["Left17"] = {pos = Vector(0, 0, 0), angle = Angle(4.524, 0.3, -39.885) },
		["Left11"] = {pos = Vector(0, 0, 0), angle = Angle(17.864, 0, 0) },
		["Left9"] = {pos = Vector(0, 0, 0), angle = Angle(8.972, 0, 0) },
		["Left_L_Arm"] = {pos = Vector(1.231, 2.617, -1.206), angle = Angle(0, 0, 84.377) },
		["Left24"] = {pos = Vector(0, 0, 0), angle = Angle(31.447, -4.021, -22.029) },
		["Left16"] = {pos = Vector(0, 0, 0), angle = Angle(7.047, 11.637, -22.139) },
		["Left14"] = {pos = Vector(0, 0, 0), angle = Angle(14.432, -4.611, 0) },
		["Left2"] = {pos = Vector(0, 0, 0), angle = Angle(0, 40.631, 0) },
		["Left_U_Arm"] = {pos = Vector(2.54, 0.004, 0), angle = Angle(0, 0, 0) }}
		
	SWEP.PSO1AxisAlign = {right = 0, up = 0.4, forward = -90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.AttachmentPosDependency = {["md_pbs1"] = {["bg_ak74_rpkbarrel"] = Vector(-28, 0, -0.816), ["bg_ak74_ubarrel"] = Vector(-14, 0, -0.88)}}
end

SWEP.MuzzleVelocity = 715 -- in meter/s

SWEP.LuaViewmodelRecoil = true

--SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -50},  atts = {"md_kobra", "md_eotech", "md_aimpoint"}},
--	[2] = {header = "Barrel", offset = {-175, -100}, atts = {"md_pbs1"}},
--	[3] = {header = "Handguard", offset = {-100, 200}, atts = {"md_foregrip"}}}

SWEP.BarrelBGs = {main = 2, rpk = 1, short = 4, regular = 0}
SWEP.StockBGs = {main = 1, regular = 0, heavy = 1, foldable = 2}
SWEP.ReceiverBGs = {main = 3, rpk = 1, regular = 0}
SWEP.MagBGs = {main = 4, regular = 0, rpk = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300},  atts = {"md_kobra", "md_eotech", "md_aimpoint"}},
	[2] = {header = "Barrel", offset = {300, -300}, atts = {"md_pbs1"}},
	["+reload"] = {header = "Ammo", offset = {800, 200}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"ak47_fire1", "ak47_fire2", "ak47_fire3"},
	reload = "ak47_reload",
	idle = "ak47_idle",
	draw = "ak47_draw"}
	
SWEP.Sounds = {	ak47_draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"},
			{time = 0.1, sound = "CW_AKM_BOLTBACK"},
			{time = 0.4, sound = "CW_AKM_BOLTRELEASE"}},

	ak47_reload = {[1] = {time = 0.75, sound = "CW_AKM_MAGOUT"},
	[2] = {time = 1.35, sound = "CW_AKM_MAGIN"},
	[3] = {time = 2.35, sound = "CW_AKM_BOLTBACK"},
	[4] = {time = 2.45, sound = "CW_AKM_BOLTRELEASE"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
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
SWEP.ViewModel		= "models/weapons/matts_akm/v_akm_matt.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_ak47.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x39MM"

SWEP.FireDelay = 0.1
SWEP.FireSound = "CW_AKM_FIRE"
SWEP.FireSoundSuppressed = "CW_AK74_FIRE_SUPPRESSED"
SWEP.Recoil = 1.2

SWEP.HipSpread = 0.044
SWEP.AimSpread = 0.006
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.052
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.14
SWEP.Shots = 1
SWEP.Damage = 38
SWEP.DeployTime = 1.0

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.946
SWEP.ReloadTime_Empty = 2.65
SWEP.ReloadHalt = 1.946
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = true
SWEP.Chamberable  = true