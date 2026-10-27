AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("28 Gauge", "28 Gauge Rounds", 5, 10)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Raging Judge (Black Ops II)"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.SelectIcon = surface.GetTextureID("weaponicons/mr96")
	killicon.Add("cw_mr96", "weaponicons/mr96", Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_shotgun"
	SWEP.PosBasedMuz = false
	SWEP.NoShells = true

	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/weapons/w_raging_judge.mdl"
	SWEP.WMPos = Vector(-0.8, 0.1, 0.5)
	SWEP.WMAng = Vector(-3, 0, 180)
		
	SWEP.IronsightPos = Vector(-2.677, 0, 0)
	SWEP.IronsightAng = Vector(-0.561, -0.233, 0)
	
	SWEP.SprintPos = Vector(3.076, 0, 1.23)
	SWEP.SprintAng = Vector(-27.307, 16.343, 0)
	
	SWEP.AlternativePos = Vector(-0.281, 1.325, -0.52)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 1.8
	SWEP.FullAimViewmodelRecoil = false
	SWEP.HUD_MagText = "CYLINDER: "

	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1.5, roll = 3, forward = 1, pitch = 4}
	SWEP.CustomizationMenuScale = 0.025
	SWEP.DisableSprintViewSimulation = true
end

SWEP.BarrelBGs = {main = 1, regular = 1, long = 2, short = 0}
SWEP.LuaViewmodelRecoil = false
SWEP.ADSFireAnim = true
SWEP.CanRestOnObjects = false

SWEP.Attachments = {["+attack2"] = {header = "Perks", offset = {-250, -75},  atts = {"pk_sleightofhand", "pk_light"}},
	["+reload"] = {header = "Ammo", offset = {500, -75}, atts = {"am_slugrounds", "am_flechetterounds"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {[1] = {time = 0, sound = "CW_FOLEY_LIGHT"},
	[2] = {time = 0.5, sound = "CW_RINIC_EXECUTIONER_CYLINDEROPEN"},
	[3] = {time = 0.61, sound = "CW_RINIC_EXECUTIONER_SPIN"},
	[4] = {time = 1.09, sound = "CW_RINIC_EXECUTIONER_CYLINDERCLOSE"}},

	reload = {[1] = {time = 0.3, sound = "CW_RINIC_EXECUTIONER_CYLINDEROPEN"},
	[2] = {time = 0.36, sound = "CW_RINIC_EXECUTIONER_SPIN"},
	[3] = {time = 1.21, sound = "CW_RINIC_EXECUTIONER_ROUNDSOUT"},
	[4] = {time = 1.87, sound = "CW_RINIC_EXECUTIONER_ROUNDSIN"},
	[5] = {time = 2.59, sound = "CW_RINIC_EXECUTIONER_CYLINDERCLOSE"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"double"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 Rinic's Pack"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/weapons/v_raging_judge.mdl"
SWEP.WorldModel		= "models/cw2/weapons/w_raging_judge.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 25
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "28 Gauge"

SWEP.FireDelay = 60/468
SWEP.FireSound = "CW_RINIC_EXECUTIONER_FIRE"
SWEP.Recoil = 3.2

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.045
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.45
SWEP.Shots = 8
SWEP.Damage = 30
SWEP.DeployTime = 0.7
SWEP.Chamberable = false
SWEP.ZoomAmount = 5

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.1
SWEP.ReloadHalt = 2.4

SWEP.ReloadTime_Empty = 2.1
SWEP.ReloadHalt_Empty = 2.4