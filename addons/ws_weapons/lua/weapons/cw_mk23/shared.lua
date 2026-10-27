AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "H&K MK23"
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = false

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 1
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 3, y = 2, z = -6}
	
	SWEP.IronsightPos = Vector(2.04, 0, 1.065)
	SWEP.IronsightAng = Vector(-0.057, 0.174, 0)
	
	SWEP.SprintPos = Vector(-2.526, -7.55, -8.24)
	SWEP.SprintAng = Vector(70, 0, 0)
	
	SWEP.MicroT1Pos = Vector(2.165, 0, -0.045)
	SWEP.MicroT1Ang = Vector(-0.42, 0.28, 0)
	
	SWEP.RMRPos = Vector(2.029, 0, 0.349)
	SWEP.RMRAng = Vector(0, 0, 0)
	
	SWEP.CustomizePos = Vector(-7.901, -1.037, -1.476)
	SWEP.CustomizeAng = Vector(16.968, -41.403, -11.54)
	
	SWEP.PronePos = Vector(6.717, -6.273, -6.577)
	SWEP.ProneAng = Vector(5.618, 49.055, -15.311)

	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	SWEP.FullAimViewmodelRecoil = false
	SWEP.BoltBone = "Slide"
	SWEP.BoltShootOffset = Vector(1.449, 0, 0)
	SWEP.BoltBonePositionRecoverySpeed = 25
	SWEP.OffsetBoltDuringNonEmptyReload = true
	SWEP.BoltReloadOffset = Vector(-1.449, 0, 0)
	SWEP.ReloadBoltBonePositionRecoverySpeed = 30
	SWEP.ReloadBoltBonePositionMoveSpeed = 100
	SWEP.StopReloadBoneOffset = 0.7
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	SWEP.DisableSprintViewSimulation = true
	SWEP.SightWithRail = true
	SWEP.FOVPerShot = 0.3

	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/cw2/attachments/pistolrail.mdl", bone = "Frame", rel = "", pos = Vector(-0.267, -0.806, -0), angle = Angle(0, 0, 90), size = Vector(0.15, 0.15, 0.15)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "Frame", rel = "", pos = Vector(5.099, 1.05, -1.5), angle = Angle(0, -90, 0), size = Vector(0.5, 0.5, 0.5)},
		["md_microt1"] = {model = "models/cw2/attachments/microt1.mdl", bone = "Frame", rel = "", pos = Vector(-1.027, 1.855, 0.072), angle = Angle(90, 0, 90), size = Vector(0.5, 0.5, 0.5)},
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "Frame", rel = "", pos = Vector(4.426, -3.162, 0.319), angle = Angle(-180, 0, 90), size = Vector(0.85, 0.85, 0.85)},
		["md_insight_x2"] = {model = "models/cw2/attachments/pistollaser.mdl", bone = "Frame", rel = "", pos = Vector(-0.726, 0.129, 0.25), angle = Angle(0, 0, 90), size = Vector(0.14, 0.14, 0.14)}
	}

	SWEP.LaserPosAdjust = Vector(0.25, 0, -1)
	SWEP.LaserAngAdjust = Angle(0, 180, 0)
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/pistols/w_mk23.mdl"
	SWEP.WMPos = Vector(-1.25, 0, 0)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 17 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
end

SWEP.ShootWhileProne = true

SWEP.MuzzleVelocity = 260 -- in meter/s

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.CanRestOnObjects = false

SWEP.Attachments = {[1] = {header = "Barrel", offset = {-350, -200}, atts = {"md_saker"}},
	[2] = {header = "Sight", offset = {400, -300}, atts = {"md_microt1", "md_rmr"}},
	[3] = {header = "Rail", offset = {-350, 200}, atts = {"md_insight_x2"}},
	["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {reload = "reload",
	fire = {"shoot1", "shoot2", "shoot3"},
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_LIGHT"},
	{time = 0.85, sound = "CW_MK23_SLIDEBACK"}},

	reload = {{time = 0, sound = "CW_MK23_SLIDEBACK2"},
	{time = 0.5, sound = "CW_MK23_CLIPOUT"},
	{time = 1.18, sound = "CW_MK23_CLIPIN"},
	{time = 2.31, sound = "CW_MK23_SLIDERELEASE"}}
}

SWEP.SpeedDec = 7

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Pepaund"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/cw2/pistols/v_mk23.mdl"
SWEP.WorldModel		= "models/cw2/pistols/w_mk23.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 12
SWEP.Primary.DefaultClip	= 12
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".45 ACP"

SWEP.FireDelay = 0
SWEP.FireSound = "CW_MK23_FIRE"
SWEP.FireSoundSuppressed = "CW_MK23_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.25
SWEP.MaxSpreadInc = 0.037
SWEP.SpreadPerShot = 0.013
SWEP.SpreadCooldown = 0.18
SWEP.Shots = 1
SWEP.Damage = 25
SWEP.DrawSpeed = 1.1
SWEP.DeployTime = 1.1

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.86
SWEP.ReloadHalt = 1.86

SWEP.ReloadTime_Empty = 2.67
SWEP.ReloadHalt_Empty = 2.67

SWEP.SnapToIdlePostReload = true