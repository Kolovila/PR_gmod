AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Argus"
	SWEP.CSMuzzleFlashes = true
	SWEP.SnapToGrip = true	
	
	killicon.Add( "cw_blackops3_dlc4_cp_prec", "blackops3/icon_kill/cw_blackops3_dlc4_cp_prec", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("blackops3/icon_weapons/cw_blackops3_dlc4_cp_prec")

	SWEP.IronsightPos = Vector(-9.6159, 0.4704, 1.3889)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.BO3_ELOPos = Vector(-9.6159, -15.4364, 0.6582)
	SWEP.BO3_ELOAng = Vector(0, 0, 0)

	SWEP.BO3_ReflexPos = Vector(-9.6159, -15.4364, 0.0984)
	SWEP.BO3_ReflexAng = Vector(0, 0, 0)

	SWEP.BO3_ACOGPos = Vector(-9.6159, -10.7392, 0.425)
	SWEP.BO3_ACOGAng = Vector(0, 0, 0)

	SWEP.BO3_HybirdPos = Vector(-9.6159, 34.5513, -0.3442)
	SWEP.BO3_HybirdAng = Vector(0, 0, 0)

	SWEP.BO3_HoloPos = Vector(-9.6159, -15.4364, 0.0864)
	SWEP.BO3_HoloAng = Vector(0, 0, 0)

	SWEP.BO3_IRPos = Vector(-9.6159, -15.4364, 0.6582)
	SWEP.BO3_IRAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(2.95, -3.057, -4.119)
	SWEP.SprintAng = Vector(-13.131, 33.537, -29.906)

	SWEP.CustomizePos = Vector(20.199, -5.829, 5)
	SWEP.CustomizeAng = Vector(21.255, 37.437, 30.848)
	
	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.ViewModelMovementScale = 1.65
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = false
	SWEP.ShellScale = 0.9
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	
	SWEP.BipodAngleLimitYaw = 40
	
	SWEP.SightWithRail = false
	
	SWEP.OffsetBoltOnBipodShoot = true

	SWEP.HUD_3D2DScale = 0.045
	
	SWEP.AttachmentModelsVM = {
		["md_blackops3_sil_ar"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", attachVMBodyGroups = {[4] = 1,}, detachVMBodyGroups = {[4] = 0,}},
		["md_blackops3_hybrid"] = {model = "models/loyalists/blackops3/public/optic_hybrid.mdl", pos = Vector(12.3332, 0, 12.6537), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_reflex"] = {model = "models/loyalists/blackops3/public/optic_reflex.mdl", pos = Vector(12.3332, 0, 12.3332), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_acog"] = {model = "models/loyalists/blackops3/public/optic_acog.mdl", pos = Vector(12.3332, 0, 12.709), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_holo"] = {model = "models/loyalists/blackops3/public/optic_holo.mdl", pos = Vector(12.3332, 0, 12.6537), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_ir"] = {model = "models/loyalists/blackops3/public/optic_thermal.mdl", pos = Vector(12.3332, 0, 12.5537), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_elo"] = {model = "models/loyalists/blackops3/public/optic_laser.mdl", pos = Vector(12.3332, 0, 12.6537), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_barrel_long"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", attachVMBodyGroups = {[4] = 2,}, detachVMBodyGroups = {[4] = 0,}},
		["bg_blackops3_stock_heavy"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", attachVMBodyGroups = {[5] = 1,}, detachVMBodyGroups = {[5] = 0,}},
		["bg_blackops3_stock_light"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", attachVMBodyGroups = {[5] = 1,}, detachVMBodyGroups = {[5] = 0,}},
		["bg_blackops3_fast_mag"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", attachVMBodyGroups = {[3] = 1,[7] = 1,}, detachVMBodyGroups = {[3] = 0,[7] = 0,}},
		["bg_blackops3_ext_mag"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", attachVMBodyGroups = {[8] = 1,}, detachVMBodyGroups = {[8] = 0,}},
		["md_blackops3_dbal"] = {model = "models/loyalists/blackops3/cp/prec/prec_dbal_01.mdl", pos = Vector(40.7294, 2.813, 8.988), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
	}
	
	SWEP.AttachmentModelsWM = {
		["md_blackops3_sil_ar"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon", attachWMBodyGroups = {[3] = 1,}, detachWMBodyGroups = {[3] = 0,}},
		["md_blackops3_hybrid"] = {model = "models/loyalists/blackops3/public/optic_hybrid.mdl", bone = "tag_weapon", pos = Vector(4.7075, 0, 4.9619), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},	
		["md_blackops3_reflex"] = {model = "models/loyalists/blackops3/public/optic_reflex.mdl", bone = "tag_weapon", pos = Vector(4.7075, 0, 4.9619), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_blackops3_acog"] = {model = "models/loyalists/blackops3/public/optic_acog.mdl", bone = "tag_weapon", pos = Vector(4.7075, 0, 4.9619), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},	
		["md_blackops3_holo"] = {model = "models/loyalists/blackops3/public/optic_holo.mdl", bone = "tag_weapon", pos = Vector(4.7075, 0, 4.9619), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_blackops3_ir"] = {model = "models/loyalists/blackops3/public/optic_thermal.mdl", bone = "tag_weapon", pos = Vector(4.7075, 0, 4.9619), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_blackops3_elo"] = {model = "models/loyalists/blackops3/public/optic_laser.mdl", pos = Vector(4.7075, 0, 4.9619), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon"},
		["md_blackops3_barrel_long"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon", attachWMBodyGroups = {[3] = 2,}, detachWMBodyGroups = {[3] = 0,}},
		["bg_blackops3_stock_heavy"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon", attachWMBodyGroups = {[4] = 1,}, detachWMBodyGroups = {[4] = 0,}},
		["bg_blackops3_stock_light"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon", attachWMBodyGroups = {[4] = 1,}, detachWMBodyGroups = {[4] = 0,}},
		["bg_blackops3_fast_mag"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon", attachWMBodyGroups = {[2] = 1,[6] = 1,}, detachWMBodyGroups = {[2] = 0,[6] = 0,}},
		["bg_blackops3_ext_mag"] = {model = "models/loyalists/blackops3/public/placeholder.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon", attachWMBodyGroups = {[7] = 1,}, detachWMBodyGroups = {[7] = 0,}},
		["md_blackops3_dbal"] = {model = "models/loyalists/blackops3/cp/prec/prec_dbal_01.mdl", pos = Vector(15.663, 1.1403, 3.4912), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon"},
	}
	
	SWEP.CustomizationMenuScale = 0.035
end

SWEP.SightBGs = {main = 10, carryhandle = 0, none = 1}
SWEP.WMSightBGs = {main = 9, carryhandle = 0, none = 1}

SWEP.Attachments = {
	[1] = {header = "Sight", offset = {1100, -300},  atts = {"md_blackops3_elo", "md_blackops3_reflex", "md_blackops3_acog", "md_blackops3_hybrid", "md_blackops3_holo", "md_blackops3_ir"}},
	[2] = {header = "Magazine", offset = {600, 600}, atts = {"bg_blackops3_fast_mag", "bg_blackops3_ext_mag"}},
	[3] = {header = "Barrel", offset = {-100, -300}, atts = {"md_blackops3_barrel_long", "md_blackops3_sil_ar"}},
	[4] = {header = "Stock", offset = {1500, 600}, atts = {"bg_blackops3_stock_heavy", "bg_blackops3_stock_light"}},
	[5] = {header = "Rail", offset = {-100, 600}, atts = {"md_blackops3_dbal"}},
	["+reload"] = {header = "Ammo", offset = {1500, 200}, atts = {"am_slugrounds", "am_flechetterounds"}}
	}

-- coded extended anims
-- INS2-ish nomenclature
SWEP.Animations = {
	base_idle = "base_idle",
	base_fire = "base_fire",
	base_fire_ads = "base_fire_ads",
	base_fire_last = "base_lastshot",
	base_reload = "base_reload",
	base_reload_empty = "base_reload_empty",
	base_reload_ext = "base_reload_ext",
	base_reload_empty_ext = "base_reload_ext_empty",
	base_reload_dm = "base_reload_quick",
	base_reload_empty_dm = "base_reload_empty_quick",
	base_rechamber = "base_rechamber",
	base_rechamber_ads = "base_rechamber_ads",
	base_draw = "base_draw",
	base_draw_first = "base_draw_first",
	base_holster = "base_holster",
	base_melee = "base_melee",
	base_crawl_loop = "base_crawl_loop",
	base_mantle_over = "base_mantle_over",
	base_sprint_in = "base_sprint_in",
	base_sprint_loop = "base_sprint_loop",
	base_sprint_out = "base_sprint_out",
	}
	
SWEP.Sounds = {
	base_reload = {
	[1] = {time = 0.2, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Open"},
	[2] = {time = 0.4, sound = "Weapon_BLACKOPS3_ARGUS.Wheel"},
	[3] = {time = 0.6, sound = "Weapon_BLACKOPS3_ARGUS.Magout"},
	[4] = {time = 1.6, sound = "Weapon_BLACKOPS3_ARGUS.Magin"},
	[5] = {time = 2.2, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Close"},
	},
	
	base_reload_empty = {
	[1] = {time = 0.2, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Open"},
	[2] = {time = 0.4, sound = "Weapon_BLACKOPS3_ARGUS.Wheel"},
	[3] = {time = 0.6, sound = "Weapon_BLACKOPS3_ARGUS.Magout"},
	[4] = {time = 1.6, sound = "Weapon_BLACKOPS3_ARGUS.Magin"},
	[5] = {time = 2.2, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Close"},
	},

	base_reload_ext = {
	[1] = {time = 0.2, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Open"},
	[2] = {time = 0.4, sound = "Weapon_BLACKOPS3_ARGUS.Wheel_Close"},
	[3] = {time = 0.6, sound = "Weapon_BLACKOPS3_ARGUS.Magout"},
	[4] = {time = 1.6, sound = "Weapon_BLACKOPS3_ARGUS.Magin"},
	[5] = {time = 2.2, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Close"},
	},
	
	base_reload_ext_empty = {
	[1] = {time = 0.2, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Open"},
	[2] = {time = 0.4, sound = "Weapon_BLACKOPS3_ARGUS.Wheel_Close"},
	[3] = {time = 0.6, sound = "Weapon_BLACKOPS3_ARGUS.Magout"},
	[4] = {time = 1.7, sound = "Weapon_BLACKOPS3_ARGUS.Magin"},
	[5] = {time = 2.6, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Close"},
	},
	
	base_reload_quick = {
	[1] = {time = 0.2, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Open"},
	[2] = {time = 0.4, sound = "Weapon_BLACKOPS3_ARGUS.Wheel_Close"},
	[3] = {time = 0.6, sound = "Weapon_BLACKOPS3_ARGUS.Magout"},
	[4] = {time = 1.1, sound = "Weapon_BLACKOPS3_ARGUS.Magin"},
	[5] = {time = 1.5, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Close"},
	},
	
	base_reload_empty_quick = {
	[1] = {time = 0.2, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Open"},
	[2] = {time = 0.4, sound = "Weapon_BLACKOPS3_ARGUS.Wheel_Close"},
	[3] = {time = 0.6, sound = "Weapon_BLACKOPS3_ARGUS.Magout"},
	[4] = {time = 1.1, sound = "Weapon_BLACKOPS3_ARGUS.Magin"},
	[5] = {time = 1.5, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Close"},
	[6] = {time = 1.6, sound = "Weapon_BLACKOPS3_ARGUS.First_Raise"},
	},
	
	base_lastshot = {
	[1] = {time = 0.1, sound = "Weapon_BLACKOPS3_ARGUS.Wheel"},
	[2] = {time = 0.15, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Open"},
	[3] = {time = 0.35, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Close"},
	[4] = {time = 0.4, sound = "Weapon_BLACKOPS3_ARGUS.Wheel_Close"},
	},
	
	base_rechamber = {
	[1] = {time = 0.1, sound = "Weapon_BLACKOPS3_ARGUS.Wheel"},
	[2] = {time = 0.15, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Open"},
	[3] = {time = 0.35, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Close"},
	[4] = {time = 0.4, sound = "Weapon_BLACKOPS3_ARGUS.Wheel_Close"},
	},
	
	base_rechamber_ads = {
	[1] = {time = 0.1, sound = "Weapon_BLACKOPS3_ARGUS.Wheel"},
	[2] = {time = 0.15, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Open"},
	[3] = {time = 0.35, sound = "Weapon_BLACKOPS3_ARGUS.Lever_Close"},
	[4] = {time = 0.4, sound = "Weapon_BLACKOPS3_ARGUS.Wheel_Close"},
	},
	
	base_draw_first = {
	[1] = {time = 0.0, sound = "Weapon_BLACKOPS3_Cloth.Med"},
	[2] = {time = 0.0, sound = "Weapon_BLACKOPS3_ARGUS.First_Raise"},
	},
}
	
SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"pump"}
SWEP.Base = "cw_blackops3_base"
SWEP.Category = "CW 2.0 Black Ops III"

SWEP.Author				= "Loyalists"
SWEP.Contact			= ""
SWEP.Purpose			= ""

SWEP.Trivia = {
	text = "Lever-action shotgun. Reliable with a small hip-fire spread, and deadly accurate while ADS.",
	x = -300, 
	y = -400, 
--	textFormatFunc = function(self, wep) if wep.ActiveAttachments.md_bipod then return "" else return self.text end end
	}

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/loyalists/blackops3/cp/prec/v_shot_prec.mdl"
SWEP.WorldModel		= "models/loyalists/blackops3/cp/prec/w_shot_prec.mdl"
SWEP.WM				= "models/loyalists/blackops3/cp/prec/w_shot_prec.mdl"
SWEP.WMPos			= Vector(-1,0,0)
SWEP.WMAng			= Vector(-5,0,180)
SWEP.DrawTraditionalWorldModel = false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.SnapToIdlePostReload = false

SWEP.Primary.ClipSize		= 10
SWEP.Primary.ClipSize_Ext	= 14
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay				= 0.2
SWEP.FireSound				= "CW_BLACKOPS3_ARGUS_FIRE"
SWEP.FireSoundSuppressed	= "CW_BLACKOPS3_ARGUS_FIRE_SUPPRESSED"
SWEP.Recoil					= 2.0

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.05
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.1
SWEP.ClumpSpread = 0.02
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 8
SWEP.Damage = 10

SWEP.HolsterSpeed = 1
SWEP.HolsterTime = 0.5

SWEP.DeployTime = 0.83
SWEP.FirstDeployTime = 1.3
SWEP.FirstDrawSpeed = 1

SWEP.ReloadSpeed = 1.0
SWEP.RechamberTime = 0.7
-- SWEP.RechamberDelayMul = 3.5

SWEP.ReloadTime = 2.77
SWEP.ReloadTime_Empty = 2.77
SWEP.ReloadHalt = 2.77
SWEP.ReloadHalt_Empty = 2.77
SWEP.ReloadTime_Fast = 1.8
SWEP.ReloadTime_Empty_Fast = 2.2

SWEP.MeleeAttackRange = 50
SWEP.MeleeAttackDamage = 75
SWEP.MeleeInTime = 0.15
SWEP.MeleeOutTime = 0.7

// Custom Features
SWEP.QuickMeleeLogic = true
SWEP.DualMagLogic = false
SWEP.Chamberable = false
SWEP.BoltActionLogic = true