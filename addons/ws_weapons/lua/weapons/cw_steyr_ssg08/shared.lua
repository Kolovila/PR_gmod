AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Steyr SSG 08"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_sr25"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.55
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	SWEP.ShellDelay = 0.75
	SWEP.AimBreathingEnabled = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_steyr_ssg08.mdl"
	SWEP.WMPos = Vector(-0.5, 0, 1.1)
	SWEP.WMAng = Vector(-9, 0, 180)
	
	SWEP.IronsightPos = Vector(3.102, -6.827, 0.85)
	SWEP.IronsightAng = Vector(-2.62, 0.141, 0)

	SWEP.EoTechPos = Vector(3.071, -7.34, 0.777)
	SWEP.EoTechAng = Vector(0, 0.068, 0)

	SWEP.LeupoldPos = Vector(-2.794, -4.398, 0.634)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.816, -4.398, 0.907)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(3.095, -5.72, 0.72)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.ShortDotPos = Vector(3.062, -6.776, 0.995)
	SWEP.ShortDotAng = Vector(0, 0, 0)

	SWEP.CoD4ReflexPos = Vector(3.105, -6.067, 0.771)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(3.084, -6.281, 0.758)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)

	SWEP.CSGOSSGPos = Vector(3.056, -4.194, 0.73)
	SWEP.CSGOSSGAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(-5.843, 0, -0.528)
	SWEP.CustomizeAng = Vector(6.171, -29.816, -1.969)
	
	SWEP.SprintPos = Vector(-1.81, -2.25, 1.667)
	SWEP.SprintAng = Vector(-26.351, -30.788, 9.871)
	
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
	
	SWEP.M203OffsetCycle_Reload = 0.81
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)

	SWEP.ReticleInactivityPostFire = 1.5
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = {pos = Vector(4.461, 0.308, -2.166), angle = Angle(0, 0, 0)}
	}

	SWEP.AttachmentModelsVM = {
		["md_cod4_aimpoint_v2"] = {model = "models/v_cod4_aimpoint.mdl", bone = "Base", rel = "", pos = Vector(-0.035, -5.343, -2.139), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Base", rel = "", pos = Vector(-0.181, 11.321, -9.287), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "Base", rel = "", pos = Vector(0.14, 3.829, -1.821), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Base", rel = "", pos = Vector(0.109, -0.269, 1.702), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "G3SG1", pos = Vector(-3.34, 7.82, -5.904), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_lasersight"] = {model = "models/rageattachments/anpeqbf.mdl", bone = "Base", rel = "", pos = Vector(1.097, -12.389, 0.865), angle = Angle(0, 90, 180), size = Vector(0.8, 0.8, 0.8)},
		["md_csgo_scope_ssg"] = {model = "models/kali/weapons/csgo/eq_optic_scope_ssg08.mdl", bone = "Base", rel = "", pos = Vector(0.057, -0.208, 1.335), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_l115a3_scope"] = {model = "models/atts/aw_scope.mdl", bone = "Base", rel = "", pos = Vector(2.763, -10.728, 1.963), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "Base", rel = "", pos = Vector(0.008, -22.847, -0.08), angle = Angle(0, 90, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_hk416_bipod"] = {model = "models/c_bipod.mdl", bone = "Base", rel = "", pos = Vector(0.076, -12.947, -1.211), angle = Angle(0, 180, 0), size = Vector(1, 1, 1)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "Base", rel = "", pos = Vector(0.391, 4.714, -3.06), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_pgm_bipod"] = {model = "models/attachments/pgm_hecate_bipod.mdl", bone = "gun-main", rel = "", pos = Vector(13.217, 0.291, -0.339), angle = Angle(0, 0, -90), size = Vector(0.4, 0.4, 0.4)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "Base", rel = "", pos = Vector(0.076, 5.916, -2.047), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "G3SG1", pos = Vector(-0.583, 3.305, -1.293), angle = Angle(2.538, -90, 0), size = Vector(1, 1, 1), animated = true}
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
	
	SWEP.LaserPosAdjust = Vector(-0.5, 7, 2.5)
	SWEP.LaserAngAdjust = Angle(0, 0, 0)

end

SWEP.SightBGs = {main = 1, none = 1}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {600, -300},  atts = {"md_microt1", "md_eotech", "md_schmidt_shortdot", "md_csgo_acog", "md_csgo_scope_ssg"}},
	[2] = {header = "Barrel", offset = {-500, -400},  atts = {"md_csgo_silencer_rifle"}},
	[3] = {header = "Handguard", offset = {-500, -0}, atts = {}},
	[4] = {header = "Laser", offset = {0, -700}, atts = {"md_lasersight"}},
	["+attack2"] = {header = "Perks", offset = {-500, 500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {600, 200}, atts = {"am_magnum", "am_matchgrade"}}}

if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
		table.insert(SWEP.Attachments[3].atts, 1, "md_hk416_bipod")		
end

SWEP.Animations = {fire = {"fire"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	fire = {[1] = {time = 0.55, sound = "CW_STEYR_SSG08_BOLTBACK"},
	[2] = {time = 0.75, sound = "CW_STEYR_SSG08_BOLTDOWN"},
	[3] = {time = 0.95, sound = "CW_STEYR_SSG08_BOLTFORWARD"}},

	reload = {[1] = {time = 0.45, sound = "CW_STEYR_SSG08_BOLTTAP"},
	[2] = {time = 0.88, sound = "CW_STEYR_SSG08_MAGOUT"},
	[3] = {time = 1.52, sound = "CW_STEYR_SSG08_MAGTAP"},
	[4] = {time = 1.87, sound = "CW_STEYR_SSG08_MAGIN"}},

	reload_empty = {[1] = {time = 0.45, sound = "CW_STEYR_SSG08_BOLTTAP"},
	[2] = {time = 0.88, sound = "CW_STEYR_SSG08_MAGOUT"},
	[3] = {time = 1.52, sound = "CW_STEYR_SSG08_MAGTAP"},
	[4] = {time = 1.87, sound = "CW_STEYR_SSG08_MAGIN"},
	[5] = {time = 2.02, sound = "CW_FOLEY_light"},
	[6] = {time = 2.35, sound = "CW_STEYR_SSG08_BOLTBACK"},
	[7] = {time = 2.55, sound = "CW_STEYR_SSG08_BOLTDOWN"},
	[8] = {time = 2.85, sound = "CW_STEYR_SSG08_BOLTFORWARD"}}}

SWEP.SpeedDec = 30

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
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_steyr_ssg08.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_steyr_ssg08.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ADSFireAnim = true
SWEP.BipodFireAnim = true
SWEP.ForceBackToHipAfterAimedShot = false

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 24
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".338 Lapua"

SWEP.FireDelay = 1.5
SWEP.FireSound = "CW_STEYR_SSG08_FIRE"
SWEP.FireSoundSuppressed = "CW_STEYR_SSG08_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.350
SWEP.AimSpread = 0.0001
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.55
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.17
SWEP.Shots = 1
SWEP.Damage = 120
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 2.4
SWEP.ReloadTime_Empty = 3.1
SWEP.ReloadHalt = 2.6
SWEP.ReloadHalt_Empty = 3.3