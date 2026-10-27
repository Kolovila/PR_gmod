AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo(".50 BMG", ".50 BMG Rounds", 12.7, 99)

if CLIENT then
	SWEP.PrintName = "DSR-50"
	SWEP.CSMuzzleFlashes = true

	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1.45
	SWEP.FireMoveMod = 0.5

	SWEP.IconLetter = "r"
	killicon.AddFont("cw_l115", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))

	SWEP.DrawCrosshair = false
	SWEP.CrosshairEnabled = false

	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = 0, y = -10, z = 0}
	SWEP.SnapToGrip = true
	SWEP.ShellDelay = 0.95
	SWEP.ShellScale = 0.8
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = -1.5}
	
	SWEP.ReticleInactivityPostFire = 1.6
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_bo2_dsr50.mdl"
	SWEP.WMPos = Vector(-1, 0, 0.8)
	SWEP.WMAng = Vector(0, 0, 180)

    SWEP.IronsightPos = Vector(-3.015, 3.457, -0.099)
    SWEP.IronsightAng = Vector(0.233, -0.01, 0)

	SWEP.MicroT1Pos = Vector(-3, 0, 0.159)
    SWEP.MicroT1Ang = Vector(-0.25, 0.07, 0)
	
    SWEP.RMRPos = Vector(-2.95, -1, 0.451)
    SWEP.RMRAng = Vector(0.2, 0.2, 0)

	SWEP.AimpointPos = Vector(-3.066, 0, -0.04)    -- (-2.991, 0, -0.04)
    SWEP.AimpointAng = Vector(-0.08, -0.05, 0)     -- (-0.08, 0.2, 0) 

	SWEP.EoTechPos = Vector(-3, 0, -0.801)
    SWEP.EoTechAng = Vector(0, 0.059, 0) -- 0.15, 0.059, 0
	
	SWEP.ShortDotPos = Vector(-3, -0.101, 0.079)
    SWEP.ShortDotAng = Vector(0, 0.141, 0)

    SWEP.DSRPos = Vector(-3, 0, 0.239)
    SWEP.DSRAng = Vector(0, 0, 0)
	
--[[--------------------Unofficial ATTACHMENTS-------------------------]]--

	SWEP.CmorePos = Vector(-2.995, 0, 0.039)
	SWEP.CmoreAng = Vector(-0.366, 0.08, 0)
	
	SWEP.ReflexPos = Vector(-3, 0, 0.16)
	SWEP.ReflexAng = Vector(-0.2, 0.08, 0)
	
	SWEP.TrijiconPos = Vector(-2.95, 0, -0.12)
	SWEP.TrijiconAng = Vector(1.125, 0.17, 0)
	
	SWEP.CSGOACOGPos = Vector(-3, 0, 0.28)
	SWEP.CSGOACOGAng = Vector(-1.476, 0.1, 0)
	
	SWEP.ELCANPos = Vector(-3, 0, -0.04)
	SWEP.ELCANAng = Vector(0, -0.101, 0)
	
	SWEP.CSGO556Pos = Vector(-3, 0, 0.28)
	SWEP.CSGO556Ang = Vector(0, 0, 0)

	SWEP.CSGOSSGPos = Vector(-2.925, 0, 0.159)
	SWEP.CSGOSSGAng = Vector(-0.281, 0, 0)
	
