AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SRSS Bulldog"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	SWEP.CustomizationMenuScale = 0.012
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g36c", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("entities/cw_bulldog")

	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -7, y = 0, z = 0}
	SWEP.FireMoveMod = 0.6
		
	SWEP.IronsightPos = Vector(-2.757, 0, 0.045)
	SWEP.IronsightAng = Vector(0.067, 0.014, 0)
		
	SWEP.MicroT1Pos = Vector(-2.773, 0, 0.3)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.EoTechPos = Vector(-2.76, 0, -0.014)
	SWEP.EoTechAng = Vector(1.049, 0.318, 0)
	
	SWEP.AimpointPos = Vector(-2.786, 0, 0.043)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.776, 0, -0.176)
	SWEP.ShortDotAng = Vector(4.441, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.764, 0, -0.119)
	SWEP.ACOGAng = Vector(0.0, 0.0, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.767, 0, -1.267), [2] = Vector(0, 0, 0)}}
	
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -4.45, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.2, 0, -0.4)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.AttachmentModelsVM = {
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "body", rel = "", pos = Vector(-8.723, 2.384, 0.268), adjustment = {min = -8.723, max = -0.379, axis = "x", inverseOffsetCalc = true}, angle = Angle(-90, 0, -90), size = Vector(1.1, 1.1, 1.1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "body", rel = "", pos = Vector(-12.69, 7.207, -0.255), angle = Angle(0, 1.5, -90), size = Vector(1, 1, 1)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "body", rel = "", pos = Vector(-7.753, 1.906, 0.36), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(-1.3, -3.941, -0.021), adjustment = {min = -1.3, max = 7.15, axis = "x", inverseOffsetCalc = true}, angle = Angle(90, 0, -90), size = Vector(0.449, 0.449, 0.449)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "body", rel = "", pos = Vector(-0.163, -2.241, -1.589), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "body", rel = "", pos = Vector(6.368, -1.803, -0.761), angle = Angle(0, 0, -180), size = Vector(0.4, 0.4, 0.4)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "body", pos = Vector(-7.869, 1.880, 0.361), angle = Angle(-90, 0, -90), size = Vector(1, 1, 1)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = 0, forward = 0, pitch = 0}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(0, 00, 0) 
	
	SWEP.Trivia = {text = "This weapon comes with a angled grip pre-installed, so it don't have grip attachments.", x = -500, y = -360}
end

SWEP.MuzzleVelocity = 930 -- in meter/s

SWEP.SightBGs = {main = 2, regular = 0, none = 1}
SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_acog"}},
	[2] = {header = "Barrel", offset = {-500, -300}, atts = {"md_saker"}},
	[3] = {header = "Rail", offset = {-500, 200},  atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.05, sound = "CW_BULLDOG_DEPLOY"}},

	reload = {{time = 0.13, sound = "CW_BULLDOG_FOLEY"},
	{time = 0.91, sound = "CW_BULLDOG_MAGOUT"},
	{time = 1.25, sound = "CW_BULLDOG_FOLEY"},
	{time = 1.55, sound = "CW_BULLDOG_MAGIN"},
	{time = 2.08, sound = "CW_BULLDOG_THROW"},
	{time = 2.35, sound = "CW_BULLDOG_BOLTBACK"},
	{time = 2.61, sound = "CW_BULLDOG_BOLTFORWARD"},
	{time = 2.80, sound = "CW_BULLDOG_RETURN"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Pepaund"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/rifles/bulldog.mdl"
SWEP.WorldModel		= "models/cw2/rifles/w_bulldog.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 0.0857142857142857
SWEP.FireSound = "CW_BULLDOG_FIRE"
SWEP.FireSoundSuppressed = "CW_L85A2_FIRE_SUPPRESSED"
SWEP.Recoil = 1.43

SWEP.HipSpread = 0.0475
SWEP.AimSpread = 0.0025
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.063
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.16
SWEP.Shots = 1
SWEP.Damage = 42
SWEP.DeployTime = 0.75

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.73
SWEP.ReloadTime_Empty = 3.33
SWEP.ReloadHalt = 1.73
SWEP.ReloadHalt_Empty = 3

SWEP.SnapToIdlePostReload = true