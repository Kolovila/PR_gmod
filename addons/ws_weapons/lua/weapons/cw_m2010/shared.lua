AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo(".300 Winchester Magnum", ".300 Winchester Magnum", 7.62, 67)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M2010"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
		
	SWEP.IconLetter = "r"
	killicon.AddFont("cw_l115", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_OTS"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellDelay = 0.7
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -2}
	
	SWEP.FireMoveMod = 0.6
	SWEP.OverrideAimMouseSens = 0.7
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_snip_M2010.mdl"
	SWEP.WMPos = Vector(-0.8, -0.1, 1.9)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.816, 0, -0.16)
	SWEP.IronsightAng = Vector(0.529, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.823, 0, -0.343)
	SWEP.EoTechAng = Vector(-0.05, 0.05, 0)
	
	SWEP.AimpointPos = Vector(-2.84, 0, 0.119)
	SWEP.AimpointAng = Vector(-0.245, 0.025, 0)
	
	SWEP.ACOGPos = Vector(-2.825, 0, -0.202)
	SWEP.ACOGAng = Vector(-0.156, 0.836, 0)
	
	SWEP.NXSPos = Vector(-2.806, 0, -0.02)
	SWEP.NXSAng = Vector(0.352, 0.319, 0)

	SWEP.MicroT1Pos = Vector(-2.784, 0, 0.18)
	SWEP.MicroT1Ang = Vector(0, 0.2, 0)

	SWEP.RMRPos = Vector(-2.784, 0, 0.609)
	SWEP.RMRAng = Vector(-1.101, 0.15, 0)

	SWEP.ShortDotPos = Vector(-2.81, 0, 0.119)
    SWEP.ShortDotAng = Vector(-0.489, 0.1, 0)
	
--[[--------------------Unofficial ATTACHMENTS-------------------------]]--

	SWEP.CmorePos = Vector(-2.814, 0, 0.259)
	SWEP.CmoreAng = Vector(-0.443, 0.054, 0)

	SWEP.ReflexPos = Vector(-2.84, -1.734, 0.2)
	SWEP.ReflexAng = Vector(0.202, 0, 0)
	
	SWEP.TrijiconPos = Vector(-2.78, 0, -0.08)
	SWEP.TrijiconAng = Vector(0.959, 0.06, 0)

	SWEP.ELCANPos = Vector(-2.84, 0, 0.197)
	SWEP.ELCANAng = Vector(-2.04, -0.181, 0)

	SWEP.CSGOACOGPos = Vector(-2.816, -1.545, 0.037)
	SWEP.CSGOACOGAng = Vector(-0.094, -0.036, 0)

	SWEP.CSGO556Pos = Vector(-2.814, 0, 0)
	SWEP.CSGO556Ang = Vector(1.037, 0, 0)

	SWEP.CSGOSSGPos = Vector(-2.814, 0, 0)
	SWEP.CSGOSSGAng = Vector(0, 0, 0)

	SWEP.LeupoldPos = Vector(-1.945, 0.437, -0.179)
	SWEP.LeupoldAng = Vector(0, 0.1, 0)
	
--	SWEP.BallisticPos = Vector(-2.76, -4.6, 0.36)
--	SWEP.BallisticAng = Vector(0, 0, 0)

