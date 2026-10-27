AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MP7 (MW3)"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "x"
	killicon.AddFont("cw_mp5", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePsMod = {x = 2, y = 0, z = -3}
	SWEP.SnapToGrip = true
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.87

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_mp7_tmp.mdl"
	SWEP.WMPos = Vector(0.500, -1.200, -3.000)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-1.795, -3.435, 0.563)

	SWEP.IronsightAng = Vector(0.8, 0.324, 0)

	SWEP.MicroT1Pos = Vector(-1.81, -4.248, 0.127)
	SWEP.MicroT1Ang = Vector(-0.129, 0.324, 0)
		
	SWEP.EoTechPos = Vector(-1.831, -4.187, -0.072)

	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-1.811, -3.892, 0.041)

	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.CoD4ReflexPos = Vector(-1.81, -4.082, 0.104)

	SWEP.CoD4ReflexAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.59, 0, 0.363)
	SWEP.SprintAng = Vector(-14.898, 28.45, -18.254)

	SWEP.CustomizePos = Vector(3.46, -0.61, -0.902)
	SWEP.CustomizeAng = Vector(17.681, 29.917, 15.121)
	
	SWEP.AlternativePos = Vector(0, 1.325, -0.801)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(2.028, -5.613, -1.124), [2] = Vector(0, 0, 0)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}

	SWEP.AttachmentModelsVM = {
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "gun", rel = "", pos = Vector(0, -1.305, -2.03), angle = Angle(180, 1, -90), size = Vector(0.4, 0.4, 0.4)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "gun", rel = "", pos = Vector(0.25, 9.626, -12.808), angle = Angle(90, 0, -90), size = Vector(1, 1, 1)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "gun", rel = "", pos = Vector(0.643, 1.667, 4.114), angle = Angle(-90, 180, 180), size = Vector(0.009, 0.009, 0.009)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "gun", rel = "", pos = Vector(-0.232, 3.946, -7.654), angle = Angle(0, 0, -90), size = Vector(0.899, 0.899, 0.899)},
		["md_cod4_reflex"] = {model = "models/v_cod4_reflex.mdl", bone = "gun", rel = "", pos = Vector(0, 1.891, -5.916), angle = Angle(-90, 0, -90), size = Vector(0.899, 0.899, 0.899)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "gun", rel = "", pos = Vector(0.014, -1.101, -4.357), angle = Angle(180, 0, 90), size = Vector(0.5, 0.5, 0.5)}
	}
	
	SWEP.AttachmentPosDependency = {["md_saker"] = {["bg_mp5_kbarrel"] = Vector(-0.038, -10.749, 0.324)}}

	SWEP.LaserPosAdjust = {x = 0.1, y = 0, z = 0.1}
	SWEP.LaserAngAdjust = {p = 0, y = 180, r = 35}
	SWEP.SightWithRail = false
	SWEP.CustomizationMenuScale = 0.012
end

SWEP.BarrelBGs = {main = 2, sd = 1, k = 2, regular = 0}
SWEP.StockBGs = {main = 1, regular = 0, retractable = 1, none = 2}
SWEP.RailBGs = {main = 3, on = 1, off = 0}
SWEP.MagBGs = {main = 4, round15 = 0, round30 = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {-500, -400}, atts = {"md_microt1", "md_eotech", "md_aimpoint"}},
[2] = {header = "Barrel", offset = {500, -400}, atts = {"md_saker"}},
[3] = {header = "Rail", offset = {-300, 100}, atts = {"md_anpeq15"}},
["+attack2"] = {header = "Perks", offset = {900, -400}, atts = {"pk_sleightofhand", "pk_light"}},
["+reload"] = {header = "Ammo", offset = {700, 0}, atts = {"am_magnum", "am_matchgrade"}}}

	if CustomizableWeaponry_KK_HK416 then
		table.insert(SWEP.Attachments[1].atts, 2, "md_cod4_reflex")
end

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] = {time = 0.5, sound = "CW_MW_MP7_BOLTBACK"} },

	reload = {[1] = {time = 0.41, sound = "CW_MW_MP7_MAGOUT"},
	[2] = {time = 1.1, sound = "CW_MW_MP7_MAGIN"}},
	
	reload = {[1] = {time = 0.41, sound = "CW_MW_MP7_MAGOUT"},
	[2] = {time = 1.1, sound = "CW_MW_MP7_MAGIN"},
	[3] = {time = 1.8, sound = "CW_MW_MP7_BOLTBACK"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy & Rinic"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_mp7_tmp.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_mp7_tmp.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 40
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "HK 4.6x30MM"

SWEP.FireDelay = 0.06
SWEP.FireSound = "CW_MW_MP7_FIRE"
SWEP.FireSoundSuppressed = "CW_MW_MP7_FIRE_SUPPRESSED"
SWEP.Recoil = 0.2

SWEP.HipSpread = 0.085
SWEP.AimSpread = 0.009
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.004
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 1.7
SWEP.ReloadTime_Empty = 2.3
SWEP.ReloadHalt = 0.5
SWEP.ReloadHalt_Empty = 1.7
SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()
		self.Animations.draw = "draw_norm"
			if self.Animations.draw == "draw_norm" then
		self.DeployTime = 0.23
	end
end