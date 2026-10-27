AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MR6"
	SWEP.CSMuzzleFlashes = true
	SWEP.SnapToGrip = true	
	
	killicon.Add( "cw_blackops3_mr6", "blackops3/icon_kill/cw_blackops3_mr6", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("blackops3/icon_weapons/cw_blackops3_mr6")

	SWEP.IronsightPos = Vector(-8.9801, 11.1574, 4.4512)
	SWEP.IronsightAng = Vector()

	SWEP.H1RDSPos = Vector(-8.9801, -20.7446, 2.4809)
	SWEP.H1RDSAng = Vector()
	
	SWEP.BO3_ReflexPos = Vector(-8.9801, -20.7446, 2.4809)
	SWEP.BO3_ReflexAng = Vector()

	SWEP.BO3_ELOPos = Vector(-8.9801, -15.4003, 2.9784)
	SWEP.BO3_ELOAng = Vector()

	SWEP.SprintPos = Vector(2.95, -3.057, -4.119)
	SWEP.SprintAng = Vector(-13.131, 33.537, -29.906)
	
--	SWEP.SprintPos = Vector(0, 0, 0)
--	SWEP.SprintAng = Vector(-15.478, 21.809, -31.659)

	SWEP.CustomizePos = Vector(20.199, -5.829, 5)
	SWEP.CustomizeAng = Vector(21.255, 37.437, 30.848)
	
--	SWEP.CustomizePos = Vector(10.854, 0, 1.004)
--	SWEP.CustomizeAng = Vector(16.25, 25.139, 16.18)
	
	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.ViewModelMovementScale = 1.65
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.9
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	
	SWEP.BipodAngleLimitYaw = 40
	
	SWEP.SightWithRail = false
	
	SWEP.OffsetBoltOnBipodShoot = true

	SWEP.HUD_3D2DScale = 0.045
	
	SWEP.AttachmentModelsVM = {
		["md_blackops3_sil_ar"] = {model = "models/loyalists/blackops3/mr6/mr6_silencer_01.mdl", pos = Vector(23.2453, 0, 7.5804), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_reflex"] = {model = "models/loyalists/blackops3/public/optic_reflex.mdl", pos = Vector(12.5184, 0, 2.0508), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_slide_animate"},
		["md_blackops3_elo"] = {model = "models/loyalists/blackops3/public/optic_laser.mdl", pos = Vector(12.5184, 0, 2.391), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_slide_animate"},
		["md_blackops3_barrel_long"] = {model = "models/loyalists/blackops3/mr6/mr6_barrel_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", bone_merge = true},
		["md_blackops3_dbal"] = {model = "models/loyalists/blackops3/mr6/mr6_laser_01.mdl", pos = Vector(-4.9073, 0, 3.6103), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_laser", attachVMBodyGroups = {[5] = 1,}, detachVMBodyGroups = {[5] = 0,}},
		["h1_att_reddot"] = {model = "models/loyalists/h1/public/optic_reddot_vm.mdl", pos = Vector(12.5184, 0, 2.2), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_slide_animate", retSizeMult = 2},
	}
	
	SWEP.AttachmentModelsWM = {
		["md_blackops3_sil_ar"] = {model = "models/loyalists/blackops3/mr6/mr6_silencer_01.mdl", pos = Vector(8.1, 0, 3.0026), angle = Angle(0, -90, 0), size = Vector(0.3044, 0.3044, 0.3044), bone = "tag_weapon"},
		["md_blackops3_reflex"] = {model = "models/loyalists/blackops3/public/optic_reflex.mdl", pos = Vector(5.1144, 0, 3.2383), angle = Angle(0, -90, 0), size = Vector(0.375, 0.375, 0.375), bone = "tag_weapon"},
		["md_blackops3_elo"] = {model = "models/loyalists/blackops3/public/optic_laser.mdl", pos = Vector(4.5171, 0, 3.3659), angle = Angle(0, -90, 0), size = Vector(0.375, 0.375, 0.375), bone = "tag_weapon"},
		["md_blackops3_barrel_long"] = {model = "models/loyalists/blackops3/mr6/mr6_barrel_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.375, 0.375, 0.375), bone = "tag_barrel"},
		["md_blackops3_dbal"] = {model = "models/loyalists/blackops3/mr6/mr6_laser_01.mdl", pos = Vector(-1.8398, 0, 1.5513), angle = Angle(0, -90, 0), size = Vector(0.375, 0.375, 0.375), bone = "tag_laser", attachWMBodyGroups = {[1] = 1,}, detachWMBodyGroups = {[1] = 0,}},
		["h1_att_reddot"] = {model = "models/loyalists/h1/public/optic_reddot_vm.mdl", bone = "tag_weapon", pos = Vector(4.5171, 0, 3.3659), angle = Angle(0, -90, 0), size = Vector(0.375, 0.375, 0.375)},
	}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 	

	SWEP.AimSwayIntensity = 0.3
	
	SWEP.CustomizationMenuScale = 0.035
end

SWEP.MagBGs = {main = 1, fast_mag = 2, ext_mag = 1, regular = 0}
SWEP.BarrelBGs = {main = 3, long = 1, regular = 0}

SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {
	[1] = {header = "Sight", offset = {500, -300},  atts = {"md_blackops3_elo", "md_blackops3_reflex", "h1_att_reddot"}},
	[2] = {header = "Magazine", offset = {500, 400}, atts = {"bg_blackops3_fast_mag", "bg_blackops3_ext_mag"}},
	[3] = {header = "Barrel", offset = {-300, -300}, atts = {"md_blackops3_barrel_long", "md_blackops3_sil_ar"}},
	[4] = {header = "Rail", offset = {-300, 400}, atts = {"md_blackops3_dbal"}},
	[5] = {header = "Sight Contract", offset = {-300, 100}, atts = {"h1_att_contract"}},
	["+reload"] = {header = "Ammo", offset = {1100, 400}, atts = {"am_magnum", "am_matchgrade"}}
	}

SWEP.Animations = {
	base_idle = "base_idle",
	base_fire = "base_fire",
	base_fire_ads = "base_fire_ads",
	base_reload = "base_reload",
	base_reload_empty = "base_reload_empty",
	base_reload_ext = "base_reload_ext",
	base_reload_empty_ext = "base_reload_empty_ext",
	base_reload_dm = "base_reload_dm",
	base_reload_empty_dm = "base_reload_empty_dm",
	base_draw = "base_draw",
	base_draw_first = "base_draw_first",
	base_holster = "base_holster",
	base_melee = "base_melee",
	base_crawl_loop = "base_crawl_loop",
	base_mantle_over = "base_mantle_over",
	base_sprint_in = "base_sprint_in",
	base_sprint_loop = "base_sprint_loop",
	base_sprint_out	= "base_sprint_out",
	}
	
SWEP.Sounds = { 
	base_reload = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_MR6.Magout"},
	[2] = {time = 0.75, sound = "Weapon_BLACKOPS3_MR6.Magin"},
	},

	base_reload_empty = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_MR6.Magout"},
	[2] = {time = 0.75, sound = "Weapon_BLACKOPS3_MR6.Magin"},
	[3] = {time = 1.2, sound = "Weapon_BLACKOPS3_MR6.Slide_Back"},
	[4] = {time = 1.35, sound = "Weapon_BLACKOPS3_MR6.Slide_Forward"},
	},
	
	base_reload_ext = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_MR6.Magout"},
	[2] = {time = 0.75, sound = "Weapon_BLACKOPS3_MR6.Magin"},
	},

	base_reload_empty_ext = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_MR6.Magout"},
	[2] = {time = 0.75, sound = "Weapon_BLACKOPS3_MR6.Magin"},
	[3] = {time = 1.2, sound = "Weapon_BLACKOPS3_MR6.Slide_Back"},
	[4] = {time = 1.35, sound = "Weapon_BLACKOPS3_MR6.Slide_Forward"},
	},
	
	base_reload_dm = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_MR6.Magout"},
	[2] = {time = 0.75, sound = "Weapon_BLACKOPS3_MR6.Magin"},
	},

	base_reload_empty_dm = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_MR6.Magout"},
	[2] = {time = 0.75, sound = "Weapon_BLACKOPS3_MR6.Magin"},
	[3] = {time = 1.2, sound = "Weapon_BLACKOPS3_MR6.Slide_Back"},
	},
	
	base_draw_first = {
	[1] = {time = 0.35, sound = "Weapon_BLACKOPS3_MR6.Slide_Back"},
	[2] = {time = 0.5, sound = "Weapon_BLACKOPS3_MR6.Slide_Forward"},
	},
}
	
