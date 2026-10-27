AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo(".338 Lapua Magnum", ".338 Lapua Magnum Rounds", 8.58, 69.20)

SWEP.EffectiveRange_Orig = 100 * 275
SWEP.DamageFallOff_Orig = .20

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Warface Remington MSR"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.70
	
	SWEP.IconLetter = "r"
	killicon.AddFont("cw_l115", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
--	SWEP.ShellOffsetMul = 1
	SWEP.ShellDelay = 0.9
	SWEP.ShellPosOffset = {x = 2, y = 0, z = 0} -- 1

	SWEP.FireMoveMod = 0.5
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_snip_warface_msr.mdl"
	SWEP.WMPos = Vector(-0.95, -0.5, 2.0)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.32, 0, 0.09)
	SWEP.IronsightAng = Vector(0.20, 0.029, 0)
	
	SWEP.EoTechPos = Vector(-2.3, -1.35, -0.2)
	SWEP.EoTechAng = Vector(0.25, 0.05, 0)

	SWEP.AimpointPos = Vector(-2.35, 0, 0.298)
	SWEP.AimpointAng = Vector(-0.285, -0.033, 0)
	
	SWEP.ACOGPos = Vector(-2.332, 0, 0)
	SWEP.ACOGAng = Vector(-0.28, 0.209, 0)
	
	SWEP.NXSPos = Vector(-2.36, 0, 0.2)
	SWEP.NXSAng = Vector(0.07, 0.019, 0)
	
	SWEP.MicroT1Pos = Vector(-2.333, 0, 0.4)
	SWEP.MicroT1Ang = Vector(-0.55, 0.04, 0)
	
	SWEP.RMRPos = Vector(-2.316, 0, 0.5)
	SWEP.RMRAng = Vector(0.3, -0.05, 0)
	
	SWEP.ShortDotPos = Vector(-2.347, 0, 0.252)
	SWEP.ShortDotAng = Vector(-0.362, 0, 0)
	
	--[[--------------------Unofficial ATTACHMENTS-------------------------]]--

	SWEP.CmorePos = Vector(-2.31, -1, 0.235)
	SWEP.CmoreAng = Vector(-0.235, 0.06, 0)
	
	SWEP.ReflexPos = Vector(-2.33, -1, 0.395)
	SWEP.ReflexAng = Vector(-0.55, 0.05, 0)
	
	SWEP.TrijiconPos = Vector(-2.355, 0, -0)
	SWEP.TrijiconAng = Vector(0.9, -0.042, 0)
	
	SWEP.ELCANPos = Vector(-2.392, 0, 0.014)
	SWEP.ELCANAng = Vector(-0.542, -0.35, 0)
	
	SWEP.CSGOACOGPos = Vector(-2.29, 0, 0.079)
	SWEP.CSGOACOGAng = Vector(0, 0.419, 0)
	
	SWEP.CSGO556Pos = Vector(-2.327, 0, 0.14)
	SWEP.CSGO556Ang = Vector(1, 0.2, 0)

	SWEP.CSGOSSGPos = Vector(-2.32, 0, 0.079)
	SWEP.CSGOSSGAng = Vector(0, 0.419, 0)
	
	SWEP.LeupoldPos = Vector(-2.349, 0, 0.134)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	
