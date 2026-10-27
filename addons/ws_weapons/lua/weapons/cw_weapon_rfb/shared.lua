AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

SWEP.EffectiveRange_Orig = 100 * 182
SWEP.DamageFallOff_Orig = .26

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "RFB"
	SWEP.CSMuzzleFlashes = true
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 0.8
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	
	SWEP.InvertShellEjectAngle = false
	SWEP.ShellScale = 0.8
	SWEP.ShellPosOffset = {x = 0.25, y = 0, z = -0.2}
	SWEP.ShellOffsetMul = 1
	SWEP.ShellDelay = 0.061
	
    SWEP.BoltBone = "bolt"
    SWEP.BoltShootOffset = Vector(0, 5, 0)
	SWEP.BoltBonePositionRecoverySpeed = 60 -- 50
	
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.80
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.85

	SWEP.DrawTraditionalWorldModel = false
    SWEP.WM = "models/weapons/w_snip_rfb.mdl"
	SWEP.WMPos = Vector(-1, 0, 1)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-2, 0, 0.579)
	SWEP.IronsightAng = Vector(0.293, 0.039, 0)
	
	SWEP.RMRPos = Vector(-1.996, 0, -0.08)
	SWEP.RMRAng = Vector(1.35, 0.08, 0)

	SWEP.MicroT1Pos = Vector(-2, 0, -0)
	SWEP.MicroT1Ang = Vector(-0.2, 0.014, 0)

	SWEP.EoTechPos = Vector(-2.007, 0, -0.398)
	SWEP.EoTechAng = Vector(-0.574, 0.05, 0)
	
	SWEP.AimpointPos = Vector(-2.027, 0, -0.05)
	SWEP.AimpointAng = Vector(-0.3, -0.01, 0)
	
	SWEP.ShortDotPos = Vector(-1.991, 0, -0.08)
	SWEP.ShortDotAng = Vector(-0.5, 0.129, 0)

	SWEP.ACOGPos = Vector(-2.018, 0, -0.681)
	SWEP.ACOGAng = Vector(1.052, 0.2, 0)
	
	SWEP.NXSPos = Vector(-2.05, 0, -0.102)
	SWEP.NXSAng = Vector(-0.201, -0.1, 0)
	
--[[--------------------Unofficial ATTACHMENTS-------------------------]]--

	SWEP.CmorePos = Vector(-2, 0, -0.234)
	SWEP.CmoreAng = Vector(-0.205, 0.1, 0)
	
	SWEP.ReflexPos = Vector(-2, 0, -0.234)
	SWEP.ReflexAng = Vector(0.95, 0.18, 0)

	SWEP.TrijiconPos = Vector(-1.981, 0, -0.32)
	SWEP.TrijiconAng = Vector(0.45, 0.165, 0)

	SWEP.ELCANPos = Vector(-1.966, 0, -0.64)
	SWEP.ELCANAng = Vector(1.98, 0.5, 0)

	SWEP.CSGOACOGPos = Vector(-2.026, 0, -0.343)
	SWEP.CSGOACOGAng = Vector(0.772, -0, 0)

	SWEP.CSGO556Pos = Vector(-2.04, 0, -0.12)
	SWEP.CSGO556Ang = Vector(-0.101, -0.101, 0)

	SWEP.CSGOSSGPos = Vector(-2.04, 0.921, -0.269)
	SWEP.CSGOSSGAng = Vector(-0.75, -0.101, 0)

	SWEP.LeupoldPos = Vector(-2, 0.921, -0.238)
	SWEP.LeupoldAng = Vector(1.226, 0.15, 0)
	
--	SWEP.BallisticPos = Vector(-2.76, -4.6, 0.36)
--	SWEP.BallisticAng = Vector(0, 0, 0)

--[[----------------------------------------------]]--

    SWEP.CustomizePos = Vector(5.087, -1, -1.236)
    SWEP.CustomizeAng = Vector(9.5, 37.74, 0)
	
	SWEP.SprintPos = Vector(4.718, -0.45, -1.341)
	SWEP.SprintAng = Vector(-4.6, 38.558, 0)

--	SWEP.SprintPos = Vector(7.127, 0, -0.615)
--	SWEP.SprintAng = Vector(-8.836, 52.873, -1.875)

	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
		
	SWEP.BackupSights = {
	["md_acog"] = {[1] = Vector(-2.025, 0, -1.657), [2] = Vector(0, 0.05, 0)},
	
	["md_snip_rfb_elcan"] = {[1] = Vector(-2.024, 0, -1.2), [2] = Vector(0.2, -0.101, 0)},
	["md_uecw_csgo_556"] = {[1] = Vector(-2.016, 0, -1.153), [2] = Vector(1.128, 0.009, 0)}}

	SWEP.ACOGAxisAlign = {right = -1.025, up = -0.2, forward = 0}
	SWEP.NXSAlign = {right = 0.2, up = 0.105, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0.5, up = -0.15, forward = 0}
	
	SWEP.ElcanAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AimBreathingEnabled = true
