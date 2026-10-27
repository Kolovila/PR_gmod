AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("7.62x39MM", "7.62x39 Rounds", 7.62, 39)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AK-17"
	SWEP.CSMuzzleFlashes = true
		
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.8
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_ak17.mdl"
	SWEP.WMPos = Vector(0, 0, 1)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-1.707, 0, 0.219)
	SWEP.IronsightAng = Vector(0.407, 0.098, 0)
	
	SWEP.MicroT1Pos = Vector(-1.711, 0, -0.359)
	SWEP.MicroT1Ang = Vector(0, 0.1, 0)

	SWEP.AimpointPos = Vector(-1.719, 0, -0.338)
	SWEP.AimpointAng = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-1.711, 0.326, -0.755)
	SWEP.EoTechAng = Vector(-0.412, 0, 0)

    SWEP.ACOGPos = Vector(-1.721, 0, -0.64)
	SWEP.ACOGAng = Vector(0.316, -0, 0)
	
	SWEP.RMRPos = Vector(-1.701, 0, 0)
	SWEP.RMRAng = Vector(-0.42, 0.109, 0)
	
	SWEP.CustomizePos = Vector(3.227, -0.733, -0.668)
    SWEP.CustomizeAng = Vector(8.199, 32.745, 0)
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.LaserPosAdjust = Vector(-0.5, 0, 0)
	SWEP.LaserAngAdjust = Angle(-2, -180, 0) 
	
	SWEP.LaserAngAdjustAim = Angle(0, 180, 0)
	
    SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-1.715, 0, -1.481), [2] = Vector(-0.047, -0, 0)}}
	
	SWEP.IconLetter = "b"
	killicon.AddFont("cw_ak74", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_OTS"
	SWEP.PosBasedMuz = false
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
    SWEP.ShellPosOffset = {x = 1, y = -3, z = -1}
	SWEP.SightWithRail = false
	
	SWEP.BoltBone = "Bolt"
	SWEP.BoltShootOffset = Vector(-0.5, 0, 0)
	--SWEP.OffsetBoltOnBipodShoot = true

	SWEP.AttachmentModelsVM = {["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "body", rel = "", pos = Vector(-0.375, -0.976, -2.878), angle = Angle(0, -90, 0), size = Vector(0.824, 0.824, 0.824)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "body", rel = "", pos = Vector(-0.2, -4.059, -1.943), angle = Angle(0, 0, 0), size = Vector(0.574, 0.574, 0.574)},
	    ["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(-0.08, -0.616, 2.007), angle = Angle(0, 0, 0), size = Vector(0.368, 0.368, 0.368)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "body", rel = "", pos = Vector(-0.35, -4.686, -2.737), angle = Angle(0, 0, 0), size = Vector(0.8, 0.8, 0.8)},
	    ["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "body", rel = "", pos = Vector(-0.849, 6.283, 1.139), angle = Angle(0, 90, -90), size = Vector(0.412, 0.412, 0.412)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "body", rel = "", pos = Vector(0.259, -12.768, -10.462), angle = Angle(0, -90, 0), size = Vector(1.148, 1.148, 1.148)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "body", rel = "", pos = Vector(-0.271, -5.197, -2.875), angle = Angle(0, 0, 0), size = Vector(0.825, 0.825, 0.825)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "body", rel = "", pos = Vector(-0.051, 1.577, -1.201), angle = Angle(0, 0, 0), size = Vector(0.582, 0.582, 0.582)}
	}
	
	SWEP.ForeGripHoldPos = {
	["Bip01 L Hand"] = {pos = Vector(0, 0, 0), angle = Angle(0, 50, 0) },
	["Bip01 L UpperArm"] = {pos = Vector(-2, -0.4, -1), angle = Angle(-45, -8, 50) },
	["Bip01 L Forearm"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, -10) },
	["Bip01 L ForeTwist"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, -10) },
	["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(20, -8, -20) },
	["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bip01 L Finger43"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, 
	["Bip01 L Finger42"] = {pos = Vector(0, 0.1, 0.1), angle = Angle(0, -15, 0) },
	["Bip01 L Finger33"] = {pos = Vector(0, 0, 0), angle = Angle(0, -25, 0) }, 
	["Bip01 L Finger32"] = {pos = Vector(-0.1, 0.3, 0), angle = Angle(0, 28, 0) },
	["Bip01 L Finger23"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, 
	["Bip01 L Finger22"] = {pos = Vector(-0.5, 0.5, 0), angle = Angle(0, 45, 0) }, 
	["Bip01 L Finger13"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }, 
	["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 80, 0) },	
	} 
	
	SWEP.LuaVMRecoilAxisMod = {vert = -20, hor = 0.3, roll = 0.5, forward = 0, pitch = 0}
	
	SWEP.ACOGAxisAlign = {right = -0.3, up = 1.35, forward = 0}	
	SWEP.PSO1AxisAlign = {right = 0, up = 0.4, forward = -90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = -0.4, forward = 0}
	
	SWEP.CustomizationMenuScale = 0.0085
	
end

SWEP.MuzzleVelocity = 750 -- in meter/s

SWEP.LuaViewmodelRecoil = false
SWEP.LuaViewmodelRecoilOverride = false

SWEP.Attachments = {
    [1] = {header = "Sight", offset = {800, -800},  atts = {"md_rmr", "md_microt1", "md_eotech", "md_aimpoint", "md_acog"}},
	[3] = {header = "Handguard", offset = {100, 450}, atts = {"md_foregrip"}}, 
	[4] = {header = "Rail", offset = {300, -200}, atts = {"md_anpeq15"}},
	[2] = {header = "Barrel", offset = {-700, -200}, atts = {"md_pbs1"}},
	["+reload"] = {header = "Ammo", offset = {730, 750}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"ak47_fire1", "ak47_fire2", "ak47_fire3"},
	reload = "ak47_reload",
	idle = "ak47_idle",
	draw = "ak47_draw"}
	
SWEP.Sounds = {
   ak47_draw = {[1] ={time = 0, sound = "CW_FOLEY_MEDIUM"}},

	ak47_reload = {[1] = {time = 0.3, sound = "CW_AK74_CLOTH"},
	[2] = {time = 0.3, sound = "CW_ak17_CLOTH"},
	[3] = {time = 0.42, sound = "CW_ak17_MAGOUT"},
	[4] = {time = 1.45, sound = "CW_ak17_MAGIN"},
	[5] = {time = 1.8, sound = "CW_ak17_CLOTH_FAST"},
	[6] = {time = 2.1, sound = "CW_ak17_BOLTPULL"}}}
	
SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_rif_ak17.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_ak17.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x39MM"

SWEP.FireDelay = 0.084
SWEP.FireSound = "CW_ak17_FIRE"
SWEP.FireSoundSuppressed = "CW_ak17_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 1.55
SWEP.MaxSpreadInc = 0.055
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 34.5
SWEP.DeployTime = 0.6

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 3.0
SWEP.ReloadTime_Empty = 3.0
SWEP.ReloadHalt = 3.0
SWEP.ReloadHalt_Empty = 3.0
SWEP.SnapToIdlePostReload = false