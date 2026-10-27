AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "CM901"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = -3, z = -30}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.EffectiveRange_Orig = 115 * 230
	SWEP.DamageFallOff_Orig = .20
	
	--SWEP.M203OffsetCycle_Reload = 0.65
	--SWEP.M203OffsetCycle_Reload_Empty = 0.73
	--SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_calil.mdl"
	SWEP.WMPos = Vector(0, -1, 0.5)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.595, 0.614, 0.616)
	SWEP.IronsightAng = Vector(0.193, -2.661, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.55, 0, 0.097)
	SWEP.EoTechAng = Vector(0.819, -2.6, 0)
	
	SWEP.AimpointPos = Vector(-2.556, -0.16, 0.3)
	SWEP.AimpointAng = Vector(0.85, -2.648, 0)
	
	SWEP.MicroT1Pos = Vector(-2.708, 2.632, 0.53)
	SWEP.MicroT1Ang = Vector(0.6, -2.751, 0)
	
	SWEP.ACOGPos = Vector(-2.56, 0, 0.144)
	SWEP.ACOGAng = Vector(0.957, -2.699, 0)
	
	SWEP.NXSPos = Vector(-2.56, 0, 0.722)
	SWEP.NXSAng = Vector(-1.058, -2.503, 0)
	
	SWEP.RMRPos = Vector(-2.194, -6.436, 1.049)
	SWEP.RMRAng = Vector(-2.1, -1.101, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.56, 0, -0.914), [2] = Vector(1.511, -2.691, 0)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1, roll = 1, forward = 1, pitch = 1}

	SWEP.ACOGAxisAlign = {right = -88, up = 2, forward = 0}
	SWEP.NXSAlign = {right = -88, up = 2, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Left_L_Arm"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)

	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "smdimport", rel = "", pos = Vector(-4.506, -0.689, -2.224), angle = Angle(90, 180, 0), size = Vector(0.95, 0.95, 0.95)},
	  --  ["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "smdimport", rel = "", pos = Vector(1.925, -0.35, 5.185), angle = Angle(91.803, 90, 90), size = Vector(0.939, 0.939, 0.939)},
	    ["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "smdimport", rel = "", pos = Vector(-1.405, -0.16, 8.366), angle = Angle(-180, 90, 90), size = Vector(0.5, 0.5, 0.5)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "smdimport", rel = "", pos = Vector(-4.985, -0.867, -3.744), angle = Angle(-2.401, -90, -90), size = Vector(1.039, 1.039, 1.039)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "smdimport", rel = "", pos = Vector(-12.176, -1.015, -11.369), angle = Angle(85.652, -90, -90), size = Vector(1.213, 1.213, 1.213)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "smdimport", rel = "", pos = Vector(-2.869, -9.256, 6.584), angle = Angle(-90, 0, 0), size = Vector(0.602, 0.602, 0.602)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "smdimport", rel = "", pos = Vector(0.039, 2.115, 1.008), angle = Angle(0, 0, -90), size = Vector(0.662, 0.662, 0.662)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "smdimport", rel = "", pos = Vector(1.039, -0.401, 1.572), angle = Angle(-177.243, 90, 90), size = Vector(0.398, 0.398, 0.398)},
	--	["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "smdimport", rel = "", pos = Vector(-4.281, -0.881, -2.616), angle = Angle(-2.576, -90, -90), size = Vector(0.906, 0.906, 0.906)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "smdimport", rel = "", pos = Vector(-0.05, 0.65, 7.737), angle = Angle(-88.548, 89.689, 180), size = Vector(0.55, 0.55, 0.55)},
	}

	SWEP.ForeGripHoldPos = {
		["Left1"] = {pos = Vector(0, 0, 0), angle = Angle(35, -10, -20) },
	    ["Left2"] = {pos = Vector(0, 0, 0), angle = Angle(35, 0, 0) },
	    ["Left3"] = {pos = Vector(0, 0, 0), angle = Angle(40, 0, 0) },
	    ["Left4"] = {pos = Vector(0, 0, 0), angle = Angle(40, 2, 0) },
		["Left5"] = {pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },
		["Left6"] = {pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },
		["Left7"] = {pos = Vector(0, 0, 0), angle = Angle(55, 0, 0) },
		["Left8"] = {pos = Vector(0, 0, 0), angle = Angle(55, 0, 0) },
		["Left9"] = {pos = Vector(0, 0, 0), angle = Angle(60, 0, 0) },
		["Left10"] = {pos = Vector(0, 0, 0), angle = Angle(60, 0, 0) },
		["Left11"] = {pos = Vector(0, 0, 0), angle = Angle(65, 0, 0) },
		["Left12"] = {pos = Vector(0, 0, 0), angle = Angle(65, 20, 0) },
		["Left13"] = {pos = Vector(0, 0, 0), angle = Angle(70, 0, 0) },
	    ["Left14"] = {pos = Vector(0, 0, 0), angle = Angle(70, 0, 0) },
		["Left15"] = {pos = Vector(0, 0, 0), angle = Angle(70, 0, 0) },
		["Dummy02"] = {pos = Vector(-0.5, 0, 0), angle = Angle(0, 0, 0) },
		["Left_Hand"] = {pos = Vector(0, 0, 0), angle = Angle(-15, -40, 10) },
		["Left_L_Arm"] = {pos = Vector(-3, 0, -0.01), angle = Angle(-27, 5, 50) }
	}   
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["md_foregrip"] = Vector(0, 0.633, 7.737)},
	["md_bipod"] = {["md_foregrip"] = Vector(-1.405, -0.16, 9.366)}}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0.2)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LaserAngAdjustAim = Angle(0, 100.05, 0)

end

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.StockBGs = {main = 2, regular = 0, heavy = 1, sturdy = 2}
SWEP.SightBGs = {main = 1, none = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -200}, atts = {"md_microt1", "md_aimpoint", "md_eotech"}}, -- "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs" work only with 2d sights (simple_telescopics)
	[2] = {header = "Barrel", offset = {300, -200}, atts = {"md_saker"}},
	[3] = {header = "Handguard", offset = {150, 450}, atts = {"md_foregrip"}}, 
	[4] = {header = "Rail", offset = {-400, 0}, atts = {"md_anpeq15"}, dependencies = {md_foregrip = true}},
	[5] = {header = "Bipod", offset = {-400, 450}, atts = {"md_bipod"}, dependencies = {md_foregrip = true}},
	[6] = {header = "Stock", offset = {1200, 650}, atts = {"bg_ar15sturdystock", "bg_ar15heavystock"}},
	["+reload"] = {header = "Ammo", offset = {700, 600}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "draw",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.6, sound = "CW_901_MAGOUT"},
	[2] = {time = 1.3, sound = "CW_901_MAGIN"},
	[3] = {time = 2.0, sound = "CW_901_BOLT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_rif_calil.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_calil.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 200
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.098666666666667
SWEP.FireSound = "CW_CM901_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_FIRE_SUPPRESSED"
SWEP.Recoil = 1.45

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 1.4
SWEP.MaxSpreadInc = 0.02
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 45
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 1.0
SWEP.ReloadTime = 1.65
SWEP.ReloadTime_Empty = 1.65
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()

	self.EffectiveRange = 115 * 230
	self.DamageFallOff = .20
	
end