--	SWEP.ReticleInactivityPostFire = 0.1
--	SWEP.AimViewModelFOV = 60
	
	SWEP.HipFireFOVIncrease = true
	SWEP.FireMoveMod = 1.8 -- 1.8

	SWEP.LuaViewmodelRecoil = false
	
    SWEP.CustomizationMenuScale = 0.0075

	SWEP.BaseArm = "ValveBiped.Bip01_L_Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
	    ["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "weapon", rel = "", pos = Vector(-0.11, 2.644, 3.446), angle = Angle(0, -90, 0), size = Vector(0.999, 0.999, 0.999)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "weapon", rel = "", pos = Vector(-0.38, -3.889, -3.274), angle = Angle(0, 0, 0), size = Vector(0.996, 0.996, 0.996)},
	   	["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "weapon", rel = "", pos = Vector(-0.311, -3.998, -2.631), angle = Angle(0, -90, 0), size = Vector(0.882, 0.882, 0.882)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "weapon", rel = "", pos = Vector(0.319, -11.95, -10.15), angle = Angle(0, -90, 0), size = Vector(1.167, 1.167, 1.167)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "weapon", rel = "", pos = Vector(-0.23, -3.622, -2.72), angle = Angle(0, 0, 0), size = Vector(0.898, 0.898, 0.898)},
	   	["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "weapon", rel = "", pos = Vector(0, 2.028, 2.539), angle = Angle(0, 0, 0), size = Vector(0.382, 0.382, 0.382)},
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "weapon", rel = "", pos = Vector(-0.325, -1.119, -2.631), angle = Angle(0, -90, 0), size = Vector(0.882, 0.882, 0.882)},
	    ["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "weapon", rel = "", pos = Vector(-0.02, 6.025, 2.25), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)},
	    ["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "weapon", rel = "", pos = Vector(0, 8.638, 0.527), angle = Angle(0, 0, 0), size = Vector(0.7, 0.7, 0.7)}, -- (0.686, 0.686, 0.686)
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "weapon", rel = "", pos = Vector(0, 2.95, -0.589), angle = Angle(0, 0, 0), size = Vector(0.529, 0.529, 0.529)},
		["md_snip2_light_suppressor"] = {model = "models/attachments/special_light_suppressor.mdl", bone = "weapon", rel = "", pos = Vector(0, 3.65, -0.551), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_snip2_osprey_suppressor"] = {model = "models/attachments/special_osprey_suppressor.mdl", bone = "weapon", rel = "", pos = Vector(0, 3.65, -0.551), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_heavy_muzzle_brake"] = {model = "models/attachments/heavy_muzzle_brake.mdl", bone = "weapon", rel = "", pos = Vector(0, 3.65, -0.551), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},	
		
		["md_cmore"] = { type = "Model", model = "models/attachments/cmore.mdl", bone = "weapon", rel = "", pos = Vector(0, 1.679, 2.38), angle = Angle(0, 0, 0), size = Vector(0.764, 0.764, 0.764)},
		["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "weapon", rel = "", pos = Vector(-0.015, 3.839, 2.599), angle = Angle(0, 0, 0), size = Vector(0.764, 0.764, 0.764)},
		["md_trijicon"] = { type = "Model", model = "models/att_trijicon.mdl", bone = "weapon", rel = "", pos = Vector(0.009, 3.839, -0.288), angle = Angle(0, 0, 0), size = Vector(2.301, 2.301, 2.301)},

	    ["md_snip_rfb_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "weapon", rel = "", pos = Vector(-0.2925, -3.812, -2.201), angle = Angle(0, 0, 0), size = Vector(0.816, 0.816, 0.816)},
		["md_uecw_csgo_acog"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_acog.mdl", bone = "weapon", rel = "", pos = Vector(0.045, -5.66, -1.42), angle = Angle(0, -90, 0), size = Vector(0.842, 0.842, 0.842)},
		["md_uecw_csgo_556"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_sig.mdl", bone = "weapon", rel = "", pos = Vector(0.045, 0.879, 2.19), angle = Angle(0, -90, 0), size = Vector(0.842, 0.842, 0.842)},
		
		["md_uecw_csgo_scope_ssg"] = { type = "Model", model = "models/gmod4phun/csgo/eq_optic_scope_bender.mdl", bone = "weapon", rel = "", pos = Vector(0.045, 2.595, 2.19), angle = Angle(0, -90, 0), size = Vector(0.842, 0.842, 0.842)}

	}	
	
	SWEP.ForegripOverridePos = {
	["bipod"] = {
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, -10), angle = Angle(0, 0, 0) }},
	
	["null"] = {
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }}}
	
	SWEP.AttachmentPosDependency = {
	["md_saker"] = {["bg_rfb_long_barrel"] = Vector(0, 6.2, -0.6), ["bg_rfb_short_barrel"] = Vector(0, -1, -0.6)},
	["md_snip2_light_suppressor"] = {["bg_rfb_long_barrel"] = Vector(0, 6.2, -0.55), ["bg_rfb_short_barrel"] = Vector(0, -1, -0.6)},
	["md_snip2_osprey_suppressor"] = {["bg_rfb_long_barrel"] = Vector(0, 6.2, -0.55), ["bg_rfb_short_barrel"] = Vector(0, -1, -0.6)},
	["md_heavy_muzzle_brake"] = {["bg_rfb_long_barrel"] = Vector(0, 6.2, -0.55), ["bg_rfb_short_barrel"] = Vector(0, -1, -0.6)},
	["md_anpeq15"] = {["bg_rfb_special_rail"] = Vector(-0.08, 10, 2.03)},
    ["md_bipod"] = {["bg_rfb_special_rail"] = Vector(0, 10, -0.45)}}
	
	SWEP.LaserPosAdjust = Vector(-0.8, 0, 0.2)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.MuzzleVelocity = 900 -- in meter/s

SWEP.SightBGs = {main = 3, none = 1}
SWEP.BarrelBGs = {main = 4, long = 1, short = 2, regular = 0}
SWEP.RailsBGs = {main = 5, kt_rfb_rail = 1, regular = 0}

if CustomizableWeaponry_OP_Perks and CustomizableWeaponry_G4P_UECW then

    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {300, -700}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_snip_rfb_elcan", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-850, -150}, atts = {"md_saker"}},
       [3] = {header = "short barrel", offset = {-500, -680}, atts = {"bg_rfb_long_barrel", "bg_rfb_short_barrel"}}, 
       [4] = {header = "Rail", offset = {-850, 450}, atts = {"bg_rfb_special_rail"}, exclusions = {bg_rfb_short_barrel = true}},
       [5] = {header = "Rail", offset = {550, 700}, atts = {"md_anpeq15"}, dependencies = {bg_rfb_special_rail = true}},
       [6] = {header = "bipod", offset = {-150, 700}, atts = {"md_bipod"}, dependencies = {bg_rfb_special_rail = true}},
       ["+use"] = {header = "Perks", offset = {2000, 400}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Cod_Double_Tap", "Perk_Stopping_Power"}},
       ["+reload"] = {header = "Ammo", offset = {2000, 800}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
    elseif CustomizableWeaponry_G4P_UECW then
	
    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {300, -700}, atts = {"md_rmr", "md_microt1", "md_cmore", "md_reflex", "md_trijicon", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_snip_rfb_elcan", "md_uecw_csgo_acog", "md_uecw_csgo_556", "md_acog", "md_nightforce_nxs", "md_uecw_csgo_scope_ssg"}},
       [2] = {header = "Barrel", offset = {-850, -150}, atts = {"md_saker"}},
       [3] = {header = "short barrel", offset = {-500, -680}, atts = {"bg_rfb_long_barrel", "bg_rfb_short_barrel"}}, 
       [4] = {header = "Rail", offset = {-850, 450}, atts = {"bg_rfb_special_rail"}, exclusions = {bg_rfb_short_barrel = true}},
       [5] = {header = "Rail", offset = {550, 700}, atts = {"md_anpeq15"}, dependencies = {bg_rfb_special_rail = true}},
       [6] = {header = "bipod", offset = {-150, 700}, atts = {"md_bipod"}, dependencies = {bg_rfb_special_rail = true}},
       ["+reload"] = {header = "Ammo", offset = {2000, 800}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
    elseif CustomizableWeaponry_OP_Perks then
	
    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {300, -700}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
       [2] = {header = "Barrel", offset = {-850, -150}, atts = {"md_saker"}},
       [3] = {header = "short barrel", offset = {-500, -680}, atts = {"bg_rfb_long_barrel", "bg_rfb_short_barrel"}}, 
       [4] = {header = "Rail", offset = {-850, 450}, atts = {"bg_rfb_special_rail"}, exclusions = {bg_rfb_short_barrel = true}},
       [5] = {header = "Rail", offset = {550, 700}, atts = {"md_anpeq15"}, dependencies = {bg_rfb_special_rail = true}},
       [6] = {header = "bipod", offset = {-150, 700}, atts = {"md_bipod"}, dependencies = {bg_rfb_special_rail = true}},
       ["+use"] = {header = "Perks", offset = {2000, 400}, atts = {"Cod_Extreme_Conditioning", "Cod_Fast_Hands", "Cod_Steady_Aim", "Perk_Force", "Cod_Double_Tap", "Perk_Stopping_Power"}},
       ["+reload"] = {header = "Ammo", offset = {2000, 800}, atts = {"am_magnum", "am_matchgrade"}}
	}
	
	elseif not CustomizableWeaponry_G4P_UECW or CustomizableWeaponry_OP_Perks then
	
    SWEP.Attachments = {
       [1] = {header = "Sight", offset = {300, -700}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech", "md_schmidt_shortdot", "md_acog", "md_nightforce_nxs"}},
       [2] = {header = "Barrel", offset = {-850, -150}, atts = {"md_saker"}},
       [3] = {header = "short barrel", offset = {-500, -680}, atts = {"bg_rfb_long_barrel", "bg_rfb_short_barrel"}}, 
       [4] = {header = "Rail", offset = {-850, 450}, atts = {"bg_rfb_special_rail"}, exclusions = {bg_rfb_short_barrel = true}},
       [5] = {header = "Rail", offset = {550, 700}, atts = {"md_anpeq15"}, dependencies = {bg_rfb_special_rail = true}},
       [6] = {header = "bipod", offset = {-150, 700}, atts = {"md_bipod"}, dependencies = {bg_rfb_special_rail = true}},
       ["+reload"] = {header = "Ammo", offset = {2000, 800}, atts = {"am_magnum", "am_matchgrade"}}
	}
end
--[[
if Customizable_Weaponry_Yan_Sniper_Pack_2 then
	table.insert(SWEP.Attachments[2].atts, 2, "md_snip2_light_suppressor")
	table.insert(SWEP.Attachments[2].atts, 3, "md_snip2_osprey_suppressor")
	table.insert(SWEP.Attachments[2].atts, 4, "md_heavy_muzzle_brake")
end
--]]	
SWEP.Animations = {
    fire = {"shoot", "shoot2"},
	reload = "reload_tac",
	reload_empty = "reload",
	idle = "idle1",
	draw = "draw"}
	
SWEP.Sounds = {draw = {
    {time = 0, sound = "CW_FOLEY_MEDIUM"}}, -- CW_RFB_DRAW

   	reload_tac = {
	[1] = {time = 0.5, sound = "CW_RFB_CLOTH3"},
	[2] = {time = 1.1, sound = "CW_RFB_MAGOUT"},
	[3] = {time = 2.15, sound = "CW_RFB_MAGIN"},
	[4] = {time = 2.22, sound = "CW_RFB_MAGIN_RELEASE"},
	[5] = {time = 2.8, sound = "CW_RFB_TAP"},
	[6] = {time = 2.9, sound = "CW_RFB_CLOTH3"}},
	
	reload = {
	[1] = {time = 0.5, sound = "CW_RFB_CLOTH3"},
	[2] = {time = 1.1, sound = "CW_RFB_MAGOUT"},
	[3] = {time = 2.15, sound = "CW_RFB_MAGIN"},
	[4] = {time = 2.22, sound = "CW_RFB_MAGIN_RELEASE"},
	[5] = {time = 2.8, sound = "CW_RFB_TAP"},
	[6] = {time = 3.6, sound = "CW_RFB_BOLT_BACK"},
	[7] = {time = 3.86, sound = "CW_RFB_BOLT_RELEASE"},
	[8] = {time = 3.92, sound = "CW_RFB_CLOTH4"}}}

SWEP.SpeedDec = 33

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX" -- fuck you fucking copy pastes
SWEP.Contact		= "https://steamcommunity.com/profiles/76561198296543672/"
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_snip_rfb.mdl" 
SWEP.WorldModel		= "models/weapons/w_snip_rfb.mdl"
SWEP.ADSFireAnim    = false
SWEP.BipodFireAnim = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51mm"

SWEP.FireDelay = 0.125
SWEP.FireSound = "CW_RFB_FIRE"
SWEP.FireSoundSuppressed = "CW_RFB_SIL_FIRE"
SWEP.Recoil = 1.25

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.0012
SWEP.VelocitySensitivity = 1.65
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.3
SWEP.Shots = 1
SWEP.Damage = 65
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 3.8
SWEP.ReloadTime_Empty = 4.6
SWEP.ReloadHalt = 3.8
SWEP.ReloadHalt_Empty = 4.6
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()

	self.EffectiveRange = 100 * 182
	self.DamageFallOff = .26
	
	if self.dt.BipodDeployed then
		self.AimBreathingEnabled = true
		self.ForegripOverride = true
		self.ForegripParent = "bipod"
		
	elseif not self.dt.BipodDeployed  then
		self.AimBreathingEnabled = false
		self.ForegripOverride = true
		self.ForegripParent = "null"
	end
end