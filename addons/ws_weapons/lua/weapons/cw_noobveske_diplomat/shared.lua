AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Noveske Diplomat"
	SWEP.CSMuzzleFlashes = true
	
		
	SWEP.EffectiveRange_Orig = 115 * 80
	SWEP.DamageFallOff_Orig = .30
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_noobveske.mdl"
	SWEP.WMPos = Vector(0, -1, 0.5)
	SWEP.WMAng = Vector(-5, 0, 180)
	
	SWEP.IronsightPos = Vector(-2.529, 0, -0.002)
	SWEP.IronsightAng = Vector(0.62, 0.05, 0)

	SWEP.MicroT1Pos = Vector(-2.52, -2.112, 0.187)
	SWEP.MicroT1Ang = Vector(0, 0.25, 0)

	SWEP.AimpointPos = Vector(-2.52, 0, -0.12)
	SWEP.AimpointAng = Vector(0.5, 0.152, 0)

	SWEP.EoTechPos = Vector(-2.513, 0, -0.334)
	SWEP.EoTechAng = Vector(-0.434, 0.1, 0)
	
    SWEP.ACOGPos = Vector(-2.527, 0, -0.203)
	SWEP.ACOGAng = Vector(-0.101, 0.1, 0)
	
	SWEP.ShortenedPos = Vector(-2.428, -4.005, 0.815)
	SWEP.ShortenedAng = Vector(0, -0.036, 0)

	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-2.529, 0, 0.321)
	SWEP.RMRAng = Vector(0.15, 0, 0)

	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.LaserPosAdjust = Vector(-0.75, 0, 0.1)
	SWEP.LaserAngAdjust = Angle(-1, -180, 0) 
	
	SWEP.LaserAngAdjustAim = Angle(-1, -185, 0)
	
    SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.55, 0, -1.186), [2] = Vector(-0.25, 0, 0)}}

	SWEP.IconLetter = "b"
	killicon.AddFont("cw_ar15", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_SUPPRESSED"
	SWEP.PosBasedMuz = false
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 1, y = -3, z = -2}
	SWEP.SightWithRail = false
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	--SWEP.BoltBone = "Bolt"
	--SWEP.BoltShootOffset = Vector(-1.0, 0, 0)
	--SWEP.OffsetBoltOnBipodShoot = true
	
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)

	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Weapon", rel = "", pos = Vector(-0.25, -9.07, -2.07), angle = Angle(0, -90, 0), size = Vector(0.938, 0.938, 0.938)},
	--	["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "body", rel = "", pos = Vector(-0.362, -4.203, -1.866), angle = Angle(0, 0, 0), size = Vector(0.619, 0.619, 0.619)},
	    ["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Weapon", rel = "", pos = Vector(0.05, -3.839, 3.4), angle = Angle(0, 0, 0), size = Vector(0.391, 0.391, 0.391)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Weapon", rel = "", pos = Vector(-0.25, -9.235, -1.833), angle = Angle(0, 0, 0), size = Vector(0.898, 0.898, 0.898)},
	    ["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Weapon", rel = "", pos = Vector(-0.576, 2.556, 2.16), angle = Angle(0, 90, -90), size = Vector(0.5, 0.5, 0.5)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Weapon", rel = "", pos = Vector(0.449, -18.755, -10.728), angle = Angle(0, -90, 0), size = Vector(1.304, 1.304, 1.304)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Weapon", rel = "", pos = Vector(-0.171, -9.858, -2.431), angle = Angle(0, 0, 0), size = Vector(1.003, 1.003, 1.003)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Weapon", rel = "", pos = Vector(0.1, -5.884, 0.426), angle = Angle(0, 0, 0), size = Vector(0.614, 0.614, 0.614)}
	}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.8, hor = 0.5, roll = 0, forward = 0, pitch = 0}

	SWEP.ACOGAxisAlign = {right = 0.05, up = -0.1, forward = 0}
	SWEP.PSO1AxisAlign = {right = 0, up = 0.4, forward = -90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = -0.4, forward = 0}
end

SWEP.MuzzleVelocity = 600 -- in meter/s

SWEP.SightBGs = {main = 1, none = 1}

--SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -50},  atts = {"md_kobra", "md_eotech", "md_aimpoint"}},
--	[2] = {header = "Barrel", offset = {-175, -100}, atts = {"md_pbs1"}},
--	[3] = {header = "Handguard", offset = {-100, 200}, atts = {"md_foregrip"}}}

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300},  atts = {"md_rmr", "md_microt1", "md_eotech", "md_aimpoint", "md_acog"}},
	[3] = {header = "Rail", offset = {100, 300}, atts = {"md_anpeq15"}},
	[2] = {header = "Barrel", offset = {-300, -300}, atts = {"md_saker"}},
	["+reload"] = {header = "Ammo", offset = {800, 500}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"fire", "fire2", "fire3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {
    draw = {[1] ={time = 0, sound = "CW_FOLEY_MEDIUM"},
	[2] ={time = 0.05, sound = "CW_NOOBVESKE_BOLT_BACK"},
	[3] ={time = 0.55, sound = "CW_NOOBVESKE_BOLT"}},

	reload = {[1] = {time = 0.35, sound = "CW_NOOBVESKE_MAGOUT"},
	[2] = {time = 1.5, sound = "CW_NOOBVESKE_MAGIN"},
	[3] = {time = 2, sound = "CW_NOOBVESKE_MAGINHIT"},
	[4] = {time = 2.6, sound = "CW_NOOBVESKE_BOLT"}}}
	
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
SWEP.ViewModel		= "models/weapons/v_rif_noobveske.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_noobveske.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56X45MM"

SWEP.FireDelay = 0.082
SWEP.FireSound = "CW_NOOBVESKE_FIRE"
SWEP.FireSoundSuppressed = "CW_NOOBVESKE_FIRE_SUPPRESSED"
SWEP.Recoil = 0.7

SWEP.HipSpread = 0.030
SWEP.AimSpread = 0.0015
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.015
SWEP.SpreadPerShot = 0.002
SWEP.SpreadCooldown = 0.3
SWEP.Shots = 1
SWEP.Damage = 29.5
SWEP.DeployTime = 1.0

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 3.0
SWEP.ReloadTime_Empty = 3.0
SWEP.ReloadHalt = 3.0
SWEP.ReloadHalt_Empty = 3.0
SWEP.SnapToIdlePostReload = false

function SWEP:IndividualThink()

	self.EffectiveRange = 115 * 80
	self.DamageFallOff = .30
	
end