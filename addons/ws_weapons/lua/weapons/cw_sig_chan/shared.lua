AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SG 550 (Sig-chan)"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_sr25"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_sig_chan.mdl"
	SWEP.WMPos = Vector(0, -1, 0.2)
	SWEP.WMAng = Vector(-5, 0, 180)

	SWEP.BoltBone = "Bolt"
	SWEP.BoltShootOffset = Vector(0, 2.5, 0)
	SWEP.OffsetBoltOnBipodShoot = true
	
	SWEP.IronsightPos = Vector(1.646, -2.889, 0.518)

	SWEP.IronsightAng = Vector(0.33, -0.027, 0)
	
	SWEP.EoTechPos = Vector(1.661, -5.013, -0.166)
	SWEP.EoTechAng = Vector(1.36, 0, 0)
	
	SWEP.AimpointPos = Vector(1.659, -5.365, 0.195)
	SWEP.AimpointAng = Vector(0, 0, 0)

	SWEP.CSGO556Pos = Vector(1.651, -5.365, 0.232)

	SWEP.CSGO556Ang = Vector(0, 0, 0)

	SWEP.LeupoldPos = Vector(1.656, -4.033, -0.106)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(1.651, -5.013, 0.155)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-2.162, 0.192, -0.353)
	SWEP.SprintAng = Vector(-15.778, -26.233, 25.204)

	SWEP.PronePos = Vector(-0.668, -10.417, -4.231)
	SWEP.ProneAng = Vector(3.262, -70, 29.052)

	SWEP.CustomizePos = Vector(-4.601, -0.072, -0.967)
	SWEP.CustomizeAng = Vector(11.442, -23.473, -11.537)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-1.606, -1.107, -1.5), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = true
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.M203Pos = Vector(0, -1, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.M203OffsetCycle_Reload = 0.81
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.CSGO556AxisAlign = {right = 0, up = 0, forward = 50.5}
	SWEP.LeupoldAxisAlign = {right = -0.160, up = -0.070, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}

	SWEP.CustomizationMenuScale = 0.020
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = {pos = Vector(4.461, 0.308, -2.166), angle = Angle(0, 0, 0)}
	}

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Base", rel = "", pos = Vector(-0.132, 6.314, -3.018), angle = Angle(0, 180, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Base", rel = "", pos = Vector(-0.61, 13, -8.915), angle = Angle(0, 90, 0), size = Vector(1, 1, 1)},
		["md_csgo_556"] = {model = "models/kali/weapons/csgo/eq_optic_sig.mdl", bone = "Base", rel = "", pos = Vector(-0.399, 1.118, 1.577), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Base", rel = "", pos = Vector(-0.369, 1.774, 2), angle = Angle(0, 0, 0), size = Vector(0.4, 0.4, 0.4)},
		["md_fas2_leupold"] = {model = "models/v_fas2_leupold.mdl", bone = "Base", rel = "", pos = Vector(-0.341, 2.996, 3.012), angle = Angle(0, 90, 0), size = Vector(1.7, 1.7, 1.7)},
		["md_fas2_leupold_mount"] = {model = "models/v_fas2_leupold_mounts.mdl", bone = "Base", rel = "", pos = Vector(-0.341, 2.996, 3.012), angle = Angle(0, 90, 0), size = Vector(1.7, 1.7, 1.7)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "G3SG1", pos = Vector(-3.34, 7.82, -5.904), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Base", rel = "", pos = Vector(-0.348, -5.922, -1.81), angle = Angle(0, 180, 0), size = Vector(0.699, 0.699, 0.699)},
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

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
end

SWEP.SightBGs = {main = 1, none = 1}
SWEP.BipodBGs = {main = 2, on = 1, off = 0}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {600, -500},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_csgo_556"}},
	[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
	[3] = {header = "Handguard", offset = {-250, 150}, atts = {"bg_sig_bipod"}},
	["+attack2"] = {header = "Perks", offset = {1200, 0}, atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {600, 0}, atts = {"am_magnum", "am_matchgrade"}}}

if CustomizableWeaponry_KK_HK416 then
	table.insert( SWEP.Attachments[1].atts, 5, "md_fas2_leupold" )
end

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.75, sound = "CW_SIG_CHAN_MAGOUT"},
	[2] = {time = 1.85, sound = "CW_SIG_CHAN_MAGIN"}},

	reload_empty = {[1] = {time = 0.75, sound = "CW_SIG_CHAN_MAGOUT"},
	[2] = {time = 1.85, sound = "CW_SIG_CHAN_MAGIN"},
	[3] = {time = 2.55, sound = "CW_SIG_CHAN_BOLTBACK"},
	[4] = {time = 2.75, sound = "CW_SIG_CHAN_BOLTFORWARD"}}}

SWEP.SpeedDec = 40

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

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_sig_chan.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_sig_chan.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.6x45MM GP90"

SWEP.FireDelay = 0.0857142857142857
SWEP.FireSound = "CW_SIG_CHAN_FIRE"
SWEP.FireSoundSuppressed = "CW_SIG_CHAN_FIRE_SUPPRESSED"
SWEP.Recoil = 0.4

SWEP.HipSpread = 0.085
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.09
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.17
SWEP.Shots = 1
SWEP.Damage = 45
SWEP.DeployTime = 0.7

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 2.2
SWEP.ReloadTime_Empty = 2.7
SWEP.ReloadHalt = 2.4
SWEP.ReloadHalt_Empty = 2.9
SWEP.SnapToIdlePostReload = false