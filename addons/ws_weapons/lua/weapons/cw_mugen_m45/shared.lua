AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Colt M45A1"
	
	SWEP.IconLetter = "a"
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.45
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = -1, z = 0.5}
		
	SWEP.EFTFF3Pos = Vector(-2.2241, 4, 0.15)
	SWEP.EFTFF3Ang = Vector(0, 0, 0)

	SWEP.mr01Pos = Vector(-2.2241, 2, 0.33)
	SWEP.mr01Ang = Vector(0, 0, 0)
	
	SWEP.mr02Pos = Vector(-2.2241, 2, 0.33)
	SWEP.mr02Ang = Vector(0, 0, 0)
	
	SWEP.mr03Pos = Vector(-2.2241, 2, 0.33)
	SWEP.mr03Ang = Vector(0, 0, 0)
	
	--------------------------------

	SWEP.MicroT1Pos = Vector(-2.2241, 0.1376, -0.4454)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.IronsightPos = Vector(-2.2186, 4, 0.5207)
	SWEP.IronsightAng = Vector(0.633, 0.0512, 0)

	SWEP.AlternativePos = Vector(-2.4, 0, -1.3)
	SWEP.AlternativeAng = Vector(1.5, 0, -19.1)

	SWEP.SprintPos = Vector(-2, 1.01, 1)  --跑步晃动角度
	SWEP.SprintAng = Vector(-24, 10, -20)

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/mugen/cw2/pistols/w_cw2_m45.mdl"
	SWEP.WMPos = Vector(-1.4, 2, -1.25)
	SWEP.WMAng = Vector(0, 0, 180)

	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	
	SWEP.ReticleInactivityPostFire = 0.12
		
	SWEP.BoltBone = "slide"
	SWEP.BoltShootOffset = Vector(-0.3, 0, 0)
	SWEP.BoltBonePositionRecoverySpeed = 25
	
	SWEP.OffsetBoltDuringNonEmptyReload = false
	SWEP.BoltReloadOffset = Vector(0, 1.39, 0)
	SWEP.EmptyBoltHoldAnimExclusion = "shoot_empty"
	SWEP.ReloadBoltBonePositionRecoverySpeed = 20
	SWEP.ReloadBoltBonePositionMoveSpeed = 100
	
	SWEP.StopReloadBoneOffset = 0.8
	SWEP.HoldBoltWhileEmpty = true
	SWEP.DontHoldWhenReloading = true
	SWEP.DisableSprintViewSimulation = true
	SWEP.SightWithRail = true
	SWEP.FOVPerShot = 0.3
    SWEP.CustomizationMenuScale = 0.008

	SWEP.AttachmentModelsVM = {
["md_decho_comp"] = {model = "models/viper/mw/attachments/attachment_vm_pi_decho_muzzlebrake.mdl", bone = "barrel", pos = Vector(0, 2, -0.2), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
["md_oil_filter_suppressor"] = {model = "models/viper/mw/attachments/attachment_vm_oil_filter_suppressor.mdl", bone = "barrel", pos = Vector(0, 2, -0.12), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
["md_silencer04"] = {model = "models/viper/mw/attachments/attachment_vm_silencer04.mdl", bone = "barrel", pos = Vector(0, 2.19, -0.12), angle = Angle(0, -90, 46), size = Vector(0.75, 0.75, 0.75)},
["md_silencerpstl"] = {model = "models/viper/mw/attachments/attachment_vm_silencerpstl.mdl", bone = "barrel", pos = Vector(0, 2.06, -0.12), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
["md_silencerpstl03"] = {model = "models/viper/mw/attachments/attachment_vm_silencerpstl03.mdl", bone = "barrel", pos = Vector(0, 2.09, -0.12), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
["md_comp"] = {model = "models/viper/mw/attachments/attachment_vm_compensator_pstl01.mdl", bone = "barrel", pos = Vector(0, 2, -0.12), angle = Angle(0, -90, 0), size = Vector(0.9, 0.9, 0.9)},
["md_flash"] = {model = "models/viper/mw/attachments/attachment_vm_flashhider01.mdl", bone = "barrel", pos = Vector(0, 2, -0.12), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},

["md_minireddot01"] = {model = "models/viper/mw/attachments/attachment_vm_pi_minireddot01.mdl", bone = "slide", pos = Vector(0, -2.3, 0.4), angle = Angle(0, -90, 0), size = Vector(0.76, 0.76, 0.76)},	
["md_minireddot02"] = {model = "models/viper/mw/attachments/attachment_vm_pi_minireddot02.mdl", bone = "slide", pos = Vector(0, -2.3, 0.4), angle = Angle(0, -90, 0), size = Vector(0.76, 0.76, 0.76)},	
["md_minireddot03"] = {model = "models/viper/mw/attachments/attachment_vm_pi_minireddot03.mdl", bone = "slide", pos = Vector(0, -2.3, 0.4), angle = Angle(0, -90, 0), size = Vector(0.76, 0.76, 0.76)},	

			
["md_eft_sil_osprey9"] = {model = "models/weapons/cw_eft/upgrades/silencers/osprey/v_osprey.mdl", bone = "barrel", pos = Vector(0, 2, -0.12), angle = Angle(0, -90, 0), size = Vector(0.75, 0.75, 0.75)},
["md_eft_sil_aac"] = {model = "models/weapons/cw_eft/upgrades/silencers/aac/v_aac.mdl", bone = "barrel", pos = Vector(0, 2, -0.115), angle = Angle(0, -90, 0), size = Vector(0.75, 1, 1)},

["md_eft_fl_x400"] = {model = "models/weapons/cw_eft/upgrades/tactical/x400/x400.mdl", bone = "1911", rel = "", pos = Vector(0, 2.7, 0.5), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
["md_eft_fl_dbalpl"] = {model = "models/weapons/cw_eft/upgrades/tactical/dbalpl/dbalpl.mdl", bone = "1911", rel = "", pos = Vector(0, 2.6, 0.5), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},

["md_rail"] = {model = "models/viper/mw/attachments/attachment_pistol_rail.mdl", bone = "slide", pos = Vector(0, -2.6, 0.4), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
["md_cobram2"] = {model = "models/cw2/attachments/cobra_m2.mdl", pos = Vector(0.0303, 4.6434, -0.1053), angle = Angle(0, 90, 0), size = Vector(0.8097, 0.8097, 0.8097), bone = "barrel"},
["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", pos = Vector(-0.0097, 0.6882, 2.2124), angle = Angle(0, 180, 0), size = Vector(0.3988, 0.3988, 0.3988), bone = "1911"},
}



	SWEP.LaserPosAdjust = Vector(0, -1, 0)
	SWEP.LaserAngAdjust = Angle(0, -0.2, 0)  
	
	SWEP.BoltBonePositionRecoverySpeed = 17 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	SWEP.SlideBGs = {main = 1, pm = 0, pb = 1}
	SWEP.SuppressorBGs = {main = 2, pm = 1, pb = 2, none = 0}
	SWEP.MagBGs = {main = 3, regular = 0, extended = 1}


end

SWEP.ShootWhileProne = true
SWEP.MuzzleVelocity = 380 -- in meter/s
SWEP.CanRestOnObjects = false
SWEP.ReloadViewBobEnabled = false

    SWEP.LuaVMRecoilAxisMod = {vert = -0.1, hor = 1, roll = 2.6, forward = 1.2, pitch = 0}
    SWEP.LuaViewmodelRecoil = true
    SWEP.LuaViewmodelRecoilOverride = true
    SWEP.FullAimViewmodelRecoil = true
    SWEP.ADSFireAnim = true 

SWEP.Attachments = {
    [1] = {header = "Barrel", offset = {500, -400}, atts = {"md_decho_comp", "md_flash", "md_comp", "md_silencerpstl03", "md_silencerpstl", "md_silencer04", "md_oil_filter_suppressor", "md_eft_sil_osprey9", "md_eft_sil_aac"}},
	[2] = {header = "Sight", offset = {500, 300}, atts = {"md_minireddot01", "md_minireddot02", "md_minireddot03"}},
	[3] = {header = "Rail", offset = {-450, 300}, atts = {"md_eft_fl_x400", "md_eft_fl_dbalpl"}},
	--["impulse 100"] = {header = "Skin", offset = {950, -400}, atts = {"bg_m45_1"}},
	["+reload"] = {header = "Ammo", offset = {500, 650}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {
	reload = "reload",
	reload_empty = "reload_empty",
	fire = {"shoot1", "shoot2"},
	fire_dry = "shoot_empty",
	idle = "idle",
	drawfirst = "draw",
	draw = "draw_normal"}
	
SWEP.Sounds = {draw_normal = {{time = 0, sound = "CW_FOLEY_LIGHT"}},

	reload_empty = {{time = 0.4, sound = "CW_MUGEN_M45_MAGOUT"},
	{time = 1.2, sound = "CW_MUGEN_M45_MAGIN"},
	{time = 1.7, sound = "CW_MUGEN_M45_SLIDEBACK"}},

		
     reload = {{time = 0.4, sound = "CW_MUGEN_M45_MAGOUT"},
	{time = 1.2, sound = "CW_MUGEN_M45_MAGIN"}}

	
}

SWEP.SpeedDec = 5

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi", "auto"}
SWEP.Base = "cw_base"
SWEP.Category = "CW-Goodgun"

SWEP.Author			= "MUGEN"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/mugen/cw2/pistols/v_cw2_m45.mdl"
SWEP.WorldModel		= "models/mugen/cw2/pistols/w_cw2_m45.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 70
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".45 ACP"

SWEP.FireDelay = 0.15
SWEP.FireSound = "CW_MUGEN_M45_FIRE"
SWEP.FireSoundSuppressed = "CW_MUGEN_M45_FIRE_SUPPRESSED"
SWEP.Recoil = 0.8

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 5
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.17
SWEP.Shots = 1
SWEP.Damage = 41
SWEP.DeployTime = 0.4
--SWEP.Chamberable = false

SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 1.59
SWEP.ReloadHalt = 1.8

SWEP.ReloadTime_Empty = 2
SWEP.ReloadHalt_Empty = 2.2

SWEP.SnapToIdlePostReload = false