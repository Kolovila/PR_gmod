if CustomizableWeaponry then
AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

SWEP.magType = "arMag"
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M60E3"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
		
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_m249_official", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.CustomizationMenuScale = 0.025
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = false
	SWEP.ShellScale = 0.65
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -1, y = 0, z = -3}
	
	SWEP.ForeGripOffsetCycle_Draw = 0.65
	SWEP.ForeGripOffsetCycle_Reload = 0.83
	SWEP.ForeGripOffsetCycle_Reload_Empty = .89
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/my_black_ops_weapons/m60/w_aron_m603.mdl"
	SWEP.WMPos = Vector( -21, -1.2, 1.8)
	SWEP.WMAng = Vector(-14, 90, 180)


	SWEP.IronsightPos = Vector(-3.406, -6.835, 0.629)
	SWEP.IronsightAng = Vector(0.4, 0, 0)
	
	SWEP.AronREDDOTPos = Vector(-3.4, -7, 0.85)
	SWEP.AronREDDOTAng = Vector(0, 0, 0)

	SWEP.AronACOGPos = Vector(-3.412, -4, 0.748)
	SWEP.AronACOGAng = Vector(0, 0, 0)
	
	SWEP.AronREFLEXPos = Vector(-3.418, -8.257, 0.73)
	SWEP.AronREFLEXAng = Vector(0, 0, 0)

	SWEP.AronNATOIRPos = Vector(-3.405, -7.5, 0.773)
	SWEP.AronNATOIRAng = Vector(0, 0, 0)


	SWEP.SprintPos = Vector(0, 0.904, -0.86)
	SWEP.SprintAng = Vector(-19.542, 31.87, -31.23)
	
	SWEP.CustomizePos = Vector(-0.805, -3.82, -3.619)
	SWEP.CustomizeAng = Vector(20.402, 16.18, -14.775)
	
	SWEP.AlternativePos = Vector(0, 0, 0)  -- 0, -2.613, -0.403
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewbobEnabled = true
	SWEP.ViewbobIntensity = 1
	SWEP.ZoomAmount = 10
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
	["bo_nato_ir"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/anpvs_v_enfield.mdl", bone = "j_reload_cover", rel = "", pos = Vector(0.19, 0, -3.829), angle = Angle(0, 0, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_reddot"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/Elbit_V_aug.mdl", bone = "j_reload_cover", rel = "", pos = Vector(-4.631, 0, -3), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_reflex"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/Aimpoint_No_rail_V.mdl", bone = "j_reload_cover", rel = "", pos = Vector(-3.6, 0.029, -3.684), angle = Angle(0, 0, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "Weapon", pos = Vector(0.138, 6.619, 0.601), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699), bodygroup = {[1] = 1}},
	["bo_acog"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/Acog_v_colt_alt.mdl", bone = "j_reload_cover", rel = "", pos = Vector(-3.5, 0.005, 0.9), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
}

	SWEP.WElements = {
}


SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0, roll = 1, forward = 4, pitch = 1}
 

end



SWEP.Animations = {fire = {"fire"},
	reload = "reload",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = false
SWEP.FullAimViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {200, -100}, atts = {"bo_acog"}},
	["+reload"] = {header = "Ammo", offset = {800, 300}, atts = {"am_magnum", "am_matchgrade"}}}



SWEP.Sounds = {	draw = {{time = 0.0, sound = ""}},

	reload = {[1] = {time = 0.0, sound = "my_weapons/bo_generic5.wav"},
	[2] = {time = 0.4, sound = "my_weapons/bo_hk21/hk21_zamek_bolt.wav"},
	[3] = {time = 0.6, sound = "my_weapons/bo_hk21/hk21_zamek_drop.wav"},
	[4] = {time = 1.2, sound = "my_weapons/bo_generic4.wav"},
	[5] = {time = 2.1, sound = "my_weapons/bo_m60/m60_open.wav"},
	[6] = {time = 2.8, sound = "my_weapons/bo_m60/m60_magout.wav"},
	[7] = {time = 4.0, sound = "my_weapons/bo_m60/m60_magin.wav"},
	[8] = {time = 4.8, sound = "my_weapons/bo_m60/m60_bullets.wav"},
	[9] = {time = 5.6, sound = "my_weapons/bo_m60/m60_close.wav"},
	[10] = {time = 6.1, sound = "my_weapons/bo_m60/m60_slap.wav"},
	[11] = {time = 7.1, sound = "my_weapons/bo_generic5.wav"}},

	draw = {[1] = {time = 0.0, sound = "my_weapons/bo_generic5.wav"},
	[2] = {time = 0.8, sound = "my_weapons/bo_generic2.wav"}},
	
	reload_empty = {[1] = {time = 0.0, sound = ""},
	[2] = {time = 0.0, sound = ""}}}
		

SWEP.SpeedDec = 55

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Spy"
SWEP.Contact		= "Google.com"
SWEP.Purpose		= "Give suppressive fire"
SWEP.Instructions	= "No"

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/my_black_ops_weapons/m60/v_aron_bo1_m60.mdl"
SWEP.WorldModel		= "models/my_black_ops_weapons/m60/w_aron_m603.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 100
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.090
SWEP.FireSound = "BO_ARON_M60_FIRE"
SWEP.FireSoundSuppressed = "BO_ARON_M60_FIRE_SILENCER"
SWEP.Recoil = 1.35

SWEP.HipSpread = 0.15
SWEP.AimSpread = 0.008
SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.15
SWEP.SpreadPerShot = 0.0015
SWEP.SpreadCooldown = 0.06
SWEP.Shots = 1
SWEP.Damage = 42
SWEP.DeployTime = 1.4

SWEP.ReloadSpeed = 0.8
SWEP.ReloadTime = 8.2
SWEP.ReloadTime_Empty = 8.2
SWEP.ReloadHalt = 8.2
SWEP.ReloadHalt_Empty = 8.2
SWEP.SnapToIdlePostReload = true
end
