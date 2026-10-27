AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo(".408 Cheytac", ".408 Cheytac", 10.36, 77)

SWEP.EffectiveRange_Orig = 100 * 910
SWEP.DamageFallOff_Orig = .35

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Cheytac M200"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1.85
	
	SWEP.IconLetter = "r"
	killicon.AddFont("cw_l115", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
    SWEP.ZoomAmount = 10 -- 15
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 1
	SWEP.ShellOffsetMul = 1
	SWEP.ShellDelay = 0.85
	SWEP.ShellPosOffset = {x = 20, y = -10, z = 20}
	SWEP.FireMoveMod = 0.6
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_snip_m200.mdl"
	SWEP.WMPos = Vector(-0.5, 0, 3)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-5.336, 0.15, 0.839)
	SWEP.IronsightAng = Vector(-1.058, 0, 0)
	
	SWEP.RMRPos = Vector(-5.275, 0.5, 1.222)
	SWEP.RMRAng = Vector(-0.05, 0.23, 0)
	
	SWEP.MicroT1Pos = Vector(-5.334, 0, 0.843)
	SWEP.MicroT1Ang = Vector(0.226, 0.03, 0)

	SWEP.EoTechPos = Vector(-5.304, -0.5, 0)
	SWEP.EoTechAng = Vector(0.1, 0.065, 0)
	
	SWEP.AimpointPos = Vector(-5.35, 0, 0.72)
	SWEP.AimpointAng = Vector(-0.3, -0.01, 0)
	
	SWEP.ACOGPos = Vector(-5.341, 0, 0.465)
	SWEP.ACOGAng = Vector(-0.32, -0.026, 0)
	
	SWEP.ShortDotPos = Vector(-5.321, 0, 0.607)
	SWEP.ShortDotAng = Vector(0, 0, 0)

	SWEP.NXSPos = Vector(-5.35, 0, 0.5)
	SWEP.NXSAng = Vector(-0.201, 0.2, 0)
	
