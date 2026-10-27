AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "PGM Hecate Ultima Ratio II"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzle_center_M82"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 1
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ShellDelay = 0.9
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.ReticleInactivityPostFire = 1.6
	SWEP.AimBreathingEnabled = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_sinon_hecate.mdl"
	SWEP.WMPos = Vector(-0.5, 0, 1.1)
	SWEP.WMAng = Vector(-9, 0, 180)
	
	SWEP.IronsightPos = Vector(-3.596, -4.494, 0.772)

	SWEP.IronsightAng = Vector(0.356, 0, 0)
	
	SWEP.EoTechPos = Vector(-3.612, -4.981, 0.976)
	SWEP.EoTechAng = Vector(0, 0, 0)

	SWEP.LeupoldPos = Vector(-3.619, -5.145, 0.837)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-3.583, -4.182, 1.128)

	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-3.606, -4.476, 1.036)

	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.RscopePos = Vector(-3.645, -3.630, 1.080)
	SWEP.RscopeAng = Vector(0, 0, 0)

	SWEP.CoD4ReflexPos = Vector(-3.576, -5.172, 1.171)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(-3.589, -4.716, 0.999)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)

	SWEP.CSGOSSGPos = Vector(-3.564, -3.382, 1.024)
	SWEP.CSGOSSGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(2.407, 0, 0)

	SWEP.SprintAng = Vector(-19.341, 35.276, -16.581)

	SWEP.PronePos = Vector(0.462, -10.349, -3.152)
	SWEP.ProneAng = Vector(-19.585, 67.98, -51.23)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-1.606, -1.107, -1.5), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = false
	SWEP.CSGOACOGAxisAlign = {right = -0.1, up = -0.1, forward = -40}
	SWEP.LeupoldAxisAlign = {right = 1, up = 0, forward = 0}
	SWEP.CSGOSSGAxisAlign = {right = 0, up = 0, forward = 145}
	SWEP.BFRIFLEAxisAlign = {right = -0.02, up = 0, forward = 0}

	SWEP.M203Pos = Vector(0, -1, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.M203OffsetCycle_Reload = 0.81
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	SWEP.DryFire = true
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = {pos = Vector(4.461, 0.308, -2.166), angle = Angle(0, 0, 0)}
	}

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "tag_weapon", rel = "", pos = Vector(-3.631, 0.305, -1.596), angle = Angle(0, 90, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "tag_weapon", rel = "", pos = Vector(-9.466, -0.166, -7.25), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "tag_weapon", rel = "", pos = Vector(-1.862, 0.071, 0.688), angle = Angle(0, 180, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "tag_weapon", rel = "", pos = Vector(1.006, 0.122, 4.75), angle = Angle(0, 0, 0), size = Vector(1.799, 1.799, 1.799)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "tag_weapon", rel = "", pos = Vector(1.006, 0.122, 4.75), angle = Angle(0, 0, 0), size = Vector(1.799, 1.799, 1.799)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "tag_weapon", rel = "", pos = Vector(1.687, 0.081, 3.721), angle = Angle(0, -90, 0), size = Vector(0.449, 0.449, 0.449)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "G3SG1", pos = Vector(-3.34, 7.82, -5.904), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_lasersight"] = {model = "models/rageattachments/anpeqbf.mdl", bone = "tag_weapon", rel = "", pos = Vector(17.041, -1.459, 0.628), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_csgo_scope_ssg"] = {model = "models/kali/weapons/csgo/eq_optic_scope_ssg08.mdl", bone = "tag_weapon", rel = "", pos = Vector(2.46, 0.02, 3.285), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_bfriflescope"] = {model = "models/rageattachments/sniperscopesv.mdl", bone = "tag_weapon", rel = "", pos = Vector(1.546, 0.186, 3.193), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "tag_weapon", rel = "", pos = Vector(42.884, 0.074, 0.916), angle = Angle(0, 0, 0), size = Vector(1.5, 1.5, 1.5)},
		["md_attironsights"] = {model = "models/bunneh/rearsight.mdl", bone = "gun-main", rel = "", pos = Vector(4.485, -3.368, -2.247), angle = Angle(1.437, 180, 90), size = Vector(0.85, 0.85, 0.85)},
		["md_couldbewhat"] = {model = "models/bunneh/frontsight.mdl", bone = "gun-main", rel = "", pos = Vector(37.955, -4.416, -3.529), angle = Angle(180, 3, -90), size = Vector(1.5, 1.5, 1.5)},
		["md_hk416_bipod"] = {model = "models/c_bipod.mdl", bone = "gun-main", rel = "", pos = Vector(11.645, 0.382, -0.269), angle = Angle(-90, 90, 0), size = Vector(1.2, 1.2, 1.2)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "tag_weapon", rel = "", pos = Vector(-4.361, 0.035, -0.327), angle = Angle(0, 0, 0), size = Vector(0.85, 0.85, 0.85)},
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
	SWEP.CustomizationMenuScale = 0.025

	SWEP.LaserPosAdjust = Vector(0.7, 1, 0.2)
	SWEP.LaserAngAdjust = Angle(0.5, 0, 0)

end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.BipodBGs = {main = 3, pgm_bipod_down = 1, pgm_bipod_up = 0}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {600, -300},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_csgo_acog", "md_bfriflescope", "md_csgo_scope_ssg"}},
	[2] = {header = "Barrel", offset = {-500, -400},  atts = {"md_csgo_silencer_rifle"}},
	[3] = {header = "Handguard", offset = {-500, -0}, atts = {"bg_pgm_bipod"}},
	[4] = {header = "Laser", offset = {0, -700}, atts = {"md_lasersight"}},
	["+attack2"] = {header = "Perks", offset = {-500, 500}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {600, 200}, atts = {"am_magnum", "am_matchgrade"}}}

if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 6, "md_fas2_leupold")		
end