--[[----------------------------------------------]]--

	SWEP.SprintPos = Vector(4.719, -0.5, -1)
	SWEP.SprintAng = Vector(-4.6, 33.173, 0)
	
	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(4.376, 0, 0)
    SWEP.CustomizeAng = Vector(4.405, 30.28, 0)

	SWEP.ReticleInactivityPostFire = 1.5
	
	SWEP.BackupSights = {
	["md_acog"] = {[1] = Vector(-2.836, 0, -1.211), [2] = Vector(-0.025, 0, 0)},
	["md_snip1_elcan"] = {[1] = Vector(-2.816, -1.545, -0.78), [2] = Vector(-0.094, -0.036, 0)},
	["md_uecw_csgo_556"] = {[1] = Vector(-2.806, 0, -0.786), [2] = Vector(1.052, 0.019, 0)}}

	SWEP.ACOGAxisAlign = {right = 0.16, up = -0.83, forward = 0}
	SWEP.NXSAlign = {right = -0.352, up = -0.315, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0.5, up = -0.1, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
		
	SWEP.ElcanAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AimBreathingEnabled = true
	SWEP.CrosshairEnabled = false
	SWEP.AimViewModelFOV = 70
	
	SWEP.HipFireFOVIncrease = false

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
		
	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Base", rel = "", pos = Vector(-0.35, -4.835, -3.701), angle = Angle(0, -90, 0), size = Vector(0.824, 0.824, 0.824)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Base", rel = "", pos = Vector(-0.036, -0.408, 1.123), angle = Angle(0, 180, 0), size = Vector(0.368, 0.368, 0.368)},
	    ["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "Base", rel = "", pos = Vector(0.009, 9.739, -1.621), angle = Angle(0, 0, 0), size = Vector(0.709, 0.709, 0.709)},
	    ["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "Base", rel = "", pos = Vector(-0.157, -0.792, 2.053), angle = Angle(0, -90, 0), size = Vector(0.972, 0.972, 0.972)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Base", rel = "", pos = Vector(-0.401, -6.411, -4.251), angle = Angle(0, 0, 0), size = Vector(0.912, 0.912, 0.912)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Base", rel = "", pos = Vector(-0.301, -6.408, -4.22), angle = Angle(0, 0, 0), size = Vector(0.912, 0.912, 0.912)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Base", rel = "", pos = Vector(0.259, -14.098, -11.855), angle = Angle(0, -90, 0), size = Vector(1.197, 1.197, 1.197)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Base", rel = "", pos = Vector(-0.051, 5.817, -2.225), angle = Angle(0, 0, 0), size = Vector(0.717, 0.717, 0.717)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Base", rel = "", pos = Vector(0.908, 10.479, 0), angle = Angle(0, 90, 90), size = Vector(0.5, 0.5, 0.5)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "Base", rel = "", pos = Vector(-0.353, -5.889, -3.724), angle = Angle(0, -90, 0), size = Vector(0.828, 0.828, 0.828)},

		["md_cmore"] = { type = "Model", model = "models/attachments/cmore.mdl", bone = "Base", rel = "", pos = Vector(-0.051, -1.122, 0.93), angle = Angle(0, 0, 0), size = Vector(0.605, 0.605, 0.605)},
		["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "Base", rel = "", pos = Vector(-0.076, 1.235, 1.161), angle = Angle(0, 0, 0), size = Vector(0.657, 0.657, 0.657)},
		
		["md_trijicon"] = { type = "Model", model = "models/att_trijicon.mdl", bone = "Base", rel = "", pos = Vector(-0.02, 0.681, -1.4), angle = Angle(0, 0, 0), size = Vector(2.022, 2.022, 2.022)},

	    ["md_snip1_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "Base", rel = "", pos = Vector(-0.311, -5.259, -3.25), angle = Angle(0, 0, 0), size = Vector(0.742, 0.742, 0.742)},
		["md_uecw_csgo_acog"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_acog.mdl", bone = "Base", rel = "", pos = Vector(-0, -6.875, -2.381), angle = Angle(0, -90, 0), size = Vector(0.742, 0.742, 0.742)},
		["md_uecw_csgo_556"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_sig.mdl", bone = "Base", rel = "", pos = Vector(-0, -1.323, 0.8), angle = Angle(0, -90, 0), size = Vector(0.742, 0.742, 0.742)},
		
		["md_uecw_csgo_scope_ssg"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_scope_bender.mdl", bone = "Base", rel = "", pos = Vector(-0, -0.829, 0.8), angle = Angle(0, -90, 0), size = Vector(0.742, 0.742, 0.742)}

	--  ["md_ballistic"] = { type = "Model", model = "models/bunneh/scope01.mdl", bone = "AK12_Body", rel = "", pos = Vector(-0.171, -8.207, -0.26), angle = Angle(0, 0, 0), size = Vector(0.718, 0.718, 0.718)}
	}
	
    SWEP.AttachmentPosDependency = {["md_saker"] = {["bg_snip_m2010_short_barrel"] = Vector(0, 1, -2.2)}}
	
	SWEP.LaserPosAdjust = Vector(-0.6, 0, 0.2)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.CustomizationMenuScale = 0.0105

end

SWEP.MuzzleVelocity = 1000 -- in meter/s

SWEP.SightBGs = {main = 3, none = 1} -- 4,1 short barrel -- 5,1 stock up
SWEP.BarrelBGs = {main = 4, longris = 0, long = 0, short = 1, magpul = 0, ris = 0, regular = 0}
SWEP.StockBGs  = {main = 5, regular = 0, retractable = 0, none = 0, up = 1}

SWEP.ADSFireAnim = true

SWEP.PreventQuickScoping = true
SWEP.QuickScopeSpreadIncrease = 0.2

SWEP.ZoomAmount = 25

-- [1] = {header = "Sight", offset = {600, -700}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},

if CustomizableWeaponry_OP_Perks and CustomizableWeaponry_G4P_UECW then

    SWEP.Attachments = {
        [1] = {header = "Sight", offset = {450, -700}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_snip1_elcan", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
        [2] = {header = "Barrel", offset = {-750, -250}, atts = {"md_saker"}},
	    [3] = {header = "short barrel", offset = {-300, -680}, atts = {"bg_snip_m2010_short_barrel"}}, 
	    [4] = {header = "Rail", offset = {100, 180}, atts = {"md_anpeq15"}},
    	[5] = {header = "Bipod", offset = {-400, 620}, atts = {"md_bipod"}},
     	[6] = {header = "Stock", offset = {2200, 1000}, atts = {"bg_snip_m2010_rest_cheeks_up"}},
		[7] = {header = "Perks", offset = {2200, 200}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Cod_Double_Tap", "Perk_Stopping_Power"}},
    	["+reload"] = {header = "Ammo", offset = {1100, 800}, atts = {"am_magnum", "am_matchgrade"}}
	}

    elseif CustomizableWeaponry_G4P_UECW then
	
    SWEP.Attachments = {
        [1] = {header = "Sight", offset = {450, -700}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_snip1_elcan", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
        [2] = {header = "Barrel", offset = {-750, -250}, atts = {"md_saker"}},
	    [3] = {header = "short barrel", offset = {-300, -680}, atts = {"bg_snip_m2010_short_barrel"}}, 
	    [4] = {header = "Rail", offset = {100, 180}, atts = {"md_anpeq15"}},
    	[5] = {header = "Bipod", offset = {-400, 620}, atts = {"md_bipod"}},
     	[6] = {header = "Stock", offset = {2200, 1000}, atts = {"bg_snip_m2010_rest_cheeks_up"}},
    	["+reload"] = {header = "Ammo", offset = {1100, 800}, atts = {"am_magnum", "am_matchgrade"}}
    }	

    elseif CustomizableWeaponry_OP_Perks then
	
    SWEP.Attachments = {
        [1] = {header = "Sight", offset = {600, -700}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
        [2] = {header = "Barrel", offset = {-750, -250}, atts = {"md_saker"}},
	    [3] = {header = "short barrel", offset = {-300, -680}, atts = {"bg_snip_m2010_short_barrel"}}, 
	    [4] = {header = "Rail", offset = {100, 180}, atts = {"md_anpeq15"}},
    	[5] = {header = "Bipod", offset = {-400, 620}, atts = {"md_bipod"}},
     	[6] = {header = "Stock", offset = {2200, 1000}, atts = {"bg_snip_m2010_rest_cheeks_up"}},
	    [7] = {header = "Perks", offset = {1900, 200}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Cod_Double_Tap", "Perk_Stopping_Power"}},
    	["+reload"] = {header = "Ammo", offset = {1100, 800}, atts = {"am_magnum", "am_matchgrade"}}
    }		
	
    elseif not CustomizableWeaponry_OP_Perks or CustomizableWeaponry_G4P_UECW then
	
    SWEP.Attachments = {
        [1] = {header = "Sight", offset = {600, -700}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
        [2] = {header = "Barrel", offset = {-750, -250}, atts = {"md_saker"}},
	    [3] = {header = "short barrel", offset = {-300, -680}, atts = {"bg_snip_m2010_short_barrel"}}, 
	    [4] = {header = "Rail", offset = {100, 180}, atts = {"md_anpeq15"}},
    	[5] = {header = "Bipod", offset = {-400, 620}, atts = {"md_bipod"}},
     	[6] = {header = "Stock", offset = {2200, 1000}, atts = {"bg_snip_m2010_rest_cheeks_up"}},
    	["+reload"] = {header = "Ammo", offset = {1100, 800}, atts = {"am_magnum", "am_matchgrade"}}
    }	
	
end

SWEP.Animations = {fire = {"fire"},
	reload = "reload_tac",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {fire = {
    {time = 0.4, sound = "CW_M2010_BOLT"},
	{time = 0.9, sound = ""}},

	draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},
	
	reload_tac = {
	[1] = {time = 0.4, sound = "CW_CLOTH1"},
	[2] = {time = 0.75, sound = "CW_M2010_MAGOUT"},
	[3] = {time = 1.2, sound = "CW_CLOTH"},
	[4] = {time = 2.05, sound = "CW_M2010_MAGIN"},
	[5] = {time = 2.1, sound = "CW_M2010_MAGINTAP"},
	[6] = {time = 2.7, sound = "CW_CLOTH3"}},

	reload = {
	[1] = {time = 0.4, sound = "CW_CLOTH1"},
	[2] = {time = 0.75, sound = "CW_M2010_MAGOUT"},
	[3] = {time = 1.2, sound = "CW_CLOTH"},
	[4] = {time = 2.05, sound = "CW_M2010_MAGIN"},
	[5] = {time = 2.1, sound = "CW_M2010_MAGINTAP"},
	[6] = {time = 2.7, sound = "CW_CLOTH3"},
	[7] = {time = 2.8, sound = "CW_M2010_BOLT"}}}
	
SWEP.SpeedDec = 40

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
SWEP.ViewModel		= "models/weapons/v_snip_M2010.mdl" 
SWEP.WorldModel		= "models/weapons/w_snip_M2010.mdl"
SWEP.BipodFireAnim = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".300 Winchester Magnum"

SWEP.FireDelay = 1.5
SWEP.FireSound = "CW_M2010_FIRE"
SWEP.FireSoundSuppressed = "CW_M2010_FIRE_SUPPRESSED"
SWEP.Recoil = 1.82

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.0005
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.015
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.75
SWEP.Shots = 1
SWEP.Damage = 112
SWEP.DeployTime = 0.75

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 3.0
SWEP.ReloadTime_Empty = 3.85
SWEP.ReloadHalt = 3.0
SWEP.ReloadHalt_Empty = 3.85