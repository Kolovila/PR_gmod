AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("9x18MM", "9x18MM Rounds", 9, 18)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "LEO"
	
	SWEP.IconLetter = "a"
	killicon.AddFont("", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.8
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -0.4, y = 2, z = 3.6}
		
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_pist_fiveseven.mdl"
	SWEP.WMPos = Vector(-1, 0, 0)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.IronsightPos = Vector(-1.356, 0, 0.479)
	SWEP.IronsightAng = Vector(-0.231, 0.037, 1.3)

	SWEP.MicroT1Pos = Vector(-2.135, 0, -0.237)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.RMRPos = Vector(-1.346, 0, 0.209)
	SWEP.RMRAng = Vector(-0.105, 0.059, 1.3)

	SWEP.SprintPos = Vector(2.313, -1.091, -4.294)
	SWEP.SprintAng = Vector(38.793, -1.349, 0)
	
	SWEP.CustomizePos = Vector(4.647, 0, -0.547)
	SWEP.CustomizeAng = Vector(6.801, 29.028, 0)
	
	--SWEP.SwimPos = Vector(3.668, 0.492, -0.991)
	--SWEP.SwimAng = Vector(-5.232, 15, 0)
	
	SWEP.PronePos = Vector(3.668, 0.492, -0.991)
	SWEP.ProneAng = Vector(-5.232, 20.628, 0)
	
	SWEP.ReticleInactivityPostFire = 0.3

	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	SWEP.FullAimViewmodelRecoil = true
	--SWEP.BoltBone = "Slide"
	--SWEP.BoltShootOffset = Vector(-0.7, 0, 0)
	SWEP.BoltBonePositionRecoverySpeed = 25
	SWEP.StopReloadBoneOffset = 0.8
	SWEP.HoldBoltWhileEmpty = false
	SWEP.DontHoldWhenReloading = true
	SWEP.DisableSprintViewSimulation = true
	SWEP.SightWithRail = false
	SWEP.FOVPerShot = 0.3

	SWEP.AttachmentModelsVM = {
		["md_rmr"] = {model = "models/cw2/attachments/pistolholo.mdl", bone = "slide", rel = "", pos = Vector(-0.181, 2.153, 2.555), angle = Angle(-180, -90, 0), size = Vector(0.5, 0.469, 0.5)},
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "body", rel = "", pos = Vector(0, -1.77, 5.635), angle = Angle(0, 0, 90), size = Vector(0.535, 0.535, 0.535)},
	    ["md_insight_x2"] = {model = "models/cw2/attachments/pistollaser.mdl", bone = "body", rel = "", pos = Vector(-0, -0.543, 1.843), angle = Angle(-90, 0, -90), size = Vector(0.108, 0.108, 0.108)}
	}
	
	SWEP.LaserPosAdjust = Vector(0.5, 0, -1.5)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.25, hor = 0.5, roll = 2, forward = 0, pitch = 1}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 17 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	--SWEP.AttachmentPosDependency = {["md_insight_x2"] = {["md_microt1"] = Vector(-0.188, -5.661, 1.4)}}
	
    SWEP.FullAimViewmodelRecoil = false
end

SWEP.ShootWhileProne = false
SWEP.MuzzleVelocity = 500 -- in meter/s

SWEP.LuaViewmodelRecoilOverride = false
SWEP.CanRestOnObjects = false

SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -300}, atts = {"md_rmr"}},
    [2] = {header = "Barrel", offset = {-350, -200}, atts = {"md_tundra9mm"}},
	[3] = {header = "Rail", offset = {-350, 200}, atts = {"md_insight_x2"}},
	["+reload"] = {header = "Ammo", offset = {800, 330}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {reload = "glock_reload",
	fire = {"glock_firesingle"},
	fire_dry = "glock_firelast",
	idle = "glock_idle",
	draw = "glock_draw"}
	
SWEP.Sounds = {glock_draw = {{time = 0, sound = "CW_FOLEY_LIGHT"}},

	glock_reload = {{time = 0, sound = "CW_LEO_SLIDE_BACK"},
	{time = 0.24, sound = "CW_CLOTH1"},
	{time = 0.53, sound = "CW_LEO_MAGOUT"},
	{time = 0.55, sound = "CW_CLOTH"},
	{time = 1.0, sound = "CW_LEO_CLOTH"},
	{time = 1.1, sound = "CW_LEO_MAGIN"},
	{time = 1.2, sound = "CW_CLOTH2"},
	{time = 1.52, sound = "CW_LEO_SLIDERELEASE"},
	{time = 1.6, sound = "CW_CLOTH3"}}
}

SWEP.SpeedDec = 5

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_pist_leo.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_fiveseven.mdl"
SWEP.ADSFireAnim = true
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.16
SWEP.FireSound = "CW_LEO"
SWEP.FireSoundSuppressed = "CW_LEO_FIRE_SUPPRESSED"
SWEP.Recoil = 0.6

SWEP.HipSpread = 0.043
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.025
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.4
SWEP.Shots = 1
SWEP.Damage = 22.5
SWEP.DeployTime = 0.4
--SWEP.Chamberable = false

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.3
SWEP.ReloadHalt = 2.3

SWEP.ReloadTime_Empty = 2.3
SWEP.ReloadHalt_Empty = 2.3

SWEP.SnapToIdlePostReload = true