CustomizableWeaponry_BlackOps3_DLC4 = true

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M8A7"
	SWEP.CSMuzzleFlashes = true
	SWEP.SnapToGrip = true	
	
	killicon.Add( "cw_blackops3_dlc4_m8a7", "blackops3/icon_kill/cw_blackops3_dlc4_m8a7", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("blackops3/icon_weapons/cw_blackops3_dlc4_m8a7")

	SWEP.IronsightPos = Vector(-10.2604, -2.9923, 1.0979)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.BO3_ELOPos = Vector(-10.2604, -10.8003, -1.3634)
	SWEP.BO3_ELOAng = Vector(0, 0, 0)

	SWEP.BO3_ReflexPos = Vector(-10.2604, -10.8003, -1.8174)
	SWEP.BO3_ReflexAng = Vector()

	SWEP.BO3_ACOGPos = Vector(-10.2604, -10.8003, -1.3322)
	SWEP.BO3_ACOGAng = Vector()

	SWEP.BO3_HybirdPos = Vector(-10.2604, 36.0203, -2.3873)
	SWEP.BO3_HybirdAng = Vector()

	SWEP.BO3_HoloPos = Vector(-10.2604, -11.0667, -1.8073)
	SWEP.BO3_HoloAng = Vector()

	SWEP.BO3_IRPos = Vector(-10.2604, -10.8003, -1.3634)
	SWEP.BO3_IRAng = Vector(0, 0, 0)
	
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
	SWEP.ShellScale = 0.9
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	
	SWEP.BipodAngleLimitYaw = 40
	
	SWEP.OffsetBoltOnBipodShoot = true
	
	SWEP.AttachmentModelsVM = {
		["md_blackops3_dbal"] = {model = "models/loyalists/blackops3/m8a7/m8a7_dbal_01.mdl", pos = Vector(40.7177, 4.236, 5.2513), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_grip_ar"] = {model = "models/loyalists/blackops3/m8a7/m8a7_foregrip_01.mdl", pos = Vector(32.6731, 0, 0.1014), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_grip_smg"] = {model = "models/loyalists/blackops3/m8a7/m8a7_foregrip_02.mdl", pos = Vector(32.6731, 0, 0.1014), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_sil_ar"] = {model = "models/loyalists/blackops3/m8a7/m8a7_silencer_01.mdl", pos = Vector(60.2611, 0, 6.7483), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_hybrid"] = {model = "models/loyalists/blackops3/public/optic_hybrid.mdl", pos = Vector(11.6937, 0, 16.339), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},	
		["md_blackops3_reflex"] = {model = "models/loyalists/blackops3/public/optic_reflex.mdl", pos = Vector(10.6937, 0, 15.9), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_acog"] = {model = "models/loyalists/blackops3/public/optic_acog.mdl", pos = Vector(14.8, 0, 16.1), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_holo"] = {model = "models/loyalists/blackops3/public/optic_holo.mdl", pos = Vector(12, 0, 16.2), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_ir"] = {model = "models/loyalists/blackops3/public/optic_thermal.mdl", pos = Vector(11, 0, 15.9), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["md_blackops3_elo"] = {model = "models/loyalists/blackops3/public/optic_laser.mdl", pos = Vector(10.6937, 0, 16.339), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon"},
		["bg_blackops3_stock_heavy"] = {model = "models/loyalists/blackops3/m8a7/m8a7_stock_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", bone_merge = true},
		["bg_blackops3_stock_light"] = {model = "models/loyalists/blackops3/m8a7/m8a7_stock_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", bone_merge = true},
		["md_blackops3_cover"] = {model = "models/loyalists/blackops3/m8a7/m8a7_handguard_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", bone_merge = true, attachVMBodyGroups = {[7] = 1,},detachVMBodyGroups = {[7] = 0,}},
		["md_blackops3_barrel_long"] = {model = "models/loyalists/blackops3/m8a7/m8a7_barrel_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "tag_weapon", bone_merge = true, attachVMBodyGroups = {[10] = 1,},detachVMBodyGroups = {[10] = 0,}},
	}
	
	SWEP.AttachmentModelsWM = {
		["md_blackops3_dbal"] = {model = "models/loyalists/blackops3/m8a7/m8a7_dbal_01.mdl", pos = Vector(16.271, 1.6664, 2.0932), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon"},
		["md_blackops3_grip_ar"] = {model = "models/loyalists/blackops3/m8a7/m8a7_foregrip_01.mdl", pos = Vector(14.7723, 0, 0.1859), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon"},
		["md_blackops3_grip_smg"] = {model = "models/loyalists/blackops3/m8a7/m8a7_foregrip_02.mdl", pos = Vector(14.7723, 0, 0.1859), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon"},
		["md_blackops3_sil_ar"] = {model = "models/loyalists/blackops3/m8a7/m8a7_silencer_01.mdl", pos = Vector(24.3953, 0, 2.6649), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon"},
		["md_blackops3_hybrid"] = {model = "models/loyalists/blackops3/public/optic_hybrid.mdl", bone = "tag_weapon", pos = Vector(4.7272, 0, 6.5298), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},	
		["md_blackops3_reflex"] = {model = "models/loyalists/blackops3/public/optic_reflex.mdl", bone = "tag_weapon", pos = Vector(4.7272, 0, 6.5298), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_blackops3_acog"] = {model = "models/loyalists/blackops3/public/optic_acog.mdl", bone = "tag_weapon", pos = Vector(4.7272, 0, 6.5298), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},	
		["md_blackops3_holo"] = {model = "models/loyalists/blackops3/public/optic_holo.mdl", bone = "tag_weapon", pos = Vector(4.7272, 0, 6.5298), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_blackops3_ir"] = {model = "models/loyalists/blackops3/public/optic_thermal.mdl", bone = "tag_weapon", pos = Vector(4.7272, 0, 6.5298), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_blackops3_elo"] = {model = "models/loyalists/blackops3/public/optic_laser.mdl", pos = Vector(4.7272, 0, 6.5298), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_weapon"},
		["bg_blackops3_stock_heavy"] = {model = "models/loyalists/blackops3/m8a7/m8a7_stock_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_stock", attachWMBodyGroups = {[4] = 1,},detachWMBodyGroups = {[4] = 0,}},
		["bg_blackops3_stock_light"] = {model = "models/loyalists/blackops3/m8a7/m8a7_stock_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_stock", attachWMBodyGroups = {[4] = 1,},detachWMBodyGroups = {[4] = 0,}},
		["md_blackops3_cover"] = {model = "models/loyalists/blackops3/m8a7/m8a7_handguard_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_handguard", attachWMBodyGroups = {[7] = 1,},detachWMBodyGroups = {[7] = 0,}},
		["md_blackops3_barrel_long"] = {model = "models/loyalists/blackops3/m8a7/m8a7_barrel_01.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4), bone = "tag_barrel", attachWMBodyGroups = {[10] = 1,},detachWMBodyGroups = {[10] = 0,}},
	}
	
	SWEP.ForegripOverridePos = {
		["customizing"] = {
		["j_shoulder_le"] = { pos = Vector(-6.481, 5.741, -13.148), angle = Angle(0, 0, 0) },
		},
	}

	SWEP.AimSwayIntensity = 0.3
	SWEP.CustomizationMenuScale = 0.035
end

SWEP.SightBGs = {main = 3, carryhandle = 0, none = 1}
SWEP.MagBGs = {main = 1, fast_mag = 2, ext_mag = 1, regular = 0}
SWEP.StockBGs = {main = 4, light = 1, heavy = 1, regular = 0}

SWEP.Attachments = {
	[1] = {header = "Sight", offset = {1100, -500},  atts = {"md_blackops3_elo", "md_blackops3_reflex", "md_blackops3_acog", "md_blackops3_hybrid", "md_blackops3_holo", "md_blackops3_ir"}},
	[2] = {header = "Handguard", offset = {-100, 600}, atts = {"md_blackops3_grip_ar", "md_blackops3_grip_smg"}},
	[3] = {header = "Magazine", offset = {1100, 600}, atts = {"bg_blackops3_fast_mag", "bg_blackops3_ext_mag"}},
	[4] = {header = "Barrel", offset = {-100, -100}, atts = {"md_blackops3_barrel_long", "md_blackops3_sil_ar"}},
	[5] = {header = "Receiver", offset = {400, -100}, atts = {"md_blackops3_cover"}},
	[6] = {header = "Stock", offset = {1500, 600}, atts = {"bg_blackops3_stock_heavy", "bg_blackops3_stock_light"}},
	[7] = {header = "Rail", offset = {400, 600}, atts = {"md_blackops3_dbal"}},
	["+reload"] = {header = "Ammo", offset = {1500, 200}, atts = {"am_magnum", "am_matchgrade"}}
	}

-- coded extended anims
-- INS2-ish nomenclature
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
	base_reload_dm_quick = "base_reload_dm_quick",
	base_reload_empty_dm_quick = "base_reload_empty_dm_quick",
	base_draw = "base_draw",
	base_draw_quick = "base_draw_quick",
	base_draw_first = "base_draw_first",
	base_holster = "base_holster",
	base_holster_quick = "base_holster_quick",
	base_melee = "base_melee",
	base_crawl_loop = "base_crawl_loop",
	base_mantle_over = "base_mantle_over",
	base_sprint_in = "base_sprint_in",
	base_sprint_loop = "base_sprint_loop",
	base_sprint_out	= "base_sprint_out",
	
	grip_idle = "grip_idle",
	grip_fire = "grip_fire",
	grip_fire_ads = "grip_fire_ads",
	grip_reload = "grip_reload",
	grip_reload_empty = "grip_reload_empty",
	grip_reload_ext = "grip_reload_ext",
	grip_reload_empty_ext = "grip_reload_empty_ext",
	grip_reload_dm = "grip_reload_dm",
	grip_reload_empty_dm = "grip_reload_empty_dm",
	grip_reload_dm_quick = "grip_reload_dm_quick",
	grip_reload_empty_dm_quick = "grip_reload_empty_dm_quick",
	grip_draw = "grip_draw",
	grip_draw_quick = "grip_draw_quick",
	grip_draw_first = "grip_draw_first",
	grip_holster = "grip_holster",
	grip_holster_quick = "grip_holster_quick",
	grip_melee = "grip_melee",
	grip_crawl_loop = "grip_crawl_loop",
	grip_mantle_over = "grip_mantle_over",
	grip_sprint_in = "grip_sprint_in",
	grip_sprint_loop = "grip_sprint_loop",
	grip_sprint_out	= "grip_sprint_out",
	}
	
SWEP.Sounds = { 
	base_reload = {
	[1] = {time = 0.35, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.41, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 1.90, sound = "Weapon_BLACKOPS3_M8A7.Tap"},
	},

	base_reload_empty = {
	[1] = {time = 0.35, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.41, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 1.90, sound = "Weapon_BLACKOPS3_M8A7.Tap"},
	[4] = {time = 2.25, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Back"},
	[5] = {time = 2.45, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Forward"},
	},	

	base_reload_ext = {
	[1] = {time = 0.35, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.41, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	},

	base_reload_empty_ext = {
	[1] = {time = 0.35, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.41, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 2.25, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Back"},
	[4] = {time = 2.45, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Forward"},
	},	
	
	base_reload_dm = {
	[1] = {time = 0.45, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.0, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	},

	base_reload_empty_dm = {
	[1] = {time = 0.45, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.0, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 1.45, sound = "Weapon_BLACKOPS3_M8A7.Tap"},
	},
	
	base_reload_dm_quick = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 0.8, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	},

	base_reload_empty_dm_quick = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 0.8, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 1.45, sound = "Weapon_BLACKOPS3_M8A7.Tap"},
	},
	
	base_draw_first = {
	[1] = {time = 0.5, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Back"},
	[2] = {time = 0.75, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Forward"},
	},
	
	grip_reload = {
	[1] = {time = 0.35, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.41, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 1.90, sound = "Weapon_BLACKOPS3_M8A7.Tap"},
	},

	grip_reload_empty = {
	[1] = {time = 0.35, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.41, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 1.90, sound = "Weapon_BLACKOPS3_M8A7.Tap"},
	[4] = {time = 2.25, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Back"},
	[5] = {time = 2.45, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Forward"},
	},	

	grip_reload_ext = {
	[1] = {time = 0.35, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.41, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	},

	grip_reload_empty_ext = {
	[1] = {time = 0.35, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.41, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 2.25, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Back"},
	[4] = {time = 2.45, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Forward"},
	},	
	
	grip_reload_dm = {
	[1] = {time = 0.45, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.0, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	},

	grip_reload_empty_dm = {
	[1] = {time = 0.45, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 1.0, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 1.45, sound = "Weapon_BLACKOPS3_M8A7.Tap"},
	},
	
	grip_reload_dm_quick = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 0.8, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	},

	grip_reload_empty_dm_quick = {
	[1] = {time = 0.3, sound = "Weapon_BLACKOPS3_M8A7.Magout"},
	[2] = {time = 0.8, sound = "Weapon_BLACKOPS3_M8A7.Magin"},
	[3] = {time = 1.45, sound = "Weapon_BLACKOPS3_M8A7.Tap"},
	},
	
	grip_draw_first = {
	[1] = {time = 0.5, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Back"},
	[2] = {time = 0.75, sound = "Weapon_BLACKOPS3_M8A7.Bolt_Forward"},
	},
}
	
SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"blackops3_4burst", "semi"}
SWEP.Base = "cw_blackops3_base"
SWEP.Category = "CW 2.0 Black Ops III"

SWEP.Author				= "Loyalists"
SWEP.Contact			= ""
SWEP.Purpose			= ""

SWEP.Trivia = {
	text = "4-round burst rifle. High cyclic rate of fire with minimal recoil.",
	x = -300, 
	y = -400, 
--	textFormatFunc = function(self, wep) if wep.ActiveAttachments.md_bipod then return "" else return self.text end end
	}

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/loyalists/blackops3/m8a7/v_ar_m8a7.mdl"
SWEP.WorldModel		= "models/loyalists/blackops3/m8a7/w_ar_m8a7.mdl"
SWEP.WM				= "models/loyalists/blackops3/m8a7/w_ar_m8a7.mdl"
SWEP.WMPos			= Vector(-1,-1,0)
SWEP.WMAng			= Vector(-3,0,180)
SWEP.DrawTraditionalWorldModel = false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.SnapToIdlePostReload = false

SWEP.Primary.ClipSize		= 32
SWEP.Primary.ClipSize_Ext	= 44
SWEP.Primary.DefaultClip	= 128
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay				= 0.06
SWEP.FireSound				= "CW_BLACKOPS3_M8A7_FIRE"
SWEP.FireSoundSuppressed	= "CW_BLACKOPS3_M8A7_FIRE_SUPPRESSED"
SWEP.Recoil					= 0.45

SWEP.HipSpread = 0.25
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.08
SWEP.SpreadPerShot = 0.003
SWEP.SpreadCooldown = 0.25
SWEP.Shots = 1
SWEP.Damage = 30

SWEP.HolsterSpeed = 1
SWEP.HolsterTime = 0.6

SWEP.DeployTime = 0.83
SWEP.FirstDeployTime = 1.3
SWEP.FirstDrawSpeed = 1

SWEP.ReloadSpeed = 1.0
SWEP.ReloadTime = 2.5
SWEP.ReloadTime_Empty = 3.1
SWEP.ReloadHalt = 2.5
SWEP.ReloadHalt_Empty = 3.1
SWEP.ReloadTime_Fast = 1.6
SWEP.ReloadTime_Empty_Fast = 2.17

SWEP.MeleeAttackRange = 50
SWEP.MeleeAttackDamage = 75
SWEP.MeleeInTime = 0.15
SWEP.MeleeOutTime = 0.7

SWEP.ViewbobIntensity = 0.25

// Custom Features
SWEP.QuickMeleeLogic = true
SWEP.DualMagLogic = true
