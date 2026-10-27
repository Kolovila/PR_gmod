AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "PSG-1 [Black Ops Variant]"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	SWEP.AimBreathingEnabled = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_bo_psg1.mdl"
	SWEP.WMPos = Vector(0.5, 0.5, 0.5)
	SWEP.WMAng = Vector(0, -90, 180)
	
	SWEP.IronsightPos = Vector(-1.877, -2.639, 1.05)

	SWEP.IronsightAng = Vector(-0.371, 0, 0)

	SWEP.IsightsPos = Vector(-1.871, -4.419, 0.671)

	SWEP.IsightsAng = Vector(0.815, 0.09, 0)

	SWEP.CoD4ReflexPos = Vector(-1.875, -3.29, 0.418)
	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-1.874, -2.786, -0.01)
	SWEP.EoTechAng = Vector(1.934, 0, 0)
	
	SWEP.AimpointPos = Vector(-1.885, -4.113, 0.4)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-1.872, -3.645, 0.428)
	SWEP.MicroT1Ang = Vector(0.14, 0.128, 0)
	
	SWEP.CSGOACOGPos = Vector(-1.861, -3.646, 0.289)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.PSG1Pos = Vector(-1.88, -2.638, 0.316)
	SWEP.PSG1Ang = Vector(0, 0, 0)
	
	SWEP.LeupoldPos = Vector(-1.879, -3.646, 0.351)

	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-1.606, -1.107, -1.5), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = true
	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	SWEP.PSG1AxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.LeupoldAxisAlign = {right = 0.08, up = 0.05, forward = 0}

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

	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 0, forward = 15, pitch = 4}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = {pos = Vector(4.461, 0.308, -2.166), angle = Angle(0, 0, 0)}
	}

	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/wystan/attachments/rail.mdl", bone = "g3_low", rel = "", pos = Vector(-0.898, 0.101, 0.51), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "g3_low", rel = "", pos = Vector(-4.861, 0.094, -1.619), angle = Angle(0, 90, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "g3_low", rel = "", pos = Vector(-3.679, -0.064, -0.014), angle = Angle(0, 180, 0), size = Vector(0.55, 0.55, 0.55)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "g3_low", rel = "", pos = Vector(-1.82, -0.057, 2.466), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "g3_low", rel = "", pos = Vector(-1.82, -0.057, 2.466), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "g3_low", rel = "", pos = Vector(-9.796, -0.285, -6.811), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_attironsights"] = {model = "models/zozzie/p90smgrearsight.mdl", bone = "g3_low", rel = "", pos = Vector(-1.252, -0.042, 1.314), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699)},
		["md_couldbewhat"] = {model = "models/zozzie/p90smgfrontsight.mdl", bone = "g3_low", rel = "", pos = Vector(14.413, -0.144, 1.113), angle = Angle(0, 0, 0), size = Vector(0.899, 0.899, 0.899)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "g3_low", rel = "", pos = Vector(-1.135, -0.073, 1.921), angle = Angle(0, -90, 0), size = Vector(0.25, 0.25, 0.25)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "G3SG1", pos = Vector(-3.34, 7.82, -5.904), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_csgo_silencer_rifle"] = {model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "g3_low", rel = "", pos = Vector(22.822, -0.053, -0.255), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "g3_low", rel = "", pos = Vector(-5.363, -0.109, -0.948), angle = Angle(0, 0, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_psg1_scope"] = {model = "models/attachments/v_psg1_scope.mdl", bone = "g3_low", rel = "", pos = Vector(-0.2, -1.282, 0.646), angle = Angle(0, 0, 0), size = Vector(0.27, 0.27, 0.27)},
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
end

SWEP.BipodBGs = {main = 1, bipod_on = 1, bipod_off = 0, none = 0}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {900, -300},  atts = {"md_attironsights", "md_microt1", "md_eotech", "md_aimpoint", "md_csgo_acog", "md_psg1_scope"}},
	[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_csgo_silencer_rifle"}},
	[3] = {header = "Bipod", offset = {250, -300},  atts = {"bg_psg1_bipod"}},
	["+attack2"] = {header = "Perks", offset = {-250, 150}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {600, 150}, atts = {"am_magnum", "am_matchgrade"}}}

if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 3, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 7, "md_fas2_leupold")		
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},
	
	reload = {[1] = {time = 0.18, sound = "CW_BLOPS_PSG1_BOLTBACK"},
	[2] = {time = 1.2, sound = "CW_BLOPS_PSG1_MAGOUT"},
	[3] = {time = 2.85, sound = "CW_BLOPS_PSG1_MAGTAP"},
	[4] = {time = 3.25, sound = "CW_BLOPS_PSG1_MAGIN"},
	[5] = {time = 4.25, sound = "CW_BLOPS_PSG1_BOLTFORWARD"}}}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_bo_psg1.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_bo_psg1.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.2564102564102564
SWEP.FireSound = "CW_BLOPS_PSG1_FIRE"
SWEP.FireSoundSuppressed = "CW_BLOPS_PSG1_FIRE_SUPPRESSED"
SWEP.Recoil = 1.3

SWEP.HipSpread = 0.4
SWEP.AimSpread = 0.00001
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.95
SWEP.SpreadPerShot = 0.25
SWEP.SpreadCooldown = 0.02
SWEP.Shots = 1
SWEP.Damage = 90
SWEP.DeployTime = 0.7

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 4.7
SWEP.ReloadTime_Empty = 4.7
SWEP.ReloadHalt = 3.05
SWEP.ReloadHalt_Empty = 4.85