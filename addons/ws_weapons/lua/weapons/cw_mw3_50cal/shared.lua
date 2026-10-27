AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Barrett .50 Cal"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePsMod = {x = 2, y = 0, z = -3}
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 1.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = -25, z = 3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	SWEP.AimBreathingEnabled = true
	SWEP.FullAimViewModelRecoil = false

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_snip_50c.mdl"
	SWEP.WMPos = Vector(-0.5, -1.2, 2)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-0.076, -4.009, 1.407)
	SWEP.IronsightAng = Vector(1.83, 0, 0)

	SWEP.FoldSightPos = Vector(2.111, -1, 0.225)
	SWEP.FoldSightAng = Vector(0.096, -0.009, 0)
	
	SWEP.EoTechPos = Vector(2.578, -5.018, 0.717)


	SWEP.EoTechAng = Vector(1.787, 0, 0)
	
	SWEP.AimpointPos = Vector(2.572, -3.119, 1.11)

	SWEP.AimpointAng = Vector(0, -0.135, 0)
	
	SWEP.MicroT1Pos = Vector(2.586, -3.122, 1.171)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(2.579, -3.122, 1.277)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)

	SWEP.LeupoldPos = Vector(2.598, -3.004, 0.94)


	SWEP.LeupoldAng = Vector(0, 0, 0)

	SWEP.B50CSPos = Vector(2.582, -2.948, 1.101)
	SWEP.B50CSAng = Vector(0, 0, 0)

	SWEP.RscopePos = Vector(2.565, -2.662, 1.503)
	SWEP.RscopeAng = Vector(0, 0, 0)

	SWEP.CSGOACOGPos = Vector(2.563, -3.119, 0.904)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)

	SWEP.CSGOSSGPos = Vector(2.551, -1.779, 0.958)
	SWEP.CSGOSSGAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-4.422, -0.403, -1.407)
	SWEP.SprintAng = Vector(-13.367, -36.584, 28.843)

	SWEP.PronePos = Vector(-0.668, -10.417, -4.231)
	SWEP.ProneAng = Vector(3.262, -70, 29.052)

	SWEP.CustomizePos = Vector(-7.84, 0.574, 0.187)
	SWEP.CustomizeAng = Vector(12.663, -28.844, -9.849)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-1.606, -1.107, -1.5), [2] = Vector(0, 0, 0)}}

	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -40}
	SWEP.LeupoldAxisAlign = {right = -0.010, up = -0.050, forward = 0}
	SWEP.CSGOSSGAxisAlign = {right = 0, up = 0, forward = 145}
	SWEP.BFRIFLEAxisAlign = {right = 0.010, up = -0.050, forward = 0}
	SWEP.B50CSAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.M203Pos = Vector(0, -1, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.M203OffsetCycle_Reload = 0.81
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Left_U_Arm"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.M203HoldPos = {
		["Left_U_Arm"] = { scale = Vector(1, 1, 1), pos = Vector(2.046, -2.323, -1.992), angle = Angle(0, 0, 0)}
	}

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "DrawCall_16", rel = "", pos = Vector(0.321, -7.604, 3.256), angle = Angle(0, -180, 180), size = Vector(1.1, 1.1, 1.1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "DrawCall_16", rel = "", pos = Vector(-0.301, -11.811, 9.925), angle = Angle(0, -90, 180), size = Vector(1.2, 1.2, 1.2)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "DrawCall_16", rel = "", pos = Vector(0.02, -4.382, 0.409), angle = Angle(0, 90, 180), size = Vector(1, 1, 1)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "DrawCall_16", rel = "", pos = Vector(0.075, -2.108, -4.292), angle = Angle(0, -90, 180), size = Vector(2, 2, 2)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "DrawCall_16", rel = "", pos = Vector(0.075, -2.108, -4.292), angle = Angle(0, -90, 180), size = Vector(2, 2, 2)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "DrawCall_16", rel = "", pos = Vector(0.013, 0.007, -3.158), angle = Angle(0, 0, 180), size = Vector(0.5, 0.5, 0.5)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "G3SG1", pos = Vector(-3.34, 7.82, -5.904), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_csgo_scope_ssg"] = {model = "models/kali/weapons/csgo/eq_optic_scope_ssg08.mdl", bone = "DrawCall_16", rel = "", pos = Vector(-0.042, 0.351, -2.689), angle = Angle(0, -90, 180), size = Vector(1, 1, 1)},
		["md_50cal_scope"] = {model = "models/attachments/v_50cal_scope.mdl", bone = "DrawCall_16", rel = "", pos = Vector(-2.531, 0.612, -1.397), angle = Angle(180, -90, 0), size = Vector(1, 1, 1)},
		["md_csgo_silencer_ballistic"] = {model = "models/kali/weapons/csgo/eq_dsr50_suppressor.mdl", bone = "DrawCall_17", rel = "", pos = Vector(0.112, -26.750, -0.345), angle = Angle(0, -90, 0), size = Vector(2, 2, 2)},
		["md_csgo_acog"] = {model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "DrawCall_16", rel = "", pos = Vector(-0.031, -8.211, 2.038), angle = Angle(0, -90, 180), size = Vector(1.1, 1.1, 1.1)},
		["md_50cal_bipod"] = {model = "models/attachments/c_50cal_bipod.mdl", bone = "DrawCall_16", rel = "", pos = Vector(0, 14.42, -0.405), angle = Angle(0, -90, 180), size = Vector(0.649, 0.649, 0.649)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "DrawCall_16", rel = "", pos = Vector(-2.61, -8.973, -4.45), angle = Angle(0, -90, -180), size = Vector(1.1, 1.1, 1.1), animated = true}
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

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	SWEP.CustomizationMenuScale = 0.02
end

SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {600, -500},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_csgo_acog", "md_50cal_scope", "md_csgo_scope_ssg"}},
	[2] = {header = "Barrel", offset = {-250, -500},  atts = {"md_csgo_silencer_ballistic"}},
	[3] = {header = "Handguard", offset = {-250, 300}, atts = {"md_50cal_bipod"}},
	["+attack2"] = {header = "Perks", offset = {1450, 100}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {100, -500}, atts = {"am_magnum", "am_matchgrade"}}}

	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
		table.insert(SWEP.Attachments[1].atts, 6, "md_fas2_leupold")		
end

SWEP.BarrelBGs = {main = 2, none = 1}

SWEP.Animations = {fire = "shoot1",
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0, sound = "CW_MW3_50CAL_MAGOUT"},
	[2] = {time = 2.2, sound = "CW_MW3_50CAL_MAGIN"},
	[3] = {time = 3, sound = "CW_MW3_50CAL_BOLT"}}}

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

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_barrett_50cal.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_snip_50c.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "50 BMG"

SWEP.FireDelay = 0.05
SWEP.FireSound = "CW_MW3_50CAL_FIRE"
SWEP.FireSoundSuppressed = "CW_MW3_50CAL_FIRE_SUPPRESSED"
SWEP.Recoil = 4.2

SWEP.ADSFireAnim = false
SWEP.BipodFireAnim = true
SWEP.ForceBackToHipAfterAimedShot = false

SWEP.HipSpread = 0.35
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.8
SWEP.SpreadPerShot = 0.55
SWEP.SpreadCooldown = 0.05
SWEP.Shots = 1
SWEP.Damage = 300
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 2.8
SWEP.ReloadTime_Empty = 3.3
SWEP.ReloadHalt = 2.2
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = true