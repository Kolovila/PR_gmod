AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

SWEP.EffectiveRange_Orig = 100 * 280
SWEP.DamageFallOff_Orig = .25

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "TAC .338"
	SWEP.CSMuzzleFlashes = true
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1.2
	
	SWEP.IconLetter = "r"
	killicon.AddFont("cw_l115", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellDelay = 1
	SWEP.ShellPosOffset = {x = 0, y = -2, z = 3}
	SWEP.FireMoveMod = 0.6
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_snip_TAC338.mdl"
	SWEP.WMPos = Vector(-1, 0, 2.05)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.866, 0.35, -0.178)
	SWEP.IronsightAng = Vector(0.6, 0.065, 0)
	
	SWEP.EoTechPos = Vector(-2.921, 0.25, -0.9)
	SWEP.EoTechAng = Vector(-0.4, -0.141, 0)
	
	SWEP.AimpointPos = Vector(-2.9, 0.25, -0.18)
	SWEP.AimpointAng = Vector(-0.40, 0.02, 0)
	
	SWEP.ShortDotPos = Vector(-2.83, 0, -0.267)
	SWEP.ShortDotAng = Vector(-0.876, 0.349, 0)
	
	SWEP.ACOGPos = Vector(-2.86, 0, -0.52)
	SWEP.ACOGAng = Vector(-0.392, 0.1, 0)
	
	SWEP.NXSPos = Vector(-2.951, 0.25, -0.361) -- (-2.951, 0, -0.361)
	SWEP.NXSAng = Vector(0.279, 0.07, 0)       -- (0.279, 0.07, 0)
	
	SWEP.MicroT1Pos = Vector(-2.859, 0, -0.427)
	SWEP.MicroT1Ang = Vector(0.35, 0.165, 0)
	
	SWEP.RMRPos = Vector(-2.81, 0.45, 0.455)
	SWEP.RMRAng = Vector(-1.908, 0.349, 0)
	
--[[--------------------Unofficial ATTACHMENTS-------------------------]]--

	SWEP.CmorePos = Vector(-2.881, 0.35, -0.159)
	SWEP.CmoreAng = Vector(-1.8, 0.12, 0) -- -1.65
	
	SWEP.ReflexPos = Vector(-2.881, 0.35, -0.159)
	SWEP.ReflexAng = Vector(-0.801, 0.05, 0)
	
	SWEP.TrijiconPos = Vector(-2.8, 0.25, -0.721)
	SWEP.TrijiconAng = Vector(0.77, 0.2, 0)

	SWEP.ELCANPos = Vector(-2.733, 0, -0.633)
	SWEP.ELCANAng = Vector(0.284, 0.769, 0)
	
	SWEP.CSGOACOGPos = Vector(-2.733, 0, -0.633)
	SWEP.CSGOACOGAng = Vector(0.55, 0.78, 0)
	
	SWEP.CSGO556Pos = Vector(-2.837, 0.2, 0)
	SWEP.CSGO556Ang = Vector(-1.8, 0.2, 0)
	
	SWEP.CSGOSSGPos = Vector(-2.865, 0, -0.32)
	SWEP.CSGOSSGAng = Vector(-1.816, 0.172, 0)
	
	SWEP.LeupoldPos = Vector(-2.865, 0, -0.32)
	SWEP.LeupoldAng = Vector(-1.816, 0.172, 0)

--	SWEP.BallisticPos = Vector(-2.733, 0, -0.633)
--	SWEP.BallisticAng = Vector(0.284, 0.769, 0)

--[[-------------------------------------------------------------------]]--

	SWEP.SprintPos = Vector(6.806, -4.5, -3.6)
	SWEP.SprintAng = Vector(0, 47.216, 0)
	
	SWEP.CustomizePos = Vector(6.528, -2.576, -0.962)
    SWEP.CustomizeAng = Vector(6.65, 35.811, 0)

	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.PronePos = Vector(9.97, -1.496, -1.505)
	SWEP.ProneAng = Vector(-6.5, 40, 0)

	SWEP.ReticleInactivityPostFire = 1.92
	
	SWEP.BackupSights = {
	["md_rmr"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_microt1"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_aimpoint"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_eotech"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_schmidt_shortdot"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_acog"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_nightforce_nxs"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	
--	SWEP.IronSightsPos = Vector(-5.623, 3, 1.455)
--  SWEP.IronSightsAng = Vector(0.66, -0.667, -42.911)
	
	["md_cmore"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_reflex"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_trijicon"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},	
	["md_uecw_csgo_acog"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_snip2_elcan"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_uecw_csgo_556"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)},
	["md_uecw_csgo_scope_ssg"] = {[1] = Vector(-5.623, 3.5, 1.455), [2] = Vector(0.66, -0.652, -42.911)}}
	
	SWEP.ACOGAxisAlign = {right = 0.4, up = -0.09, forward = 0}
	SWEP.NXSAlign = {right = -0.28, up = -0.06, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0.85, up = -0.35, forward = 0}
	
	SWEP.ElcanAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AimBreathingEnabled = true
	SWEP.CrosshairEnabled = false
--	SWEP.AimViewModelFOV = 60
	SWEP.HipFireFOVIncrease = false

    SWEP.LuaViewmodelRecoil = true  
	SWEP.LuaVMRecoilAxisMod = {vert = 0.4, hor = 0.95, roll = 0.9, forward = 0.15, pitch = 0.25}
		
	SWEP.AttachmentModelsVM = {
	
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Gun", rel = "", pos = Vector(0, -2.34, -0.046), angle = Angle(90, 0, -90), size = Vector(0.55, 0.55, 0.55)},
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Gun", rel = "", pos = Vector(-5.519, 4.989, 0.439), angle = Angle(0, 0, -90), size = Vector(1.251, 1.251, 1.251)},
	    ["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "Gun", rel = "", pos = Vector(0, -3.451, 0.1), angle = Angle(0, 0, -90), size = Vector(1.271, 1.271, 1.271)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Gun", rel = "", pos = Vector(-6.807, 4.349, 0.36), angle = Angle(-90, 180, 90), size = Vector(1.121, 1.121, 1.121)},
	    ["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "Gun", rel = "", pos = Vector(13.128, 1.549, 0), angle = Angle(-90, 0, -90), size = Vector(1.098, 1.098, 1.098)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Gun", rel = "", pos = Vector(-7.5, 4.44, 0.27), angle = Angle(-90, 180, 90), size = Vector(1.149, 1.149, 1.149)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Gun", rel = "", pos = Vector(-18.664, 16.03, -0.48), angle = Angle(-180, 180, 90), size = Vector(1.689, 1.689, 1.689)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Gun", rel = "", pos = Vector(14.9, 2.08, -0), angle = Angle(-90, 0, -90), size = Vector(0.966, 0.966, 0.966)},
		["md_snip2_osprey_suppressor"] = {model = "models/attachments/special_osprey_suppressor.mdl", bone = "Gun", rel = "", pos = Vector(16.35, 1.879, 0), angle = Angle(-90, -0, -90), size = Vector(0.883, 0.883, 0.883)},
		["md_snip2_light_suppressor"] = {model = "models/attachments/special_light_suppressor.mdl", bone = "Gun", rel = "", pos = Vector(16.35, 1.879, 0), angle = Angle(-90, -0, -90), size = Vector(0.883, 0.883, 0.883)},
		["md_heavy_muzzle_brake"] = {model = "models/attachments/heavy_muzzle_brake.mdl", bone = "Gun", rel = "", pos = Vector(16.35, 1.879, 0), angle = Angle(-90, -0, -90), size = Vector(0.883, 0.883, 0.883)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Gun", rel = "", pos = Vector(11.5, -1.8, 0.1), angle = Angle(180, 0, -90), size = Vector(0.596, 0.596, 0.596)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "Gun", rel = "", pos = Vector(-6.171, 4.655, 0.388), angle = Angle(0, 0, -90), size = Vector(1.19, 1.19, 1.19)},

		["md_cmore"] = { type = "Model", model =  "models/attachments/cmore.mdl", bone = "Gun", rel = "", pos = Vector(0.483, -2.089, -0.01), angle = Angle(-90, 90, 0), size = Vector(1.062, 1.062, 1.062)},
		["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "Gun", rel = "", pos = Vector(5.139, -2.421, -0.01), angle = Angle(-90, 90, 0), size = Vector(1.062, 1.062, 1.062)},
		["md_trijicon"] = { type = "Model", model = "models/att_trijicon.mdl", bone = "Gun", rel = "", pos = Vector(3.479, 1.44, -0.071), angle = Angle(-90, 90, 0), size = Vector(3.052, 3.052, 3.052)},

	    ["md_snip2_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "Gun", rel = "", pos = Vector(-6.276, 3.95, 0.33), angle = Angle(-90, 90, 0), size = Vector(1.062, 1.062, 1.062)},
		["md_uecw_csgo_acog"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_acog.mdl", bone = "Gun", rel = "", pos = Vector(-8.787, 2.848, -0.116), angle = Angle(0, 0, -90), size = Vector(1.1, 1.1, 1.1)},
		["md_uecw_csgo_556"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_sig.mdl", bone = "Gun", rel = "", pos = Vector(0.187, -1.821, -0.116), angle = Angle(0, 0, -90), size = Vector(1.1, 1.1, 1.1)},
		
		["md_uecw_csgo_scope_ssg"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_scope_bender.mdl", bone = "Gun", rel = "", pos = Vector(0.465, -1.821, -0.099), angle = Angle(0, 0, -90), size = Vector(1.077, 1.077, 1.077)}
	--  ["md_ballistic"] = { type = "Model", model = "models/bunneh/scope01.mdl", bone = "AK12_Body", rel = "", pos = Vector(-0.171, -8.207, -0.26), angle = Angle(0, 0, 0), size = Vector(0.718, 0.718, 0.718)}
	}
	
	SWEP.AttachmentPosDependency = {
	["md_saker"] = {["bg_tac338_short_barrel"] = Vector(-0, 2.1, 0)},
	["md_snip2_light_suppressor"] = {["bg_tac338_short_barrel"] = Vector(-0, 2.1, 0)},
	["md_snip2_osprey_suppressor"] = {["bg_tac338_short_barrel"] = Vector(-0, 2.1, 0)},
	["md_heavy_muzzle_brake"] = {["bg_tac338_short_barrel"] = Vector(-0, 2.1, 0)}}

	SWEP.LaserPosAdjust = Vector(-0.8, 0, 0.2)
	SWEP.LaserAngAdjust = Angle(0, 179.05, 0)
	
	SWEP.LaserAngAdjustAim = Angle(0, 180.05, 0)
end

SWEP.MuzzleVelocity = 936 -- in meter/s

SWEP.SightBGs  = {main = 2, none = 1}
SWEP.BarrelBGs = {main = 4, short = 1, regular = 0}
SWEP.StockBGs  = {main = 5, up = 1, regular = 0}
SWEP.MagBGs    = {main = 6, extended = 1, regular = 0}
SWEP.SB_BipodBGs  = {main = 7, SB_ON = 1, SB_DEPLOYED = 2, SB_OFF = 0}

SWEP.ADSFireAnim = true
SWEP.PreventQuickScoping = true
SWEP.QuickScopeSpreadIncrease = 0.2

-- SWEP.ZoomAmount = 10

if CustomizableWeaponry_OP_Perks and CustomizableWeaponry_G4P_UECW then

    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {350, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_snip2_elcan", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-800, -10}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "md_heavy_muzzle_brake"}},
	   [3] = {header = "short barrel", offset = {-360, -600}, atts = {"bg_tac338_short_barrel"}, exclusions = { md_snip2_osprey_suppressor = true, md_snip2_light_suppressor = true}},
   	   [4] = {header = "Rail", offset = {300, -10}, atts = {"md_anpeq15"}},
	   [5] = {header = "Bipod", offset = {-360, 540}, atts = {"md_bipod", "bg_snip2_special_bipod"}},
	   [6] = {header = "Magazine", offset = {700, 950}, atts = {"bg_snip_tac338_8_mag"}},
	   [7] = {header = "Stock", offset = {2300, 960}, atts = {"bg_snip_tac338_rest_cheeks_up"}},
       [8] = {header = "Bolt", offset = {2700, 100}, atts = {"md_improved_bolt"}},
	   ["+use"] = {header = "Perks", offset = {2700, 500}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Perk_Stopping_Power"}},
	   ["+reload"] = {header = "Ammo", offset = {1350, 950}, atts = {"am_magnum", "am_matchgrade"}}
    }
	
    elseif CustomizableWeaponry_G4P_UECW then
	
    SWEP.Attachments = {
	   [1] = {header = "Sight", offset = {350, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_snip2_elcan", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-800, -10}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "md_heavy_muzzle_brake"}},
	   [3] = {header = "short barrel", offset = {-360, -600}, atts = {"bg_tac338_short_barrel"}, exclusions = { md_snip2_osprey_suppressor = true, md_snip2_light_suppressor = true}},
   	   [4] = {header = "Rail", offset = {300, -10}, atts = {"md_anpeq15"}},
	   [5] = {header = "Bipod", offset = {-360, 540}, atts = {"md_bipod", "bg_snip2_special_bipod"}},
	   [6] = {header = "Magazine", offset = {700, 950}, atts = {"bg_snip_tac338_8_mag"}},
	   [7] = {header = "Stock", offset = {2300, 960}, atts = {"bg_snip_tac338_rest_cheeks_up"}},
       [8] = {header = "Bolt", offset = {2300, 555}, atts = {"md_improved_bolt"}},
	   ["+reload"] = {header = "Ammo", offset = {1350, 950}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
    elseif CustomizableWeaponry_OP_Perks then
		
    SWEP.Attachments = {
	   [1] = {header = "Sight", offset = {500, -600}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
       [2] = {header = "Barrel", offset = {-800, -10}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "md_heavy_muzzle_brake"}},
	   [3] = {header = "short barrel", offset = {-360, -600}, atts = {"bg_tac338_short_barrel"}, exclusions = { md_snip2_osprey_suppressor = true, md_snip2_light_suppressor = true}},
   	   [4] = {header = "Rail", offset = {300, -10}, atts = {"md_anpeq15"}},
	   [5] = {header = "Bipod", offset = {-360, 540}, atts = {"md_bipod", "bg_snip2_special_bipod"}},
	   [6] = {header = "Magazine", offset = {700, 950}, atts = {"bg_snip_tac338_8_mag"}},
	   [7] = {header = "Stock", offset = {2300, 960}, atts = {"bg_snip_tac338_rest_cheeks_up"}},
       [8] = {header = "Bolt", offset = {2700, 100}, atts = {"md_improved_bolt"}},
	   ["+use"] = {header = "Perks", offset = {2700, 500}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Perk_Stopping_Power"}},
	   ["+reload"] = {header = "Ammo", offset = {1350, 950}, atts = {"am_magnum", "am_matchgrade"}}
    }
	
	elseif not CustomizableWeaponry_G4P_UECW or CustomizableWeaponry_OP_Perks then

    SWEP.Attachments = {
	   [1] = {header = "Sight", offset = {500, -600}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
       [2] = {header = "Barrel", offset = {-800, -10}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "md_heavy_muzzle_brake"}},
	   [3] = {header = "short barrel", offset = {-360, -600}, atts = {"bg_tac338_short_barrel"}, exclusions = { md_snip2_osprey_suppressor = true, md_snip2_light_suppressor = true}},
   	   [4] = {header = "Rail", offset = {300, -10}, atts = {"md_anpeq15"}},
	   [5] = {header = "Bipod", offset = {-360, 540}, atts = {"md_bipod", "bg_snip2_special_bipod"}},
	   [6] = {header = "Magazine", offset = {700, 950}, atts = {"bg_snip_tac338_8_mag"}},
	   [7] = {header = "Stock", offset = {2300, 960}, atts = {"bg_snip_tac338_rest_cheeks_up"}},
       [8] = {header = "Bolt", offset = {2300, 555}, atts = {"md_improved_bolt"}},
	   ["+reload"] = {header = "Ammo", offset = {1350, 950}, atts = {"am_magnum", "am_matchgrade"}}
    }
end

SWEP.Animations = {fire = {"shoot"},
--	reload = "reload_tac",
    reload = "reload",
	idle = "idle1",
	draw = "draw"}
	
SWEP.Sounds = {
	draw = {{time = 0, sound = "CW_TAC_DRAW"},
    {time = 0.15, sound = "CW_TAC_BOLTUP"},
    {time = 0.3, sound = "CW_TAC_BOLTBACK"},
    {time = 0.77, sound = "CW_TAC_BOLTRELEASE"},
	{time = 0.87, sound = "CW_TAC_BOLTDOWN"}},
	
	draw2 = {{time = 0, sound = "CW_TAC_DRAW"},
    {time = 0.15, sound = "CW_TAC_BOLTUP"},
    {time = 0.3, sound = "CW_TAC_BOLTBACK"},
    {time = 0.77, sound = "CW_TAC_BOLTRELEASE"},
	{time = 0.87, sound = "CW_TAC_BOLTDOWN"}},
	
    shoot = {
    {time = 0.75, sound = "CW_CLOTH3"},
	{time = 0.42, sound = "CW_TAC_BOLTUP"},
    {time = 0.8, sound = "CW_TAC_BOLT"},
	{time = 1.4, sound = "CW_TAC_BOLTDOWN"},
	{time = 1.45, sound = "CW_CLOTH2"}},
	
--	reload_tac = {
--	[1] = {time = 0.1, sound = "CW_CLOTH3"},
--	[2] = {time = 0.45, sound = "CW_TAC_MAGGRAB"},
--	[3] = {time = 0.8, sound = "CW_TAC_MAGOUT"},
--	[4] = {time = 0.82, sound = "CW_CLOTH"},
--	[5] = {time = 1.6, sound = "CW_TAC_MAGIN"},
--	[6] = {time = 1.95, sound = "CW_TAC_MAGINTAP"},
--	[7] = {time = 3.1, sound = "CW_CLOTH2"},
--	[8] = {time = 3.15, sound = "CW_CLOTH1"}},

	reload = {
	[1] = {time = 0.1, sound = "CW_CLOTH2"},
	[2] = {time = 0.42, sound = "CW_TAC_BOLTUP"},
	[3] = {time = 0.62, sound = "CW_TAC_BOLTBACK2"},
	[4] = {time = 1.33, sound = "CW_TAC_MAGGRAB"},
	[5] = {time = 1.65, sound = "CW_TAC_MAGOUT"},
	[6] = {time = 2.4, sound = "CW_CLOTH"},
	[7] = {time = 2.65, sound = "CW_TAC_MAGIN"},
	[8] = {time = 3.05, sound = "CW_TAC_MAGINTAP"},
	[9] = {time = 3.6, sound = "CW_CLOTH2"},
	[10] = {time = 3.75, sound = "CW_TAC_BOLTRELEASE"},
	[11] = {time = 3.92, sound = "CW_TAC_BOLTDOWN"},
	[12] = {time = 3.95, sound = "CW_CLOTH1"}},
	
	reload_8_mag = {
	[1] = {time = 0.1, sound = "CW_CLOTH3"},
	[2] = {time = 0.42, sound = "CW_TAC_BOLTUP"},
	[3] = {time = 0.62, sound = "CW_TAC_BOLTBACK2"},
	[4] = {time = 1.33, sound = "CW_TAC_MAGGRAB"},
	[5] = {time = 1.65, sound = "CW_TAC_MAGOUT"},
	[6] = {time = 2.4, sound = "CW_CLOTH"},
	[7] = {time = 2.65, sound = "CW_TAC_MAGIN"},
	[8] = {time = 3.05, sound = "CW_TAC_MAGINTAP"},
	[9] = {time = 3.6, sound = "CW_CLOTH2"},
	[10] = {time = 3.75, sound = "CW_TAC_BOLTRELEASE"},
	[11] = {time = 3.92, sound = "CW_TAC_BOLTDOWN"},
	[12] = {time = 3.95, sound = "CW_CLOTH1"}}}
	
SWEP.SpeedDec = 30

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

SWEP.ViewModelFOV	= 70  -- 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_snip_TAC338.mdl"
SWEP.WorldModel		= "models/weapons/w_snip_TAC338.mdl"
SWEP.BipodFireAnim = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".338 Lapua"
SWEP.Chamberable = false

SWEP.FireDelay = 1.82
SWEP.FireSound = "CW_TAC_FIRE"
SWEP.FireSoundSuppressed = "CW_TAC_SILFIRE"
SWEP.Recoil = 2.5

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.0005
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.85
SWEP.Shots = 1
SWEP.Damage = 122
SWEP.DeployTime = 1.12

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 4.5
SWEP.ReloadTime_Empty = 4.5
SWEP.ReloadHalt = 4.5
SWEP.ReloadHalt_Empty = 4.5

function SWEP:IndividualThink()
	
	self.EffectiveRange = 100 * 280
	self.DamageFallOff = .25
	
	if self.ActiveAttachments.bg_tac338_short_barrel then
	    self.EffectiveRange = (self.EffectiveRange * 0.95)
	else
	    self.EffectiveRange = 100 * 280
	end
	
	if self.dt.BipodDeployed and self.ActiveAttachments.bg_snip2_special_bipod then 
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_DEPLOYED)
	else
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_ON)
    end	
	
	if not self.ActiveAttachments.bg_snip2_special_bipod then
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_OFF)
	end
	
    self.Animations.draw = "draw2"
	if self.Animations.draw == "draw2" then
	    self.DeployTime = 1.12
	end
end