--[[-------------------------------------------------------------------]]--

	SWEP.AlternativePos = Vector(-1.321, 0, -0.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(5.967, -2.244, -0.891)
	SWEP.CustomizeAng = Vector(7.747, 35.701, 0)

    SWEP.SprintPos = Vector(6.821, -1.191, 0)
    SWEP.SprintAng = Vector(-13, 38.637, 0)

--  SWEP.SprintPos = Vector(0, -2.444, -1)
--  SWEP.SprintAng = Vector(-11.131, 31.955, -17.755)

	SWEP.BackupSights = {
	["md_acog"] = {[1] = Vector(-4.441, -5.915, -0.847), [2] = Vector(0.49, 0, 0)},
    ["md_snip2_elcan"] = {[1] = Vector(-3, 0, -0.991), [2] = Vector(-0.027, -0.136, 0)},
    ["md_uecw_csgo_556"] = {[1] = Vector(-3, 0, -0.945), [2] = Vector(1.146, -0.02, 0)}}

	SWEP.DSRAxisAlign = {right = -0, up = 0, forward = 0}
	SWEP.NXSAlign = {right = -1.19, up = -0.27, forward = 0}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.ElcanAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.FullAimViewmodelRecoil = true
	SWEP.HipFireFOVIncrease = false

	SWEP.CustomizationMenuScale = 0.02
	
	SWEP.LaserPosAdjust = Vector(1, 4, -0)--{x = 1, y = 0, z = 0}
	SWEP.LaserAngAdjust = Angle(0, 180, 0)
	
	SWEP.CustomizationMenuScale = 0.015

    SWEP.AttachmentModelsVM = {
	    ["md_bo2_dsr_scope"] = { type = "Model", model = "models/attachments/dsr_scope.mdl", bone = "j_gun", rel = "", pos = Vector(-0.102, 0, 4.138), angle = Angle(0, -90, 0), size = Vector(0.801, 0.801, 0.801), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "j_gun", rel = "", pos = Vector(0.25, 0.449, -2.988), angle = Angle(0, 0, 0), size = Vector(1.133, 1.133, 1.133)},
	    ["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "j_gun", rel = "", pos = Vector(1.2, 0.05, 3.71), angle = Angle(0, 90, 0), size = Vector(0.537, 0.537, 0.537)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "j_gun", rel = "", pos = Vector(-20.418, -0.48, -16.671), angle = Angle(0, 0, 0), size = Vector(1.878, 1.878, 1.878)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "j_gun", rel = "", pos = Vector(-6.569, 0.389, -4.011), angle = Angle(0, 90, 0), size = Vector(1.322, 1.322, 1.322)},
	    ["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "j_gun", rel = "", pos = Vector(6.684, 0.029, -0.677), angle = Angle(0, 90, 0), size = Vector(0.967, 0.967, 0.967)},
	    ["md_snip2_osprey_suppressor"] = {model = "models/attachments/special_osprey_suppressor.mdl", bone = "j_gun", rel = "", pos = Vector(6.684, 0.029, -0.677), angle = Angle(0, 90, 0), size = Vector(0.967, 0.967, 0.967)},
		["md_snip2_light_suppressor"] = {model = "models/attachments/special_light_suppressor.mdl", bone = "j_gun", rel = "", pos = Vector(6.684, 0.029, -0.677), angle = Angle(0, 90, 0), size = Vector(0.967, 0.967, 0.967)},
    	["md_snip_2_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "j_gun", rel = "", pos = Vector(-8.429, 0.469, -3.421), angle = Angle(0, 0, 0), size = Vector(1.202, 1.202, 1.202)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "j_gun", rel = "", pos = Vector(14.6, -0.136, -0.466), angle = Angle(0, 180, 180), size = Vector(0.717, 0.717, 0.717)},
		
		["md_cmore"] = { type = "Model", model =  "models/attachments/cmore.mdl", bone = "j_gun", rel = "", pos = Vector(-0.733, 0.032, 3.4), angle = Angle(0, 90, 0), size = Vector(1.001, 1.001, 1.001)},
		["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "j_gun", rel = "", pos = Vector(1.901, 0.032, 3.763), angle = Angle(0, 90, 0), size = Vector(1.001, 1.001, 1.001)},
		["md_trijicon"] = { type = "Model", model = "models/att_trijicon.mdl", bone = "j_gun", rel = "", pos = Vector(1.718, -0, 0.085), angle = Angle(0, 90, 0), size = Vector(2.838, 2.838, 2.838)},
		["md_uecw_csgo_acog"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_acog.mdl", bone = "tag_weapon", rel = "", pos = Vector(-7.843, -0.042, -1.331), angle = Angle(0, 0, 0), size = Vector(1.05, 1.05, 1.05)},
	    ["md_snip2_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "tag_weapon", rel = "", pos = Vector(-6.315, 0.349, -2.165), angle = Angle(0, 90, 0), size = Vector(0.985, 0.985, 0.985)},
		["md_uecw_csgo_556"] = { type = "Model", model =  "models/gmod4phun/csgo/eq_optic_sig.mdl", bone = "tag_weapon", rel = "", pos = Vector(-0.601, -0.042, 3.176), angle = Angle(0, 0, 0), size = Vector(0.985, 0.985, 0.985)},
		["md_uecw_csgo_scope_ssg"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_scope_bender.mdl", bone = "tag_weapon", rel = "", pos = Vector(0.016, -0.051, 3.154), angle = Angle(0, 0, 0), size = Vector(0.944, 0.944, 0.944)},
    }
end

SWEP.MuzzleVelocity = 1100 -- in meter/s
SWEP.LuaViewmodelRecoil = false

SWEP.SightBGs = {main = 2, none = 1}
SWEP.BarrelBGs = {main = 3, Brake = 1, regular = 0}

if CustomizableWeaponry_OP_Perks and CustomizableWeaponry_G4P_UECW then

    SWEP.Attachments = {
       [1] = {header = "Sights", offset = {500, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_snip_2_schmidt_shortdot", "md_snip2_elcan", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_uecw_csgo_scope_ssg", "md_bo2_dsr_scope"}}, 
       [2] = {header = "Barrel", offset = {-700, -100}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "bg_dsr_muzzle_brake"}},
       [3] = {header = "Rail", offset = {-700, 450}, atts = {"md_anpeq15"}},
       [4] = {header = "Bolt", offset = {2640, 100}, atts = {"md_improved_bolt"}},
	   ["+use"] = {header = "Perks", offset = {2350, 500}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Perk_Stopping_Power"}},
       ["+reload"] = {header = "Ammo", offset = {2350, 950}, atts = {"am_magnum", "am_matchgrade"}}
    }  
	
    elseif CustomizableWeaponry_G4P_UECW then
    SWEP.Attachments = {
       [1] = {header = "Sights", offset = {600, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_snip_2_schmidt_shortdot", "md_uecw_csgo_scope_ssg", "md_bo2_dsr_scope"}}, 
       [2] = {header = "Barrel", offset = {-700, -100}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "bg_dsr_muzzle_brake"}},
       [3] = {header = "Rail", offset = {-700, 450}, atts = {"md_anpeq15"}},
       [4] = {header = "Bolt", offset = {2350, 450}, atts = {"md_improved_bolt"}},
       ["+reload"] = {header = "Ammo", offset = {2350, 950}, atts = {"am_magnum", "am_matchgrade"}}
    }  
	
    elseif CustomizableWeaponry_OP_Perks then
    SWEP.Attachments = {
       [1] = {header = "Sights", offset = {750, -600}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_snip_2_schmidt_shortdot", "md_bo2_dsr_scope"}}, 
       [2] = {header = "Barrel", offset = {-700, -100}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "bg_dsr_muzzle_brake"}},
       [3] = {header = "Rail", offset = {-700, 450}, atts = {"md_anpeq15"}},
       [4] = {header = "Bolt", offset = {2640, 100}, atts = {"md_improved_bolt"}},
	   ["+use"] = {header = "Perks", offset = {2350, 500}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Perk_Stopping_Power"}},
       ["+reload"] = {header = "Ammo", offset = {2350, 950}, atts = {"am_magnum", "am_matchgrade"}}
    } 
	
	elseif not CustomizableWeaponry_G4P_UECW or CustomizableWeaponry_OP_Perks then

    SWEP.Attachments = {
       [1] = {header = "Sights", offset = {750, -600}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_snip_2_schmidt_shortdot", "md_bo2_dsr_scope"}}, 
       [2] = {header = "Barrel", offset = {-700, -100}, atts = {"md_saker", "md_snip2_light_suppressor", "md_snip2_osprey_suppressor", "bg_dsr_muzzle_brake"}},
       [3] = {header = "Rail", offset = {-700, 450}, atts = {"md_anpeq15"}},
       [4] = {header = "Bolt", offset = {2350, 450}, atts = {"md_improved_bolt"}},
       ["+reload"] = {header = "Ammo", offset = {2350, 950}, atts = {"am_magnum", "am_matchgrade"}}
    }  
end

SWEP.Animations = {fire = "fire",
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "DSR50_DRAW"}}, -- 0.1

	reload = {
	{time = 0.56, sound = "DSR50_MAGOUT"},
	{time = 0.56, sound = "CW_CLOTH1"},
	{time = 2, sound = "DSR50_MAGIN"},
	{time = 2, sound = "CW_CLOTH2"}},
	
	reload_empty = {
	{time = 0.12, sound = "CW_CLOTH1"},
	{time = 0.135, sound = "DSR50_BOLTBACK"},
	{time = 1.05, sound = "CW_CLOTH3"},
	{time = 1.1, sound = "DSR50_MAGOUT"},
	{time = 2.52, sound = "DSR50_MAGIN"},
	{time = 2.52, sound = "CW_CLOTH2"},
	{time = 3.1, sound = "CW_CLOTH4"},
	{time = 3.22, sound = "DSR50_BOLTFORWARD"}},
	
	fire = {
	{time = 0.8, sound = "DSR50_BOLTBACK"},
	{time = 1.2, sound = "DSR50_BOLTFORWARD"}}}

SWEP.SpeedDec = 60

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "CyberBre/Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_bo2_dsr50.mdl"
SWEP.WorldModel		= "models/weapons/w_bo2_dsr50.mdl"
SWEP.ADSFireAnim = true
SWEP.BipodFireAnim = true

SWEP.Spawnable			 = true
SWEP.AdminSpawnable		 = true
SWEP.AimBreathingEnabled = true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".50 BMG"

SWEP.FireDelay = 1.62
SWEP.FireSound = "DSR50_FIRE"
SWEP.FireSoundSuppressed = "DSR50_FIRE_SUPPRESSED"
SWEP.Recoil = 3.45

SWEP.HipSpread = 0.2
SWEP.AimSpread = 0.0005
SWEP.VelocitySensitivity = 2.6
SWEP.MaxSpreadInc = 0.6
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.3
SWEP.Shots = 1
SWEP.Damage = 200
SWEP.DeployTime = 0.7

SWEP.CanPenetrate = true
SWEP.PenMod = 3

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 2.74
SWEP.ReloadTime_Empty = 3.75
SWEP.ReloadHalt = 2.74
SWEP.ReloadHalt_Empty = 3.75
