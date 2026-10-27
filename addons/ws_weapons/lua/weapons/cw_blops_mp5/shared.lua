AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MP5 (Black Ops II)"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "x"
	killicon.AddFont("cw_mp5", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_blops_mp5.mdl"
	SWEP.WMPos = Vector(-0.500, -2.000, -1.000)
	SWEP.WMAng = Vector(-4, 2, 180)

	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87
	
	SWEP.IronsightPos = Vector(-2.183, -3.831, 0.423)

	SWEP.IronsightAng = Vector(0.029, 0.032, 0)

	SWEP.MicroT1Pos = Vector(-2.162, -1.879, -0.828)

	SWEP.MicroT1Ang = Vector(0, 0.337, 0)	

	SWEP.CoD4ReflexPos = Vector(-2.138, -1.879, -0.747)

	SWEP.CoD4ReflexAng = Vector(0, 0.337, 0)
		
	SWEP.EoTechPos = Vector(-2.231, -4.035, -0.8)
	SWEP.EoTechAng = Vector(-0.387, -0.821, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.205, -4.035, -0.361)
	SWEP.CoD4TascoAng = Vector(0, 0.004, 0)
	
	SWEP.CSGOACOGPos = Vector(-2, -2.316, -0.856)

	SWEP.CSGOACOGAng = Vector(0, 1.6, 0)
	
	SWEP.SprintPos = Vector(3.459, 0, 0.595)
	SWEP.SprintAng = Vector(-28.48, 31.329, -15.922)

	SWEP.CustomizePos = Vector(3.788, -1.479, -0.08)
	SWEP.CustomizeAng = Vector(8.552, 34.962, 3.711)
	
	SWEP.AlternativePos = Vector(0, 1.325, -0.801)
	SWEP.AlternativeAng = Vector(0, 0, 0)
		
	SWEP.ShortDotPos = Vector(2.009, -5.844, 0.263)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(2.028, -5.613, -1.124), [2] = Vector(0, 0, 0)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 3, roll = 1, forward = 1, pitch = 1}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CSGOACOGAxisAlign = {right = -0.1, up = -0.1, forward = -40}
	
	SWEP.SprintViewNormals = {x = 1, y = -1, z = 1}

	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/cw2/attachments/pistolrail.mdl", bone = "Base", rel = "", pos = Vector(0.291, -2.27, -1.645), angle = Angle(0, 85.099, 0), size = Vector(0.2, 0.2, 0.2)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Base", rel = "", pos = Vector(0.222, -1.456, 1.845), angle = Angle(0, 174.576, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "Base", rel = "", pos = Vector(0.601, -5.558, -1.698), angle = Angle(0, 84.764, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Base", rel = "", pos = Vector(1.332, -12.815, -9.068), angle = Angle(0, -94.111, 0), size = Vector(1, 1, 1)},
		["md_cod4_aimpoint_v2"] = {model = "models/v_cod4_aimpoint.mdl", bone = "Base", rel = "", pos = Vector(0.555, -5.375, -1.706), angle = Angle(0, 84.994, 0), size = Vector(1, 1, 1)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "Base", rel = "", pos = Vector(0.985, -8.558, -2.402), angle = Angle(0, -95.42, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "Base", rel = "", pos = Vector(-1.088, 13.5, -1.331), angle = Angle(0, 174.996, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "gun", pos = Vector(0.224, 3.98, -1.884), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255)}
	}
	
	SWEP.ForegripOverridePos = {
		["bg_mp5_sdbarrel_blops"] = {
			["l-thumb-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-6.402, 0, 0) },
	
			["l-thumb-tip"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(21.54, 0, 0) },
	
			["l-thumb-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-8.431, 0, 0) }
		},
		
		["bg_mp5_kbarrel"] = {
			["Bip01 R Hand"] = {pos = Vector(0, 0, 0), angle = Angle(0.263, 23.951, -31.754) },
			["Bip01 R Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(-0.894, 32.728, 3.026) },
			["Bip01 R Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 12.1, 0) },
			["Bip01 R Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.451, 0) },
			["Bip01 R Clavicle"] = {pos = Vector(-6.856, 2.325, 2.252), angle = Angle(48.464, 28.256, 12.512) },
			["Bip01 R Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 14.687) },
			["Bip01 R Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(-1.813, 71.625, 0) },
			["Bip01 R Finger41"] = {pos = Vector(0, 0, 0), angle = Angle(0, -26.932, 0) },
			["Bip01 R Finger31"] = {pos = Vector(0, 0, 0), angle = Angle(0, -16.4, 0) },
			["Bip01 R Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 89.527, 0) },
			["Bip01 R Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 18.952, 11.305) },
			["Bip01 R Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(-15.782, -6.495, 33.964) },
			["Bip01 R Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 54.675, -4.284) },
			["Bip01 R Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 67.799, 0) }
		}
	}
	
	SWEP.AttachmentPosDependency = {["md_tundra9mm"] = {["bg_mp5_kbarrel"] = Vector(-0.038, -10.749, 0.324)}}

	SWEP.LaserPosAdjust = {x = 1, y = 0, z = 0}
	SWEP.LaserAngAdjust = {p = 2, y = 180, r = 0}
	SWEP.SightWithRail = true
	SWEP.CustomizationMenuScale = 0.012
end

SWEP.BarrelBGs = {main = 1, sd_blops = 1, regular = 0}
SWEP.StockBGs = {main = 2, regular = 0, inside = 1, nope = 2}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {700, -400}, atts = {"md_microt1", "md_eotech", "md_csgo_acog"}},
[2] = {header = "Barrel", offset = {200, -400}, atts = {"md_tundra9mm"}, exclusions = {bg_mp5_sdbarrel_blops = true}},
[3] = {header = "Handguard", offset = {-400, -400}, atts = {"bg_mp5_sdbarrel_blops"}},
[4] = {header = "Stock", offset = {700, 350}, atts = {"bg_stockin", "bg_nostock_blops"}},
["+attack2"] = {header = "Perks", offset = {-400, 100}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {700, 0}, atts = {"am_magnum", "am_matchgrade"}}}

	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 4, "md_cod4_aimpoint_v2")
end

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.35, sound = "CW_BLOPS_MP5_BOLTBACK"}},

	reload = {[1] = {time = 0.58, sound = "CW_BLOPS_MP5_MAGOUT"},
	[2] = {time = 1.6, sound = "CW_BLOPS_MP5_MAGIN"}},
	
	reload_empty = {[1] = {time = 0.4, sound = "CW_BLOPS_MP5_BOLTBACK"},
	[2] = {time = 1.23, sound = "CW_BLOPS_MP5_MAGOUT"},
	[3] = {time = 2.31, sound = "CW_BLOPS_MP5_MAGIN"},
	[4] = {time = 2.89, sound = "CW_BLOPS_MP5_BOLTFORWARD"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_blops_mp5.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_blops_mp5.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_BLOPS_MP5_FIRE"
SWEP.FireSoundSuppressed = "CW_BLOPS_MP5_FIRE_SUPPRESSED"
SWEP.Recoil = 0.35

SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.03
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 32
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.4
SWEP.ReloadTime = 1.86
SWEP.ReloadTime_Empty = 2.98
SWEP.ReloadHalt = 2.16
SWEP.ReloadHalt_Empty = 3.38

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end