SWEP.Animations = {fire = {"fire"},
	reload = "reload",
	reload_empty = "reload_empty",
	fire_dry = "last",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.35, sound = "CW_SINON_PGM_BOLTBACK"},
	[3] = {time = 0.55, sound = "CW_SINON_PGM_BOLTFORWARD"}},

	fire = {[1] = {time = 0.55, sound = "CW_SINON_PGM_BOLTBACK"},
	[2] = {time = 1.15, sound = "CW_SINON_PGM_BOLTFORWARD"}},

	reload = {[1] = {time = 0.89, sound = "CW_SINON_PGM_MAGOUT"},
	[2] = {time = 2.5, sound = "CW_SINON_PGM_MAGIN"}},

	reload_empty = {[1] = {time = 0.25, sound = "CW_SINON_PGM_BOLTBACK"},
	[2] = {time = 1.34, sound = "CW_SINON_PGM_MAGOUT"},
	[3] = {time = 2.79, sound = "CW_SINON_PGM_MAGIN"},
	[4] = {time = 3.91, sound = "CW_SINON_PGM_BOLTFORWARD"}}}

SWEP.SpeedDec = 80

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
SWEP.ViewModel		= "models/cw2/weapons/v_sinon_hecate.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_sinon_hecate.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ADSFireAnim = true
SWEP.BipodFireAnim = true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 21
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "50 BMG"

SWEP.FireDelay = 60/35
SWEP.FireSound = "CW_SINON_PGM_FIRE"
SWEP.FireSoundSuppressed = "CW_SINON_PGM_FIRE_SUPPRESSED"
SWEP.Recoil = 1.7

SWEP.HipSpread = 0.250
SWEP.AimSpread = 0.0000001
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.55
SWEP.SpreadPerShot = 0.9
SWEP.SpreadCooldown = 0.01
SWEP.Shots = 1
SWEP.Damage = 250
SWEP.DeployTime = 1
SWEP.ZoomAmount = 25

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 2.7
SWEP.ReloadTime_Empty = 4.07
SWEP.ReloadHalt = 3.05
SWEP.ReloadHalt_Empty = 4.85

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.3
	end
end