SWEP.SpeedDec = 10

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_blackops3_base"
SWEP.Category = "CW 2.0 Black Ops III"

SWEP.Author				= "Loyalists"
SWEP.Contact			= ""
SWEP.Purpose			= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/loyalists/blackops3/mr6/v_pistol_mr6.mdl"
SWEP.WorldModel		= "models/loyalists/blackops3/mr6/w_pistol_mr6.mdl"
SWEP.WM		= "models/loyalists/blackops3/mr6/w_pistol_mr6.mdl"
SWEP.WMPos			= Vector(-1,-1,0)
SWEP.WMAng			= Vector(0,0,180)
SWEP.DrawTraditionalWorldModel = false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.SnapToIdlePostReload = false

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".45 ACP"

SWEP.FireDelay				= 60/500
SWEP.FireSound				= "CW_BLACKOPS3_MR6_FIRE"
SWEP.FireSoundSuppressed	= "CW_BLACKOPS3_MR6_FIRE_SUPPRESSED"
SWEP.Recoil					= 0.4

SWEP.HipSpread = 0.15
SWEP.AimSpread = 0.02
SWEP.VelocitySensitivity = 1.0
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 40

SWEP.HolsterSpeed = 1

SWEP.DeployTime = 0.5
SWEP.FirstDeployTime = 1.3
SWEP.FirstDrawSpeed = 1

SWEP.ReloadSpeed = 1.0
SWEP.ReloadTime = 1.5
SWEP.ReloadTime_Empty = 1.85
SWEP.ReloadHalt = 1.5
SWEP.ReloadHalt_Empty = 1.85
SWEP.ReloadTime_Fast = 1.2
SWEP.ReloadTime_Empty_Fast = 1.4

SWEP.ViewbobIntensity = 0.25

SWEP.MeleeAttackRange = 50
SWEP.MeleeAttackDamage = 40
SWEP.MeleeInTime = 0.15
SWEP.MeleeOutTime = 0.6
SWEP.MeleeAttackDamageWindow = 0.05

// Custom Features
SWEP.QuickMeleeLogic = true
SWEP.DualMagLogic = false