AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "HK416C"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_mohw_hk416c.mdl"
	SWEP.WMPos = Vector(-.7, 2.5, 0)
	SWEP.WMAng = Vector(4, 2, 180)

	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-2.01, -5.052, -0.091)
	SWEP.IronsightAng = Vector(-0.7, 0.2, 0)

	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2, -3.5, -0.39)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.03, -3.2, -0.345)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.01, 0, -0.091)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.ACOGPos = Vector(-2.006, -3.7, -0.473)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.01, -2.6, -0.231)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2, -3.67, -1.31), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "l_forearm"
	SWEP.BaseArmBoneOffset = Vector(0, 0, -30)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "gun", rel = "", pos = Vector(0.25, 5.048, -3.211), angle = Angle(0, -180, 0), size = Vector(0.84, 0.84, 0.84), adjustment = {min = 3.617, max = 5.049, axis = "y", inverseOffsetCalc = false}},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "gun", rel = "", pos = Vector(-0.21, 8.3, -7.47), adjustment = {min = 6, max = 8.3, axis = "y", inverseOffsetCalc = false}, angle = Angle(3, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "gun", rel = "", pos = Vector(-0.274, -15, -2.266), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "416c_bolt", pos = Vector(-0.05, 2.4, -0.22), angle = Angle(0, 0, 0), size = Vector(0.42, 0.42, 0.42)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "gun", pos = Vector(-0.002, 0, 1.617), adjustment = {min = -2.1, max = 0.4, axis = "y", inverseOffsetCalc = false}, angle = Angle(0, 0, 0), size = Vector(0.31, 0.31, 0.31)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "gun", pos = Vector(0.282, 3.5, -2.745), angle = Angle(0, 180, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "gun", pos = Vector(0.17, -7.966, 1.5), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "gun", pos = Vector(-1.492, 4.58, 2.285), angle = Angle(0, 90, 0), size = Vector(0.649, 0.649, 0.649), animated = true},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "gun", pos = Vector(0.294, 4, -2.75), angle = Angle(0, 90, 0), size = Vector(0.75, 0.75, 0.75)}
	}
	
	SWEP.M203HoldPos = {
		["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, -1.5, 10.213) },
		["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -56.625) },
		["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -60) },
		["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 60) },
		["l_ring_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -60.734) },
		["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0.372, 1.707, -0.104), angle = Angle(-3.368, 0, 0) },
		["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0.987, 6.455) }
	}

	SWEP.ForeGripHoldPos = {
		["l_ring_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-8.652, 0, 52.098) },
		["l_middle_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 70) },
		["l_ring_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -50.02) },
		["l_middle_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 20) },
		["l_index_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(21.322, 0, 20.836) },
		["l_thumb_low"] = { scale = Vector(1, 1, 1), pos = Vector(0.024, -0.06, -0.09), angle = Angle(4.854, 19.145, 39.276) },
		["l_index_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6.675, 0, 70) },
		["l_thumb_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-3.287, -38.348, 26.497) },
		["l_pinky_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-8.985, 0, -33.66) },
		["l_pinky_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-6.482, 0, 58.166) },
		["l_middle_mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -15) },
		["l_thumb_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -90, 0) },
		["l_index_tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 7.782) },
		["l_pinky_low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-9.74, 0, 36.263) },
		["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0.28, -1.834, -0.294), angle = Angle(46.541, -40.457, -39.07) },
		["l_wrist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(8.637, 10.451, 31.683) }
	}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0)
end

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.SightBGs = {main = 0, none = 1}
SWEP.StockBGs = {main = 1, regular = 0, push = 1, none = 2}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_acog"}},
	[2] = {header = "Barrel", offset = {350, -500}, atts = {"md_saker"}},
--	[3] = {header = "Receiver", offset = {-400, -500}, atts = {"bg_magpulhandguard", "bg_longbarrel", "bg_ris", "bg_longris"}},
	[3] = {header = "Handguard", offset = {-400, -500}, atts = {"md_foregrip", "md_m203"}},
--	[5] = {header = "Magazine", offset = {-400, 400}, atts = {"bg_ar1560rndmag"}},
	[4] = {header = "Rail", offset = {-400, -100}, atts = {"md_anpeq15"}},
	[5] = {header = "Stock", offset = {1000, 400}, atts = {"bg_416cpushstock", "bg_416cnostock"}},
	["+reload"] = {header = "Ammo", offset = {-400, 350}, atts = {"am_magnum", "am_matchgrade"}}}
	
--SWEP.AttachmentDependencies = {["md_m203"] = {"bg_longris"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw1"}
	
SWEP.Sounds = {
	draw = {
		time = 0, sound = "CW_FOLEY_MEDIUM"
	},
	reload = {
		[1] = {time = 0.55, sound = "CW_HK416C_CLIPOUT"},
		[2] = {time = 1, sound = "CW_HK416C_CLOTH2"},
		[3] = {time = 1.7, sound = "CW_HK416C_CLIPIN"},
		[4] = {time = 2.5, sound = "CW_HK416C_BOLT"}
	}
}

SWEP.SpeedDec = 20

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "꽥꽥이"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 62
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_mohw_hk416c.mdl"
SWEP.WorldModel		= "models/weapons/w_mohw_hk416c.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.066666666666667
SWEP.FireSound = "CW_HK416C_FIRE"
SWEP.FireSoundSuppressed = "CW_HK416C_FIRE_SUPPRESSED"
SWEP.Recoil = 1.05

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.1
SWEP.ReloadTime_Empty = 1.9
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true

function SWEP:postPrimaryAttack()
	self.FireDelay = math.Rand(0.066666666666667, 0.0857142857142857)
end

