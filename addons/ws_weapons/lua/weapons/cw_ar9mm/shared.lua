AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AR-9MM"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0.9
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-2.239, -4.395, 0.697)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.244, -2.2, 0.231)
	SWEP.EoTechAng = Vector(0.703, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.23, -5.376, 0.83)
	SWEP.AimpointAng = Vector(-2.5, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.238, 0.075, 0.989)
	SWEP.MicroT1Ang = Vector(-1.938, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.244, -3.88, 0.53)
	SWEP.ACOGAng = Vector(-1.4, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.249, -4.390, 0.740)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.241, -2.816, -0.255), [2] = Vector(-2.195, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "AR9mm", rel = "", pos = Vector(-0.25, -2.112, -0.85), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "AR9mm", rel = "", pos = Vector(0.211, -8.66, -7.357), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "AR9mm", rel = "", pos = Vector(-0.445, -2.045, -0.913), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "AR9mm", rel = "", pos = Vector(-0.065, 5.097, 0.493), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "AR9mm", rel = "", pos = Vector(-0.084, 1.648, 3.546), angle = Angle(0, 0, 0), size = Vector(0.34, 0.34, 0.34)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "AR9mm", rel = "", pos = Vector(-0.35, -2.806, -0.972), angle = Angle(0, 0, 0), size = Vector(0.769, 0.769, 0.769)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "AR9mm", rel = "", pos = Vector(-0.142, 7.755, 3.15), angle = Angle(0, 90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "AR9mm", pos = Vector(2.299, -6.611, 4.138), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "AR9mm", rel = "", pos = Vector(-0.334, -1.499, -0.733), angle = Angle(0, -90, 0), size = Vector(0.72, 0.72, 0.72)}
	}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-2.76, 2.651, 1.386), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 42.713, 0) },
		["Bip01 L Clavicle"] = {pos = Vector(-2.7, 1, -2), angle = Angle(-55.446, 11.843, 0) },
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
	
	SWEP.AttachmentPosDependency = {["md_saker"] = {["bg_ar9_BarrelLong"] = Vector(-0.069, 8.343, 0.344), ["bg_ar9_BarrelLongHG"] =              Vector(-0.069, 8.343, 0.344)},
        ["md_anpeq15"] = {["bg_ar9_BarrelLongHG"] = Vector(-0.142, 11, 3)}}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0)
end

SWEP.MuzzleVelocity = 640 -- in meter/s

SWEP.SightBGs = {main = 5, regular = 0, none = 1}
SWEP.BarrelBGs = {main = 4, regular = 0, longbarrel = 1, longbarrelHG = 2}
SWEP.StockBGs = {main = 3, regular = 0, none = 1}
SWEP.MagBGs = {main = 6, regular = 0, round32 = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_acog"}},
                    [2] = {header = "Receiver", offset = {-400, -500}, atts = {"bg_ar9_BarrelLong", "bg_ar9_BarrelLongHG"}},
                    [3] = {header = "Barrel", offset = {300, -500}, atts = {"md_saker"}},
                    [4] = {header = "Magazine", offset = {-400, 400}, atts = {"bg_ar9_32rndmag"}},
                    [5] = {header = "Handguard", offset = {-400, 0}, atts = {"md_foregrip"}},
                    [6] = {header = "Stock", offset = {700, 350}, atts = {"bg_ar9_nostock"}},
                    [7] = {header = "Rail", offset = {250, 400}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}
	
SWEP.AttachmentDependencies = {["md_m203"] = {"bg_ar9_BarrelLong"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload_empty = "reload",
        reload = "reload2",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
        [2] = {time = 0.6, sound = "CW_AR9mm_BOLTback"},
        [3] = {time = 0.9, sound = "CW_AR9mm_BOLTforward"}},

        reload = {[1] = {time = 0.55, sound = "CW_AR9mm_MAGOUT"},
	[2] = {time = 1.6, sound = "CW_AR9mm_MAGIN"},
	[3] = {time = 2.3, sound = "CW_AR9mm_BOLT"}},

        reload2 = {[1] = {time = 0.55, sound = "CW_AR9mm_MAGOUT"},
	[2] = {time = 1.6, sound = "CW_AR9mm_MAGIN"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Kakyoiin"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/ar_9mm/v_smg_ar9m.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_m4a1.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.062
SWEP.FireSound = "CW_AR9mm_FIRE"
SWEP.FireSoundSuppressed = "CW_AR9mm_FIRE_SUPPRESSED"
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.006
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 26
SWEP.DeployTime = 1.6

SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 2.5
SWEP.ReloadTime_Empty = 3
SWEP.ReloadHalt = 2.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true