if CustomizableWeaponry then
AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

SWEP.magType = "arMag"
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Type 56"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	killicon.Add( "cw_aron_bo_ak47", "aron_icons/hud/hud_ak47", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("aron_icons/ak47")
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = false
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 3, y = -1, z = -2}
	
	SWEP.ForeGripOffsetCycle_Draw = 0.65
	SWEP.ForeGripOffsetCycle_Reload = 0.83
	SWEP.ForeGripOffsetCycle_Reload_Empty = .89
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/my_black_ops_weapons/ak47/w_aron_bo_ak47.mdl"
	SWEP.WMPos = Vector( -9.8, -1, 1.2)
	SWEP.WMAng = Vector(-15, 90, 180)


	SWEP.IronsightPos = Vector(-2.661, -0.603, 0.87)
	SWEP.IronsightAng = Vector(0, 0, 0)

	SWEP.AronREDDOTPos = Vector(-2.65, 1, 0.38)
	SWEP.AronREDDOTAng = Vector(0, 0, 0)

	SWEP.AronACOGPos = Vector(-2.679, 7, 0.439)
	SWEP.AronACOGAng = Vector(0, 0, 0)
	
	SWEP.AronREFLEXPos = Vector(-2.68, 1, 0.22)
	SWEP.AronREFLEXAng = Vector(0, 0, 0)

	SWEP.AronRUIRPos = Vector(-2.67, -3, 0.46)
	SWEP.AronRUIRAng = Vector(0, 0, 0)


	SWEP.SprintPos = Vector(0, 0.904, -0.86)
	SWEP.SprintAng = Vector(-19.542, 31.87, -31.23)
	
	SWEP.CustomizePos = Vector(9.25, -4.02, 1.608)
	SWEP.CustomizeAng = Vector(21.106, 41.507, 32.361)
	
	SWEP.AlternativePos = Vector(0, 0, 0)		--	0.804, 0, 0 old
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.017
	

	SWEP.BoltBone = "j_bolt"
	SWEP.BoltShootOffset = Vector(-2.6, 0, 0)
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	SWEP.ViewbobEnabled = true
	SWEP.ViewbobIntensity = 1
	SWEP.ReloadViewBobEnabled = true
	SWEP.SightWithRail = false
	SWEP.ZoomAmount = 0
	SWEP.BoltBonePositionRecoverySpeed = 80
	
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.AronRUIRAxisAlign = {right = 0, up = 0, forward = 0}
		SWEP.primarySightCategory = 1
	
	-- adjustment = {min =  2, max = 7, axis = "x", inverseOffsetCalc = true},
	
	SWEP.AttachmentModelsVM = {
	["md_pbs1"] = { type = "Model", model = "models/cw2/attachments/pbs1.mdl", bone = "j_gun", rel = "", pos = Vector(27, 0, -0.18), angle = Angle(0, -90, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_reddot"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/Cobra_V_AK47.mdl", bone = "j_gun", rel = "", pos = Vector(0.2, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_reflex"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/Aimpoint_V_AK47.mdl", bone = "j_gun", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_acog"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/PKA_V_AK47.mdl", bone = "j_gun", rel = "", pos = Vector(0, 0, -0.3), angle = Angle(0, 0, 0), size = Vector(1.12, 1.12, 1.12), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["bo_ru_ir"] = { type = "Model", model = "models/my_black_ops_weapons/aron_sights/v_nsp3a_scope.mdl", bone = "j_gun", rel = "", pos = Vector(0, 0, -0.6), angle = Angle(0, 0, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
}

	SWEP.AttachmentModelsWM = {
	["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "j_gun", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
}

SWEP.AttachmentDependencies = {["md_magnifier_scope"] = {"bo_reddot", "bo_acog", "bo_reflex", "bo_ru_ir"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.LaserPosAdjust = Vector(0, 0, 0)
SWEP.LaserAngAdjust = Angle(0, 0, 0) 

SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0, roll = 1, forward = 4, pitch = 1}
 

end



SWEP.Animations = {fire = {"fire"},
	reload = "reload_full",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}

SWEP.LuaViewmodelRecoil = false
SWEP.FullAimViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {200, -500}, atts = {"bo_reddot", "bo_acog"}},
	[2] = {header = "Barrel", offset = {-100, -200}, atts = {"md_pbs1"}},
	["+reload"] = {header = "Ammo", offset = {800, 300}, atts = {"am_magnum", "am_matchgrade"}}}


SWEP.Sounds = {	draw = {{time = 0.0, sound = ""}},

	reload_full = {[1] = {time = 0, sound = "my_weapons/bo_generic1.wav"},
	[2] = {time = 0.6, sound = "my_weapons/bo_ak47/ak47_magout.wav"},
	[3] = {time = 1.4, sound = "my_weapons/bo_generic3.wav"},
	[4] = {time = 2, sound = "my_weapons/bo_ak47/ak47_magin.wav"}},

	draw = {[1] = {time = 0, sound = "my_weapons/bo_generic1.wav"},
	[2] = {time = 0.5, sound = "my_weapons/bo_ak47/ak47_zamek.wav"}},
	
	reload_empty = {[1] = {time = 0, sound = "my_weapons/bo_generic1.wav"},
	[2] = {time = 0.6, sound = "my_weapons/bo_ak47/ak47_magout.wav"},
	[3] = {time = 1.4, sound = "my_weapons/bo_generic3.wav"},
	[4] = {time = 2, sound = "my_weapons/bo_ak47/ak47_magin.wav"},
	[5] = {time = 2.75, sound = "my_weapons/bo_ak47/ak47_zamek.wav"}}}

SWEP.SpeedDec = 20

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Doni Danger"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/my_black_ops_weapons/ak47/v_aron_ak47.mdl"
SWEP.WorldModel		= "models/my_black_ops_weapons/ak47/w_aron_bo_ak47.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.45x39MM"

SWEP.FireDelay = 0.089
SWEP.FireSound = "BO_ARON_AK47_FIRE"
SWEP.FireSoundSuppressed = "BO_ARON_AK47_FIRE_SILENCER"
SWEP.Recoil = 1.55

SWEP.HipSpread = 0.17
SWEP.AimSpread = 0.009
SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.17
SWEP.SpreadPerShot = 0.003
SWEP.SpreadCooldown = 0.08
SWEP.Shots = 1
SWEP.Damage = 43
SWEP.DeployTime = 1.6

SWEP.ReloadSpeed = 0.90
SWEP.ReloadTime = 3
SWEP.ReloadTime_Empty = 4
SWEP.ReloadHalt = 3
SWEP.ReloadHalt_Empty = 4
SWEP.SnapToIdlePostReload = true
end

