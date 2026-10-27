AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Death Machine'"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 2
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePsMod = {x = -8, y = 0, z = 0}
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_blopsminigun.mdl"
	SWEP.WMPos = Vector(-1, 5, -32)
	SWEP.WMAng = Vector(-12, 0, 90)
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(0, 7.236, -1.81)
	SWEP.IronsightAng = Vector(6.331, 3.517, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.21, -4.686, 0.239)
	SWEP.EoTechAng = Vector(0, 0, -0.217)
	
	SWEP.AimpointPos = Vector(-2.194, -4.686, 0.338)
	SWEP.AimpointAng = Vector(-1.951, 0, -0.217)
	
	SWEP.MicroT1Pos = Vector(-2.208, -4.712, 0.633)
	SWEP.MicroT1Ang = Vector(-1.938, 0, -0.217)
	
	SWEP.ACOGPos = Vector(-2.211, -4, 0.146)
	SWEP.ACOGAng = Vector(-1.4, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(-2.211, -11.457, -7.639)

	SWEP.SprintAng = Vector(56.28, 0, 0)

	SWEP.PronePos = Vector(0, -5.006, -3.807)

	SWEP.ProneAng = Vector(15.798, 9.687, 1.902)
		
	SWEP.CustomizePos = Vector(0, -4.824, -4.02)
	SWEP.CustomizeAng = Vector(22.513, 14.774, 3.517)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.MoveType = 1

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "smdimport001", rel = "", pos = Vector(-0.281, -3.513, -2.086), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "smdimport001", rel = "", pos = Vector(0.238, -8.943, -7.223), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "smdimport001", rel = "", pos = Vector(-0.452, -2.556, -1.428), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "smdimport001", pos = Vector(-0.042, 4.362, 0.1), angle = Angle(0, 0, 2), size = Vector(0.75, 0.75, 0.75)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "smdimport001", pos = Vector(-0.027, 2.812, 3.634), angle = Angle(0, 180, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "smdimport001", pos = Vector(-0.401, -3.291, -2.22), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_lasersight"] = {model = "models/rageattachments/anpeqbf.mdl", bone = "DrawCall_0041", rel = "", pos = Vector(7.283, -26.66, -7.355), angle = Angle(0, 90, 90), size = Vector(1, 1, 1)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "smdimport001", pos = Vector(2.299, -6.611, 4.138), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-2.76, 2.651, 1.386), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 42.713, 0) },
		["Bip01 L Clavicle"] = {pos = Vector(-3.299, 1.235, -1.79), angle = Angle(-55.446, 11.843, 0) },
		["Bip01 L Forearm"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 42.41) },
		["Bip01 L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 71.308, 0) },
		["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.795, 0) },
		["Bip01 L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(0, 26.148, 0) },
		["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(6.522, 83.597, 0) },
		["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(23.2, 16.545, 0) },
		["Bip01 L Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 31.427, 0) },
		["Bip01 L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 29.565, 0) },
		["Bip01 L Hand"] = {pos = Vector(0, 0, 0), angle = Angle(9.491, 14.793, -15.926) },
		["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, -9.195, 0) },
		["Bip01 L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10.164, 0) },
		["Bip01 L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 18.395, 0) },
		["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(2.411, 57.007, 0) }
	}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 4)
	SWEP.LaserAngAdjust = Angle(-1, 0, 0) 
end

SWEP.LuaViewmodelRecoil = false

SWEP.ADSFireAnim = true

SWEP.Attachments = {[1] = {header = "Lazer", offset = {800, -500}, atts = {"md_lasersight"}},
["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}
	
SWEP.AttachmentDependencies = {["md_m203"] = {"bg_longris"}} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_DEATHMACHINE_BOLT"}},

	shoot1 = {{time = 0.05, sound = "CW_DEATHMACHINE_BOLT"}},

	shoot2 = {{time = 0.05, sound = "CW_DEATHMACHINE_BOLT"}},

	reload = {[1] = {time = 0.35, sound = "CW_DEATHMACHINE_MAGOUT"},
	[2] = {time = 1.2, sound = "CW_DEATHMACHINE_MAGIN"},
	[3] = {time = 2.3, sound = "CW_FOLEY_MEDIUM"},
	[4] = {time = 3.25, sound = "CW_DEATHMACHINE_BOLT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_cod_deathmach.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_blopsminigun.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 999
SWEP.Primary.DefaultClip	= 999
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.05
SWEP.FireSound = "CW_DEATHMACHINE_FIRE"
SWEP.Recoil = 0.03

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.02
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 80
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.8
SWEP.ReloadTime_Empty = 2.8
SWEP.ReloadHalt = 3.2
SWEP.ReloadHalt_Empty = 2.7
SWEP.SnapToIdlePostReload = false

SWEP.Chamberable = false
SWEP.SpeedDec = 0.1