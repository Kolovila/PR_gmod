AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("7.62x51MM", "7.62x51MM", 7.62, 51)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M24"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "r"
	killicon.AddFont("cw_l115", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellDelay = 0.7
	SWEP.ShellPosOffset = {x = 0, y = -1, z = -1}
	SWEP.MoveType = 1

	SWEP.FireMoveMod = 0.6
--	SWEP.OverrideAimMouseSens = 0.7
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_snip_M24.mdl"
	SWEP.WMPos = Vector(-1, 0, 0.75)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.413, -1.4, -0.08)
	SWEP.IronsightAng = Vector(1.31, 0, 0)
	
    SWEP.MicroT1Pos = Vector(-2.411, 0, -0.08)
    SWEP.MicroT1Ang = Vector(0.34, 0.10, 0)

	SWEP.EoTechPos = Vector(-2.921, 0, -0.48)
	SWEP.EoTechAng = Vector(-2.12, -0.141, 0)
	
	SWEP.AimpointPos = Vector(-2.375, 0, -0.13)
	SWEP.AimpointAng = Vector(-0.017, 0.11, 0)
	
    SWEP.ShortDotPos = Vector(-2.381, 0, 0)
    SWEP.ShortDotAng = Vector(-0.25, -0.051, 0)

	SWEP.ACOGPos = Vector(-2.366, 0, -0.299)
	SWEP.ACOGAng = Vector(0, 0.2, 0)

	SWEP.NXSPos = Vector(-2.411, 0, -0.188)
	SWEP.NXSAng = Vector(0.531, 0.1, 0)
	
	SWEP.RMRPos = Vector(-2.356, 0, 0.317)
	SWEP.RMRAng = Vector(0.01, 0.119, 0)

--[[--------------------Unofficial ATTACHMENTS-------------------------]]--

	SWEP.CmorePos = Vector(-2.424, 0, 0)
	SWEP.CmoreAng = Vector(-0.921, -0.055, 0)
	
	SWEP.ReflexPos = Vector(-2.424, 0, 0)
	SWEP.ReflexAng = Vector(-0.005, -0.046, 0)

	SWEP.TrijiconPos = Vector(-2.317, 0, -0.182)
	SWEP.TrijiconAng = Vector(0.598, 0.222, 0)

	SWEP.ELCANPos = Vector(-2.437, 0, -0.201)
	SWEP.ELCANAng = Vector(-0.25, -0.301, 0)

--	SWEP.CSGOACOGPos = Vector(-1.92, 0, -0.4)
--	SWEP.CSGOACOGAng = Vector(1.45, 0.319, 0)
	
--	SWEP.CSGO556Pos = Vector(-1.92, 0, 0)
--	SWEP.CSGO556Ang = Vector(0.279, 0.25, 0)
	
	SWEP.CSGOSSGPos = Vector(-2.379, 0, -0.406)
	SWEP.CSGOSSGAng = Vector(1.736, 0, 0)

--	SWEP.LeupoldPos = Vector(-1.945, 0.437, -0.179)
--	SWEP.LeupoldAng = Vector(0, 0.1, 0)
	
--	SWEP.BallisticPos = Vector(-2.76, -4.6, 0.36)
--	SWEP.BallisticAng = Vector(0, 0, 0)

