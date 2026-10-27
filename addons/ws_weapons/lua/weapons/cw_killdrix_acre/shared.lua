

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "ACR-E"
	SWEP.CSMuzzleFlashes = false
	SWEP.ViewModelMovementScale = 1.15
	
	local icol = Color( 255, 80, 0, 150 ) 
	killicon.Add( "cw_killdrix_acre", "vgui/hud/acr", icol) 
	SWEP.SelectIcon = surface.GetTextureID("vgui/hud/acr")
	SWEP.MuzzleAttachmentName = "muzzle"
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = false
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = -20
	SWEP.InvertShellEjectAngle = false
	SWEP.ShellPosOffset = {x = 1, y = -5, z = 5}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.7
	
	SWEP.M203OffsetCycle_Reload = 0.73
	SWEP.M203OffsetCycle_Reload_Empty = 0.73
	SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.IronsightPos = Vector(-2.76, -0.962, 0.938)
	SWEP.IronsightAng = Vector(0.513, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.78, -1.267, 0.319)
	SWEP.EoTechAng = Vector(0, 0, 0)	
	
	SWEP.MicroT1Pos = Vector(-2.78, -1.267, 1.039)
    SWEP.MicroT1Ang = Vector(0, 0, 0)	
	
	SWEP.AimpointPos = Vector(-2.741, -1.803, 0.791)
    SWEP.AimpointAng = Vector(0, 0, 0)	
	
	SWEP.FAS2AimpointPos = Vector(-2.28, -1.201, 0.379)
    SWEP.FAS2AimpointAng = Vector(0, 0, 0)
	
	SWEP.BarskaPos = Vector(-2.76, -1.803, 0.889)
    SWEP.BarskaAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.741, -1.231, 0.838)
    SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.721, -1.037, 0.555)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(-0.04, -1.043, 0.92)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_bo2_specter"] = {[1] = Vector(-2.58, -4.052, -0.38), [2] = Vector(1.22, 0.616, -39.183)},
                         ["md_bo2_combo"] = {[1] = Vector(-2.26, 4, -0.844), [2] = Vector(0.555, 0, 0)}}

	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}	
	SWEP.TechAxisAlign = {right = -0, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "acr_main", rel = "", pos = Vector(-1.818, -1.964, 0), angle = Angle(90.099, -90.758, 0), size = Vector(0.428, 0.428, 0.428)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "acr_main", rel = "", pos = Vector(-15.914, 13.487, -0.332), angle = Angle(0, 2.911, -90.061), size = Vector(1.368, 1.368, 1.368)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "acr_main", rel = "", pos = Vector(-6.965, 3.835, 0.363), angle = Angle(0, 0, -90.027), size = Vector(1.001, 1.001, 1.001)},
		["md_saker"] = { model = "models/cw2/attachments/556suppressor.mdl", bone = "acr_main", rel = "", pos = Vector(-0.936, -0.426, -2.185), angle = Angle(0, 90.222, 0), size = Vector(0.723, 0.723, 0.723)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "acr_main", rel = "", pos = Vector(-7.448, 3.884, 0.347), angle = Angle(-90.13, 90.041, 0), size = Vector(1.003, 1.003, 1.003)},
		["md_barska"] = {model = "models/attachment/barska.mdl", bone = "acr_main", rel = "", pos = Vector(-2.72, -2.175, 0.012), angle = Angle(0, 0, -90.002), size = Vector(0.203, 0.203, 0.203)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "acr_main", rel = "", pos = Vector(-6.952, 3.786, 0.233), angle = Angle(-90.048, 90.089, 0), size = Vector(1.001, 1.001, 1.001)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "acr_main", rel = "", pos = Vector(9.305, -0.459, 0.978), angle = Angle(0, 180, 0), size = Vector(0.578, 0.578, 0.578)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "body", rel = "", pos = Vector(-2.579, -3.847, -1.77), angle = Angle(0, 0.003, -90.489), size = Vector(0.763, 0.763, 0.763), animated = true}
	}
	
	SWEP.M203HoldPos = {
		["Dummy02"] = { scale = Vector(1, 1, 1), pos = Vector(1.052, 0.075, -1.907), angle = Angle(0, 0, 0) }
	}
	SWEP.ForeGripHoldPos = {
	["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(22, 0.911, 0.098), angle = Angle(0, 0, 0)}
		}
		
SWEP.ForegripOverridePos = {["md_angledgrip"] = {
	["l_forearm"] = { scale = Vector(1, 1, 1), pos = Vector(22, 0.911, 0.098), angle = Angle(0, 0, 0)}},

	}
	
	SWEP.AttachmentPosDependency = {["md_anpeq15"] = {["bg_longris"] = Vector(-0.225, 13, 3.15)},
	["md_saker"] = {["bg_longbarrel"] = Vector(-0.042, 9, -0.1), ["bg_longris"] = Vector(-0.042, 9, -0.1)}}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0)
	SWEP.LaserAngAdjust = Angle(-0., 180, 0) 
