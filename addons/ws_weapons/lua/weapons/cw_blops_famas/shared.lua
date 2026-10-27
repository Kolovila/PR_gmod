AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "FAMAS Felin (Black Ops Variant)"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_bo1_famas.mdl"
	SWEP.WMPos = Vector(-0.65, -1.7, 0.5)
	SWEP.WMAng = Vector(-5, 0, 180)

	SWEP.BoltBone = "j_bolt"
	SWEP.BoltShootOffset = Vector(-3.2, 0, 0)
	SWEP.OffsetBoltOnBipodShoot = true
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-2.837, -7.896, 0.143)

	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.BFReflexPos = Vector(-2.823, -8.313, 0.238)
	SWEP.BFReflexAng = Vector(0, 0, 0)
		
	SWEP.EoTechPos = Vector(-2.84, -8.167, -0.094)
	SWEP.EoTechAng = Vector(3.009, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.869, -8.157, 0.109)

	SWEP.AimpointAng = Vector(0, 0, 0)

	SWEP.CoD4ReflexPos = Vector(-2.819, -8.313, 0.317)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.875, -6.06, 0.079)
	SWEP.MicroT1Ang = Vector(0.209, -0.055, 0)
	
	SWEP.CSGOACOGPos =Vector(-2.816, -6.014, 0.013)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(1.641, -2.595, 0)
	SWEP.M203Ang = Vector(6.679, 0, 0)

	SWEP.SprintPos = Vector(4.609, 0.529, -2.257)
	SWEP.SprintAng = Vector(-17.014, 36.622, -27.834)

	SWEP.CustomizePos = Vector(7.782, 0, 0.787)

    	SWEP.CustomizeAng = Vector(12.336, 32.783, 18.246)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "j_elbow_le"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "j_gun", rel = "", pos = Vector(-4.507, 0.076, -0.267), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "j_gun", rel = "", pos = Vector(-9.181, -0.468, -5.428), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "j_gun", rel = "", pos = Vector(-1.856, -0.216, 2.535), angle = Angle(0, 180, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_bfreflex"] = {model = "models/rageattachments/usareddot.mdl", bone = "j_gun", rel = "", pos = Vector(2.625, -0.134, 4.699), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "j_gun", rel = "", pos = Vector(19.868, -0.215, 1.995), angle = Angle(0, 0, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "j_gun", rel = "", pos = Vector(1.628, -0.187, 5.553), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "j_gun", rel = "", pos = Vector(-6.243, -0.278, 0.776), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "smdimport001", pos = Vector(-0.225, 9.715, 3.15), angle = Angle(0, 90, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "j_gun", rel = "", pos = Vector(-9.613, -2.997, 5.269), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["j_elbow_le"] = { scale = Vector(1, 1, 1), pos = Vector(0.449, -0.899, -0.733), angle = Angle(0, 0, 0) }
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

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_microt1", "md_bfreflex", "md_eotech", "md_aimpoint", "md_csgo_acog"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_csgo_silencer_rifle"}},
	[3] = {header = "Magazine", offset = {-300, -500}, atts = {"md_rinic_extended_mag"}},
	[4] = {header = "Nade Launcher", offset = {-300, 300}, atts = {"md_m203"}},
	["+attack2"] = {header = "Perks", offset = {1200, 500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {1200, 0}, atts = {"am_magnum", "am_matchgrade"}}}
	
	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.45, sound = "CW_BLOPS_FAMAS_BOLT"}},

	reload = {[1] = {time = 0.32, sound = "CW_BLOPS_FAMAS_MAGOUT"},
	[2] = {time = 1.28, sound = "CW_BLOPS_FAMAS_MAGIN"},
	[3] = {time = 1.9, sound = "CW_BLOPS_FAMAS_BOLT"}}}

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

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_bop_famas.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_bo1_famas.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.064034151547492
SWEP.FireSound = "CW_BLOPS_FAMAS_FIRE"
SWEP.FireSoundSuppressed = "CW_BLOPS_FAMAS_FIRE_SUPPRESSED"
SWEP.Recoil = 0.52

SWEP.HipSpread = 0.085
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.09
SWEP.SpreadPerShot = 0.006
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.7
SWEP.ReloadTime_Empty = 2.5
SWEP.ReloadHalt = 1.8
SWEP.ReloadHalt_Empty = 2.7
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end