--[[--------------------Unofficial ATTACHMENTS-------------------------]]--

	SWEP.CmorePos = Vector(-5.332, 0.05, 0.813)
	SWEP.CmoreAng = Vector(-0.42, -0.015, 0)
	
	SWEP.ReflexPos = Vector(-5.332, 0.05, 0.813)
	SWEP.ReflexAng = Vector(-0, -0.035, 0)
	
	SWEP.TrijiconPos = Vector(-5.321, 0, 0.578)
	SWEP.TrijiconAng = Vector(0.14, -0.055, 0)
	
	SWEP.ELCANPos = Vector(-5.341, 0, 0.465)
	SWEP.ELCANAng = Vector(-0.50, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(-5.341, 0, 0.465)
	SWEP.CSGOACOGAng = Vector(-0.50, 0, 0)
	
	SWEP.CSGO556Pos = Vector(-5.341, 0, 0.947)
	SWEP.CSGO556Ang = Vector(-0.484, -0.301, 0)
	
	SWEP.CSGOSSGPos = Vector(-5.33, 0, 0.6)
	SWEP.CSGOSSGAng = Vector(0, 0, 0)
	
--	SWEP.NXSPos = Vector(-5.35, 0, 0.5)
--	SWEP.NXSAng = Vector(-0.201, 0.2, 0)
	
	SWEP.LeupoldPos = Vector(-5.33, -1.469, 0.143)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	
--	SWEP.BallisticPos = Vector(-5.33, -1.469, 0.143)
--	SWEP.BallisticAng = Vector(0, -0.231, 0)

--[[-------------------------------------------------------------------]]--
	
	SWEP.SprintPos = Vector(7.657, -3.02, -1.343)
	SWEP.SprintAng = Vector(-6.4, 40.733, 0)

	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(4.647, -1, -0.547)
	SWEP.CustomizeAng = Vector(6.801, 28, 0)
	
	SWEP.PronePos = Vector(9.97, -5, -1.505)
	SWEP.ProneAng = Vector(-4.2, 45, 0)
	
	SWEP.ReticleInactivityPostFire = 1.9
	
	SWEP.BackupSights = {
	["md_acog"] = {[1] = Vector(-5.341, 0, -0.847), [2] = Vector(-0.08, -0.026, 0)},
	["md_uecw_csgo_556"] = {[1] = Vector(-5.325, 0, -0.288), [2] = Vector(0.855, 0.015, 0)},
	["md_snip2_elcan"] = {[1] = Vector(-5.319, 0, -0.6), [2] = Vector(0.1, -0.1, 0)}}

	SWEP.ACOGAxisAlign = {right = 0.35, up = 0, forward = 0}
	SWEP.NXSAlign = {right = 0.2, up = -0.2, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.ElcanAxisAlign = {right = 0, up = 0, forward = 0}
	
    SWEP.CrosshairEnabled 	= false
	
	SWEP.AimBreathingEnabled = true
--	SWEP.AimViewModelFOV = 70
	
	SWEP.HipFireFOVIncrease = false
	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}

	SWEP.AttachmentModelsVM = {
	    ["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "body", rel = "", pos = Vector(0.1, 18.728, 0.699), angle = Angle(0, 0, 0), size = Vector(1.189, 1.189, 1.189)},
		["md_snip2_light_suppressor"] = {model = "models/attachments/special_light_suppressor.mdl", bone = "body", rel = "", pos = Vector(0.032, 19.52, 0.728), angle = Angle(0, 0, 0), size = Vector(1.154, 1.154, 1.154)}, 
		["md_snip2_osprey_suppressor"] = {model = "models/attachments/special_osprey_suppressor.mdl", bone = "body", rel = "", pos = Vector(0.032, 19.52, 0.728), angle = Angle(0, 0, 0), size = Vector(1.154, 1.154, 1.154)},
		["md_snip2_m200_heavy_muzzle_brake"] = {model = "models/attachments/heavy_muzzle_brake.mdl", bone = "body", rel = "", pos = Vector(0.032, 19.52, 0.728), angle = Angle(0, 0, 0), size = Vector(1.154, 1.154, 1.154)}, 		
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "body", rel = "", pos = Vector(-0.38, 2.5, -0.101), angle = Angle(0, -90, 0), size = Vector(1.041, 1.041, 1.041)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(0.035, 6.756, 6.005), angle = Angle(0, -180, 0), size = Vector(0.474, 0.474, 0.474)},
	    ["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "body", rel = "", pos = Vector(-0.136, 7.177, 7.445), angle = Angle(0, -90, 0), size = Vector(1.473, 1.473, 1.473)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "body", rel = "", pos = Vector(-0.401, -0.774, -0.821), angle = Angle(0, 0, 0), size = Vector(1.159, 1.159, 1.159)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "body", rel = "", pos = Vector(-0.301, -1.418, -1.201), angle = Angle(0, 0, 0), size = Vector(1.24, 1.24, 1.24)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "body", rel = "", pos = Vector(0.487, -13.087, -12.2), angle = Angle(0, -90, 0), size = Vector(1.682, 1.682, 1.682)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "body", rel = "", pos = Vector(-0.401, -0.461, -0.82), angle = Angle(0, -90, 0), size = Vector(1.175, 1.175, 1.175)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "body", rel = "", pos = Vector(1.52, 25.5, 4.4), angle = Angle(0, 90, 90), size = Vector(0.730, 0.730, 0.730)},
	
		["md_cmore"] = { type = "Model", model = "models/attachments/cmore.mdl", bone = "body", rel = "", pos = Vector(0.026, 7, 5.8), angle = Angle(0, 0, 0), size = Vector(0.892, 0.892, 0.892)},
		["md_reflex"] = { type = "Model", model =  "models/attachments/kascope.mdl", bone = "body", rel = "", pos = Vector(0.021, 11.428, 6.15), angle = Angle(0, 0, 0), size = Vector(0.892, 0.892, 0.892)},
		["md_trijicon"] = { type = "Model", model = "models/att_trijicon.mdl", bone = "body", rel = "", pos = Vector(0.05, 8.819, 2.519), angle = Angle(0, 0, 0), size = Vector(2.851, 2.851, 2.851)},

	    ["md_snip2_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "body", rel = "", pos = Vector(-0.32, 1.11, -0.12), angle = Angle(0, 0, 0), size = Vector(1.049, 1.049, 1.049)},
		["md_uecw_csgo_acog"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_acog.mdl", bone = "body", rel = "", pos = Vector(0.1, -1.617, 0.899), angle = Angle(0, -90, 0), size = Vector(1.098, 1.098, 1.098)},
		["md_uecw_csgo_556"] = { type = "Model", model =  "models/gmod4phun/csgo/eq_optic_sig.mdl", bone = "body", rel = "", pos = Vector(0.079, 7.035, 5.599), angle = Angle(0, -90, 0), size = Vector(0.935, 0.935, 0.935)},
		["md_uecw_csgo_scope_ssg"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_scope_bender.mdl", bone = "body", rel = "", pos = Vector(0.079, 7.035, 5.599), angle = Angle(0, -90, 0), size = Vector(0.935, 0.935, 0.935)},
	    ["md_ballistic"] = { type = "Model", model = "models/bunneh/scope01.mdl", bone = "body", rel = "", pos = Vector(-2.201, -7.095, 6.769), angle = Angle(0, -90, 0), size = Vector(1.733, 1.733, 1.733)}
	}
	
	SWEP.AttachmentPosDependency = {
	["md_saker"] = {["bg_cheytac_short_barrel"] = Vector(0, 11.5, 0.7)},
    ["md_snip2_light_suppressor"] = {["bg_cheytac_short_barrel"] = Vector(0, 12.2, 0.7)},
    ["md_snip2_osprey_suppressor"] = {["bg_cheytac_short_barrel"] = Vector(0, 12.2, 0.77)},
    ["md_snip2_m200_heavy_muzzle_brake"] = {["bg_cheytac_short_barrel"] = Vector(0, 12.2, 0.77)}}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0.45)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.CustomizationMenuScale = 0.0182
end

SWEP.MuzzleVelocity = 1400 -- in meter/s

SWEP.SightBGs     = {main = 2, none = 1} -- 3,1 Short barrel -- 4, no bip, 5,1 no stock
SWEP.BarrelBGs    = {main = 3, short = 1, regular = 0}
SWEP.BipodBGs     = {main = 4, rails = 1, regular = 0}
SWEP.StockBGs     = {main = 5, regular = 0, retractable = 0, none = 1}
SWEP.SB_BipodBGs  = {main = 6, SB_ON = 1, SB_DEPLOYED = 2, SB_OFF = 0}

SWEP.ADSFireAnim = true
SWEP.PreventQuickScoping = true
SWEP.QuickScopeSpreadIncrease = 0.22

if CustomizableWeaponry_OP_Perks and CustomizableWeaponry_G4P_UECW then

    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {400, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_snip2_elcan", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
	   [2] = {header = "Barrel", offset = {-840, 50}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "md_snip2_m200_heavy_muzzle_brake"}},
	   [3] = {header = "short barrel", offset = {-840, -600}, atts = {"bg_cheytac_short_barrel"}, exclusions = {md_snip2_light_suppressor = true, md_snip2_osprey_suppressor = true}},
	   [4] = {header = "Railed", offset = {-840, 600}, atts = {"bg_Cheytac_Bipod"}},
	   [5] = {header = "Stock", offset = {2050, 1100}, atts = {"bg_snip_Cheytac_no_stock"}},
       [6] = {header = "Bolt", offset = {2350, 100}, atts = {"md_improved_bolt"}},
	   [7] = {header = "Rail", offset = {50, 50}, atts = {"md_anpeq15"}, dependencies = {bg_Cheytac_Bipod = true}},
	   [8] = {header = "Bipod", offset = {50, 600}, atts = {"bg_snip2_special_bipod"}, dependencies = {bg_Cheytac_Bipod = true}},
       ["+use"] = {header = "Perks", offset = {2350, 500}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Perk_Stopping_Power"}},
	   ["+reload"] = {header = "Ammo", offset = {850, 850}, atts = {"am_magnum", "am_matchgrade"}}
	
	}
	
    elseif CustomizableWeaponry_G4P_UECW then
	
	SWEP.Attachments = {
       [1] = {header = "Sight", offset = {400, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_snip2_elcan", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
	   [2] = {header = "Barrel", offset = {-840, 50}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "md_snip2_m200_heavy_muzzle_brake"}},
	   [3] = {header = "short barrel", offset = {-840, -600}, atts = {"bg_cheytac_short_barrel"}, exclusions = {md_snip2_light_suppressor = true, md_snip2_osprey_suppressor = true}},
	   [4] = {header = "Railed", offset = {-840, 600}, atts = {"bg_Cheytac_Bipod"}},
	   [5] = {header = "Stock", offset = {2050, 1100}, atts = {"bg_snip_Cheytac_no_stock"}},
       [6] = {header = "Bolt", offset = {2050, 600}, atts = {"md_improved_bolt"}},
	   [7] = {header = "Rail", offset = {50, 50}, atts = {"md_anpeq15"}, dependencies = {bg_Cheytac_Bipod = true}},
	   [8] = {header = "Bipod", offset = {50, 600}, atts = {"bg_snip2_special_bipod"}, dependencies = {bg_Cheytac_Bipod = true}},
	   ["+reload"] = {header = "Ammo", offset = {850, 850}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
	elseif CustomizableWeaponry_OP_Perks then
	
    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {400, -600}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
	   [2] = {header = "Barrel", offset = {-840, 50}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "md_snip2_m200_heavy_muzzle_brake"}},
	   [3] = {header = "short barrel", offset = {-840, -600}, atts = {"bg_cheytac_short_barrel"}, exclusions = {md_snip2_light_suppressor = true, md_snip2_osprey_suppressor = true}},
	   [4] = {header = "Railed", offset = {-840, 600}, atts = {"bg_Cheytac_Bipod"}},
	   [5] = {header = "Stock", offset = {2050, 1100}, atts = {"bg_snip_Cheytac_no_stock"}},
       [6] = {header = "Bolt", offset = {2350, 100}, atts = {"md_improved_bolt"}},
	   [7] = {header = "Rail", offset = {50, 50}, atts = {"md_anpeq15"}, dependencies = {bg_Cheytac_Bipod = true}},
	   [8] = {header = "Bipod", offset = {50, 600}, atts = {"bg_snip2_special_bipod"}, dependencies = {bg_Cheytac_Bipod = true}},
       ["+use"] = {header = "Perks", offset = {2350, 500}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Perk_Stopping_Power"}},
	   ["+reload"] = {header = "Ammo", offset = {850, 850}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
	elseif not CustomizableWeaponry_OP_Perks or CustomizableWeaponry_G4P_UECW then
	
    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {400, -600}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
	   [2] = {header = "Barrel", offset = {-840, 50}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "md_snip2_m200_heavy_muzzle_brake"}},
	   [3] = {header = "short barrel", offset = {-840, -600}, atts = {"bg_cheytac_short_barrel"}, exclusions = {md_snip2_light_suppressor = true, md_snip2_osprey_suppressor = true}},
	   [4] = {header = "Railed", offset = {-840, 600}, atts = {"bg_Cheytac_Bipod"}},
	   [5] = {header = "Stock", offset = {2050, 1100}, atts = {"bg_snip_Cheytac_no_stock"}},
       [6] = {header = "Bolt", offset = {2050, 600}, atts = {"md_improved_bolt"}},
	   [7] = {header = "Rail", offset = {50, 50}, atts = {"md_anpeq15"}, dependencies = {bg_Cheytac_Bipod = true}},
	   [8] = {header = "Bipod", offset = {50, 600}, atts = {"bg_snip2_special_bipod"}, dependencies = {bg_Cheytac_Bipod = true}},
	   ["+reload"] = {header = "Ammo", offset = {850, 850}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
end

SWEP.Animations = {fire = {"awm_fire_layer_fix"},
	reload = "reload_tac",
	reload_empty = "reload_fix",
	idle = "idle1",
	draw = "deploy_layer"}
	
SWEP.Sounds = {
	deploy_layer = {{time = 0, sound = "CW_CHEYTAC_DRAW"}},
	
    awm_fire_layer_fix = {
    {time = 0.85, sound = "CW_CHEYTAC_BOLT"},   -- 0.74
	{time = 1.25, sound = "CW_CHEYTAC_BOLT2"}}, -- 1.12
	
	reload_tac = {
	[1] = {time = 0.44, sound = "CW_CHEYTAC_MAGOUTCLICK"},
	[2] = {time = 0.4, sound = "CW_CLOTH1"},
	[3] = {time = 0.78, sound = "CW_CHEYTAC_MAGOUT"},
	[4] = {time = 2.05, sound = "CW_CHEYTAC_MAGIN"},
	[5] = {time = 2.05, sound = "CW_CLOTH2"},
	[6] = {time = 2.15, sound = "CW_CLOTH3"},
	[7] = {time = 2.25, sound = "CW_CLOTH1"}},

	reload_fix = {
	[1] = {time = 0.44, sound = "CW_CHEYTAC_MAGOUTCLICK"},
	[2] = {time = 0.4, sound = "CW_CLOTH1"},
	[3] = {time = 0.78, sound = "CW_CHEYTAC_MAGOUT"},
	[4] = {time = 2.05, sound = "CW_CHEYTAC_MAGIN"},
	[5] = {time = 2, sound = "CW_CLOTH3"},
	[6] = {time = 2.68, sound = "CW_CHEYTAC_BOLT"},
	[7] = {time = 3.05, sound = "CW_CHEYTAC_BOLT2"},
	[8] = {time = 3.1, sound = "CW_CLOTH2"}}}

SWEP.SpeedDec = 65

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_snip_m200.mdl"
SWEP.WorldModel		= "models/weapons/w_snip_m200.mdl"
SWEP.BipodFireAnim = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 56
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".408 Cheytac"

SWEP.FireDelay = 1.85 -- 1.62
SWEP.FireSound = "CW_CHEYTAC_FIRE"
SWEP.FireSoundSuppressed = "CW_CHEYTAC_FIRE_SUPPRESSED"

SWEP.Recoil = 4

SWEP.CanPenetrate = true
SWEP.PenMod = 4

SWEP.HipSpread = 0.077
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 3.3
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 1.0
SWEP.Shots = 1
SWEP.Damage = 180
SWEP.DeployTime = 0.55

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 3
SWEP.ReloadTime_Empty = 3.85
SWEP.ReloadHalt = 3
SWEP.ReloadHalt_Empty = 3.85

SWEP.BipodInstalled = true

function SWEP:IndividualThink()

	self.EffectiveRange = 100 * 910
	self.DamageFallOff = .35

	if self.ActiveAttachments.bg_cheytac_short_barrel then
	    self.EffectiveRange = (self.EffectiveRange * 0.9)
	    self.DamageFallOff = (self.DamageFallOff + 0.05)	
	else
	    self.EffectiveRange = 100 * 910
	    self.DamageFallOff = .35	
	end

	if self.dt.BipodDeployed and self.ActiveAttachments.bg_snip2_special_bipod then 
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_DEPLOYED)
	else
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_ON)
    end	
	
	if self.ActiveAttachments.bg_Cheytac_Bipod and not self.ActiveAttachments.bg_snip2_special_bipod then
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_OFF)
		
	elseif not self.ActiveAttachments.bg_snip2_special_bipod and not self.ActiveAttachments.bg_Cheytac_Bipod then
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_OFF)
        self.BipodInstalled = true
	end
 end