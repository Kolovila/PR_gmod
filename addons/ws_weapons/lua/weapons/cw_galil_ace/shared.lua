AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Galil Ace"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = true
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = -0, z = -1}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	
	SWEP.EffectiveRange_Orig = 115 * 180
	SWEP.DamageFallOff_Orig = .35
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_rif_galil_ace.mdl"
	SWEP.WMPos = Vector(0, -1, -0.5)
	SWEP.WMAng = Vector(-10, 0, 180)
	
	SWEP.IronsightPos = Vector(-1.851, -0.12, 0.202)
	SWEP.IronsightAng = Vector(1.7, 0.019, 0)
	
	SWEP.EoTechPos = Vector(-1.739, -2.388, -0.304)
	SWEP.EoTechAng = Vector(-0.806, 1.919, 0)
	
	SWEP.AimpointPos = Vector(-1.861, 0, -0.16)
	SWEP.AimpointAng = Vector(0.2, -0.014, 0)
	
	SWEP.MicroT1Pos = Vector(-1.854, -0.159, 0.093)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-1.857, -0.629, -0.211)
	SWEP.ACOGAng = Vector(-0.06, 0.002, 0)
	
	--SWEP.SG1Pos = Vector(-1.614, -0.861, -0.51)
	--SWEP.SG1Ang = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)
	
	SWEP.ShortDotPos = Vector(-2.017, -5.564, 0.495)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-1.844, 0, 0.142)
	SWEP.RMRAng = Vector(-0.156, 0.06, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-1.857, -0.629, -1.019), [2] = Vector(-0.06, 0.002, 0)}}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 2, roll = 0, forward = 0.5, pitch = 1}

	SWEP.SightWithRail = false
	SWEP.ACOGAxisAlign = {right = 0, up = -90, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	--SWEP.M203OffsetCycle_Reload = 0.81
    --SWEP.M203OffsetCycle_Reload_Empty = 0.73
	--SWEP.M203OffsetCycle_Draw = 0
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}

	SWEP.BaseArm = "Left_U_Arm"
	SWEP.BaseArmBoneOffset = Vector(-500, 0, 0)
	
	SWEP.M203Pos = Vector(-0.562, -2.481, 0.24)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.M203HoldPos = {
		["Left_U_Arm"] = {pos = Vector(2.197, -2.123, -1.015), angle = Angle(0, 0, 0)}
	}
	
	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Gun", rel = "", pos = Vector(0, 0.356, -2.75), angle = Angle(0, 0, 0), size = Vector(0.958, 0.958, 0.958)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "Gun", rel = "", pos = Vector(-0.791, 0.209, -1.956), angle = Angle(0, 90, 0), size = Vector(0.827, 0.827, 0.827)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "Gun", rel = "", pos = Vector(-8.525, -0.561, -8.561), angle = Angle(0, -1.803, 0), size = Vector(1.052, 1.052, 1.052)},
		["md_anpeq15"] = {model = "models/cw2/attachments/anpeq15.mdl", bone = "Gun", rel = "", pos = Vector(8.656, -0.124, 2.575), angle = Angle(0, 0, 0), size = Vector(0.432, 0.432, 0.432)},
		["md_microt1"] = {model = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "Gun", rel = "", pos = Vector(2.642, 0.019, 2.799), angle = Angle(0, 90.046, 0), size = Vector(0.33, 0.33, 0.33)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Gun", rel = "", pos = Vector(8.098, 0.14, -0.036), angle = Angle(0, 90.88, -0), size = Vector(0.446, 0.446, 0.446)}
		--["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "Gun", rel = "", pos = Vector(-1.736, 0.28, -1.601), angle = Angle(0, 90, 0), size = Vector(0.75, 0.75, 0.75)}
	}

	SWEP.LuaVMRecoilAxisMod = {vert = 0.6, hor = 1,5, roll = 1, forward = 0.5, pitch = 0.5}
	
	SWEP.LaserPosAdjust = Vector(0, -1.206, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0)
	
	--SWEP.LaserAngAdjustAim = Angle(0, 0, 0)

	SWEP.BoltBone = "Bolt"
	SWEP.BoltShootOffset = Vector(-1.4, 0, 0)	
end

SWEP.MuzzleVelocity = 714 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.LuaViewmodelRecoil = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -300},  atts = {"md_rmr", "md_microt1", "md_aimpoint", "md_eotech"}},
	[2] = {header = "Barrel", offset = {-400, -300},  atts = {"md_saker"}},
	[3] = {header = "Rail", offset = {150, -400},  atts = {"md_anpeq15"}},
	["+reload"] = {header = "Ammo", offset = {800, 500}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {{time = 0.4, sound = "CW_SCARH_MAGOUT"},
	{time = 0.4, sound = "cloth"},
	{time = 0.6, sound = "CW_FOLEY_LIGHT"},
	{time = 1.1, sound = "CW_SCARH_MAGIN"},
	{time = 1.4, sound = "CW_FOLEY_LIGHT"},
	{time = 1.8, sound = "CW_SCARH_BOLT"},
	{time = 2.1, sound = "boltforward"},
	{time = 2, sound = "CW_FOLEY_MEDIUM"}}}

SWEP.SpeedDec = 40

SWEP.Slot = 2
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
SWEP.ViewModel		= "models/weapons/v_rif_galil_ace.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_galil_ace.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x39MM"

SWEP.FireDelay = 0.092
SWEP.FireSound = "galil-ace"
SWEP.FireSoundSuppressed = "CW_G3A3_FIRE_SUPPRESSED"
SWEP.Recoil = 1.25

SWEP.HipSpread = 0.044
SWEP.AimSpread = 0.0022
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.060
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 38
SWEP.DeployTime = 0,8

SWEP.ReloadSpeed = 0.9
SWEP.ReloadTime = 2.8
SWEP.ReloadTime_Empty = 2.8
SWEP.ReloadHalt = 2.8
SWEP.ReloadHalt_Empty = 2.8

SWEP.SnapToIdlePostReload = true

function SWEP:IndividualThink()

	self.EffectiveRange = 115 * 180
	self.DamageFallOff = .35
	
end