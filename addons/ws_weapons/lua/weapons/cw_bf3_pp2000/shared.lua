AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "PP-2000"
	SWEP.CSMuzzleFlashes = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_smg_BF3PP2000.mdl"
	SWEP.WMPos = Vector(-1, 0, -0.5)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(4.079, -2.412, 2.717)
	SWEP.IronsightAng = Vector(-0.011, -0.046, 0)

	SWEP.MicroT1Pos = Vector(4.103, 0, 1.87)
	SWEP.MicroT1Ang = Vector(-0.138, 0.05, 0)

	SWEP.AimpointPos = Vector(4.103, 0, 1.738)
	SWEP.AimpointAng = Vector(-0.201, 0.019, 0)
	
	SWEP.EoTechPos = Vector(-2.513, 0, -0.334)
	SWEP.EoTechAng = Vector(-0.434, 0.15, 0)
	
	SWEP.RMRPos = Vector(4.063, 0, 1.955)
	SWEP.RMRAng = Vector(1.0, -0.08, 0)
	
	SWEP.KobraPos = Vector(-2.55, -3.224, -0.026)
	SWEP.KobraAng = Vector(0.717, -0.638, 0)
	
    SWEP.ACOGPos = Vector(4.089, 0, 1.414)
	SWEP.ACOGAng = Vector(0.55, -0.06, 0)
	
	SWEP.ShortenedPos = Vector(-2.428, -4.005, 0.815)
	SWEP.ShortenedAng = Vector(0, -0.036, 0)
	
    SWEP.CustomizePos = Vector(-4.965, -2.881, 0)
    SWEP.CustomizeAng = Vector(8.394, -21.326, 0)
	
	SWEP.SprintPos = Vector(-6.22, -0.031, 0.158)
	SWEP.SprintAng = Vector(-5.377, -27.879, 0)
	
	SWEP.SwimPos = Vector(-9.589, -1.691, -0.894)
	SWEP.SwimAng = Vector(-3.376, -30.128, -5.791)
	
	SWEP.PronePos = Vector(0, -2, -.1579)
	SWEP.ProneAng = Vector(6, 15.7368, -5.9474)

	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0.1)
	SWEP.LaserAngAdjust = Angle(-1, -180, 0) 
	
    SWEP.BackupSights = {["md_acog"] = {[1] = Vector(4.09, 0, 0.514), [2] = Vector(0.163, -0.02, 0)}}
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.IconLetter = "b"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -0.5, y = 0, z = -1}
	SWEP.SightWithRail = false
	
	--SWEP.BoltBone = "Bolt"
	--SWEP.BoltShootOffset = Vector(-1.0, 0, 0)
	--SWEP.OffsetBoltOnBipodShoot = true
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)

	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Gun_bone", rel = "", pos = Vector(0.31, 6.379, -1.803), angle = Angle(0, 90, 0), size = Vector(0.781, 0.781, 0.781)},
	    ["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Gun_bone", rel = "", pos = Vector(0.009, 1.98, 2.805), angle = Angle(0, 0, 0), size = Vector(0.409, 0.409, 0.409)},
		["md_acog"] = {model =  "models/wystan/attachments/2cog.mdl", bone = "Gun_bone", rel = "", pos = Vector(0.354, 7.256, -2.392), angle = Angle(0, 180, 0), size = Vector(0.884, 0.884, 0.884)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Gun_bone", rel = "", pos = Vector(0.275, 8.008, -2.888), angle = Angle(0, 180, 0), size = Vector(0.981, 0.981, 0.981)},
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "Gun_bone", rel = "", pos = Vector(0, -10.247, 0.565), angle = Angle(0, 0, 0), size = Vector(0.884, 0.884, 0.884)}
	}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 0.5, roll = 0, forward = 0, pitch = 0}

	SWEP.ACOGAxisAlign = {right = -0.5, up = -0.1, forward = 0}

end

SWEP.MuzzleVelocity = 650 -- in meter/s

SWEP.SightBGs = {main = 1, none = 1}

--SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -50},  atts = {"md_kobra", "md_eotech", "md_aimpoint"}},
--	[2] = {header = "Barrel", offset = {-175, -100}, atts = {"md_pbs1"}},
--	[3] = {header = "Handguard", offset = {-100, 200}, atts = {"md_foregrip"}}}

SWEP.Attachments = {[1] = {header = "Sight", offset = {500, -300},  atts = {"md_rmr","md_microt1", "md_aimpoint", "md_acog"}},
	[2] = {header = "Barrel", offset = {-300, -100}, atts = {"md_tundra9mm"}},
	["+reload"] = {header = "Ammo", offset = {200, 500}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"PP2000_Fire_1", "PP2000_Fire_2"},
	reload = "PP2000_Reload",
	idle = "PP2000_Idle",
	draw = "PP2000_Draw"}
	
SWEP.Sounds = {PP2000_Draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	PP2000_Reload = {[1] = {time = 0.1, sound = "CW_BF3_P2000_MAGOUT"},
	[2] = {time = 0.2, sound = "CW_BF3_P2000_CLOTH"},
	[3] = {time = 0.6, sound = "CW_BF3_P2000_CLOTH2"},
	[4] = {time = 0.7, sound = "CW_BF3_P2000_MAGIN"}}}
	
SWEP.SpeedDec = 30

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/v_smg_BF3PP2000.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_BF3PP2000.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 40
SWEP.Primary.DefaultClip	= 380
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9X19MM"

SWEP.FireDelay = 0.065
SWEP.FireSound = "CW_BF3_PP2000_FIRE"
SWEP.FireSoundSuppressed = "CW_PP2000_FIRE_SUPPRESSED"
SWEP.Recoil = 0.7 -- 0.8

SWEP.HipSpread = 0.050
SWEP.AimSpread = 0.0020
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.015
SWEP.SpreadPerShot = 0.0022
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 1
SWEP.Damage = 25
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 1.5
SWEP.ReloadTime_Empty = 1.5
SWEP.ReloadHalt = 1.5
SWEP.ReloadHalt_Empty = 1.5
SWEP.SnapToIdlePostReload = false