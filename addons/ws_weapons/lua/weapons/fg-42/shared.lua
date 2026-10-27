AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "FG-42 (Fujiko-sensei)"
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
	 SWEP.WM = "models/cw2/weapons/w_cam_fg42.mdl"
	 SWEP.WMPos = Vector( 0, 0, 0)
	 SWEP.WMAng = Vector(-4.452, 0, -171.924)


	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(3.463, -5.398, 1.949)
	SWEP.IronsightAng = Vector(0, -0.135, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(3.46, -3.797, 2.242)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(3.5, -4.31, 2.552)

	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(3.463, -3.464, 2.207)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	 SWEP.SprintPos = Vector(-2.161, -2.393, 0.73)
	 SWEP.SprintAng = Vector(-21.132, -33.882, 16.92)

	SWEP.ACOGPos = Vector(3.394, -5.093, 2.592)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(-5.283, -4.66, 0)
	 SWEP.CustomizeAng = Vector(8.619, -42.065, -1.333)

	SWEP.CoyotePos = Vector(3.49, -4.417, 2.598)

	SWEP.CoyoteAng = Vector(0, 0, 0)

	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(3.394, -5.093, 1.738), [2] = Vector(0, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "a_fg42", rel = "", pos = Vector(-6.557, 4.206, 0.67), angle = Angle(-90, 90, 0), size = Vector(0.841, 0.841, 0.841)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "a_fg42", rel = "", pos =Vector(-12.492, 9.156, 0.16), angle = Angle(0, 0, -90), size = Vector(0.927, 0.927, 0.927)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "smdimport001", rel = "", pos = Vector(-0.452, -2.556, -1.428), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_cyotesight"] = {model = "models/rageattachments/cyotesight.mdl", bone = "a_fg42", rel = "", pos = Vector(-2.633, -0.445, 0.43), angle = Angle(0, 0, -90), size = Vector(0.632, 0.632, 0.632)},            
		["md_eyepatch"] = {model = "models/atts/eyepatch.mdl", bone = "a_fg42", pos = Vector(1.97, 0.66, 20.67), angle = Angle(-2.845, -137.008, -180), size = Vector(10, 10, 10)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "a_fg42", rel = "", pos = Vector(-6.612, 3.948, 0.62), angle = Angle(-90, 0, -90), size = Vector(0.762, 0.762, 0.762)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "fal", pos = Vector(2.325, -12.502, -4.737), angle = Angle(0, 180, 0), size = Vector(0.781, 0.781, 0.781)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "a_fg42", pos = Vector(-2.633, -0.685, 0.398), angle = Angle(90, 0, -90), size = Vector(0.632, 0.632, 0.632)},
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
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(1, 0, 0)
	SWEP.LaserAngAdjust = Angle(2, 180, 0) 
end

SWEP.SightBGs = {main = 1, none = 1}
SWEP.BarrelBGs = {main = 3, longris = 4, long = 3, magpul = 2, ris = 1, regular = 0}
SWEP.StockBGs = {main = 2, regular = 0, heavy = 1, sturdy = 2}
SWEP.MagBGs = {main = 5, regular = 0, round60 = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "0ptics", offset = {800, -200}, atts = {"md_acog", "md_microt1", "md_eotech", "md_aimpoint", "md_cyotesight"}},
	[2] = {header = "Perks", offset = {100, 200}, atts = {"pk_sleightofhand", "pk_light"}},
	[3] = {header = "Upotte!", offset = {300, 400}, atts = {"md_eyepatch"}},
	["+reload"] = {header = "Ammo", offset = {500, 600}, atts = {"am_magnum", "am_matchgrade"}}}
	
SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.35, sound = "CW_FG42_MAGOUT"},
	[2] = {time = 1.3, sound = "CW_FG42_MAGIN"},
	[3] = {time = 1.9, sound = "CW_FG42_BOLTPULL"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "Cameron's CW 2.0 SWEPS"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/weapons/v_cam_fg42.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_cam_fg42.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 25
SWEP.Primary.DefaultClip	= 500
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"
SWEP.Primary.Automatic		= true

SWEP.FireDelay = 0.066666666666667
SWEP.FireSound = "CW_FG42_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_FIRE_SUPPRESSED"
SWEP.Recoil = 1.7

SWEP.HipSpread = 0.030
SWEP.AimSpread = 0.0003
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 34
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 0.6
SWEP.ReloadTime = 1.65
SWEP.ReloadTime_Empty = 1.65
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true