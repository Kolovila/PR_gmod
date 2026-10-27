AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")
//SCK name: evo
//SCK grip: evogrip
//SCK mags: evomags
//Cover: evocover
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "CZ Scorpion Evo 3"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "x" 
	killicon.Add("cw_scorpin_evo3", "vgui/kills/cw_scorpin_evo3", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_scorpin_evo3")
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false
	SWEP.MuzzlePosMod = {x = 0, y = 0, z = 0}
	SWEP.MuzzleAttachmentName = "muzzle"
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -5, y = -1, z = -2}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87
	
	SWEP.IronsightPos = Vector(-1.675, 0, 1.049)
	SWEP.IronsightAng = Vector(0, 0, 0)
		
	SWEP.MicroT1Pos = Vector(-1.721, 0, 0.56)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-1.7, 0, 0.1)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-1.66, 0, 0.56)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
		
	SWEP.AimpointPos = Vector(-1.68, 0, 0.409)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.EFTRMRPos = Vector(-1.68, 0, 0.15)  --EFT
	SWEP.EFTRMRAng = Vector(0, 0, 0)
	
	SWEP.EFTUH1Pos = Vector(-1.68, 0, 0.1)  --EFT
	SWEP.EFTUH1Ang = Vector(0, 0, 0)
	
	SWEP.EFTMICROT1Pos = Vector(-1.68, 0, 0.88)  --EFT
	SWEP.EFTMICROT1Ang = Vector(0, 0, 0)
	
	SWEP.EFTCOMPM4Pos = Vector(-1.68, 0, 0.55)  --EFT
	SWEP.EFTCOMPM4Ang = Vector(0, 0, 0)
	
	SWEP.EFTACOGTA01Pos = Vector(-1.68, -2, 0.3)  --EFT
	SWEP.EFTACOGTA01Ang = Vector(0, 0, 0)
	
	SWEP.EFTFF3backupPos = Vector(-2.82, -1.5, 0.9)  --EFT-侧瞄
	SWEP.EFTFF3backupAng = Vector(0, 0, -45)
	
	SWEP.EFTElcanPos = Vector(-1.68, -1.6, 0.21)  --EFT
	SWEP.EFTElcanAng = Vector(0, 0, 0)
	
	
	SWEP.AlternativePos = Vector(1, 0.6, 0.2)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {
	["md_acog"] = {[1] = Vector(-1.655, 0, -0.801), [2] = Vector(0, 0, 0)}, 
	["md_ws_acog"] = {[1] = Vector(-1.691, 0, -0.301), [2] = Vector(-0.5, 0, 0)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 2.5, hor = 3, roll = 2, forward = 1, pitch = 1}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CoD4ACOGAxisAlign = {right = 0, up = 180.01, forward = -2.5}
	
	SWEP.BoltBone = "ump_charger"
	SWEP.BoltShootOffset = Vector(0, 2, 0)
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	SWEP.MuzzleVelocity = 420
	
	SWEP.AttachmentModelsVM = {

		["md_eft_si_uh1"] = {model = "models/weapons/cw_eft/upgrades/scopes/UH1/v_uh1.mdl", bone = "ump_main", pos = Vector(0, -2, 1.74), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},	
		["md_eft_si_rmr"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/rmr/v_rmr.mdl", bone = "ump_main", pos = Vector(0, -2, 1.74), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},	
		["md_eft_si_t1"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/t1/v_t1.mdl", bone = "ump_main", pos = Vector(0, -2, 1.74), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},	
		["md_eft_si_m4"] = {model = "models/weapons/cw_eft/upgrades/scopes/comp_m4/v_m4.mdl", bone = "ump_main", pos = Vector(0, -2, 1.74), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},	
		["md_eft_si_acog_ta01nsn"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/ta01nsn/v_ta01nsn.mdl", bone = "ump_main", pos = Vector(0, -1.71, 1.65), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},	
		["md_eft_si_elcan_tan"] = {model = "models/weapons/cw_eft/upgrades/scopes/assault/elcan/fde/v_elcan.mdl", bone = "ump_main", pos = Vector(0, -1.4, 1.75), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},	

		["md_eft_fg_afg_fg"] = { type = "Model", model = "models/weapons/cw_eft/upgrades/foregrips/afg/v_afg_fde.mdl", bone = "ump_main", rel = "", pos = Vector(0, 6.2, -1.1), angle = Angle(0, -90, 0), size = Vector(0.4, 0.4, 0.4)},

		["md_eft_mt_mpr45"] = {model = "models/weapons/cw_eft/upgrades/mounts/mpr45/mount_all_ncstar_mpr45.mdl", bone = "ump_main", pos = Vector(0, -4, 1.76), angle = Angle(0, -90, 0), size = Vector(0.7, 0.7, 0.7)},
		["md_eft_si_ff3_backup"] = {model = "models/weapons/cw_eft/upgrades/scopes/compact/ff3/v_ff3.mdl", bone = "ump_main", pos = Vector(-0.7, -4, 1.9), angle = Angle(0, -90, 45), size = Vector(0.85, 0.85, 0.85)},

		["md_eft_fl_x400"] = { type = "Model", model = "models/weapons/cw_eft/upgrades/tactical/x400/x400.mdl", bone = "ump_main", rel = "", pos = Vector(-0.7, 6, 0), angle = Angle(0, -90, -90), size = Vector(0.8, 0.8, 0.8)},
		["md_eft_ld_ls321"] = { type = "Model", model = "models/weapons/cw_eft/upgrades/tactical/ls321/v_ls321.mdl", bone = "ump_main", rel = "", pos = Vector(-0.7, 6, 0), angle = Angle(0, -90, -90), size = Vector(0.8, 0.8, 0.8)},


		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "ump_main", pos = Vector(0, -4.1, -2.3), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_schmidt_shortdot"] = { type = "Model", model = "models/cw2/attachments/schmidt.mdl", bone = "ump_main", rel = "", pos = Vector(-0.301, -7.676, -3.401), angle = Angle(0, -90, 0), size = Vector(0.899, 0.899, 0.899), adjustment = {min = -8.6, max = 0, axis = "y", inverse = false, inverseOffsetCalc = true}},
		["md_cod4_reflex"] = { type = "Model", model = "models/v_cod4_reflex.mdl", bone = "ump_main", rel = "", pos = Vector(0.009, -4.676, -1.241), angle = Angle(0, 90, 0), size = Vector(0.899, 0.899, 0.899)}, //, adjustment = {min = -7.5, max = 0, axis = "y", inverse = false, inverseOffsetCalc = true}
		["md_ws_c_more"] = { type = "Model", model = "models/attachments/White_Snow/ws_c_more.mdl", bone = "ump_main", rel = "", pos = Vector(-0.071, -1.4, 1.899), angle = Angle(0, 0, 0), size = Vector(0.3, 0.3, 0.3), adjustment = {min = -2.5, max = 4.5, axis = "y", inverse = false, inverseOffsetCalc = true}},
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "ump_main", rel = "", pos = Vector(0, 2.3, 1.8), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_foregrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "ump_main", rel = "", pos = Vector(-0.52, -9.8, -3), angle = Angle(0, 0, 0), size = Vector(1, 1, 0.58)},
     	}
	
	SWEP.ForegripOverride = true
	SWEP.ForegripOverridePos = {
	["FuckGrip"] = {
	["ump_main"] = { scale = Vector(1, 1, 1), pos = Vector(-0.5, 0, 0), angle = Angle(0, 0 ,0) },

	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 0, 13.6) }, --拇指
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -17, 0) },
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -71, 0) },
	
	["L Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -60, 0) }, --食指
	["L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -50, 0) },
	["L Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -5, 0) },

	
	["L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -48.5, 0) }, --中指
	["L Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -46, 0) },
	["L Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -15.833, 0) },

	["L Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -38.5 ,0) },  --无名指
	["L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -27 ,0) },
	["L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -32 ,0) },
	
	["L Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -2.5, 0) }, --小拇指
    ["L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -16.8, 0) },
	["L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -34, 0) },
	
	["L Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -6, -33) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -0.5, 0) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 1), angle = Angle(0, 1.5, -80) },
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(-0.926, 0.14, 0.555), angle = Angle(0, 0, 0) },
	["L ForeTwist"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.556, 2.407), angle = Angle(10, 0, -68) },


	},
	
	["md_ws_afg"] = {	
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 1, 0)},
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 47, -70) },
	["L Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -45, 0) }, --食指
	["L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -35, 0) },
	["L Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -25, 0) },

	
	["L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -38.5, 0) }, --中指
	["L Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -36, 0) },
	["L Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -15.833, 0) },

	["L Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -38.5 ,0) },  --无名指
	["L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -17 ,0) },
	["L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -32 ,0) },
	
	["L Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -2.5, 0) }, --小拇指
    ["L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -16.8, 0) },
	["L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -34, 0) },
	
	["L ForeTwist"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.556, 1.5), angle = Angle(9, 3, -48) },
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0.8, -1.9, 0), angle = Angle(0, 0, 1) },
	
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -65, 0) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -25, 0) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, -16, 0) }},



	["fatAss"] = {	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0.795), angle = Angle(0, 64.748, -107.286) },
	["L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -29.133, 0) },
	["L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -39.538, 0) },
	["L ForeTwist"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.556, 2), angle = Angle(10, 0, -98.889) },
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, -1.4, 1), angle = Angle(0, 0, 0) },
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(2.589, -59.569, 0) },
	["L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -49.943, 0) },
	["L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -27.053, 0) },
	["L Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -58.266, 0) },
	["L Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -72.833, 0) },
	["L Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -14.566, 0) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15.539, -38.849, 20.718) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10.36, -25.669, 30.167) }},
	
	["cmagGripHold"] = {["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(1.7, -2, 0), angle = Angle(8.833, 0, 0) }}
}

	SWEP.LaserPosAdjust = Vector(0.4, 5, 0)
	SWEP.LaserAngAdjust = Angle(0, 0.13, 0) 
	SWEP.SightWithRail = false
	SWEP.CustomizationMenuScale = 0.008
		SWEP.MuzzleVelocity = 410
end

	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {-450, -500},  atts = { "md_eft_si_rmr", "md_eft_si_t1", "md_eft_si_m4", "md_eft_si_uh1", "md_eft_si_acog_ta01nsn", "md_eft_si_elcan_tan"}},
		[2] = {header = "Muzzle", offset = {-450, -100}, atts = {"md_saker"}},
		[3] = {header = "Handguard", offset = {-450, 300}, atts = {"md_eft_fg_afg_fg", "md_foregrip"}},
		[4] = {header = "Lasers", offset = {-450, 750}, atts = {"md_eft_fl_x400", "md_eft_ld_ls321"}},
		[5] = {header = "Handguard", offset = {1450, -500}, atts = {"md_eft_si_ff3_backup"}},
		["impulse 100"] = {header = "Skin", offset = {400, 750}, atts = {"skin_ws_evo3scifi"}},
		["+reload"] = {header = "Ammo", offset = {1000, 300}, atts = {"am_magnum","am_matchgrade"}}
	}
	
	SWEP.AttachmentDependencies = {
	["md_eft_si_ff3_backup"] = {"md_eft_si_acog_ta01nsn", "md_eft_si_elcan_tan"},
	["md_eft_ld_ls321"] = {"md_eft_fg_afg_fg", "md_foregrip"},
	["md_eft_fl_x400"] = {"md_eft_fg_afg_fg", "md_foregrip"}


}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.05, hor = 0.15, roll = 0.8, forward = 0.5, pitch = -0.1}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = false  

SWEP.BarrelBGs		= {main = 4, regular = 0, none = 1, longris = 1, magpul = 1}
SWEP.SightBGs		= {main = 1, carryhandle = 1, foldsight = 1, none = 1, foldfold = 1}
SWEP.ForegripBGs	= {main = 3, regular = 0, covered = 1}
SWEP.MagBGs			= {main = 3, regular = 0, none = 2, cmag = 2, emag = 2, pmag = 2, round60 = 2, round100 = 1, round100_empty = 1}
SWEP.StockBGs		= {main = 2, regular = 0, lightweight = 1, moestock = 1, none = 1}
SWEP.SilencerBGs	= {main = 6, off = 0, on = 1, long_off = 2, long_on = 3}

SWEP.Animations = {
	fire = {"iron_fire", "iron_fire_a", "iron_fire_b", "iron_fire_c", "iron_fire_d", "iron_fire_e"}, //base_fire
	--fire = {"base_fire"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	idle = "base_idle", 
	draw = "base_draw"}
	
SWEP.Sounds = {

	base_reloadempty = {
	[1] = {time = 0.5, sound = "CW_EVO3_CLIPOUT"},
	[2] = {time = 2, sound = "CW_EVO3_CLIPIN"},
	[3] = {time = 3.2, sound = "CW_EVO3_BOLTPULL"},
	[4] = {time = 3.4, sound = "CW_EVO3_BOLTRELEASE"}
	},
	
	base_reload = {
	[1] = {time = 0.5, sound = "CW_EVO3_CLIPOUT"},
	[2] = {time = 2, sound = "CW_EVO3_CLIPIN"}
	}
	
	}

SWEP.SpeedDec = 15

SWEP.DryFire = true
SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.AimViewModelFOV = 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/scorpion/v_ev03.mdl"
SWEP.WorldModel		= "models/weapons/scorpion/w_ev03.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/scorpion/w_ev03.mdl"
SWEP.WMPos = Vector(-0.9, 3.5, 0.6)
SWEP.WMAng = Vector(-3,1,180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 230
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"
SWEP.magType = "smgMag"

SWEP.FireDelay = 0.05456
SWEP.FireSound = "CW_EVO3_FIRE"
SWEP.FireSoundSuppressed = "CW_EVO3_FIRE_SUPPRESSED"
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.03
SWEP.AimSpread = 0.006
SWEP.VelocitySensitivity = 1.1
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.08
SWEP.Shots = 1
SWEP.Damage = 21
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 1.7
SWEP.ReloadTime = 2.5 
SWEP.ReloadTime_Empty = 4.5
SWEP.ReloadHalt = 3 
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = true

//Thanks to Knife Kitty
	function SWEP:getMuzzlePosition()
		return self.CW_VM:GetAttachment(self.CW_VM:LookupAttachment(self.MuzzleAttachmentName))
	end
	
	function SWEP:RenderTargetFunc()
	local fagal = self.AttachmentModelsVM.md_ws_c_more.ent
	fagal:SetSkin(1)

	local fuck = false
	
	if CustomizableWeaponry_WS_Pack then
		fuck = false
	else
		fuck = true
	end
	
	if (self.ActiveAttachments.bg_ws_cmag and self.ActiveAttachments.md_ws_afg) or (self.ActiveAttachments.bg_hk416_cmagforevo and self.ActiveAttachments.md_ws_afg) then
		self.ForegripParent = "md_ws_afg"
	elseif (self.ActiveAttachments.bg_ws_cmag and self.ActiveAttachments.md_foregrip) or (self.ActiveAttachments.bg_hk416_cmagforevo and self.ActiveAttachments.md_foregrip) or 
	(self.ActiveAttachments.bg_ws_cmag and self.ActiveAttachments.md_ws_grippodFOREVO) or 
	(self.ActiveAttachments.bg_hk416_cmagforevo and self.ActiveAttachments.md_ws_grippodFOREVO) then
		self.ForegripParent = "cmagGripHold"
	elseif self.ActiveAttachments.md_ws_grippodFOREVO then
	self.ForegripParent = nil
	elseif self.ActiveAttachments.bg_ws_cmag or self.ActiveAttachments.bg_hk416_cmagforevo then
		self.ForegripParent = "fatAss"
	elseif self.ActiveAttachments.md_eft_fg_afg_fg then
		self.ForegripParent = "md_ws_afg"
	else
			self.ForegripParent = "FuckGrip"
			//self.CW_VM:SetBodygroup( 3, 0 )
	end
	
	if self.ActiveAttachments.bg_ws_cmag or self.ActiveAttachments.bg_ws_pmag or self.ActiveAttachments.bg_ws_emag then
		self.CW_VM:ManipulateBoneScale(self.CW_VM:LookupBone("ump_magazine"), Vector(0.009, 0.009, 0.009))
	else
		self.CW_VM:ManipulateBoneScale(self.CW_VM:LookupBone("ump_magazine"), Vector(1, 1, 1))	
	end
	
	if (self.ActiveAttachments.bg_ws_cmag and self.ActiveAttachments.md_foregrip) or (self.ActiveAttachments.bg_hk416_cmagforevo and self.ActiveAttachments.md_foregrip) then
	self.ForeGripHoldPos = {
	["L UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(1.7, -2, 0), angle = Angle(8.833, 0, 0) }
	}
	elseif self.ActiveAttachments.md_ws_afg then
		self.ForegripParent = "md_ws_afg"
	elseif self.ActiveAttachments.md_foregrip then
		self.ForeGripHoldPos = {}
		self.ForegripParent = nil
	elseif fuck then
		self.ForegripParent = "FuckGrip"
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