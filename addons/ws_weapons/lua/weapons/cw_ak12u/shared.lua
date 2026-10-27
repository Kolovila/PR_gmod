AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AK-12u"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_ak47.mdl"
	SWEP.WMPos = Vector(0, -1, 0.5)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.108, 0, 1.047)
	SWEP.IronsightAng = Vector(0.085, 0.07, 0)
	
	SWEP.MicroT1Pos = Vector(-2.108, 0, 0.49)
	SWEP.MicroT1Ang = Vector(-0.044, -0.08, 0)

	SWEP.AimpointPos = Vector(-2.123, -0.969, 0.569)
	SWEP.AimpointAng = Vector(0.14, -0.06, 00)
	
	SWEP.EoTechPos = Vector(-2.095, 0, 0)
	SWEP.EoTechAng = Vector(1.5, 0, 0)

	SWEP.KobraPos = Vector(-2.55, -3.224, -0.026)
	SWEP.KobraAng = Vector(0.717, -0.638, 0)
	
    SWEP.ACOGPos = Vector(-2.116, 0.702, 0.354)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.ShortenedPos = Vector(-2.428, -4.005, 0.815)
	SWEP.ShortenedAng = Vector(0, -0.036, 0)
	
	SWEP.RPKPos = Vector(-2.418, -3.481, 0.93)
	SWEP.RPKAng = Vector(0.125, -0.25, 0)
	
	SWEP.PSOPos = Vector(-2.5, 0.65, -0.101)
	SWEP.PSOAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-2.099, 0, 0.493)
	SWEP.RMRAng = Vector(1.19, 0.05, 0)
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.LaserPosAdjust = Vector(-0.6, 0, 0.2)
	SWEP.LaserAngAdjust = Angle(0, 179.095, 0)

	SWEP.LaserAngAdjustAim = Angle(-1, -180.5, 0)	
	
	--SWEP.LaserPosAdjust = Vector(-0.5, 0, 0)
    --SWEP.LaserAngAdjust = Angle(1, -181, 0) 
	
    SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.116, 0.702, -0.378), [2] = Vector(0, 0, 0)}}
	
	SWEP.IconLetter = "b"
	killicon.AddFont("cw_ak74", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = false
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -3, y = -1, z = -2}
	SWEP.SightWithRail = false
--	SWEP.ForeGripOffsetCycle_Draw = 0
--	SWEP.ForeGripOffsetCycle_Reload = 0.65
--	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.BoltBone = "ak12_Bolt"
	SWEP.BoltShootOffset = Vector(0, 1.6, 0)
	--SWEP.OffsetBoltOnBipodShoot = true

	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "ak12", rel = "", pos = Vector(-0.25, -2.097, -3.33), angle = Angle(0, -90, 0), size = Vector(0.736, 0.736, 0.736)},
	    ["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "ak12", rel = "", pos = Vector(0.05, 0.677, 0.945), angle = Angle(0, -180, 0), size = Vector(0.382, 0.382, 0.382)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "ak12", rel = "", pos = Vector(-0.224, -3.75, -2.948), angle = Angle(0, 0, 0), size = Vector(0.665, 0.665, 0.665)},
	    ["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "ak12", rel = "", pos = Vector(-0.062, 6.16, 0.712), angle = Angle(0, 90.716, 0), size = Vector(0.395, 0.395, 0.395)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "ak12", rel = "", pos = Vector(0.3, -10.735, -9.65), angle = Angle(0, -90, 0), size = Vector(0.973, 0.973, 0.973)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "ak12", rel = "", pos = Vector(0.189, 4.456, -2.948), angle = Angle(0, -180, 0), size = Vector(0.665, 0.665, 0.665)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "ak12", rel = "", pos = Vector(0, 10.47, -1.03), angle = Angle(0, -180, 0), size = Vector(0.465, 0.465, 0.465)}
	}
		
	SWEP.PSO1AxisAlign = {right = 0, up = 0.4, forward = -90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = -0.4, forward = 0}
	SWEP.AttachmentPosDependency = {["md_pbs1"] = {["bg_ak74_rpkbarrel"] = Vector(-28, 0, -0.816), ["bg_ak74_ubarrel"] = Vector(-14, 0, -0.88)}}
end

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.LuaViewmodelRecoil = false

--SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -50},  atts = {"md_kobra", "md_eotech", "md_aimpoint"}},
--	[2] = {header = "Barrel", offset = {-175, -100}, atts = {"md_pbs1"}},
--	[3] = {header = "Handguard", offset = {-100, 200}, atts = {"md_foregrip"}}}

SWEP.BarrelBGs = {main = 2, rpk = 1, short = 4, regular = 0}
SWEP.StockBGs = {main = 1, regular = 0, heavy = 1, foldable = 2}
SWEP.ReceiverBGs = {main = 3, rpk = 1, regular = 0}
SWEP.MagBGs = {main = 4, regular = 0, rpk = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {400, -350},  atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_acog"}},
	[2] = {header = "Rail", offset = {100, 150}, atts = {"md_anpeq15"}},
	[3] = {header = "Barrel", offset = {-400, -200}, atts = {"md_pbs1"}},
	["+reload"] = {header = "Ammo", offset = {800, 300}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {
   draw = {[1] ={time = 0.55, sound = "CW_ak12u_BOLTBACK"},
   [2] = {time = 0.97, sound = "CW_ak12u_BOLTRELEASE"}
   },


	reload = {[1] = {time = 0.30, sound = "CW_ak12u_MAGOUT"},
	[2] = {time = 0.60, sound = "CW_ak12u_RELOADFOLEY"},
	[3] = {time = 1.75, sound = "CW_ak12u_RELOADFOLEY"},
	[4] = {time = 1.65, sound = "CW_ak12u_MAGIN"},
	[5] = {time = 2.65, sound = "CW_ak12u_BOLTBACK"},
	[6] = {time = 2.99, sound = "CW_ak12u_BOLTRELEASE"}}}
	
SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_rif_ak12u.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_ak47.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x39MM"

SWEP.FireDelay = 0.082
SWEP.FireSound = "CW_ak12u_FIRE"
SWEP.FireSoundSuppressed = "CW_AK74_FIRE_SUPPRESSED"
SWEP.Recoil = 0.8

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 33
SWEP.DeployTime = 1.5

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 2.3
SWEP.ReloadTime_Empty = 3.8
SWEP.ReloadHalt = 2.3
SWEP.ReloadHalt_Empty = 3.8
SWEP.SnapToIdlePostReload = true