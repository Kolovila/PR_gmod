if CustomizableWeaponry then
AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

SWEP.magType = "arMag"
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "HK21"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
		
	SWEP.IconLetter = "w"
	killicon.Add( "cw_aron_bo_hk21", "aron_icons/hk21", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("aron_icons/hk21")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = false
	SWEP.ShellScale = 0.6
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -0}
	
	SWEP.ForeGripOffsetCycle_Draw = 0.65
	SWEP.ForeGripOffsetCycle_Reload = 0.83
	SWEP.ForeGripOffsetCycle_Reload_Empty = .89
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/my_black_ops_weapons/hk21/w_aron_bo1_hk21.mdl"
	SWEP.WMPos = Vector( -11, -1.2, 3)
	SWEP.WMAng = Vector(-14, 90, 180)


	SWEP.IronsightPos = Vector(-2.03, -1.402, 0.672)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.AronREDDOTPos = Vector(-2.02, 0, -0.069)
	SWEP.AronREDDOTAng = Vector(0, 0, 0)

	SWEP.AronACOGPos = Vector(-2.034, 7, -0.226)
	SWEP.AronACOGAng = Vector(0, 0, 0)
	
	SWEP.AronREFLEXPos = Vector(-2.047, 0, -0.084)
	SWEP.AronREFLEXAng = Vector(0, 0, 0)

	SWEP.AronNATOIRPos = Vector(-2.029, -2.902, -0.026)
	SWEP.AronNATOIRAng = Vector(0, 0, 0)


	SWEP.SprintPos = Vector(5.704, -2.826, -6.395) -- 0, 0.904, -0.86
	SWEP.SprintAng = Vector(8.784, 60.374, -14.768)	-- -19.542, 31.87, -31.23
	
	SWEP.CustomizePos = Vector(2.801, -0.251, -1.158)
	SWEP.CustomizeAng = Vector(7.526, 25.371, 0)
	
	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewbobEnabled = true
	SWEP.ViewbobIntensity = 1
	SWEP.ZoomAmount = 0	
	SWEP.ReloadViewBobEnabled = true
	SWEP.BoltBonePositionRecoverySpeed = 80
	
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.AronRUIRAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CP1AxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CYACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.APX2AxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CYELCANAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.p4x24AxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.MagnifierScopeAxisAlign = {right = -0.35, up = 0, forward = 0}
		SWEP.primarySightCategory = 1
	
	-- adjustment = {min =  2, max = 7, axis = "x", inverseOffsetCalc = true},
	
	SWEP.AttachmentModelsVM = {
	["bo_reddot"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/Elbit_V_aug.mdl", bone = "j_gun", rel = "", pos = Vector(-2, 0.004, 0.884), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_reflex"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/Aimpoint_No_rail_V.mdl", bone = "j_gun", rel = "", pos = Vector(-1.295, 0.029, 0.15), angle = Angle(0, 0, 0), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_acog"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/ACOG_V_colt.mdl", bone = "j_gun", rel = "", pos = Vector(-2.646, 0, 1.539), angle = Angle(0, 0, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_nato_ir"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/anpvs_v_enfield.mdl", bone = "j_gun", rel = "", pos = Vector(2.674, 0.001, 0.254), angle = Angle(0, 0, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
}

	SWEP.WElements = {
		/*low mount*/["md_cyberaimpoint"] = { type = "Model", model = "models/my_black_ops_weapons/sights/c_fas2_aimpoint.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.131, 1.082, -5.283), pos_dropped = Vector(11.131, 1.260, -4.703), angle = Angle(-3, 1, 180), angle_dropped = Angle(0, 0, 180), size = Vector(1.7, 1.7, 1.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
}
	
SWEP.ForegripOverridePos = {
		["md_cybergrip"] = {
	["j_index_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-2.215, 14.585, 13.203) },
	["j_shoulder_le"] = { scale = Vector(1, 1, 1), pos = Vector(1.186, -0.754, 0.325), angle = Angle(0, -12.327, 5.977) },
	["j_pinky_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-2.169, -13.115, 0.728) },
	["j_mid_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-1.533, 18.582, 12.505) },
	["j_elbow_le"] = { scale = Vector(1, 1, 1), pos = Vector(1, 0, 0), angle = Angle(-3.24, 1.014, 18.52) },
	["j_ring_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-1.265, 8.246, 12.906) },
	["j_wrist_le"] = { scale = Vector(1, 1, 1), pos = Vector(-0, 0, 0), angle = Angle(-32.452, 5.337, 12.956) },
	["j_thumb_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-28.271, -43.764, 80.166) },
	["j_pinky_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 92.297, 0) },
	["j_thumb_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-15.188, -8.473, 17.794) },
	["j_ring_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 97.193, 0) },
	["j_index_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -9.101) },
	["j_pinky_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 62.932, 0) },
	["j_index_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 37.296, 0) },
	["j_thumb_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -46.35, -20.725) },
	["j_mid_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 51.551, -2.244) }
}}

SWEP.LaserPosAdjust = Vector(0, 0, 0)
SWEP.LaserAngAdjust = Angle(0, 0, 0) 

SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0, roll = 1, forward = 4, pitch = 1}
 

end



SWEP.Animations = {fire = {"fire"},
	reload = "reload_full",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = false
SWEP.FullAimViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {200, -400}, atts = {"bo_acog"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Sounds = {	draw = {{time = 0.0, sound = ""}},

	reload_full = {[2] = {time = 0.78, sound = "my_weapons/bo_hk21/hk21_magout.wav"},
	[1] = {time = 0.15, sound = "my_weapons/bo_generic1.wav"},
	[3] = {time = 3.57, sound = "my_weapons/bo_generic5.wav"},
	[5] = {time = 4.7, sound = "my_weapons/bo_generic4.wav"},
	[4] = {time = 4.3, sound = "my_weapons/bo_hk21/hk21_magin.wav"}},

	draw = {[2] = {time = 1.6, sound = "my_weapons/bo_hk21/hk21_zamek_bolt.wav"},
	[3] = {time = 2.0, sound = "my_weapons/bo_hk21/hk21_zamek_drop.wav"},
	[4] = {time = 2.35, sound = "my_weapons/bo_generic4.wav"},
	[1] = {time = 0.7, sound = "my_weapons/bo_generic5.wav"}},
	
	reload_empty = {[2] = {time = 0.78, sound = "my_weapons/bo_hk21/hk21_magout.wav"},
	[1] = {time = 0.15, sound = "my_weapons/bo_generic1.wav"},
	[3] = {time = 3.57, sound = "my_weapons/bo_generic5.wav"},
	[4] = {time = 4.3, sound = "my_weapons/bo_hk21/hk21_magin.wav"},
	[6] = {time = 5.8, sound = "my_weapons/bo_hk21/hk21_zamek_bolt.wav"},
	[7] = {time = 6.1, sound = "my_weapons/bo_hk21/hk21_zamek_drop.wav"},
	[5] = {time = 4.7, sound = "my_weapons/bo_generic2.wav"},
	[8] = {time = 6.5, sound = "my_weapons/bo_generic4.wav"}}}
		

SWEP.SpeedDec = 55

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Doni Danger"
SWEP.Contact		= ""
SWEP.Purpose		= "Experiments are cool"
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/my_black_ops_weapons/hk21/v_blackops_hk21.mdl"
SWEP.WorldModel		= "models/my_black_ops_weapons/hk21/w_aron_bo1_hk21.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.083
SWEP.FireSound = "BO_ARON_HK21_FIRE"
SWEP.FireSoundSuppressed = "BO_ARON_HK21_FIRE_SILENCER"
SWEP.Recoil = 1.23
SWEP.CustomizationMenuScale = 0.023

SWEP.HipSpread = 0.15
SWEP.AimSpread = 0.006
SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.15
SWEP.SpreadPerShot = 0.0015
SWEP.SpreadCooldown = 0.08
SWEP.Shots = 1
SWEP.Damage = 36
SWEP.DeployTime = 3.6

SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 6
SWEP.ReloadTime_Empty = 7.6
SWEP.ReloadHalt = 6
SWEP.ReloadHalt_Empty = 7.6
SWEP.SnapToIdlePostReload = true

SWEP.BipodInstalled = true
SWEP.BipodRecoilModifier = 0.85

end

function SWEP:getBipodHipSpread()
	return self.HipSpread * 0.2
end