--	SWEP.BallisticPos = Vector(-2.733, 0, -0.633)
--	SWEP.BallisticAng = Vector(0.284, 0.769, 0)

  --[[----------------------------------------------]]--

	SWEP.SprintPos = Vector(6, -1.9, -1)
	SWEP.SprintAng = Vector(-7, 40, 0)
	
	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(4.647, 0, -0.547)
	SWEP.CustomizeAng = Vector(6.801, 26.028, 0)
	
	SWEP.PronePos = Vector(9.97, -1.496, -1.505)
	SWEP.ProneAng = Vector(-5, 50, 0)
	
	SWEP.ReticleInactivityPostFire = 1.9
	
	SWEP.BackupSights = {
	["md_acog"] = {[1] = Vector(-2.34, 0, -1.02), [2] = Vector(0.4, -0, 0)},
	["md_wf_msr_elcan"] = {[1] = Vector(-2.345, -1, -0.782), [2] = Vector(0, -0.125, 0)},
	["md_uecw_csgo_556"] = {[1] = Vector(-2.342, -1, -0.66), [2] = Vector(1.1, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0.3, up = -0.2, forward = 0}
	SWEP.NXSAlign = {right = -0.07, up = -0.015, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0.38, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.ElcanAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AimBreathingEnabled = true
	SWEP.CrosshairEnabled = false
--	SWEP.AimViewModelFOV = 60
	
	SWEP.HipFireFOVIncrease = false

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}

	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Main", rel = "", pos = Vector(-0.341, 0, -2.42), angle = Angle(0, -90, 0), size = Vector(0.74, 0.74, 0.74)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Main", rel = "", pos = Vector(-0.08, 4.36, 1.929), angle = Angle(0, -180, 0), size = Vector(0.365, 0.365, 0.365)},
	    ["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "Main", rel = "", pos = Vector(-0.19, 4, 2.835), angle = Angle(0, -90, 0), size = Vector(0.976, 0.976, 0.976)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Main", rel = "", pos = Vector(-0.401, -1.229, -2.862), angle = Angle(0, 0, 0), size = Vector(0.819, 0.819, 0.819)},
	    ["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "Main", rel = "", pos = Vector(0, 13.487, -0.7), angle = Angle(0, 0, 0), size = Vector(0.56, 0.56, 0.56)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Main", rel = "", pos = Vector(-0.301, -1.229, -2.862), angle = Angle(0, 0, 0), size = Vector(0.819, 0.819, 0.819)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Main", rel = "", pos = Vector(0.23, -8.601, -9.995), angle = Angle(-180, 90, 180), size = Vector(1.1, 1.1, 1.1)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Main", rel = "", pos = Vector(-0.085, 7.627, -1.387), angle = Angle(0, 0, 0), size = Vector(0.689, 0.689, 0.689)},
		["md_snip2_light_suppressor"] = {model = "models/attachments/special_light_suppressor.mdl", bone = "Main", rel = "", pos = Vector(-0.085, 7.627, -1.387), angle = Angle(0, 0, 0), size = Vector(0.689, 0.689, 0.689)},
		["md_snip2_osprey_suppressor"] = {model = "models/attachments/special_osprey_suppressor.mdl", bone = "Main", rel = "", pos = Vector(-0.085, 7.627, -1.387), angle = Angle(0, 0, 0), size = Vector(0.689, 0.689, 0.689)},
		["md_heavy_muzzle_brake"] = {model = "models/attachments/heavy_muzzle_brake.mdl", bone = "Main", rel = "", pos = Vector(-0.085, 7.627, -1.387), angle = Angle(0, 0, 0), size = Vector(0.689, 0.689, 0.689)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Main", rel = "", pos = Vector(0.894, 16.273, 0.889), angle = Angle(0.18, 90, 90), size = Vector(0.537, 0.537, 0.537)},
    	["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "Main", rel = "", pos = Vector(-0.366, -0.396, -2.587), angle = Angle(0, -90, 0), size = Vector(0.773, 0.773, 0.773)},
		
		["md_trijicon"] = { type = "Model", model = "models/att_trijicon.mdl", bone = "Main", rel = "", pos = Vector(-0.101, 5, -0.561), angle = Angle(0, 0, 0), size = Vector(2.023, 2.023, 2.023)},
		["md_cmore"] = { type = "Model", model =  "models/attachments/cmore.mdl", bone = "Main", rel = "", pos = Vector(-0.08, 4.5, 1.74), angle = Angle(0, 0, 0), size = Vector(0.648, 0.648, 0.648)},
		["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "Main", rel = "", pos = Vector(-0.101, 5.606, 2), angle = Angle(0, 0, 0), size = Vector(0.648, 0.648, 0.648)},

	    ["md_snip2_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "Main", rel = "", pos = Vector(-0.366, -0.396, -2.577), angle = Angle(0, 0, 0), size = Vector(0.773, 0.773, 0.773)},
		["md_uecw_csgo_acog"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_acog.mdl", bone = "Main", rel = "", pos = Vector(-0.044, -1.42, -1.68), angle = Angle(0, -90, 0), size = Vector(0.773, 0.773, 0.773)},
		["md_uecw_csgo_556"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_sig.mdl", bone = "Main", rel = "", pos = Vector(-0.06, 5.199, 1.6), angle = Angle(0, -90, 0), size = Vector(0.722, 0.722, 0.722)},
		["md_uecw_csgo_scope_ssg"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_scope_bender.mdl", bone = "Main", rel = "", pos = Vector(-0.05, 3.229, 1.6), angle = Angle(0, -90, 0), size = Vector(0.722, 0.722, 0.722)}
	--  ["md_ballistic"] = { type = "Model", model = "models/bunneh/scope01.mdl", bone = "AK12_Body", rel = "", pos = Vector(-0.171, -8.207, -0.26), angle = Angle(0, 0, 0), size = Vector(0.718, 0.718, 0.718)}
	}
	
	SWEP.AttachmentPosDependency = {
	["md_saker"] = {["bg_wf_msr_long_barrel"] = Vector(-0.1, 10, -1.4)},
    ["md_snip2_light_suppressor"] = {["bg_wf_msr_long_barrel"] = Vector(-0.1, 10, -1.4)},
    ["md_snip2_osprey_suppressor"] = {["bg_wf_msr_long_barrel"] = Vector(-0.1, 10, -1.4)},
    ["md_heavy_muzzle_brake"] = {["bg_wf_msr_long_barrel"] = Vector(-0.1, 10, -1.4)}}
	
	SWEP.LaserPosAdjust = Vector(-0.6, 0, 0.2)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.CustomizationMenuScale = 0.013
end

SWEP.MuzzleVelocity = 1400 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.BarrelBGs = {main = 3, long = 2, short = 0, regular = 0}
SWEP.StockBGs  = {main = 4, regular = 0, retractable = 0, none = 0, up = 1}
SWEP.SB_BipodBGs = {main = 5, SB_ON = 1, SB_DEPLOYED = 2, SB_OFF = 0}

SWEP.ADSFireAnim = true
SWEP.PreventQuickScoping = true
SWEP.QuickScopeSpreadIncrease = 0.25

if CustomizableWeaponry_OP_Perks and CustomizableWeaponry_G4P_UECW then

    SWEP.Attachments = {
	   [1] = {header = "Sight", offset = {100, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-800, 60}, atts = {"md_saker"}},
	   [3] = {header = "Rail", offset = {-50, 60}, atts = {"md_anpeq15"}},
	   [4] = {header = "Long barrel", offset = {-800, -600}, atts = {"bg_wf_msr_long_barrel"}}, 
	   [5] = {header = "bipod", offset = {-800, 590}, atts = {"md_bipod"}},
	   [6] = {header = "Stock", offset = {2000, 990}, atts = {"bg_wf_msr_rest_cheeks_up"}},
       [7] = {header = "Bolt", offset = {2200, 0}, atts = {"md_wf_msr_improved_bolt"}},
	   ["+use"] = {header = "Perks", offset = {2200, 400}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Perk_Stopping_Power"}},
	   ["+reload"] = {header = "Ammo", offset = {900, 990}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
    elseif CustomizableWeaponry_G4P_UECW then
	
	SWEP.Attachments = {
	   [1] = {header = "Sight", offset = {100, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-800, 60}, atts = {"md_saker"}},
	   [3] = {header = "Rail", offset = {-50, 60}, atts = {"md_anpeq15"}},
	   [4] = {header = "Long barrel", offset = {-800, -600}, atts = {"bg_wf_msr_long_barrel"}}, 
	   [5] = {header = "bipod", offset = {-800, 590}, atts = {"md_bipod"}},
	   [6] = {header = "Stock", offset = {2000, 990}, atts = {"bg_wf_msr_rest_cheeks_up"}},
       [7] = {header = "Bolt", offset = {2000, 450}, atts = {"md_improved_bolt"}},
	   ["+reload"] = {header = "Ammo", offset = {900, 990}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
	elseif CustomizableWeaponry_OP_Perks then
	
	SWEP.Attachments = {
	   [1] = {header = "Sight", offset = {100, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-800, 60}, atts = {"md_saker"}},
	   [3] = {header = "Rail", offset = {-50, 60}, atts = {"md_anpeq15"}},
	   [4] = {header = "Long barrel", offset = {-800, -600}, atts = {"bg_wf_msr_long_barrel"}}, 
	   [5] = {header = "bipod", offset = {-800, 590}, atts = {"md_bipod"}},
	   [6] = {header = "Stock", offset = {2000, 990}, atts = {"bg_wf_msr_rest_cheeks_up"}},
       [7] = {header = "Bolt", offset = {2200, 0}, atts = {"md_wf_msr_improved_bolt"}},
	   ["+use"] = {header = "Perks", offset = {2200, 400}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Perk_Stopping_Power"}},
	   ["+reload"] = {header = "Ammo", offset = {900, 990}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
	elseif not CustomizableWeaponry_OP_Perks or CustomizableWeaponry_G4P_UECW then
	
	SWEP.Attachments = {
	   [1] = {header = "Sight", offset = {100, -600}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-800, 60}, atts = {"md_saker"}},
	   [3] = {header = "Rail", offset = {-50, 60}, atts = {"md_anpeq15"}},
	   [4] = {header = "Long barrel", offset = {-800, -600}, atts = {"bg_wf_msr_long_barrel"}}, 
	   [5] = {header = "bipod", offset = {-800, 590}, atts = {"md_bipod"}},
	   [6] = {header = "Stock", offset = {2000, 990}, atts = {"bg_wf_msr_rest_cheeks_up"}},
       [7] = {header = "Bolt", offset = {2000, 450}, atts = {"md_improved_bolt"}},
	   ["+reload"] = {header = "Ammo", offset = {900, 990}, atts = {"am_magnum", "am_matchgrade"}}
	}
end

if Customizable_Weaponry_Yan_Sniper_Pack_2 then 
	table.insert(SWEP.Attachments[1].atts, 9, "md_snip2_elcan")
	table.insert(SWEP.Attachments[2].atts, 2, "md_snip2_light_suppressor")
	table.insert(SWEP.Attachments[2].atts, 3, "md_snip2_osprey_suppressor")
	table.insert(SWEP.Attachments[2].atts, 4, "md_heavy_muzzle_brake")
    table.insert(SWEP.Attachments[5].atts, 2, "bg_snip2_special_bipod")
end

SWEP.Animations = {fire = {"awm_fire"},
	reload = "awm_reload",
	reload_empty = "awm_reload_empty",
	idle = "awm_idle",
	draw = "awm_first_draw"}
	
SWEP.Sounds = {
    awm_fire = {{time = 0.6, sound = "CW_WF_MSR_BOLTBACK"},
    {time = 1.05, sound = "CW_WF_MSR_BOLTFORWARD"}},

	awm_first_draw = {{time = 0, sound = "CW_WF_MSR_FOLEY"},
    {time = 0.55, sound = "CW_WF_MSR_BOLTFORWARD"}},
	
	awm_draw = {{time = 0.28, sound = "CW_WF_MSR_DRAW"}},
	
	reload_tac = {
	[1] = {time = 0.1, sound = "CW_CLOTH3"},
	[2] = {time = 1.25, sound = "CW_WF_MSR_MAGOUT"},
	[3] = {time = 2.05, sound = "CW_WF_MSR_MAGIN"},
	[4] = {time = 2.5, sound = "CW_CLOTH1"},
	[5] = {time = 2.9, sound = "CW_WF_MSR_MAGTAP"},
	[6] = {time = 2.65, sound = "CW_CLOTH4"},
	[7] = {time = 2.7, sound = "CW_CLOTH2"}},
	
	awm_reload = {
	[1] = {time = 0.25, sound = "CW_CLOTH3"},
	[2] = {time = 0.65, sound = "CW_WF_MSR_MAGOUT"},
	[3] = {time = 1.8, sound = "CW_WF_MSR_MAGIN"},
	[7] = {time = 2.1, sound = "CW_CLOTH2"}},

	awm_reload_empty = {
	[1] = {time = 0.1, sound = "CW_CLOTH3"},
	[2] = {time = 1.13, sound = "CW_WF_MSR_MAGOUT"},
	[3] = {time = 1.85, sound = "CW_WF_MSR_MAGIN"},
	[4] = {time = 2.5, sound = "CW_CLOTH1"},
	[5] = {time = 2.61, sound = "CW_WF_MSR_MAGTAP"},
	[6] = {time = 3.35, sound = "CW_WF_MSR_BOLTBACK"},
	[7] = {time = 3.5, sound = "CW_CLOTH2"},
	[8] = {time = 3.68, sound = "CW_WF_MSR_BOLTFORWARD"},
	[9] = {time = 3.72, sound = "CW_CLOTH4"}}}
	
SWEP.SpeedDec = 35

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
SWEP.ViewModel		= "models/weapons/v_snip_warface_msr.mdl"
SWEP.WorldModel		= "models/weapons/w_snip_warface_msr.mdl"
SWEP.BipodFireAnim = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 84
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".338 Lapua Magnum"

SWEP.FireDelay = 1.8
SWEP.FireSound = "CW_WF_MSR_FIRE"
SWEP.FireSoundSuppressed = "CW_WF_MSR_SILFIRE"
SWEP.Recoil = 1.75

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.000015
SWEP.VelocitySensitivity = 2.0
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.1
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 1
SWEP.Damage = 165
SWEP.DeployTime = 1.75

SWEP.ReloadSpeed = 0.99
SWEP.ReloadTime = 2.75
SWEP.ReloadTime_Empty = 4.75
SWEP.ReloadHalt = 2.75
SWEP.ReloadHalt_Empty = 4.75

function SWEP:IndividualThink()
	
	self.EffectiveRange = 100 * 275
	self.DamageFallOff = .20

	if self.ActiveAttachments.bg_wf_msr_long_barrel then
	    self.EffectiveRange = (self.EffectiveRange * 1.015)
	else
	    self.EffectiveRange = 100 * 275
	end	

	if self.dt.BipodDeployed and self.ActiveAttachments.bg_snip2_special_bipod then 
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_DEPLOYED)
	else
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_ON)
    end	
	
	if not self.ActiveAttachments.bg_snip2_special_bipod then
        self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_OFF)
	end
	
    self.Animations.draw = "awm_draw"
	if self.Animations.draw == "awm_draw" then
	    self.DeployTime = 0.65
	end
end