AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "C7A1"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.Add("cw_c7a1", "vgui/kills/cw_c7a1", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_c7a1")
	SWEP.CustomizationMenuScale = 0.02
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = 3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.SprintPos = Vector(-4.444, -1, 0.082)
	SWEP.SprintAng = Vector(-12.849, -39.23, 0)
	
	SWEP.CustomizePos = Vector(-8.174, -1.27, -1.288)
	SWEP.CustomizeAng = Vector(17.954, -30, -18.357)
	
	SWEP.BallisticPos = Vector(2.96, -2.206, 0.68)
	SWEP.BallisticAng = Vector(0, 0, 0)
	
	SWEP.ELCANPos = Vector(3, -3.217, 0.479)
	SWEP.ELCANAng = Vector(0, 0, 0)
	
	SWEP.M203OffsetCycle_Reload = 0.65
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.TrijiconPos = Vector(2.96, -3.418, 0.81)
	SWEP.TrijiconAng = Vector(-1.407, 0, 0)
	
	SWEP.ReflexPos = Vector(2.96, -3.418, 0.81)
	SWEP.ReflexAng = Vector(-1.407, 0, 0)
	
	SWEP.CmorePos = Vector(2.96, -3.418, 0.81)
	SWEP.CmoreAng = Vector(-1.407, 0, 0)
	
	SWEP.IronsightPos = Vector(3, -2.222, 0.6)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.FoldSightPos = Vector(2.91, -4.222, 0.6)
	SWEP.FoldSightAng = Vector(0, 0, 0)
	
	SWEP.CSGOACOGPos = Vector(2.96, -3.418, 0.6)
	SWEP.CSGOACOGAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(2.96, -3.217, 0.4)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(2.96, -3.401, 0.439)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.MicroT1Pos = Vector(2.96, -4.422, 0.81)
	SWEP.MicroT1Ang = Vector(-1.407, 0, 0)
	
	SWEP.ACOGPos = Vector(2.99, -3.82, 0.72)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	

	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CSGOACOGAxisAlign = {right = 0, up = 0, forward = -39}
	
	SWEP.BackupSights = {
	["md_elcan"] = {[1] = Vector(3, -3.217, -0.301), [2] = Vector(1, 0, 0)},
	["md_acog_fixed"] = {[1] = Vector(2.99, -3.82, 0), [2] = Vector(0, 0, 0)}
	}
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "L_Armdummy"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_csgo_acog"] = { type = "Model", model = "models/kali/weapons/csgo/eq_optic_acog.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(0.1, 2.2, -16.105), angle = Angle(90, -90, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_cmore"] = { type = "Model", model = "models/attachments/cmore.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(0.039, -0.801, -10), angle = Angle(0, 0, -90), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_reflex"] = { type = "Model", model = "models/attachments/kascope.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(0.059, -1.4, -7.401), angle = Angle(0, 0, -90), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_trijicon"] = { type = "Model", model = "models/att_trijicon.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(0.05, 1.557, -8), angle = Angle(0, 0, -90), size = Vector(2.2, 2.2, 2.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_ballistic"] = { type = "Model", model = "models/bunneh/scope01.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(-1.241, -1.558, -17.143), angle = Angle(90, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_myfuckingbipod2"] = { type = "Model", model = "models/wystan/attachments/bipod.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(0, 1.639, 2.596), angle = Angle(0, 0, -90), size = Vector(1.5, 1.5, 1.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_csgo_silencer_rifle"] = { type = "Model", model = "models/kali/weapons/csgo/eq_suppressor_rifle.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(0.1, 0.699, 14.026), angle = Angle(90, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_elcan"] = { type = "Model", model = "models/bunneh/elcan.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(-0.274, 3.45, -15), angle = Angle(0, 0, -90), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["bg_foldsight"] = { type = "Model", model = "models/bunneh/rearsight.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(2.349, -2.3, -4.676), angle = Angle(-90, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "smdimport001", rel = "", pos = Vector(-0.281, -3.513, -2.086), angle = Angle(0, 0, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(0.349, 9.6, -21.299), angle = Angle(90, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_foregrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(-0.101, 3, -10.91), angle = Angle(0, 0, -90), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_saker"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(-0, 2.2, -2.597), angle = Angle(0, 0, -90), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(0.1, -1.3, -9.87), angle = Angle(180, 0, -90), size = Vector(0.4, 0.4, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_acog_fixed"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(-0.201, 2.596, -14.027), angle = Angle(0, 0, -90), size = Vector(0.649, 0.649, 0.649), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(0, -1, -6.753), angle = Angle(-90, 90, 0), size = Vector(0.55, 0.55, 0.55), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["md_m203"] = { type = "Model", model = "models/cw2/attachments/m203.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(2.4, -2.201, -18.182), angle = Angle(90, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, animated = true},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "m4a1_GGGUUNNN", rel = "", pos = Vector(-0.2, 4.5, -16.404), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.M203HoldPos = {
		["L_Armdummy"] = { scale = Vector(1, 1, 1), pos = Vector(2, 0, -2.5), angle = Angle(0, 0, 0) }
	}

	SWEP.ForeGripHoldPos = {
	["L_Armdummy"] = { scale = Vector(1, 1, 1), pos = Vector(-3.889, 12.882, -1.941), angle = Angle(45.528, 102.706, 51.881) },
	["L_Thumb2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(24.353, -37.059, 0) },
	["L_Thumb1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-32.825, 0, 0) }
}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
end



SWEP.SightBGs = {main = 0, carryhandle = 0, foldsight = 1, none = 2}
SWEP.BarrelBGs = {main = 0, longris = 4, long = 0, magpul = 0, ris = 0, regular = 0}
SWEP.StockBGs = {main = 0, regular = 0, heavy = 0, sturdy = 0}
SWEP.MagBGs = {main = 0, regular = 0, round60 = 0}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {0, -500}, atts = {"bg_foldsight", "md_microt1", "md_eotech", "md_aimpoint"}},
	[2] = {header = "Barrel", offset = {-550, -500}, atts = {"md_saker"}},
	[3] = {header = "Handguard", offset = {-550, -70}, atts = {"md_foregrip", "md_myfuckingbipod2", "md_m203"}},
	[4] = {header = "Rail", offset = {-550, 390}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}
	
if CustomizableWeaponry_G4P_UECW then
	table.insert( SWEP.Attachments[1].atts, 5, "md_ballistic" )
	table.insert( SWEP.Attachments[1].atts, 5, "md_csgo_acog" )
	table.insert( SWEP.Attachments[1].atts, 5, "md_acog_fixed" )
	table.insert( SWEP.Attachments[1].atts, 5, "md_elcan" )
	table.insert( SWEP.Attachments[1].atts, 3, "md_trijicon" )
	table.insert( SWEP.Attachments[1].atts, 3, "md_cmore" )
	table.insert( SWEP.Attachments[1].atts, 3, "md_reflex" )
	table.insert( SWEP.Attachments[2].atts, 2, "md_csgo_silencer_rifle" )

end

	
SWEP.Animations = {fire = {"f_shoot", "f_shoot2", "f_shoot3"},
	reload = "f_reload",
	idle = "f_idle",
	draw = "f_draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	f_reload = {[1] = {time = 0.35, sound = "CW_C7A1_MAGOUT"},
	[2] = {time = 1.3, sound = "CW_C7A1_MAGIN"},
	//[3] = {time = 1.6, sound = "CW_C7A1_TAP"},
	[3] = {time = 1.8, sound = "CW_C7A1_TAP"},
	[4] = {time = 2.5, sound = "CW_C7A1_BOLT"}}}

SWEP.SpeedDec = 35

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/c7a1/v_rif_c7a.mdl"
SWEP.WorldModel		= "models/weapons/c7a1/w_rif_c7a1a.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/c7a1/w_rif_c7a1a.mdl"
SWEP.WMPos = Vector(-3.5, 0, 0)
SWEP.WMAng = Vector(-3,1,180)
SWEP.ADSFireAnim = false
SWEP.BipodFireAnim = true
//SWEP.AimBreathingEnabled = true
//SWEP.AimBreathingIntensity = 1

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.066666666666667
SWEP.FireSound = "CW_C7A1_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_FIRE_SUPPRESSED"
SWEP.Recoil = 0.95

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.0025
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 1.25
SWEP.ReloadTime = 1.65
SWEP.ReloadTime_Empty = 1.65
SWEP.ReloadHalt = 1.9
SWEP.ReloadHalt_Empty = 3.1
SWEP.SnapToIdlePostReload = true