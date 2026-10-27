AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "VHS-K21"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_OTS"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -5, y = -2, z = -2}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_vhs.mdl"
	SWEP.WMPos = Vector(0, -8, 0)
	SWEP.WMAng = Vector(0, 0, 180)

	SWEP.IronsightPos = Vector(-2.724, 0, 0.14)
	SWEP.IronsightAng = Vector(0.14, 0.07, 0)
	
	SWEP.FoldSightPos = Vector(-2.208, -4.3, 0.143)
	SWEP.FoldSightAng = Vector(0.605, 0, -0.217)
		
	SWEP.EoTechPos = Vector(-2.704, -1.022, -0.542)
	SWEP.EoTechAng = Vector(-0.069, 0.273, 0)
	
	SWEP.AimpointPos = Vector(-2.721, 0, -0.08)
	SWEP.AimpointAng = Vector(0.001, 0, 0)
	
	SWEP.MicroT1Pos = Vector(-2.708, -0.805, -0.181)
	SWEP.MicroT1Ang = Vector(0.40, 0.05, 0)
	
	SWEP.ACOGPos = Vector(-2.75, -1.005, -0.419)
	SWEP.ACOGAng = Vector(-0.06, 0.236, 0)
	
	SWEP.NXSPos = Vector(-2.721, 0, 0.039)
	SWEP.NXSAng = Vector(-0.262, 0.061, 0)
	
	SWEP.RMRPos = Vector(-1.701, 0, 0)
	SWEP.RMRAng = Vector(-0.42, 0.109, 0)
	
	SWEP.ShortDotPos = Vector(-2.201, -4.148, 0.425)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(3.227, -0.733, -0.668)
    SWEP.CustomizeAng = Vector(8.199, 32.745, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.688, -1.005, -1.456), [2] = Vector(-0.06, 0.13, 0)}}

	SWEP.LuaVMRecoilAxisMod = {vert = 1.6, hor = 0.5, roll = 0.2, forward = 0, pitch = 0.1}

	SWEP.NXSAlign = {right = 0.7, up = -0.1, forward = 0}
	SWEP.ACOGAxisAlign = {right = 0.5, up = -0.2, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.AttachmentModelsVM = {
		["md_nightforce_nxs"] = {model = "models/cw2/attachments/l96_scope.mdl", bone = "body", rel = "", pos = Vector(1.312, -5.2, 0.07), angle = Angle(0, 0, -90), size = Vector(0.874, 0.874, 0.874)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "body", rel = "", pos = Vector(-5.218, 0.944, 0.219), angle = Angle(-90, 0, -90), size = Vector(0.915, 0.915, 0.915)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "body", rel = "", pos = Vector(-14.528, 9.399, -0.341), angle = Angle(0, 0, -90), size = Vector(1.271, 1.271, 1.271)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(1.7, -4.43, 0), angle = Angle(-90, 0, -90), size = Vector(0.423, 0.423, 0.423)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "body", rel = "", pos = Vector(5.837, -2.215, -0.89), angle = Angle(0, -180, 180), size = Vector(0.5, 0.5, 0.5)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "body", rel = "", pos = Vector(-1.507, -4.261, -0.02), angle = Angle(90, 0, 90), size = Vector(0.688, 0.688, 0.688)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "body", rel = "", pos = Vector(-3.908, 1.169, 0.319), angle = Angle(-90, 0, -90), size = Vector(0.948, 0.948, 0.948)}
	}
	
	SWEP.LaserPosAdjust = Vector(-1, 0, 0.2)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LaserAngAdjustAim = Angle(0.05, 180, 0)
	
    SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 0.5, roll = 0.3, forward = 0.6, pitch = 0.3}
	
    SWEP.CustomizationMenuScale = 0.0085
	
end

--SWEP.BoltBone = ""
--SWEP.BoltShootOffset = Vector(-4, 0, 0)

SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.SightBGs = {main = 1, none = 2}

SWEP.Attachments = {[1] = {header = "Sight", offset = {550, -900}, atts = {"md_microt1", "md_aimpoint", "md_eotech", "md_acog", "md_nightforce_nxs"}},
	[2] = {header = "Barrel", offset = {-900, -200}, atts = {"md_saker"}},
	[3] = {header = "Rail", offset = {-100, 200}, atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {1600, 800}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.4, sound = "CW_VHS_MAGOUT"},
	[2] = {time = 1.2, sound = "CW_VHS_CLOTH"},
	[3] = {time = 1.8, sound = "CW_VHS_MAGIN"},
	[4] = {time = 1.85, sound = "CW_VHS_MAGIN2"}}}
	--[5] = {time = 2.5, sound = "CW_VHS_BOLT"}}}

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
SWEP.ViewModel		= "models/weapons/v_rif_vhs.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_vhs.mdl"
SWEP.ADSFireAnim = false
SWEP.UseHands       = true


SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.074
SWEP.FireSound = "CW_VHS_FIRE"
SWEP.FireSoundSuppressed = "CW_AR15_LONGBARREL_FIRE_SUPPRESSED"

SWEP.Recoil = 0.95
SWEP.HipSpread = 0.020
SWEP.AimSpread = 0.0015
SWEP.VelocitySensitivity = 1.75
SWEP.MaxSpreadInc = 0.6
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 30
SWEP.DeployTime = 0.7

SWEP.ReloadSpeed = 1.15
SWEP.ReloadTime = 2.8
SWEP.ReloadTime_Empty = 2.8
SWEP.ReloadHalt = 2.8
SWEP.ReloadHalt_Empty = 2.8
SWEP.SnapToIdlePostReload = true