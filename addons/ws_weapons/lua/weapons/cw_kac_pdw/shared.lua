AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "KAC PDW"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_kac_pdwp.mdl"
	SWEP.WMPos = Vector(-0.3, 0, 0)
	SWEP.WMAng = Vector(-5, -2, 180)
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(3.293, -3.688, 0.474)
	SWEP.IronsightAng = Vector(2.456, 0.079, 0)

	SWEP.CoD4ReflexPos = Vector(3.341, -3.702, 1.006)

	SWEP.CoD4ReflexAng = Vector(2.03, 0.075, 0)
		
	SWEP.EoTechPos = Vector(3.341, -3.702, 0.856)
	SWEP.EoTechAng = Vector(3.513, 0.075, 0)
	
	SWEP.AimpointPos = Vector(3.341, -3.702, 0.856)
	SWEP.AimpointAng = Vector(2.193, 0.075, 0)
	
	SWEP.MicroT1Pos = Vector(3.359, -3.702, 0.957)
	SWEP.MicroT1Ang = Vector(2.03, 0.075, 0)
	
	SWEP.CSGOACOGPos = Vector(3.325, -3.702, 0.762)
	SWEP.CSGOACOGAng = Vector(2.193, 0.075, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(-2.141, -1.206, -0.12)
	SWEP.SprintAng = Vector(-13.367, -29.549, 14.774)

	SWEP.PronePos = Vector(-0.668, -10.417, -4.231)
	SWEP.ProneAng = Vector(3.262, -70, 29.052)

	SWEP.CustomizePos = Vector(-4.601, -0.072, -0.967)
	SWEP.CustomizeAng = Vector(11.442, -23.473, -11.537)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "DrawCall_0", rel = "", pos = Vector(0.244, 5.373, -1.969), angle = Angle(0, 180, 0), size = Vector(1.1, 1.1, 1.1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "DrawCall_0", rel = "", pos = Vector(-0.302, 10.472, -6.506), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "DrawCall_0", rel = "", pos = Vector(-0.108, -2.142, 0.405), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "DrawCall_0", rel = "", pos = Vector(-0.033, 3.984, 0.944), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "DrawCall_0", rel = "", pos = Vector(-0.028, -0.741, 4.453), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "DrawCall_0", rel = "", pos = Vector(-0.087, 6.256, -0.244), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "smdimport001", pos = Vector(-0.225, 9.715, 3.15), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
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
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0) 
end

SWEP.SightBGs = {main = 1, none = 1}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {-700, -500}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_csgo_acog"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_saker"}},
	["+attack2"] = {header = "Perks", offset = {800, -500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")		
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.1, sound = "CW_KAC_PDW_BOLT"}},

	reload = {[1] = {time = 0.35, sound = "CW_KAC_PDW_MAGOUT"},
	[2] = {time = 1.2, sound = "CW_KAC_PDW_MAGIN"},
	[3] = {time = 1.9, sound = "CW_KAC_PDW_BOLT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_kac_pdwp.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_kac_pdwp.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.0631578947368421
SWEP.FireSound = "CW_KAC_PDW_FIRE"
SWEP.FireSoundSuppressed = "CW_KAC_PDW_FIRE_SUPPRESSED"
SWEP.Recoil = 0.5
SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 1.7
SWEP.ReloadTime_Empty = 2
SWEP.ReloadHalt = 1.5
SWEP.ReloadHalt_Empty = 1.9
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end