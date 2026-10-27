AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Rei's Modified Scar-L" 
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
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
	
	SWEP.IronsightPos = Vector(-2.681, 0, 0.239)
	SWEP.IronsightAng = Vector(0.1, 0.1, 0)
		
	SWEP.EoTechPos = Vector(-2.681, 0, 0.239)
	SWEP.EoTechAng = Vector(-1.5, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.681, .5, -.065)
	SWEP.AimpointAng = Vector(1.5, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.681, 0, .2)
	SWEP.MicroT1Ang = Vector(1.5, 0.1, 0)
	
	SWEP.ACOGPos = Vector(-2.681, 0, -0.239)
	SWEP.ACOGAng = Vector(-1.8, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.681, -1.2, .2)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.681, 2, -1.1), [2] = Vector(-2, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "gun_root", rel = "", pos = Vector(-0.26, -5.8, -2.68), adjustment = {min = -4.3, max = -2.8, axis = "y", inverseOffsetCalc = true}, angle = Angle(0, 0, -2.0), size = Vector(.9, .9, .9)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "gun_root", rel = "", pos = Vector(0.238, -11, -8.1), adjustment = {min = -9.2, max = -7.6, axis = "y", inverseOffsetCalc = true}, angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "gun_root", rel = "", pos = Vector(-0.452, -2.556, -1.428), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Object004", pos = Vector(0, 0, -1.9), angle = Angle(0, 0, 0), size = Vector(0.35, 0.35, 0.35)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "gun_root", pos = Vector(-0.027, 0.25, 2.8), adjustment = {min = 1.25, max = 3.6, axis = "y", inverseOffsetCalc = true}, angle = Angle(0, 180, 2), size = Vector(0.35, 0.35, 0.35)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "gun_root", pos = Vector(-0.401, -4.291, -3.3), angle = Angle(0, 0, -4), size = Vector(1, 1, 1)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "gun_root", pos = Vector(-0.225, 9.715, 3.15), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "gun_root", pos = Vector(2.299, -6.611, 4.138), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "gun_root", pos = Vector(-0.35, -5.554, -2.627), angle = Angle(0, -90, 0), size = Vector(0.899, 0.899, 0.899)}
}

	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-2.76, 2.651, 1.386), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 42.713, 0) },
		["Bip01 L Clavicle"] = {pos = Vector(-3.299, 1.235, -1.79), angle = Angle(-55.446, 11.843, 0) },
		["Bip01 L Forearm"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 42.41) },
		["Bip01 L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 71.308, 0) },
		["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.795, 0) },
		["Bip01 L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(0, 26.148, 0) },
		["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(6.522, 83.597, 0) },
		["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(23.2, 16.545, 0) },
		["Bip01 L Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 31.427, 0) },
		["Bip01 L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 29.565, 0) },
		["Bip01 L Hand"] = {pos = Vector(0, 0, 0), angle = Angle(9.491, 14.793, -15.926) },
		["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, -9.195, 0) },
		["Bip01 L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10.164, 0) },
		["Bip01 L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 18.395, 0) },
		["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(2.411, 57.007, 0) }
	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0) 
end

SWEP.MuzzleVelocity = 300 -- in meter/s

SWEP.SightBGs = {main = 1, none = 1}
SWEP.BarrelBGs = {main = 3, longris = 4, long = 3, magpul = 2, ris = 1, regular = 0}
SWEP.StockBGs = {main = 2, regular = 0, heavy = 1, sturdy = 2}
SWEP.MagBGs = {main = 5, regular = 0, round60 = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -150}, atts = {"md_microt1", "md_eotech", "md_aimpoint",--[["md_schmidt_shortdot", "md_acog"]]}},
	[2] = {header = "Barrel", offset = {0150, -300}, atts = {"md_saker"}},
	--[3] = {header = "Receiver", offset = {-400, -500}, atts = {"bg_magpulhandguard", "bg_longbarrel", "bg_ris", "bg_longris"}},
	--[4] = {header = "Handguard", offset = {-400, 0}, atts = {"md_foregrip", "md_m203"}},
	--[5] = {header = "Magazine", offset = {-400, 400}, atts = {"bg_ar1560rndmag"}},
	--[6] = {header = "Stock", offset = {1000, 400}, atts = {"bg_ar15sturdystock", "bg_ar15heavystock"}},
	--[7] = {header = "Rail", offset = {250, 400}, atts = {"md_anpeq15"}, dependencies = {bg_ris = true, bg_longris = true}},
	["+reload"] = {header = "Ammo", offset = {-450, 0}, atts = {"am_magnum", "am_matchgrade", "am_tiger"}}}
	
SWEP.AttachmentDependencies = {["md_m203"] = {"bg_longris"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_SSCAR_DEPLOY"}},

	reload = {[1] = {time = 0.00, sound = "CW_SSCAR_CLOTH"},
	[2] = {time = .16, sound = "CW_SSCAR_OUT"},
	[3] = {time = .29, sound = "CW_SSCAR_MAGDRAW"},
	[4] = {time = 1.09, sound = "CW_SSCAR_MIDIN"},
	[5] = {time = 1.22, sound = "CW_SSCAR_IN"},
	[6] = {time = 2.06, sound = "CW_AR15_BOLT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rei's sweps"

SWEP.Author			= "Soul"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cw2/scarl/v_rif_p4s.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_ak47.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.1000
SWEP.FireSound = "CW_SSCAR_FIRE"
SWEP.FireSoundSuppressed = "CW_SSCAR_FIRE_SUP"
SWEP.Recoil = 0.70

SWEP.HipSpread = .067
SWEP.AimSpread = .026
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.009
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 1.0

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 1.6
SWEP.ReloadTime_Empty = 3.2
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true