AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Double Barrel Shotgun"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.SelectIcon = surface.GetTextureID("weaponicons/dbarrel")
	killicon.Add("cw_dbarrel", "weaponicons/dbarrel", Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosOffset = {x = 0, y = 4, z = -1}
	SWEP.SnapToGrip = false
	SWEP.ShellScale = 0
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "none"
	SWEP.ShellDelay = 0
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2/shotguns/w_dbarrel.mdl"
	SWEP.WMPos = Vector(-1, 3, 0.25)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.ShellPosOffset = {x = 0, y = 1, z = 0.5}
		
	SWEP.IronsightPos = Vector(-2.814, -2.211, 1.531)
	SWEP.IronsightAng = Vector(0.95, -0.025, 0)
		
	SWEP.CustomizePos = Vector(7.711, -0.482, -2)
	SWEP.CustomizeAng = Vector(16.364, 40.741, 15.277)	
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.03
end

SWEP.MuzzleVelocity = 274 -- in meter/s

SWEP.BarrelBGs = {main = 3, regular = 0, shorty = 1}
SWEP.StockBGs = {main = 2, regular = 0, shorty = 1}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Barrel", offset = {-200, -400}, atts = {"bg_barrelshorty"}},
	[2] = {header = "Stock", offset = {800, 0}, atts = {"bg_stockshorty"}},
	["+reload"] = {header = "Ammo", offset = {-200, 300}, atts = {"am_slugrounds", "am_flechetterounds"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.26, sound = "CW_DBARREL_BARRELUP"}},

	insert = {{time = 0.3, sound = "CW_DBARREL_INSERT"}},
	
	after_reload = {{time = 0.4, sound = "CW_DBARREL_BARRELDOWN"}},
	
	draw = {{time = 0.5, sound = "CW_DBARREL_BARRELDOWN"}}}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi", "2burst"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Pepaund"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/shotguns/v_dbarrel.mdl"
SWEP.WorldModel		= "models/cw2/shotguns/w_dbarrel.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 2
SWEP.Primary.DefaultClip	= 2
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0
SWEP.FireSound = "CW_DBARREL_FIRE"
SWEP.Recoil = 5

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.05
SWEP.ClumpSpread = 0.016
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.5
SWEP.Shots = 12
SWEP.Damage = 12
SWEP.DeployTime = 0.8

SWEP.ReloadStartTime = 0.6
SWEP.InsertShellTime = 0.58
SWEP.ReloadFinishWait = 1
SWEP.PumpMidReloadWait = 0
SWEP.ShotgunReload = true

SWEP.Chamberable = false