AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Minebea PM-9"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "x"
	killicon.AddFont("cw_mp5", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87

	SWEP.BoltBone = "UZI2-Bolt"
	SWEP.BoltShootOffset = Vector(-2.2, 0, 0)
	SWEP.OffsetBoltOnBipodShoot = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_pm9_japan.mdl"
	SWEP.WMPos = Vector(-0.900, -5.000, -3.000)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.IronsightPos = Vector(2.552, -2.029, 0.518)
	SWEP.IronsightAng = Vector(0, -0.087, 0)

	SWEP.MicroT1Pos = Vector(2.561, -3.316, -0.033)
	SWEP.MicroT1Ang = Vector(0, 0, 0)	
		
	SWEP.EoTechPos = Vector(2.543, -3.316, -0.217)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.CoD4ReflexPos = Vector(2.543, -3.316, 0)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(2.565, -3.316, -0.248)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0.441, 0, 0.36)
	SWEP.SprintAng = Vector(-18.203, 1.116, 7.288)

	SWEP.PronePos = Vector(-0.971, -5.13, -2.626)
	SWEP.ProneAng = Vector(-7.898, -20, 32.382)

	SWEP.CustomizePos = Vector(-8.174, -1.27, -1.288)
	SWEP.CustomizeAng = Vector(17.954, -40.578, -18.357)
	
	SWEP.AlternativePos = Vector(0, 1.325, -0.801)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(2.028, -5.613, -1.124), [2] = Vector(0, 0, 0)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AttachmentModelsVM = {
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "UZI2-Receiver", rel = "", pos = Vector(-2.727, 1.238, 0.651), angle = Angle(90, 90, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "UZI2-Receiver", rel = "", pos = Vector(9.194, -9.672, 0.388), angle = Angle(180, 0, 90), size = Vector(1, 1, 1)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "UZI2-Receiver", rel = "", pos = Vector(1.05, -1.568, 0.653), angle = Angle(0, 0, 90), size = Vector(0.8, 0.8, 0.8)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "UZI2-Receiver", rel = "", pos = Vector(3.092, -3.191, 0.865), angle = Angle(-90, 0, 90), size = Vector(0.8, 0.8, 0.8)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "UZI2-Receiver", rel = "", pos = Vector(-1.848, 0.064, -1.155), angle = Angle(0, -90, 0), size = Vector(0.6, 0.6, 0.6)}
	}

	SWEP.ForegripOverridePos = {
		["bg_mp5_sdbarrel"] = {
			["Bip01 R Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(-4.029, 14.069, 0) },
			["Bip01 R Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(0, -8.988, 0) }
		},
		
		["bg_mp5_kbarrel"] = {
			["Bip01 R Hand"] = {pos = Vector(0, 0, 0), angle = Angle(0.263, 23.951, -31.754) },
			["Bip01 R Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(-0.894, 32.728, 3.026) },
			["Bip01 R Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 12.1, 0) },
			["Bip01 R Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.451, 0) },
			["Bip01 R Clavicle"] = {pos = Vector(-6.856, 2.325, 2.252), angle = Angle(48.464, 28.256, 12.512) },
			["Bip01 R Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 14.687) },
			["Bip01 R Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(-1.813, 71.625, 0) },
			["Bip01 R Finger41"] = {pos = Vector(0, 0, 0), angle = Angle(0, -26.932, 0) },
			["Bip01 R Finger31"] = {pos = Vector(0, 0, 0), angle = Angle(0, -16.4, 0) },
			["Bip01 R Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 89.527, 0) },
			["Bip01 R Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(0, 18.952, 11.305) },
			["Bip01 R Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(-15.782, -6.495, 33.964) },
			["Bip01 R Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 54.675, -4.284) },
			["Bip01 R Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 67.799, 0) }
		}
	}

end

SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {700, -400}, atts = {"md_microt1", "md_eotech", "md_aimpoint"}},
[2] = {header = "Barrel", offset = {200, -400}, atts = {"md_saker"}},
["+attack2"] = {header = "Perks", offset = {-450, -400}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {700, 0}, atts = {"am_magnum", "am_matchgrade"}}}

	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.3, sound = "CW_PM9_BOLT"}},
	
	reload = {[1] = {time = 0.71, sound = "CW_PM9_MAGOUT"},
	[2] = {time = 1.78, sound = "CW_PM9_MAGIN"},
	[3] = {time = 2.41, sound = "CW_PM9_BOLT"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_pm9_japan.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_pm9_japan.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ADSFireAnim = false

SWEP.Primary.ClipSize		= 32
SWEP.Primary.DefaultClip	= 96
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.054005400540054
SWEP.FireSound = "CW_PM9_FIRE"
SWEP.FireSoundSuppressed = "CW_PM9_FIRE_SUPPRESSED"
SWEP.Recoil = 0.4

SWEP.HipSpread = 0.095
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.09
SWEP.SpreadPerShot = 0.09
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 2.1
SWEP.ReloadTime_Empty = 2.7
SWEP.ReloadHalt = 2
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.21
	end
end