AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AAC Honey Badger"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.75
	
	SWEP.IconLetter = "w"
	killicon.AddFont("gsmaac", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
    SWEP.SelectIcon = surface.GetTextureID("weaponicons/gsmaac")
	killicon.Add("gsmaac", "weaponicons/gsmaac", Color(255, 80, 0, 150))
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/gsm/w_gsm_aac.mdl"
	SWEP.WMPos = Vector(-0.75, -0.5, 1)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.MuzzleEffect = "muzzleflash_suppressed"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "smallshell"
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.75
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
    SWEP.IronsightPos = Vector(-2.01, -1.625, 0.185)
    SWEP.IronsightAng = Vector(0, 0, 0)
	
    SWEP.MicroT1Pos = Vector(-2.04, -2.073, 0.4)
    SWEP.MicroT1Ang = Vector(0, 0, 0)
	
    SWEP.EoTechPos = Vector(-2.04, -3.731, -0.401)
    SWEP.EoTechAng = Vector(0, 0, 0)
	
    SWEP.AimpointPos = Vector(-2.06, -3.938, 0.239)
    SWEP.AimpointAng = Vector(0, 0, 0)
	
    SWEP.ACOGPos = Vector(-2.056, -3.316, -0.12)
    SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(7.711, -0.482, -2)
	SWEP.CustomizeAng = Vector(16.364, 40.741, 15.277)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.06, -0.403, -1.241), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = true
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.012

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Honey_Body", pos = Vector(-0.301, 5.946, 41.2), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Honey_Body", pos = Vector(0.4, -3.784, 30.799), angle = Angle(0, -90, 0), size = Vector(1.5, 1.5, 1.5)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Honey_Body", pos = Vector(0, 11.5, 47.027), angle = Angle(0, -180, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "Honey_Body", pos = Vector(-0.25, 9, 43.5), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Honey_Body", pos = Vector(0, 18, 46.9), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Honey_Body", pos = Vector(-0.401, 7.026, 41.2), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)}
	}
		
	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 42.713, 0) },
		["Bip01 L Clavicle"] = {pos = Vector(0, -3.2, -3), angle = Angle(0, 11.843, 0) },
		["Bip01 L Forearm"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 75) },
		["Bip01 L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 71.308, 0) },
		["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.795, 0) },
		["Bip01 L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(0, 26.148, 0) },
		["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(6.522, 83.597, 0) },
		["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(23.2, 16.545, 0) },
		["Bip01 L Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 31.427, 0) },
		["Bip01 L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 29.565, 0) },
		["Bip01 L Hand"] = {pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
		["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25, 0) },
		["Bip01 L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10.164, 0) },
		["Bip01 L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 18.395, 0) },
		["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(2.411, 57.007, 0) }
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0.8, 0, 0.3)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acog"}},
	[2] = {header = "Rail", offset = {800, 150},  atts = {"md_anpeq15"}},
    [3] = {header = "Handguard", offset = {-300, 0}, atts = {"md_foregrip"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {reload = {{time = 0.25, sound = "CW_GSM_AAC_MAGOUT"},
	{time = 1.7, sound = "CW_GSM_AAC_MAGIN"}},
	
	reload_empty = {{time = 0.25, sound = "CW_GSM_AAC_MAGOUT"},
    {time = 1.7, sound = "CW_GSM_AAC_MAGIN"},
    {time = 2.5, sound = "CW_GSM_AAC_BOLTBACK"}}}


SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/gsm/v_gsm_aac.mdl"
SWEP.WorldModel		= "models/cw2/gsm/w_gsm_aac.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.075
SWEP.FireSound = "CW_GSM_AAC_FIRE"
SWEP.Recoil = 0.5

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 23
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 2.4
SWEP.ReloadTime_Empty = 3.5
SWEP.ReloadHalt = 2.65
SWEP.ReloadHalt_Empty = 3.5