--[[----------------------------------------------]]--
	SWEP.SprintPos = Vector(7.01, -5.185, -2.3)
	SWEP.SprintAng = Vector(-2.126, 55.581, 0)

	SWEP.CustomizePos = Vector(5.475, -1.755, -1.836)
    SWEP.CustomizeAng = Vector(9.671, 31.472, 0)

	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.ReticleInactivityPostFire = 1.25

	SWEP.BackupSights = {
	["md_acog"] = {[1] = Vector(-2.379, 0, -1.293), [2] = Vector(-0.013, 0.009, 0)},
	["md_snip1_elcan"] = {[1] = Vector(-2.401, 0, -1.03), [2] = Vector(0.041, -0.101, 0)}}

    SWEP.ACOGAxisAlign = {right = 0.02, up = 1.12, forward = 0}
	SWEP.NXSAlign = {right = -0.525, up = 1.225, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0.25, up = 1.35, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.ElcanAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AimBreathingEnabled = true
	SWEP.CrosshairEnabled = false
	SWEP.AimViewModelFOV = 60
	
	SWEP.HipFireFOVIncrease = false

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
		
	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "body", rel = "", pos = Vector(0, 3.339, 0.296), angle = Angle(0, 0, -90), size = Vector(0.878, 0.878, 0.878)},
	    ["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "body", rel = "", pos = Vector(3.105, -2.87, 0.115), angle = Angle(0, 0, -90), size = Vector(1.144, 1.144, 1.144)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "body", rel = "", pos = Vector(-2.902, 3.549, 0.31), angle = Angle(-90, 0, -90), size = Vector(0.912, 0.912, 0.912)},
	    ["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "body", rel = "", pos = Vector(12.467, 1.187, -0.101), angle = Angle(-90, 0, -90), size = Vector(1.059, 1.059, 1.059)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "body", rel = "", pos = Vector(-3.879, 3.888, 0.23), angle = Angle(-90, -90, 180), size = Vector(0.986, 0.986, 0.986)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "body", rel = "", pos = Vector(13.015, -2.8, 0), angle = Angle(90, 0, 90), size = Vector(0.666, 0.666, 0.666)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "body", rel = "", pos = Vector(-2.835, 3.539, 0.3), angle = Angle(0, 0, -90), size = Vector(0.912, 0.912, 0.912)},
	    ["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(4.827, -1.81, -0), angle = Angle(90, 0, -90), size = Vector(0.435, 0.435, 0.435)},
	--	["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "AK12_Body", rel = "", pos = Vector(0.419, -17.743, -9.931), angle = Angle(0, -90, 0), size = Vector(1.286, 1.286, 1.286)}

	--  ["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Base", rel = "", pos = Vector(0.908, 10.479, 0), angle = Angle(0, 90, 90), size = Vector(0.5, 0.5, 0.5)}
		["md_cmore"] = { type = "Model", model = "models/attachments/cmore.mdl", bone = "body", rel = "", pos = Vector(2.88, -1.621, -0), angle = Angle(-90, 0, -90), size = Vector(0.816, 0.816, 0.816)},
		["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "body", rel = "", pos = Vector(6.741, -1.92, 0.032), angle = Angle(-90, 0, -90), size = Vector(0.768, 0.768, 0.768)},
		["md_trijicon"] = { type = "Model", model =  "models/att_trijicon.mdl", bone = "body", rel = "", pos = Vector(5.278, 1.059, -0.049), angle = Angle(-90, 0, -90), size = Vector(2.296, 2.296, 2.296)},

	    ["md_snip1_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "body", rel = "", pos = Vector(-2.079, 3.065, 0.284), angle = Angle(-90, 0, -90), size = Vector(0.828, 0.828, 0.828)},
	--	["md_uecw_csgo_acog"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_acog.mdl", bone = "AK12_Body", rel = "", pos = Vector(0.125, -9.664, 0.057), angle = Angle(0, -90, 0), size = Vector(0.855, 0.855, 0.855)},
	--	["md_uecw_csgo_556"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_sig.mdl", bone = "AK12_Body", rel = "", pos = Vector(0.125, -2.757, 3.65), angle = Angle(0, -90, 0), size = Vector(0.773, 0.773, 0.773)}
		
		["md_uecw_csgo_scope_ssg"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_scope_bender.mdl", bone = "body", rel = "", pos = Vector(2.331, -1.42, -0.065), angle = Angle(-0, 0, -90), size = Vector(0.926, 0.926, 0.926)}

	--  ["md_ballistic"] = { type = "Model", model = "models/bunneh/scope01.mdl", bone = "AK12_Body", rel = "", pos = Vector(-0.171, -8.207, -0.26), angle = Angle(0, 0, 0), size = Vector(0.718, 0.718, 0.718)}
	}
	
	SWEP.AttachmentPosDependency = {["md_saker"] = {["bg_m24_short_barrel"] = Vector(4.5, -2.8, 0)}}
	
	SWEP.LaserPosAdjust = Vector(-0.6, 0, 0.2)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.CustomizationMenuScale = 0.0105
	
end

SWEP.MuzzleVelocity = 890 -- in meter/s

SWEP.SightBGs = {main = 1, none = 1}
SWEP.BarrelBGs = {main = 2, longris = 0, long = 0, short = 1, magpul = 0, ris = 0, regular = 0}

SWEP.ADSFireAnim = true

-- SWEP.Attachments = {[1] = {header = "Sight", offset = {800, 0}, atts = {"md_rmr", "md_microt1", "md_reflex", "md_cmore", "md_trijicon", "md_aimpoint", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},

if CustomizableWeaponry_OP_Perks and CustomizableWeaponry_G4P_UECW then

    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {500, -500}, atts = {"md_rmr", "md_microt1", "md_reflex", "md_cmore", "md_trijicon", "md_aimpoint", "md_schmidt_shortdot", "md_snip1_elcan", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-700, -170}, atts = {"md_saker"}},
       [3] = {header = "short barrel", offset = {-300, -680}, atts = {"bg_m24_short_barrel"}}, 
       [4] = {header = "bipod", offset = {-200, 350}, atts = {"md_bipod"}},
	   [5] = {header = "Perks", offset = {1800, 200}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Cod_Double_Tap", "Perk_Stopping_Power"}},
       ["+reload"] = {header = "Ammo", offset = {800, 800}, atts = {"am_magnum", "am_matchgrade"}}
    }

    elseif CustomizableWeaponry_G4P_UECW then
	
    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {500, -500}, atts = {"md_rmr", "md_microt1", "md_reflex", "md_cmore", "md_trijicon", "md_aimpoint", "md_schmidt_shortdot", "md_snip1_elcan", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-700, -170}, atts = {"md_saker"}},
       [3] = {header = "short barrel", offset = {-300, -680}, atts = {"bg_m24_short_barrel"}}, 
       [4] = {header = "bipod", offset = {-200, 350}, atts = {"md_bipod"}},
       ["+reload"] = {header = "Ammo", offset = {800, 800}, atts = {"am_magnum", "am_matchgrade"}}
    }
	
    elseif CustomizableWeaponry_OP_Perks then
	
    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {800, -500}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
       [2] = {header = "Barrel", offset = {-700, -170}, atts = {"md_saker"}},
       [3] = {header = "short barrel", offset = {-300, -680}, atts = {"bg_m24_short_barrel"}}, 
       [4] = {header = "bipod", offset = {-200, 350}, atts = {"md_bipod"}},
	   [5] = {header = "Perks", offset = {1800, 200}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Cod_Double_Tap", "Perk_Stopping_Power"}},
       ["+reload"] = {header = "Ammo", offset = {800, 800}, atts = {"am_magnum", "am_matchgrade"}}
    }
	
	elseif not CustomizableWeaponry_OP_Perks or CustomizableWeaponry_G4P_UECW then
	
    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {800, -500}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
       [2] = {header = "Barrel", offset = {-700, -170}, atts = {"md_saker"}},
       [3] = {header = "short barrel", offset = {-300, -680}, atts = {"bg_m24_short_barrel"}}, 
       [4] = {header = "bipod", offset = {-200, 350}, atts = {"md_bipod"}},
       ["+reload"] = {header = "Ammo", offset = {800, 800}, atts = {"am_magnum", "am_matchgrade"}}
    }
	
end

SWEP.Animations = {fire = {"shoot"},
	reload = "reload",
	idle = "idle1",
	draw = "draw"}
	
SWEP.Sounds = {shoot = {{time = 0.4, sound = "CW_M24_BOLT"}},

	draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {
	[1] = {time = 0.1, sound = "CW_CS5_CLOTH1"},
	[2] = {time = 0.1, sound = "CW_M24_BOLTUP"},
	[3] = {time = 0.4, sound = "CW_M24_BOLTBACK"},
	[4] = {time = 1.45, sound = "CW_M24_MAGGRAB"},
	[5] = {time = 1.7, sound = "CW_M24_MAGOUT"},
	[6] = {time = 1.8, sound = "CW_CLOTH4"},
	[7] = {time = 1.85, sound = "CW_M24_MAGDROP"},
	[8] = {time = 2.7, sound = "CW_CLOTH3"},
	[9] = {time = 2.86, sound = "CW_M24_MAGIN"},
	[10] = {time = 3.53, sound = "CW_M24_BOLTRELEASE"},
	[11] = {time = 3.5, sound = "CW_CLOTH1"}}}
	
SWEP.SpeedDec = 35

SWEP.Slot = 4
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
SWEP.ViewModel		= "models/weapons/v_snip_M24.mdl" 
SWEP.WorldModel		= "models/weapons/w_snip_M24.mdl"
SWEP.BipodFireAnim = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 1.3
SWEP.FireSound = "CW_M24_SHOOT"
SWEP.FireSoundSuppressed = "CW_M24_FIRE_SUPPRESSED"
SWEP.Recoil = 1.45

SWEP.HipSpread = 0.030
SWEP.AimSpread = 0.0012
SWEP.VelocitySensitivity = 1.0
SWEP.MaxSpreadInc = 0.08
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.6
SWEP.Shots = 1
SWEP.Damage = 95
SWEP.DeployTime = 0.55

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 4.25
SWEP.ReloadTime_Empty = 4.25
SWEP.ReloadHalt = 4.25
SWEP.ReloadHalt_Empty = 4.25