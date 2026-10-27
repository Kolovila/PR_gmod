AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Remington M24"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_sr25"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellDelay = 0.7
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	SWEP.AimBreathingEnabled = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_m24_sniper.mdl"
	SWEP.WMPos = Vector(-1.5,0.7,1)
	SWEP.WMAng = Vector(-7,-90,180)
	
	SWEP.IronsightPos = Vector(-2.507, -2.448, 1.013)

	SWEP.IronsightAng = Vector(-2.83, -0.049, 0)

	SWEP.CoD4ReflexPos = Vector(-2.487, -2.369, 1.282)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.487, -6.877, 0.87)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.5, -2.757, 1.429)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(-2.461, -1.410, 1.055)

	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.501, -2.175, 1.195)

	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.LeupoldPos = Vector(-2.513, -3.127, 0.916)

	SWEP.LeupoldAng = Vector(0, 0, 0)

	SWEP.CSGOSSGPos = Vector(-2.472, 0, 0.973)
	SWEP.CSGOSSGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(2.371, 0, 1.69)

	SWEP.SprintAng = Vector(-25.132, 25.26, -10.733)

	SWEP.CustomizePos = Vector(3.788, -1.479, -0.08)
	SWEP.CustomizeAng = Vector(8.552, 34.962, 3.711)
	
	SWEP.AlternativePos = Vector(0, 1.325, -0.801)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-1.601, -1.157, -0.299)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-1.606, -1.107, -1.5), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = false
	SWEP.CSGOACOGAxisAlign = {right = -0.1, up = -0.1, forward = -40}
	SWEP.LeupoldAxisAlign = {right = 1, up = 0, forward = 0}
	SWEP.CSGOSSGAxisAlign = {right = 0, up = 0, forward = 145}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.M203Pos = Vector(0, -1, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ReticleInactivityPostFire = 1.2
	
	SWEP.M203OffsetCycle_Reload = 0.81
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = {pos = Vector(4.461, 0.308, -2.166), angle = Angle(0, 0, 0)}
	}

	SWEP.AttachmentModelsVM = {
		["md_cod4_aimpoint_v2"] = {model = "models/v_cod4_aimpoint.mdl", bone = "body", rel = "", pos = Vector(-0.053, 5.782, 0.935), angle = Angle(0, -90, 180), size = Vector(0.8, 0.8, 0.8)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "body", rel = "", pos = Vector(0.209, 9.336, 9.015), angle = Angle(180, -90, 0), size = Vector(1, 1, 1)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(-0.051, 2.792, -1.864), angle = Angle(180, 0, 0), size = Vector(0.349, 0.349, 0.349)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "body", rel = "", pos = Vector(-0.055, 5.572, 0.416), angle = Angle(180, 90, 0), size = Vector(0.649, 0.649, 0.649)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "body", rel = "", pos = Vector(-0.09, 2.779, -2.797), angle = Angle(-180, -90, 0), size = Vector(1.5, 1.5, 1.5)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "body", rel = "", pos = Vector(-0.09, 2.779, -2.797), angle = Angle(-180, -90, 0), size = Vector(1.5, 1.5, 1.5)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "G3SG1", pos = Vector(-3.34, 7.82, -5.904), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "body", rel = "", pos = Vector(-0.038, -8.846, -3.474), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_csgo_scope_ssg"] = {model = "models/kali/weapons/csgo/eq_optic_scope_ssg08.mdl", bone = "body", rel = "", pos = Vector(0, 1.335, -1.548), angle = Angle(180, -90, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_bfriflescope"] = {model = "models/rageattachments/sniperscopesv.mdl", bone = "smdimport", rel = "", pos = Vector(-0.095, 5.428, 1.319), angle = Angle(0, 0, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_hk416_bipod"] = {model = "models/c_bipod.mdl", bone = "body", rel = "", pos = Vector(0, -12.459, 1.802), angle = Angle(180, 180, 0), size = Vector(1.299, 1.299, 1.299)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "body", rel = "", pos = Vector(0.002, 7.81, 1.407), angle = Angle(0, 90, 180), size = Vector(0.699, 0.699, 0.699)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "G3SG1_Rail", pos = Vector(-0.278, -5.081, -4.053), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)}
	}

	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(-8.907, 29.332, 27.155) },
		["Bip01 L Finger41"] = {pos = Vector(0, 0, 0), angle = Angle(0, 3.367, 0) },
		["Bip01 L Clavicle"] = {pos = Vector(4.335, -6.652, -3.984), angle = Angle(-42.875, 42.837, 0) },
		["Bip01 L Finger22"] = {pos = Vector(0, 0, 0), angle = Angle(0, -13.565, 0) },
		["Bip01 L Finger31"] = {pos = Vector(0, 0, 0), angle = Angle(0, 9.633, 0) },
		["Bip01 L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 96.544, 0) },
		["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.826, 0) },
		["Bip01 L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(-3.777, 13.736, 42.478) },
		["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(-4.395, 78.736, 22.27) },
		["Bip01 L Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 58.242, 0) },
		["Bip01 L Hand"] = {pos = Vector(0, 0, 0), angle = Angle(5.883, 57.971, -2.382) },
		["Bip01 L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 18.07, 0) },
		["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(33.303, 1.07, 0) },
		["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, 28.163, 0) },
		["Bip01 L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 25.208, 0) },
		["Bip01 L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 19.94, 0) },
		["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(-5.336, 58.977, 28.6) }
	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
end

SWEP.SightBGs = {main = 1, none = 1}
SWEP.LuaViewmodelRecoil = false
SWEP.BipodFireAnim = true
SWEP.ADSFireAnim = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {600, -300},  atts = {"md_microt1", "md_eotech", "md_csgo_acog", "md_csgo_scope_ssg"}},
	[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
	[3] = {header = "Handguard", offset = {-250, 150}, atts = {}},
	["+attack2"] = {header = "Perks", offset = {-250, 600}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {600, 100}, atts = {"am_magnum", "am_matchgrade"}}}

if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 5, "md_fas2_leupold")
		table.insert(SWEP.Attachments[1].atts, 4, "md_cod4_aimpoint_v2")
		table.insert(SWEP.Attachments[3].atts, 1, "md_hk416_bipod")		
end

SWEP.Animations = {fire = {"shoot"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.15, sound = "CW_REM_M24_BOLTBACK"},
	[3] = {time = 0.35, sound = "CW_REM_M24_BOLTFORWARD"}},

	shoot = {[1] = {time = 0.4, sound = "CW_REM_M24_BOLTBACK"},
	[2] = {time = 0.7, sound = "CW_REM_M24_BOLTFORWARD"}},

	reload = {[1] = {time = 0.55, sound = "CW_REM_M24_MAGOUT"},
	[2] = {time = 1.67, sound = "CW_REM_M24_MAGIN"}},
	
	reload_empty = {[1] = {time = 0.35, sound = "CW_REM_M24_BOLTBACK"},
	[2] = {time = 1.37, sound = "CW_REM_M24_MAGOUT"},
	[3] = {time = 2.45, sound = "CW_REM_M24_MAGIN"},
	[4] = {time = 2.92, sound = "CW_REM_M24_BOLTFORWARD"}}}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_m24_sniper.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_m24_sniper.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 60/50
SWEP.FireSound = "CW_REM_M24_FIRE"
SWEP.FireSoundSuppressed = "CW_REM_M24_FIRE_SUPPRESSED"
SWEP.Recoil = 1.5

SWEP.HipSpread = 0.250
SWEP.AimSpread = 0.00001
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.5
SWEP.SpreadPerShot = 0.25
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 135
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.72
SWEP.ReloadTime_Empty = 2.97
SWEP.ReloadHalt = 2.05
SWEP.ReloadHalt_Empty = 3.27

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end