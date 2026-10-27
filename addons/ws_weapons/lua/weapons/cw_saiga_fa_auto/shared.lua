AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Saiga-12"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	SWEP.ShellPosOffset = {x = 0, y = -2, z = -2.5}
	SWEP.ShellDelay = 0.06
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_shot_saiga_fa.mdl"
	SWEP.WMPos = Vector(-1, 0, 1)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.ForeGripOffsetCycle_Draw = 0.8
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.IronsightPos = Vector(-2.31, 0, -0.101)
	SWEP.IronsightAng = Vector(1.179, 0.1, 0)

	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.32, 0, -0.095)
	SWEP.EoTechAng = Vector(-1.45, 0.029, 0)

	SWEP.AimpointPos = Vector(-2.335, 0, 0.071)
	SWEP.AimpointAng = Vector(-0.1, 0.05, 0)

	SWEP.MicroT1Pos = Vector(-2.32, -0, 0.138)
	SWEP.MicroT1Ang = Vector(0.15, 0.05, 0)

	SWEP.ACOGPos = Vector(-2.764, -3.418, -1.03)
	SWEP.ACOGAng = Vector(-0.375, 0.222, 0)
	
	SWEP.RMRPos = Vector(-2.316, 0, 0.319)
	SWEP.RMRAng = Vector(0.15, 0.008, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.764, -0.403, -2.638), [2] = Vector(-0.332, 0.086, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Weapon", rel = "", pos = Vector(-0.026, -3.691, -2.352), angle = Angle(0, 0, 0), size = Vector(0.839, 0.839, 0.839)},
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Weapon", rel = "", pos = Vector(-0.276, -4.812, -2.35), angle = Angle(0, -90, 0), size = Vector(0.705, 0.705, 0.705)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "Weapon", rel = "", pos = Vector(-0.301, -6.548, -2.564), angle = Angle(0, 0, 0), size = Vector(0.731, 0.731, 0.657)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Weapon", rel = "", pos = Vector(-0.224, -6.316, -2.577), angle = Angle(0, 0, 0), size = Vector(0.754, 0.754, 0.754)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Weapon", rel = "", pos = Vector(0.266, -14.037, -9.477), angle = Angle(0, -90, 0), size = Vector(1.042, 1.042, 1.042)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Weapon", rel = "", pos = Vector(-0.03, -0.424, 1.779), angle = Angle(0, 0, 0), size = Vector(0.319, 0.319, 0.319)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Weapon", rel = "", pos = Vector(-0.06, 2.71, 1.552), angle = Angle(0, 90, 0), size = Vector(0.388, 0.388, 0.388)}
	}
	
	SWEP.ForeGripHoldPos = {
	["L Hand"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 60) },
	["L UpperArm"] = {pos = Vector(3.5, 0, 0.5), angle = Angle(0, 0, 20) },
	
	["l_pinky_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_pinky_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(0, -20, -8) }, -- pinky
	["L Finger41"] = {pos = Vector(0, 0, 0), angle = Angle(0, 40, 0) }, -- pinky
	["L Finger42"] = {pos = Vector(1, 0, 0), angle = Angle(0, 60, 0) }, --pinky
	
	["l_ring_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_ring_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, 
	["L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 15, -5) }, -- ring
	["L Finger31"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, -- ring
	["L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 60, 0) }, -- ring
	
	["l_middle_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_middle_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) }, -- middle
	["L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, -- middle
	["L Finger22"] = {pos = Vector(0, 0, 0), angle = Angle(0, 50, 0) }, -- middle
	
	["l_index_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, 
	["l_index_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(0, 35, 0) }, -- index
	["L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, -- index
	["L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, 50, 0) }, -- index
	
	["l_thumb_tip"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, 
	["l_thumb_mid"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["l_thumb_low"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, 
	["L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(40, 20, 0) }, -- thumb -- 40, 20, 0
	["L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, -- thumb
	["L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 50, 0) }, -- thumb			
	} 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 2, hor = 1, roll = 1, forward = 1, pitch = 1}

	SWEP.LaserPosAdjust = Vector(-0.5, -5, 0.1)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.BoltBone = "bolt"
SWEP.BoltShootOffset = Vector(0, 1, 0)

SWEP.MuzzleVelocity = 300 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}

SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {1000, -300}, atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech"}},
	[2] = {header = "Handguard", offset = {0, 300}, atts = {"md_foregrip"}}, 
	[3] = {header = "Rail", offset = {200, -200}, atts = {"md_anpeq15"}},
	[4] = {header = "Barrel", offset = {-300, -300}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {900, 600}, atts = {"am_slugrounds", "am_flechetterounds"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"},
    {time = 0.6, sound = "CW_SAIGA_FA_BOLT"},
	{time = 0.85, sound = "CW_SAIGA_FA_BOLT_RELEASE"}},

	reload = {[1] = {time = 0.2, sound = "CW_CLOTH4"},
	[2] = {time = 0.32, sound = "CW_SAIGA_FA_MAGOUT"},
	[3] = {time = 0.75, sound = "CW_SAIGA_FA_MAGINRATTLE"},
	[4] = {time = 1.8, sound = "CW_CLOTH1"},
	[5] = {time = 2.2, sound = "CW_SAIGA_FA_MAGIN"},
	[6] = {time = 2.3, sound = "CW_SAIGA_FA_MAGINCLIRK"},
	[7] = {time = 2.6, sound = "CW_CLOTH2"},
	[8] = {time = 2.7, sound = "CW_SAIGA_FA_BOLT"},
	[9] = {time = 2.8, sound = "CW_CLOTH3"},
	[10] = {time = 2.9, sound = "CW_SAIGA_FA_BOLT_RELEASE"},
	[11] = {time = 3, sound = "CW_CLOTH3"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_shot_saiga_fa.mdl"
SWEP.WorldModel		= "models/weapons/w_shot_saiga_fa.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 90
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "12 gauge"

SWEP.FireDelay = 0.2
SWEP.FireSound = "CW_SAIGA_FA_FIRE"
SWEP.FireSoundSuppressed = "CW_SAIGA_FA_SUPPRESED"
SWEP.Recoil = 1.8

SWEP.HipSpread = 0.050
SWEP.AimSpread = 0.0020
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.035
SWEP.SpreadPerShot = 0.0060
SWEP.SpreadCooldown = 0.10
SWEP.ClumpSpread = 0.015
SWEP.Shots = 12
SWEP.Damage = 12
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 3.4
SWEP.ReloadTime_Empty = 3.4
SWEP.ReloadHalt = 3.4
SWEP.ReloadHalt_Empty = 3.4
SWEP.SnapToIdlePostReload = true