AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Beretta ARX160"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
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
	
	SWEP.IronsightPos = Vector(-2.743, 1.516, 0.565)
	SWEP.IronsightAng = Vector(0.284, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.731, 0, 0.45)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.AimpointPos = Vector(-2.701, 1.516, 0.81)
	SWEP.AimpointAng = Vector(0.284, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.774, 0, 0.837)
	SWEP.MicroT1Ang = Vector(0,0,0)
	
	SWEP.ACOGPos = Vector(-2.744, -4.6, 0.73)
	SWEP.ACOGAng = Vector(0,0,0)
	
	SWEP.ShortDotPos = Vector(-2.721, -4.8, 0.924)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-3.12, -4.111, -1.1), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.58, up = -0.01, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	
	
	
	SWEP.magBoneName = {"Magazine001", "Bullets001"}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)

	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "acr_main", rel = "", pos = Vector(-6.974, 1.901, 0.143), angle = Angle(-90, 90, 0), size = Vector(0.713, 0.713, 0.713)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "acr_main", rel = "", pos = Vector(-14.462, 9.291, -0.288), angle = Angle(0, 0, -90), size = Vector(1.065, 1.065, 1.065)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "acr_main", rel = "", pos = Vector(17.514, 2.273, -0.255), angle = Angle(90, -180, 90), size = Vector(0.568, 0.568, 0.568)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "acr_main", rel = "", pos = Vector(5.875, -1.866, -0.021), angle = Angle(90, 0, 90), size = Vector(0.439, 0.439, 0.439)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "acr_main", rel = "", pos = Vector(-2.622, -2.294, 0.016), angle = Angle(90, 0, -90), size = Vector(0.356, 0.356, 0.356)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "acr_main", rel = "", pos = Vector(-6.285, 1.922, 0.25), angle = Angle(-90, 0, -90), size = Vector(0.704, 0.704, 0.704)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "acr_main", rel = "", pos = Vector(-6.266, 1.853, 0.226), angle = Angle(0, 0, -90), size = Vector(0.697, 0.697, 0.697)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "acr_main", rel = "", pos = Vector(7.764, -0.504, 1.027), angle = Angle(0, -180, 0), size = Vector(0.5, 0.5, 0.5)},
	}
	

	SWEP.ForeGripHoldPos = {
	["l_armtwist_4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -3.807) },
	["l_armtwist_3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -4.111) },
	["l_armtwist_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -23.261) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 25.465, 61.303) },
	["L ForeTwist1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -8.433) },
	["L ForeTwist6"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 1.86) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(32.181, 7.64, 24.797) },
	["L ForeTwist5"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 10.248) },
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(-0.225, -5.897, -1.991), angle = Angle(0, 0, 0) },
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(2.328, 56.458, 4.981) },
	["L ForeTwist4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -6.981) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(62.12, 0.712, 1.292) },
	["L ForeTwist2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -0.399) },
	["L ForeTwist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 59.222) },
	["L ForeTwist3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 7.151) }
	}
	
	
	SWEP.LaserPosAdjust = Vector(0, 0, .25)
	SWEP.LaserAngAdjust = Angle(0, 180, 20) 
end

SWEP.MuzzleVelocity = 880 -- in meter/s


SWEP.SightBGs = {main = 2, none = 1}
SWEP.BarrelBGs = {magpul = 2, ris = 1, regular = 0}

SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {950, -600}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_acog"}},
	[2] = {header = "Barrel", offset = {300, -600}, atts = {"md_saker"}},
	[3] = {header = "Handguard", offset = {-400, -100}, atts = {"md_foregrip"}},
	[4] = {header = "Rail", offset = {250, 300}, atts = {"md_anpeq15"}},
	}
	

-- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 1, sound = "CW_AR15_MAGOUT"},
	[2] = {time = 1.75, sound = "CW_AR15_MAGIN"},
	reload_full = {[1] = {time = 1, sound = "CW_AR15_MAGOUT"},
	[2] = {time = 1.75, sound = "CW_AR15_MAGIN"},
}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "acer"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_arx_ace.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_arx_ace.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.066666666666667
SWEP.FireSound = "cw_arx160_fire"
SWEP.FireSoundSuppressed = "CW_AR15_FIRE_SUPPRESSED"
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

SWEP.ReloadSpeed = 1.5
SWEP.ReloadTime = 3.3
SWEP.ReloadTime_Empty = 3.3
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 1.9
SWEP.SnapToIdlePostReload = true