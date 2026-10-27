AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("9x18MM", "9x18MM Rounds", 9, 18)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Prokolot"
	
	SWEP.IconLetter = "a"
	killicon.AddFont("", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true

	SWEP.Shell = "smallshell"
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_pist_prokolot.mdl"
	SWEP.WMPos = Vector(-1, 0, 0)
	SWEP.WMAng = Vector(0, 0, 180)
		
	SWEP.IronsightPos = Vector(-2.709, 0, 0.833)
	SWEP.IronsightAng = Vector(-0.058, 0.019, 0)

	SWEP.MicroT1Pos = Vector(-2.135, 0, -0.237)
	SWEP.MicroT1Ang = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(2.526, -9.506, -8.24)
	SWEP.SprintAng = Vector(70, 0, 0)

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
		["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "Gun", rel = "", pos = Vector(0.009, -6.105, -0.35), angle = Angle(0, 0, 0), size = Vector(0.644, 0.644, 0.644)},
	    ["md_insight_x2"] = {model = "models/cw2/attachments/pistollaser.mdl", bone = "Gun", rel = "", pos = Vector(0, -1.67, -0.35), angle = Angle(0, -90, 0), size = Vector(0.115, 0.115, 0.115)}
	}
	
	SWEP.LaserPosAdjust = Vector(0.5, 0, -1.5)
	SWEP.LaserAngAdjust = Angle(0, 180, 0) 
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.25, hor = 0.5, roll = 2, forward = 0, pitch = 1}
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 17 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	--SWEP.AttachmentPosDependency = {["md_insight_x2"] = {["md_microt1"] = Vector(-0.188, -5.661, 1.4)}}
	
    SWEP.FullAimViewmodelRecoil = false
end

SWEP.MuzzleVelocity = 408 -- in meter/s

SWEP.LuaViewmodelRecoilOverride = false
SWEP.CanRestOnObjects = false

SWEP.Attachments = {[1] = {header = "Barrel", offset = {-350, -200}, atts = {"md_tundra9mm"}},
	[2] = {header = "Rail", offset = {-350, 200}, atts = {"md_insight_x2"}},
	["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {reload = "glock_reload",
	fire = {"glock_firesingle"},
	fire_dry = "glock_firelast",
	idle = "glock_idle",
	draw = "glock_draw"}
	
SWEP.Sounds = {glock_draw = {{time = 0, sound = "CW_FOLEY_LIGHT"},
    {time = 0.1, sound = "CW_prokolot_SLIDE"},
    {time = 0.3, sound = "CW_prokolot_SLIDERELEASE"}},

	glock_reload = {{time = 0, sound = "CW_prokolot_SLIDE"},
	{time = 0.24, sound = "CW_CLOTH1"},
	{time = 0.28, sound = "CW_prokolot_MAGOUT"},
	{time = 0.55, sound = "CW_CLOTH"},
	{time = 0.62, sound = "CW_prokolot_MAGIN"},
	{time = 0.65, sound = "CW_CLOTH2"},
	{time = 1.3, sound = "CW_prokolot_SLIDERELEASE"},
	{time = 1.35, sound = "CW_CLOTH3"}}
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
SWEP.ViewModel		= "models/weapons/v_pist_prokolot.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_prokolot.mdl"
SWEP.ADSFireAnim = true
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 15
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 0.20
SWEP.FireSound = "CW_prokolot"
SWEP.FireSoundSuppressed = "CW_prokolot_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.007
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.5
SWEP.Shots = 1
SWEP.Damage = 29
SWEP.DeployTime = 0.6
--SWEP.Chamberable = false

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.15
SWEP.ReloadHalt = 2.15

SWEP.ReloadTime_Empty = 2.15
SWEP.ReloadHalt_Empty = 2.15

SWEP.SnapToIdlePostReload = true