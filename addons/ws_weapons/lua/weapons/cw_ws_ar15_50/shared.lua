AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")
//SCK name: ar1550
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AR-15.50"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	killicon.Add("cw_ws_ar15_50", "vgui/kill_icon/cw_ws_ar15_50", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kill_icon/cw_ws_ar15_50")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.MuzzleAttachmentName = "muzzle"
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
	
	SWEP.IronsightPos = Vector(-2.385, 0, 0.4)
	SWEP.IronsightAng = Vector(1.399, 0, 0)
		
	SWEP.EoTechPos = Vector(-2.37, 0, 0.839)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.AimpointPos = Vector(-2.425, 0, 0.92)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.39, 0, 0.8)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.411, 0, 0.6)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.381, 0, 0.839)
	SWEP.ShortDotAng = Vector(0, 0, 0)

	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)

	//Knife Kitty's attachments            '
	SWEP.CoD4ReflexPos = Vector(-2.39, 0, 0.85)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0) 
	
	SWEP.HoloPos = Vector(-2.36, 0, 0.414)
	SWEP.HoloAng = Vector(0, 0, 0)

	SWEP.EoTech552Pos = Vector(-2.4, 0, 0.64)
	SWEP.EoTech552Ang = Vector(0, 0, 0)

	SWEP.EoTech553Pos = Vector(-2.451, 0, 0.639)
	SWEP.EoTech553Ang = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.45, 0, 1.32)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos = Vector(-2.385, 0, 1)
	SWEP.FAS2AimpointAng = Vector(0, 0, 0)
	
	SWEP.BackupReflexPos = Vector(-4.68, 0, 1.649)
	SWEP.BackupReflexAng = Vector(0, 0, -45)
	
	SWEP.CoD4ACOGPos = Vector(-2.42, 0, 0.8)
	SWEP.CoD4ACOGAng = Vector(0, 0, 0)
	SWEP.CoD4ACOGAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.LeupoldPos = Vector(-2.42, 0, 0.6)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	SWEP.LeupoldAxisAlign = {right = 0, up = 0, forward = 0}

	//Magnifer scopes
	SWEP.MagnifierPos = Vector(-2.39, 0, 0.75)
	SWEP.MagnifierAng = Vector(0, 0, 0)
	SWEP.MagnifierScopeAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.CoD4ReflexPos_mag3x = Vector(-2.39, 0, 0.87)
	SWEP.CoD4ReflexAng_mag3x = Vector(0, 0, 0)
	
	SWEP.EoTech552Pos_mag3x = Vector(-2.4, 0, 0.66)
	SWEP.EoTech552Ang_mag3x = Vector(0, 0, 0)
	
	SWEP.EoTech553Pos_mag3x = Vector(-2.451, 0, 0.641)
	SWEP.EoTech553Ang_mag3x = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos_mag3x = Vector(-2.45, 0, 0.98)
	SWEP.CoD4TascoAng_mag3x = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos_mag3x = Vector(-2.385, 0, 0.68)
	SWEP.FAS2AimpointAng_mag3x = Vector(0, 0, 0)
	
	SWEP.HoloPos_mag3x = Vector(-2.36, 0, 0.414)
	SWEP.HoloAng_mag3x = Vector(0, 0, 0)


	SWEP.AlternativePos = Vector(-2.385, 0, 0.4)
	SWEP.AlternativeAng = Vector(1.399, 0, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.411, 0, -0.52), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "L UpperArm"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["larue_mount"] = { type = "Model", model = "models/c_larue_kkhx.mdl", bone = "Weapon", rel = "", pos = Vector(0.4, -3.5, 3.799), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255)},
		["md_magnifier_scope"] = { type = "Model", model = "models/c_magnifier_scope.mdl", bone = "Weapon", rel = "", pos = Vector(0.15, -0.801, 3.2), angle = Angle(0, -90, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255)},
		["md_backup_reflex"] = { type = "Model", model = "models/c_docter.mdl", bone = "Weapon", rel = "", pos = Vector(-1.451, 8.6, 3.4), angle = Angle(0, -90, 45), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255)},
		["md_backup_reflex_rail"] = { type = "Model", model = "models/c_angled_rails.mdl", bone = "Weapon", rel = "", pos = Vector(-0.5, 7.199, 2.799), angle = Angle(0, 90, -90), size = Vector(1.5, 1.5, 1.5), color = Color(255, 255, 255, 255)},
		["md_fas2_leupold"] = { type = "Model", model = "models/v_fas2_leupold.mdl", bone = "Weapon", rel = "", pos = Vector(0.1, -6.753, 5.099), angle = Angle(0, -90, 0), size = Vector(2, 2, 2), color = Color(255, 255, 255, 255)},
		["md_fas2_leupold_mount"] = { type = "Model", model = "models/v_fas2_leupold_mounts.mdl", bone = "Weapon", rel = "", pos = Vector(0.1, -6.753, 5.099), angle = Angle(0, -90, 0), size = Vector(2, 2, 2), color = Color(255, 255, 255, 255)},
		["md_fas2_holo"] = { type = "Model", model = "models/v_holo_sight_kkrc.mdl", bone = "Weapon", rel = "", pos = Vector(0.15, -8.832, -1.8), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255)},
		["md_fas2_holo_aim"] = { type = "Model", model = "models/v_holo_sight_orig_hx.mdl", bone = "Weapon", rel = "", pos = Vector(0.15, -8.832, -1.8), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255)},
		["md_cod4_acog_v2"] = { type = "Model", model = "models/v_cod4_acog.mdl", bone = "Weapon", rel = "", pos = Vector(0.1, -8.832, 0.67), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255)},
		["md_fas2_aimpoint"] = { type = "Model", model = "models/c_fas2_aimpoint_rigged.mdl", bone = "Weapon", rel = "", pos = Vector(0.15, -1.5, 2.779), angle = Angle(0, -90, 0), size = Vector(1.299, 1.299, 1.299), color = Color(255, 255, 255, 255)},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "Weapon", rel = "", pos = Vector(0.1, -9, 0.349), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255)},
		["md_cod4_eotech_v2"] = { type = "Model", model = "models/v_cod4_eotech.mdl", bone = "Weapon", rel = "", pos = Vector(0.1, -9.87, 0.4), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255)},
		["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "Weapon", rel = "", pos = Vector(0.1, -1.558, 3.2), angle = Angle(0, -90, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255)},
		["md_cod4_reflex"] = { type = "Model", model = "models/v_cod4_reflex.mdl", bone = "Weapon", rel = "", pos = Vector(0.125, -9.601, 0.449), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255)},
		["md_hk416_bipod"] = { type = "Model", model = "models/c_bipod.mdl", bone = "Weapon", rel = "", pos = Vector(0.25, 5, 0.649), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255)},
		["md_saker"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "Weapon", rel = "", pos = Vector(0.2, 2.5, 0.449), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255)},
		["md_m203"] = { type = "Model", model = "models/cw2/attachments/m203.mdl", bone = "Weapon", rel = "", pos = Vector(2.5, -11.948, 5), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), animated = true},
		["md_foregrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "Weapon", rel = "", pos = Vector(-0.25, -6.753, -0.95), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255)},
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "Weapon", rel = "", pos = Vector(1.45, 7.791, 3), angle = Angle(0, 90, 90), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255)},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "Weapon", rel = "", pos = Vector(0.15, -4.676, 3.95), angle = Angle(0, 180, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), adjustment = {min = -7, max = -2, inverse = true, axis = "y", inverse = false, inverseOffsetCalc = true}},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "Weapon", rel = "", pos = Vector(0.425, -16.105, -6.987), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), adjustment = {min = -17.5, max = -14, inverse = true, axis = "y", inverse = false, inverseOffsetCalc = true}},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Weapon", rel = "", pos = Vector(-0.125, -11.5, -1.951), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), adjustment = {min = -12.75, max = -9, inverse = true, axis = "y", inverse = false, inverseOffsetCalc = true}},
		["md_schmidt_shortdot"] = { type = "Model", model = "models/cw2/attachments/schmidt.mdl", bone = "Weapon", rel = "", pos = Vector(-0.225, -10.91, -1.925), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), adjustment = {min = -12.25, max = -8.5, inverse = true, axis = "y", inverse = false, inverseOffsetCalc = true}},
		["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "Weapon", rel = "", pos = Vector(-0.25, -10.91, -2), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), adjustment = {min = -12.25, max = -9, inverse = true, axis = "y", inverse = false, inverseOffsetCalc = true}}
	}
	
	SWEP.M203HoldPos = {
		["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(1.667, -2.037, -1.6), angle = Angle(0, 0, 0) }
	}

	function SWEP:getMuzzlePosition()
		return self.CW_VM:GetAttachment(self.CW_VM:LookupAttachment(self.MuzzleAttachmentName))
	end

	SWEP.ForeGripHoldPos = {
		["L Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-23.334, 83.333, 0) },
		["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(1.667, -2.779, -1.601), angle = Angle(0, 0, 0) },
		["L Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 25.555, 0) },
		["L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 56.666, 0) },
		["L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 63.333, 0) },
		["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 65.555) },
		["L Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 105.555, 12.222) },
		["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 38.888, 0) },
		["L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-14.445, 121.111, 0) }
	}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.SightBGs = {main = 1, carryhandle = 0, foldsight = 1, none = 2}
SWEP.BarrelBGs = {main = 2, DMR = 1, AMR = 2, regular = 0}
SWEP.StockBGs = {main = 6, regular = 0, DMR = 1}
SWEP.ReceiverBGs = {main = 0, regular = 0, DMR = 1}
SWEP.MagBGs = {main = 4, regular = 0, extMag = 1, mag5 = 2}
SWEP.MuzzleBrakeBGs = {main = 7, regular = 0, MB = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.AttachmentDependencies = {
	["md_magnifier_scope"] = {"md_cod4_reflex","md_cod4_eotech_v2","md_cod4_aimpoint_v2","md_fas2_eotech","md_fas2_aimpoint","md_fas2_holo"}
}


SWEP.AttachmentExclusions = {
	["bg_ws_ar15_50_AMRbarrel"] = {"md_saker", "bg_ws_ar15_50_muzzlebrake", "md_m203"},
	["md_saker"] = {"bg_ws_ar15_50_AMRbarrel"},
	["bg_ws_ar15_50_muzzlebrake"] = {"bg_ws_ar15_50_AMRbarrel"},
	["md_m203"] = {"bg_ws_ar15_50_AMRbarrel"}
}

SWEP.AttachmentPosDependency = {
	["md_fas2_aimpoint"] = {
		["md_magnifier_scope"] = Vector(0.15, -0.25, 3.1),
	},
	["md_fas2_eotech"] = {
		["md_magnifier_scope"] = Vector(0.1, 0, 3.2),
	},
	["md_cod4_reflex"] = {
		["md_magnifier_scope"] = Vector(0.125, -8.5, 0.449),
	},
	["md_cod4_aimpoint_v2"] = {
		["md_magnifier_scope"] = Vector(0.1, -8.5, 0.7),
	},		
	["md_cod4_eotech_v2"] = {
		["md_magnifier_scope"] = Vector(0.1, -8.5, 0.4),
	},
	["md_fas2_holo"] = {
		["md_magnifier_scope"] = Vector(0.15, -7, -1.8),
	},
}

SWEP.CompM4SBoneMod = {
	["ard"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(31.445, 0, 0) }
}

//lua_run Entity(1):GetViewModel():SetBodygroup(1,2)
if CustomizableWeaponry_KK_HK416 then
SWEP.Attachments = {
	[1] = {header = "Sight", offset = {800, -500}, atts = {"md_microt1", "md_cod4_reflex", "md_eotech", "md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_acog", "md_cod4_acog_v2", "md_fas2_holo", "md_schmidt_shortdot", "md_fas2_leupold"}},
	[2] = {header = "Barrel EXT", offset = {300, -500}, atts = {"md_saker", "bg_ws_ar15_50_muzzlebrake"}},
	[3] = {header = "Barrel", offset = {-400, -500}, atts = {"bg_ws_ar15_50_DMRbarrel", "bg_ws_ar15_50_AMRbarrel"}},
	[8] = {header = "Receiver", offset = {-400, 800}, atts = {"bg_ws_ar15_50_DMRrec"}},
	[4] = {header = "Handguard", offset = {-400, 0}, atts = {"md_foregrip", "md_hk416_bipod", "md_m203"}},
	[5] = {header = "Magazine", offset = {-400, 400}, atts = {"bg_ws_ar15_50_Mag5", "bg_ws_ar15_50_ExtMag"}},
	[6] = {header = "Stock", offset = {1000, 400}, atts = {"bg_ws_ar15_50_DMRstock"}},
	[7] = {header = "Rail", offset = {250, 800}, atts = {"md_anpeq15"}},
	[9] = {header = "Hybrid Sights", offset = {250, 400}, atts = {"md_backup_reflex", "md_magnifier_scope"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}
}
else
SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_acog"}},
	[2] = {header = "Barrel EXT", offset = {300, -500}, atts = {"md_saker", "bg_ws_ar15_50_muzzlebrake"}},
	[3] = {header = "Barrel", offset = {-400, -500}, atts = {"bg_ws_ar15_50_DMRbarrel", "bg_ws_ar15_50_AMRbarrel"}},
	[8] = {header = "Receiver", offset = {-400, 800}, atts = {"bg_ws_ar15_50_DMRrec"}},
	[4] = {header = "Handguard", offset = {-400, 0}, atts = {"md_foregrip", "md_m203"}},
	[5] = {header = "Magazine", offset = {-400, 400}, atts = {"bg_ws_ar15_50_Mag5","bg_ws_ar15_50_ExtMag"}},
	[6] = {header = "Stock", offset = {1000, 400}, atts = {"bg_ws_ar15_50_DMRstock"}},
	[7] = {header = "Rail", offset = {250, 400}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}
end

SWEP.Animations = {fire = {"base_fire"},
	reload = "base_reload",
    reload_empty = "base_reloadempty",
	idle = "base_idle",
	holster = "base_holster",
	draw = "base_ready"
}
	
SWEP.Sounds = {
	base_draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	base_reload = {
	[1] = {time = 0.35, sound = "CW_AR15_50_MAGRELEASE"},
	[2] = {time = 0.5, sound = "CW_AR15_50_MAGOUT"},
	[3] = {time = 1.9, sound = "CW_AR15_50_MAGIN"},
	[4] = {time = 2.5, sound = "CW_AR15_50_HIT"}
	},

	base_reloadempty = {
	[1] = {time = 0.35, sound = "CW_AR15_50_MAGRELEASE"},
	[2] = {time = 0.5, sound = "CW_AR15_50_MAGOUT"},
	[3] = {time = 1.9, sound = "CW_AR15_50_MAGIN"},
	[4] = {time = 2.5, sound = "CW_AR15_50_HIT"},
	[5] = {time = 3.5, sound = "CW_AR15_50_BOLTRELEASE"}
	},

	base_ready = {
	[1] = {time = 0.75, sound = "CW_AR15_50_BOLTBACK"},
	[2] = {time = 1.25, sound = "CW_AR15_50_BOLTRELEASE"}
	}

}

	
SWEP.SpeedDec = 50

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cw2/R6/v_ws_r6ar15_50.mdl"
SWEP.WorldModel		= "models/weapons/cw2/R6/w_ws_r6ar15_50.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/cw2/R6/w_ws_r6ar15_50.mdl"
SWEP.WMPos = Vector(-0.5, 4, 1)
SWEP.WMAng = Vector(-2, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".50 Beowulf"

SWEP.FireDelay = 0.13333333333
SWEP.FireSound = "CW_WS_AR15_50_FIRE"
SWEP.FireSoundSuppressed = "CW_WS_AR15_50_FIRE_SUPPRESSED"
SWEP.Recoil = 1.7 //1.05

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 61
SWEP.DeployTime = 2

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 3.5
SWEP.ReloadTime_Empty = 4
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
	local CT = CurTime()
	
	mag = self:Clip1()
	local ammo = self:Ammo1()
	
	self.Animations.draw = "base_draw"
	self.DeployTime = 0.5

	if self:isAttachmentActive("sights") then
		self:setBodygroup(1, 2)
		  if self.WMEnt then
   			self.WMEnt:SetBodygroup(1,2)
    	end
	else
		if self.ActiveAttachments.bg_ws_ar15_50_DMRbarrel or self.ActiveAttachments.bg_ws_ar15_50_AMRbarrel then
			self:setBodygroup(1, 1)
			if self.WMEnt then
	   			self.WMEnt:SetBodygroup(1,1)
	    	end
		else
			self:setBodygroup(1, 0)
			if self.WMEnt then
	   			self.WMEnt:SetBodygroup(1,0)
	    	end
		end
	end

	if (self.ActiveAttachments.bg_ws_ar15_50_DMRbarrel and self.ActiveAttachments.md_anpeq15) or (self.ActiveAttachments.bg_ws_ar15_50_DMRbarrel and self.ActiveAttachments.md_foregrip) or (self.ActiveAttachments.bg_ws_ar15_50_DMRbarrel and self.ActiveAttachments.md_hk416_bipod) or (self.ActiveAttachments.bg_ws_ar15_50_DMRbarrel and self.ActiveAttachments.md_backup_reflex)
		or (self.ActiveAttachments.bg_ws_ar15_50_AMRbarrel and self.ActiveAttachments.md_anpeq15) or (self.ActiveAttachments.bg_ws_ar15_50_AMRbarrel and self.ActiveAttachments.md_foregrip) or (self.ActiveAttachments.bg_ws_ar15_50_AMRbarrel and self.ActiveAttachments.md_hk416_bipod) or (self.ActiveAttachments.bg_ws_ar15_50_AMRbarrel and self.ActiveAttachments.md_backup_reflex) then
		self:setBodygroup(3, 1)
	else
		self:setBodygroup(3, 0)
	end

	//Barrels World models
    if self.ActiveAttachments.bg_ws_ar15_50_AMRbarrel then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(2,2)
    	end
    elseif self.ActiveAttachments.bg_ws_ar15_50_DMRbarrel then 
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(2,1)
    	end
    else
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(2,0)
    	end
    end

	//Magainze World models
    if self.ActiveAttachments.bg_ws_ar15_50_Mag5 then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(4,2)
    	end
    elseif self.ActiveAttachments.bg_ws_ar15_50_ExtMag then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(4,1)
    	end
    else
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(4,0)
    	end
    end

    //Receiver World models
    if self.ActiveAttachments.bg_ws_ar15_50_DMRrec then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(0,1)
    	end
    else
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(0,0)
    	end
    end

     //Laser World models
    if self.ActiveAttachments.md_anpeq15 then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(9,1)
    	end
    else
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(9,0)
    	end
    end

    //Stock World models
    if self.ActiveAttachments.bg_ws_ar15_50_DMRstock then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(6,1)
    	end
    else
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(6,0)
    	end
    end

    //Muzzle World models
    if self.ActiveAttachments.bg_ws_ar15_50_muzzlebrake then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(7,1)
    	end
   	elseif self.ActiveAttachments.md_saker then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(7,2)
    	end
    else
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(7,0)
    	end
    end


    //Handguard World models
    if self.ActiveAttachments.md_foregrip then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(8,1)
    	end
   	elseif self.ActiveAttachments.md_hk416_bipod then
   		if self.dt.BipodDeployed then
			if self.WMEnt then
   				self.WMEnt:SetBodygroup(8,2)
    		end
		else
			if self.WMEnt then
   				self.WMEnt:SetBodygroup(8,3)
    		end
		end
    elseif self.ActiveAttachments.md_m203 then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(8,4)
    	end
    else
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(8,0)
    	end
    end

    local att_magnifier = {}
	att_magnifier.aimPos = {"MagnifierPos", "MagnifierAng"}
	local isScopePos = (self.AimPos == self[att_magnifier.aimPos[1]] and self.AimAng == self[att_magnifier.aimPos[2]])

    //Hybrid Sights World models
    if self.ActiveAttachments.md_backup_reflex then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(10,1)
    	end
   	elseif self.ActiveAttachments.md_magnifier_scope then
    		if isScopePos then
				 if self.WMEnt then
   					self.WMEnt:SetBodygroup(10,2)
    			end
			elseif !isScopePos then
				 if self.WMEnt then
   					self.WMEnt:SetBodygroup(10,3)
    			end
			end
    else
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(10,0)
    	end
    end

    //Sights World models 	{"md_microt1", "md_cod4_reflex", "md_eotech", "md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2", "md_fas2_aimpoint", "md_acog", "md_cod4_acog_v2", "md_fas2_holo", "md_schmidt_shortdot", "md_fas2_leupold"}},
    if self.ActiveAttachments.md_microt1 or self.ActiveAttachments.md_cod4_reflex then	
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(11,1)
    	end
   	elseif self.ActiveAttachments.md_eotech or self.ActiveAttachments.md_cod4_eotech_v2 or self.ActiveAttachments.md_fas2_eotech then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(11,2)
    	end
   	elseif self.ActiveAttachments.md_aimpoint or self.ActiveAttachments.md_cod4_aimpoint_v2 or self.ActiveAttachments.md_fas2_aimpoint then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(11,3)
    	end
   	elseif self.ActiveAttachments.md_acog or self.ActiveAttachments.md_cod4_acog_v2 then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(11,4)
    	end
   	elseif self.ActiveAttachments.md_fas2_holo then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(11,5)
    	end
   	elseif self.ActiveAttachments.md_schmidt_shortdot then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(11,6)
    	end
    elseif self.ActiveAttachments.md_fas2_leupold then
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(11,7)
    	end
    else
    	if self.WMEnt then
   			self.WMEnt:SetBodygroup(11,0)
    	end
    end

end

function SWEP:RenderTargetFunc()
	if self.ActiveAttachments.md_magnifier_scope then
		if self.ActiveAttachments.md_fas2_aimpoint then
		self.AttachmentModelsVM.larue_mount.active = true
		end		
		if self.ActiveAttachments.md_cod4_aimpoint_v2 then
		self.AttachmentModelsVM.larue_mount.active = true
		self.AttachmentModelsVM.md_cod4_aimpoint_v2.ent:SetBodygroup(1,1)
		end	
	else
		self.AttachmentModelsVM.larue_mount.active = false
		self.AttachmentModelsVM.md_cod4_aimpoint_v2.ent:SetBodygroup(1,0)
	end	
end

function SWEP:buildBoneTable()
local vm = self.CW_VM

for i = 0, vm:GetBoneCount() - 1 do
local boneName = vm:GetBoneName(i)
local bone

if boneName then
bone = vm:LookupBone(boneName)
end

-- some ins models have [__INVALIDBONE__]s so to prevent nilpointerexceptions bone = 1
self.vmBones[i + 1] = {boneName = boneName, bone = i, curPos = Vector(0, 0, 0), curAng = Angle(0, 0, 0), targetPos = Vector(0, 0, 0), targetAng = Angle(0, 0, 0)}
end
end