if CustomizableWeaponry then
AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

SWEP.magType = "arMag"
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "RPK-74"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
		
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_m249_official", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = false
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 1, y = 0, z = -1}
	
	SWEP.ForeGripOffsetCycle_Draw = 0.65
	SWEP.ForeGripOffsetCycle_Reload = 0.83
	SWEP.ForeGripOffsetCycle_Reload_Empty = .89
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/my_black_ops_weapons/rpk/w_aron_rpk74_drummag.mdl"
	SWEP.WMPos = Vector(-14, -1, 1.5)
	SWEP.WMAng = Vector(-14, 90, 180)


	SWEP.IronsightPos = Vector(-2.268, -1.206, 0.703)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.AronREDDOTPos = Vector(-2.276, -0.5, 0.259)
	SWEP.AronREDDOTAng = Vector(0, 0, 0)

	SWEP.AronACOGPos = Vector(-2.276, 3.491, 0.337)
	SWEP.AronACOGAng = Vector(0, 0, 0)
	
	SWEP.AronREFLEXPos = Vector(-2.27, -0.5, 0.037)
	SWEP.AronREFLEXAng = Vector(0, 0, 0)

	SWEP.AronRUIRPos = Vector(-2.257, -3.264, 0.303)
	SWEP.AronRUIRAng = Vector(0, 0, 0)


	SWEP.SprintPos = Vector(0, 0.904, -0.86)
	SWEP.SprintAng = Vector(-19.542, 31.87, -31.23)
	
	SWEP.CustomizePos = Vector(2.801, -0.251, -1.158)
	SWEP.CustomizeAng = Vector(7.526, 25.371, 0)
	
	SWEP.AlternativePos = Vector(0, 0, 0)		--	0.804, 0, 0 old
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.028
	

	SWEP.BoltBone = "j_bolt"
	SWEP.BoltShootOffset = Vector(-1, 0, 0)
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	SWEP.ViewbobEnabled = true
	SWEP.ViewbobIntensity = 1
	SWEP.ReloadViewBobEnabled = true
	SWEP.ZoomAmount = 0
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
	["md_pbs1"] = { type = "Model", model = "models/cw2/attachments/pbs1.mdl", bone = "j_gun", rel = "", pos = Vector(38, 0, -0.6), angle = Angle(0, -90, 0), size = Vector(1.4, 1.4, 1.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_reddot"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/Cobra_V_AK47.mdl", bone = "j_gun", rel = "", pos = Vector(0.2, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_reflex"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/Aimpoint_V_AK47.mdl", bone = "j_gun", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_acog"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/PKA_V_AK47.mdl", bone = "j_gun", rel = "", pos = Vector(0, 0, -0.3), angle = Angle(0, 0, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_ru_ir"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/v_nsp3a_scope.mdl", bone = "j_gun", rel = "", pos = Vector(1, 0, -0.6), angle = Angle(0, 0, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
}

	SWEP.WElements = {
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


SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0, roll = 1, forward = 4, pitch = 1}
 

end



SWEP.Animations = {fire = {"fire"},
	reload = "reload_full",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}

SWEP.LuaViewmodelRecoil = false
SWEP.FullAimViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {200, -500}, atts = {"bo_acog"}},
	["+reload"] = {header = "Ammo", offset = {800, 300}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Sounds = {	draw = {{time = 0.0, sound = ""}},

	reload_full = {[1] = {time = 0.5, sound = "my_weapons/bo_rpk/rpk_magout.wav"},
	[2] = {time = 3.57, sound = "my_weapons/bo_generic1.wav"},
	[3] = {time = 4.2, sound = "my_weapons/bo_rpk/rpk_magin.wav"},
	[4] = {time = 5.1, sound = "my_weapons/bo_generic4.wav"}},

	draw = {[2] = {time = 1.7, sound = "my_weapons/bo_rpk/rpk_zamek.wav"},
	[3] = {time = 2, sound = "my_weapons/bo_rpk/rpk_zamek2.wav"},
	[4] = {time = 2.2, sound = "my_weapons/bo_generic4.wav"},
	[1] = {time = 0, sound = "my_weapons/bo_generic1.wav"}},
	
	reload_empty = {[1] = {time = 0.5, sound = "my_weapons/bo_rpk/rpk_magout.wav"},
	[2] = {time = 3.6, sound = "my_weapons/bo_generic1.wav"},
	[3] = {time = 4.2, sound = "my_weapons/bo_rpk/rpk_magin.wav"},
	[4] = {time = 6, sound = "my_weapons/bo_rpk/rpk_zamek.wav"},
	[5] = {time = 6.3, sound = "my_weapons/bo_rpk/rpk_zamek2.wav"},
	[6] = {time = 6.9, sound = "my_weapons/bo_generic4.wav"}}}
		

SWEP.SpeedDec = 55

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= "GO HOME G.I.!"
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/my_black_ops_weapons/rpk/v_blackops_rpkdrum.mdl"
SWEP.WorldModel		= "models/my_black_ops_weapons/rpk/w_aron_rpk74_drummag.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 75
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.45x39MM"

SWEP.FireDelay = 0.088
SWEP.FireSound = "BO_ARON_RPK_FIRE"
SWEP.FireSoundSuppressed = "BO_ARON_M16_FIRE_SILENCER"
SWEP.Recoil = 1.35

SWEP.HipSpread = 0.15
SWEP.AimSpread = 0.0113
SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.15
SWEP.SpreadPerShot = 0.0008
SWEP.SpreadCooldown = 0.07
SWEP.Shots = 1
SWEP.Damage = 42
SWEP.DeployTime = 3.3

SWEP.ReloadSpeed = 1.4
SWEP.ReloadTime = 6.4
SWEP.ReloadTime_Empty = 7.8
SWEP.ReloadHalt = 6.4
SWEP.ReloadHalt_Empty = 7.8
SWEP.SnapToIdlePostReload = true
end
