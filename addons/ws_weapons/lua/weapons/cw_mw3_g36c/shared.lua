AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "G36C (MW3)"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.3
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0.5
	SWEP.ForeGripOffsetCycle_Reload = 0.75
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_mw3_g36c.mdl"
	SWEP.WMPos = Vector(0,0,-0.5)
	SWEP.WMAng = Vector(-3,1,180)
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-1.747, -1.680, 0.441)
	SWEP.IronsightAng = Vector(0.241, 0.002, 0)
	
	SWEP.EoTechPos = Vector(-1.747, -2.069, -0.24)
	SWEP.EoTechAng = Vector(0.555, 0, 0)

	SWEP.CoD4ReflexPos = Vector(-1.754, -2.002, 0.142)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)

	SWEP.CoD4TascoPos = Vector(-1.749, -2.192, 0.314)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-1.747, -1.607, 0.081)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(-1.737, -1.762, -0.031)

	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(0, 0, -1.497)
	SWEP.M203Ang = Vector(6.39, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(1.472, 0, 0.651)


	SWEP.SprintAng = Vector(-16.187, 28.302, 0)
		
	SWEP.CustomizePos = Vector(2.246, -0.449, 0)

	SWEP.CustomizeAng = Vector(8.899, 37.242, 0)

	SWEP.CustomizationMenuScale = 0.010
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.211, -4, -0.95), [2] = Vector(-2, 0, 0)}}

	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "j_elbow_le"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_cod4_aimpoint_v2"] = {model = "models/v_cod4_aimpoint.mdl", bone = "tag_weapon", rel = "", pos = Vector(-1.31, 0, -0.064), angle = Angle(0, 180, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "tag_weapon", rel = "", pos = Vector(-7.552, -0.22, -6.613), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "tag_weapon", rel = "", pos = Vector(-1.366, 0, 0.112), angle = Angle(0, 180, 0), size = Vector(0.55, 0.55, 0.55)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "tag_weapon", rel = "", pos = Vector(-1.012, 0.273, -1.66), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "tag_weapon", rel = "", pos = Vector(-0.362, -0.009, -0.708), angle = Angle(0, 90, 0.924), size = Vector(0.5, 0.5, 0.5)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "tag_weapon", rel = "", pos = Vector(1.305, -0.019, 2.061), angle = Angle(0, -90, 0), size = Vector(0.28, 0.28, 0.28)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "tag_weapon", rel = "", pos = Vector(-3.215, -0.044, -0.774), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_lasersight"] = {model = "models/rageattachments/anpeqbf.mdl", bone = "tag_weapon", rel = "", pos = Vector(7.861, 0.674, 1.526), angle = Angle(0, 0, 180), size = Vector(0.699, 0.699, 0.699)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "j_gun", rel = "", pos = Vector(-12.36, -3.07, 3.903), angle = Angle(0, 0, 0), size = Vector(1.299, 1.299, 1.299), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-2.76, 2.651, 1.386), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
		["j_mid_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 25.111, 0) },
	
		["j_index_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 82.413, 32.266) },
	
		["j_ring_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 35.077, 0) },
	
		["j_pinky_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-1.15, 31.263, 3.68) },
	
		["j_mid_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 59.055, 11.737) },
	
		["j_elbow_le"] = { scale = Vector(1, 1, 1), pos = Vector(-0.188, 1.651, -0.357), angle = Angle(12.373, -20.171, 40.231) },
	
		["j_ring_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 41.894, 16.045) },
	
		["j_wrist_le"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-22.552, -8.436, 18.975) },
	
		["j_thumb_le_0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-20.539, -4.443, 0) },
	
		["j_pinky_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 49.754, 0) },
	
		["j_thumb_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -33.925, 0) },
	
		["j_ring_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 45.733, 0) },
	
		["j_pinky_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 75.999, 0) },
	
		["j_index_le_1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 39.769, 0) },
	
		["j_thumb_le_2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -61.514, 0) }
	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(-0.1, -5, 0.5)
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 
end

SWEP.SightBGs = {main = 1, none = 1}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500}, atts = {"md_microt1", "md_eotech", "md_csgo_acog"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_saker"}},
	[3] = {header = "Handguard", offset = {-400, 0}, atts = {"md_foregrip"}},
	[4] = {header = "Rail", offset = {250, 400}, atts = {"md_lasersight"}},
	["+attack2"] = {header = "Perks", offset = {-400, -500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 4, "md_cod4_aimpoint_v2")		
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.69, sound = "CW_MW3_G36C_MAGOUT"},
	[2] = {time = 1.12, sound = "CW_MW3_G36C_MAGIN"}},

	reload_empty = {[1] = {time = 0.69, sound = "CW_MW3_G36C_MAGOUT"},
	[2] = {time = 1.12, sound = "CW_MW3_G36C_MAGIN"},
	[3] = {time = 2.06, sound = "CW_MW3_G36C_BOLTBACK"},
	[4] = {time = 2.29, sound = "CW_MW3_G36C_BOLTFORWARD"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_mw3_g36c.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_mw3_g36c.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 90
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 60/769
SWEP.FireSound = "CW_MW3_G36C_FIRE"
SWEP.FireSoundSuppressed = "CW_MW3_G36C_FIRE_SUPPRESSED"
SWEP.Recoil = 0.55

SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.07
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = 0.4

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.23
SWEP.ReloadTime_Empty = 2.26
SWEP.ReloadHalt = 1.7
SWEP.ReloadHalt_Empty = 2.7
SWEP.SnapToIdlePostReload = false