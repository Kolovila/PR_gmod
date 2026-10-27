AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Magpul PDR"
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
	SWEP.WM = "models/cw2/weapons/w_smg_pdrmm.mdl"
	SWEP.WMPos = Vector(-0.9, -7.8, -2)
	SWEP.WMAng = Vector(-10, 5, 180)
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0

	SWEP.BoltBone = "mineturtle_beyond_ur_garden"
	SWEP.BoltShootOffset = Vector(0, 2, 0)
	SWEP.HoldBoltWhileEmpty = false
	
	SWEP.IronsightPos = Vector(-2.163, -1.816, -0.205)
	SWEP.IronsightAng = Vector(0.238, 0.032, 0)

	SWEP.CoD4ReflexPos = Vector(-2.214, -2.139, -0.215)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
		
	SWEP.EoTechPos = Vector(-2.205, -3.852, -0.69)
	SWEP.EoTechAng = Vector(2.759, 0.172, 0)
	
	SWEP.AimpointPos = Vector(-2.208, -1.872, -0.308)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.21, -2.191, -0.248)
	SWEP.MicroT1Ang = Vector(-0.004, 0.075, 0)
	
	SWEP.CSGOACOGPos = Vector(-2.202, -2.273, -0.38)

	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(1.337, 0, 0.303)
	SWEP.SprintAng = Vector(-16.768, 33.222, -9.096)

	SWEP.CustomizePos = Vector(2.789, -0.44, -1.145)
	SWEP.CustomizeAng = Vector(10.657, 34.962, 0)

	SWEP.PronePos = Vector(1.029, -0.626, -1.754)

	SWEP.ProneAng = Vector(-6.849, 42.062, -22.65)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "PDR_2", rel = "", pos = Vector(-0.227, -4.636, -1.637), angle = Angle(0, 0, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "PDR_2", rel = "", pos = Vector(0.254, -9.865, -7.252), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "PDR_2", rel = "", pos = Vector(0, -5.47, -0.025), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "PDR_2", rel = "", pos = Vector(0.002, -3.141, 0.828), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "PDR_2", rel = "", pos = Vector(0.008, 0.456, 3.631), angle = Angle(0, 180, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "PDR_2", rel = "", pos = Vector(0.046, -5.055, -0.131), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
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

SWEP.SightBGs = {main = 3, none = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.CustomizationMenuScale = 0.010

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
	
SWEP.Sounds = {draw = {{time = 0.42, sound = "CW_MAG_PDR_FLIP"}},

	reload = {[1] = {time = 0.4, sound = "CW_MAG_PDR_MAGOUT"},
	[2] = {time = 1.19, sound = "CW_FOLEY_MEDIUM"},
	[3] = {time = 2.12, sound = "CW_MAG_PDR_MAGIN"},
	[4] = {time = 2.75, sound = "CW_MAG_PDR_BOLT"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_smg_pdrmm.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_smg_pdrmm.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 25
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_MAG_PDR_FIRE"
SWEP.FireSoundSuppressed = "CW_MAG_PDR_FIRE_SUPPRESSED"
SWEP.Recoil = 0.5
SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 25
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 2.5
SWEP.ReloadTime_Empty = 2.9
SWEP.ReloadHalt = 2.7
SWEP.ReloadHalt_Empty = 3.2
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end