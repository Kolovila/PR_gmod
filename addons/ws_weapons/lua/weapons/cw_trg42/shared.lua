AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Sako TRG-42"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.Add("cw_trg42", "vgui/kills/cw_trg42", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_trg42")
	
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	
	SWEP.IronsightPos = Vector(3.5, -5, 1.6)
	SWEP.IronsightAng = Vector(0, 0.5, 0)
	
	SWEP.CoD4ReflexPos = Vector(3.575, 0, 1.15)
	SWEP.CoD4ReflexAng = Vector(0.7, 0.6, 0)

	SWEP.EoTech552Pos = Vector(3.519, 0, 0.92)
	SWEP.EoTech552Ang = Vector(0.06, 0.55, 0)
	
	SWEP.EoTechPos = Vector(3.519, 0, 1.12)
	SWEP.EoTechAng = Vector(0, 0.55, 0)

	SWEP.EoTech553Pos = Vector(3.579, 0, 1)
	SWEP.EoTech553Ang = Vector(0, 0.6, 0)	
	
	SWEP.AimpointPos = Vector(3.599, 0, 1.2)
	SWEP.AimpointAng = Vector(0, 0.649, 0)
	
	SWEP.CoD4TascoPos = Vector(3.64, 3, 1.55)
	SWEP.CoD4TascoAng = Vector(0, 0.649, 0)
	
	SWEP.FAS2AimpointPos = Vector(3.559, 0, 1.31)
	SWEP.FAS2AimpointAng = Vector(0, 0.55, 0)

	SWEP.MicroT1Pos = Vector(3.559, 0, 1.35)
	SWEP.MicroT1Ang = Vector(0, 0.6, 0)
	
	SWEP.ACOGPos = Vector(3.5, 0, 1.2)
	SWEP.ACOGAng = Vector(0, 0.6, 0)
		
	SWEP.CoD4ACOGPos = Vector(3.42, 0, 1.2)
	SWEP.CoD4ACOGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-4.444, -1, 0.082)
	SWEP.SprintAng = Vector(-12.849, -39.23, 0)
	
	SWEP.CoyotePos = Vector(3.555, 0, 1.36)
	SWEP.CoyoteAng = Vector(0, 0.6, 0)
	
	SWEP.LeupoldPos = Vector(3.48, 0, 0.879)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	SWEP.LeupoldAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.HoloPos = Vector(3.559, 0, 1.159)
	SWEP.HoloAng = Vector(0.25, 0.6, 0)
	
	SWEP.HoloPos = Vector(3.55, 0, 1.24)
	SWEP.HoloAng = Vector(0, 0.6, 0)
	
	SWEP.CustomizePos = Vector(-8.174, -1.27, -1.288)
	SWEP.CustomizeAng = Vector(17.954, -40.578, -18.357)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(3.42, 0, 0.079), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = false
	SWEP.ACOGAxisAlign = {right = 0, up = 0.55, forward = 0}
	SWEP.CoD4ACOGAxisAlign = {right = 0, up = 180.55, forward = 0}
		
	SWEP.RscopePos  = Vector(3.559, 0, 1.36)
	SWEP.RscopeAng = Vector(0 ,0.6,0)
	SWEP.BFRIFLEAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.MW3SPos  = Vector(3.5, 0, 0.68)
	SWEP.MW3SAng = Vector(0 ,0.6, 0)
	SWEP.MW3SAxisAlign = {right = 0, up = 0.6, forward = 0}
	
	SWEP.AlternativePos = Vector(0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)

	SWEP.AttachmentModelsVM = {
		["md_cyotesight"] = { type = "Model", model = "models/rageattachments/cyotesight.mdl", bone = "Body", rel = "", pos = Vector(-3.17, 11.947, -2.85), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75), adjustment = {min = 10, max = 13.5, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "Body", rel = "", pos = Vector(-3.201, 15, -3), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1), adjustment = {min = 13.8, max = 16, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_eotech_stencil"] = { type = "Model", model = "models/c_fas2_eotech_stencil.mdl", bone = "Body", rel = "", pos = Vector(-3.201, 15, -3), angle = Angle(0, -90, 0), size = Vector(1.1, 1.1, 1.1)},
		["md_bfeotech"] = { type = "Model", model = "models/rageattachments/bfeotech.mdl", bone = "Body", rel = "", pos = Vector(-3.151, 11.947, -3), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), adjustment = {min = 10.8, max = 12.5, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_mw3scope"] = { type = "Model", model = "models/rageattachments/v_msrscope.mdl", bone = "Body", rel = "", pos = Vector(-3.05, 12.199, -3.636), angle = Angle(0, -90, 0), size = Vector(0.85, 0.85, 0.85), adjustment = {min = 11.5, max = 12.5, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_bfriflescope"] = { type = "Model", model = "models/rageattachments/sniperscopesv.mdl", bone = "Body", rel = "", pos = Vector(-3.25, 12, -2.75), angle = Angle(0, -180, 0), size = Vector(0.8, 0.8, 0.8), adjustment = {min = 10, max = 12.5, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_holo"] = { type = "Model", model = "models/v_holo_sight_kkrc.mdl", bone = "Body", rel = "", pos = Vector(-3.24, 8.831, -6.151), angle = Angle(0, -89.35, 0), size = Vector(0.649, 0.649, 0.649), adjustment = {min = 7.4, max = 11.5, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_holo_aim"] = { type = "Model", model = "models/v_holo_sight_orig_hx.mdl", bone = "Body", rel = "", pos = Vector(-3.24, 8.831, -6.151), angle = Angle(0, -89.35, 0), size = Vector(0.649, 0.649, 0.649)},
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "Body", rel = "", pos = Vector(-3, 24.416, -3), angle = Angle(180, -90, 0), size = Vector(0.545, 0.545, 0.545)},
		["md_cod4_acog_v2"] = { type = "Model", model = "models/v_cod4_acog.mdl", bone = "Body", rel = "", pos = Vector(-3.201, 8.831, -5.301), angle = Angle(0, 90, 0), size = Vector(0.898, 0.898, 0.898), adjustment = {min = 7, max = 9, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_aimpoint"] = { type = "Model", model = "models/c_fas2_aimpoint_rigged.mdl", bone = "Body", rel = "", pos = Vector(-3.185, 15, -3.35), angle = Angle(0, -90, 0), size = Vector(1.149, 1.149, 1.149), adjustment = {min = 13.5, max = 16.8, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Body", rel = "", pos = Vector(-3.451, 5.714, -7.6), angle = Angle(0, 0, 0), size = Vector(0.898, 0.898, 0.898), adjustment = {min = 4.7, max = 7.7, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "Body", rel = "", pos = Vector(-3.201, 7.791, -5.5), angle = Angle(0, 90, 0), size = Vector(0.898, 0.898, 0.898), adjustment = {min = 6.4, max = 8, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_cod4_eotech_v2"] = { type = "Model", model = "models/v_cod4_eotech.mdl", bone = "Body", rel = "", pos = Vector(-3.201, 7.791, -5.401), angle = Angle(0, 90, 0), size = Vector(0.898, 0.898, 0.898), adjustment = {min = 6.7, max = 8.1, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_hk416_bipod"] = { type = "Model", model = "models/c_bipod.mdl", bone = "Body", rel = "", pos = Vector(-3, 21.298, -5.5), angle = Angle(0, 0, 0), size = Vector(1.1, 1.1, 1.1)},
		["md_cod4_reflex"] = { type = "Model", model = "models/v_cod4_reflex.mdl", bone = "Body", rel = "", pos = Vector(-3.211, 8, -5.35), angle = Angle(0, 90, 0), size = Vector(0.85, 0.85, 0.85), adjustment = {min = 6.4, max = 9.5, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_leupold"] = { type = "Model", model = "models/v_fas2_leupold.mdl", bone = "Body", rel = "", pos = Vector(-3.201, 10.449, -1.201), angle = Angle(0, -90, 0), size = Vector(1.799, 1.799, 1.799)},
		["md_fas2_leupold_mount"] = { type = "Model", model = "models/v_fas2_leupold_mounts.mdl", bone = "Body", rel = "", pos = Vector(-3.201, 9.869, -1.25), angle = Angle(0, -90, 0), size = Vector(1.799, 1.799, 1.799)},
		["md_saker"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "Body", rel = "", pos = Vector(-2.95, 23.5, -4.901), angle = Angle(0, 0, 1), size = Vector(0.75, 0.75, 0.75)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "Body", rel = "", pos = Vector(-2.9, 0.518, -13.301), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), adjustment = {min = -1, max = 2, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "Body", rel = "", pos = Vector(-3.211, 11, -2.401), angle = Angle(0, -180, 0), size = Vector(0.349, 0.349, 0.349), adjustment = {min = 9.9, max = 14.03, axis = "y", inverse = true, inverseOffsetCalc = true}},
		["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "Body", rel = "", pos = Vector(-3.5, 6.752, -7.792), angle = Angle(0, 0, 0), size = Vector(0.898, 0.898, 0.898), adjustment = {min = 5, max = 7.5, axis = "y", inverse = true, inverseOffsetCalc = true}},
	}
	
	SWEP.CompM4SBoneMod = {}

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 179.5, 0) 
end

SWEP.SightBGs		= {main = 2, carryhandle = 0, foldsight = 2, none = 1, foldfold = 3}
SWEP.ForegripBGs	= {main = 3, regular = 0, covered = 1}
SWEP.MagBGs			= {main = 4, regular = 0, round34 = 1, round100 = 2, round100_empty = 3, none = 4, regular_empty = 5, round34_empty = 6}
SWEP.StockBGs		= {main = 5, regular = 0, heavy = 1, none = 2}
SWEP.SilencerBGs	= {main = 6, off = 0, on = 1, long_off = 2, long_on = 3}
SWEP.LuaViewmodelRecoil = false

if CustomizableWeaponry_KK_HK416 and CustomizableWeaponry_Fluffy_Zorua then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {300, -300},  atts = {"md_cod4_reflex", "md_cyotesight", "md_microt1", "md_eotech", "md_bfeotech", "md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2","md_fas2_aimpoint","md_acog","md_cod4_acog_v2","md_fas2_holo","md_fas2_leupold", "md_bfriflescope", "md_mw3scope"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Handguard", offset = {-250, 150}, atts = {"md_hk416_bipod"}},
		[4] = {header = "Rail", offset = {-250, 600}, atts = {"md_anpeq15"}},
		["+attack2"] = {header = "Perks", offset = {1300, 0}, atts = {"pk_sleightofhand", "pk_light"}},
		["impulse 100"] = {header = "Skins", offset = {600, 600}, atts = {"bg_wstrg_paint1", "bg_wstrg_paint2", "bg_wstrg_paint3"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_KK_HK416 then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {300, -300},  atts = {"md_cod4_reflex", "md_microt1", "md_eotech", "md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2","md_fas2_aimpoint","md_acog","md_cod4_acog_v2","md_fas2_holo","md_fas2_leupold"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Handguard", offset = {-250, 150}, atts = {"md_hk416_bipod"}},
		[4] = {header = "Rail", offset = {-250, 600}, atts = {"md_anpeq15"}},
		["impulse 100"] = {header = "Skins", offset = {600, 600}, atts = {"bg_wstrg_paint1", "bg_wstrg_paint2", "bg_wstrg_paint3"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}
	}
elseif CustomizableWeaponry_Fluffy_Zorua then
		SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -300},  atts = {"md_microt1", "md_cyotesight", "md_eotech", "md_bfeotech", "md_aimpoint", "md_acog", "md_bfriflescope", "md_mw3scope"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Rail", offset = {-250, 600}, atts = {"md_anpeq15"}},
		["+attack2"] = {header = "Perks", offset = {1300, 100}, atts = {"pk_sleightofhand", "pk_light"}},
		["impulse 100"] = {header = "Skins", offset = {600, 600}, atts = {"bg_wstrg_paint1", "bg_wstrg_paint2", "bg_wstrg_paint3"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}
	}
else
	SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -300},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acog"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Rail", offset = {-250, 600}, atts = {"md_anpeq15"}},
		["impulse 100"] = {header = "Skins", offset = {600, 600}, atts = {"bg_wstrg_paint1", "bg_wstrg_paint2", "bg_wstrg_paint3"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}
	}
end
	
SWEP.Animations = {fire = {"shoot"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {
	reload = {
	[1] = {time = 0.5, sound = "CW_TRG_BOLTBACK"},
	[2] = {time = 1, sound = "CW_TRG_MAGOUT"},
	[3] = {time = 1.85, sound = "CW_TRG_MAGIN"},
	[4] = {time = 2.35, sound = "CW_TRG_BOLTIN"}},
	
	shoot = {
	[1] = {time = 0.2, sound = "CW_TRG_BOLTBACK"},
	[2] = {time = 0.20, sound = "CW_TRG_BOLTIN"}}}
	

SWEP.SpeedDec = 25

SWEP.ADSFireAnim = true
SWEP.BipodFireAnim = true
SWEP.AimBreathingIntensity = 1
SWEP.AimBreathingEnabled = true

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 75
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/tgr/v_spin_scout.mdl"
SWEP.WorldModel		= "models/weapons/tgr/w_spin_scout.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/tgr/w_spin_scout.mdl"
SWEP.WMPos = Vector(-1, -1, -0.2)
SWEP.WMAng = Vector(-3,1,180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 5
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".338mm"
SWEP.magType = "srMag"

SWEP.FireDelay = 1
SWEP.FireSound = "CW_TRG_FIRE"
SWEP.FireSoundSuppressed = "CW_TRG_SUB"
SWEP.Recoil = 2.5
SWEP.AimViewModelFOV = 55
SWEP.CustomizationMenuScale = 0.02
SWEP.ForceBackToHipAfterAimedShot = true
SWEP.GlobalDelayOnShoot = 1.1

SWEP.HipSpread = 0.01
SWEP.AimSpread = 0.0005
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.01
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 100
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2
SWEP.ReloadTime_Empty = 2
SWEP.ReloadHalt = 0
SWEP.ReloadHalt_Empty = 0
SWEP.Chamberable = false