end

SWEP.SightBGs = {main = 2, acog = 1, none = 1}
SWEP.BarrelBGs = {main = 1, sli = 1, none = 0}
SWEP.HandguardBGs = {main = 0, laser = 0, none = 0}
SWEP.MagBGs = {main = 5, regular = 0, round60 = 1}
SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim = false
SWEP.CanRestOnObjects = false


SWEP.Attachments = {[1] = {header = "Sight", offset = {850, -100},  atts = {"md_microt1","md_barska","md_eotech","md_aimpoint","md_schmidt_shortdot","md_acog"}},
    [2] = {header = "Barrel extension", offset = {-300, -100}, atts = {"md_saker"}},
	[3] = {header = "Misc", offset = {120, -500}, atts = {"md_anpeq15"}},
	[4] = {header = "Perk", offset = {250, 350}, atts = {"md_fasthand"}},
	[5] = {header = "Paintjob", offset = {250, -20}, atts = {"bg_acre_tan"}},
	["+reload"] = {header = "Ammo", offset = {800, 400}, atts = {"am_magnum","am_matchgrade"}}}
	


SWEP.Animations = {fire = {"fire_1", "fire_2", "fire_3"},
	reload = "reload_half",
	reload_empty = "reload_empty_foregrip",
	idle = "idle",
	draw = "ready"}
	
SWEP.Sounds = {ready = {
		{time = 0, sound = "CW_ACR_DRAW"},
		{time = 0.5, sound = "CW_ACR_BOLTB"},
		{time = 0.85, sound = "CW_ACR_BOLTF"},
	},

	reload_half = {{time = 0, sound = "CW_ACR_FOLEY"},
     {time = 1, sound = "CW_ACR_MAGOUT"},
    {time = 1.8, sound = "CW_ACR_MAGINSERT"},
    {time = 2.1, sound = "CW_ACR_MAGIN"}},

	draw = {{time = 0, sound = "CW_ACR_DRAW"}},
	
	reload_empty_foregrip = {{time = 0, sound = "CW_ACR_MAGINSERT"},
    {time = 0.3, sound = "CW_ACR_MAGRATTLE"},
    {time = 0.4, sound = "CW_ACR_MAGOUT"},
     {time = 1.8, sound = "CW_ACR_MAGINSERT"},
	 {time = 2.1, sound = "CW_ACR_MAGIN"},
	 {time = 2.9, sound = "CW_ACR_BOLTB"},
	 {time = 3.4, sound = "CW_ACR_BOLTF"}},
	 
	 reload_empty = {{time = 0, sound = "CW_ACR_MAGINSERT"},
    {time = 0.3, sound = "CW_ACR_MAGRATTLE"},
    {time = 0.4, sound = "CW_ACR_MAGOUT"},
     {time = 1.8, sound = "CW_ACR_MAGINSERT"},
	 {time = 2.1, sound = "CW_ACR_MAGIN"},
	 {time = 2.8, sound = "CW_ACR_BOLTF"}
	 }}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Killdrix"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/killdrix/v_acre.mdl"
SWEP.WorldModel		= "models/weapons/killdrix/w_acre.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/killdrix/w_acre.mdl"
SWEP.WMPos = Vector(-0.8, 5, 0.06)
SWEP.WMAng = Vector(-11.296, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 390
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.075
SWEP.FireSound = "CW_ACR_FIRE"
SWEP.FireSoundSuppressed = "CW_ACR_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 3.4
SWEP.ReloadTime_Empty = 4.3
SWEP.ReloadHalt = 3.6
SWEP.ReloadHalt_Empty = 4.5
SWEP.SnapToIdlePostReload = false

