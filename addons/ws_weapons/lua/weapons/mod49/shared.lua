AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("7.62x25MM", "7.62x25MM Tokarev", 7.62, 25)	

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Zastava Automat M49"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "x"
	killicon.AddFont("cw_mp5", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.PosBasedMuz = true
	SWEP.Shell = "smallshell"
	SWEP.ShellDelay = 0.04
	SWEP.ShellScale = 0.5
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -2}
	SWEP.SightWithRail = false
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.IronsightPos = Vector(-3.32, 0, 1.08)
	SWEP.IronsightAng = Vector(1.7, 1, 5.5)
	
	SWEP.SprintPos = Vector(2.96, 0, -3.08)
	SWEP.SprintAng = Vector(-14.9, 51.299, -26.9)
	
	SWEP.AlternativePos = Vector(.5, .5, -0.202)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.CustomizationMenuScale = 0.015
	SWEP.ViewModelMovementScale = 1
	
end

SWEP.MuzzleVelocity = 488 -- in meter/s
SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 1, roll = .25, forward = 1.5, pitch = 1.5}
SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {-500, 200}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"Mod49_Fire1", "Mod49_Fire2", "Mod49_Fire3"},
	reload = "Mod49_Reload",
	idle = "Mod49_Idle",
	draw = "Mod49_Draw"}
	
SWEP.Sounds = {	Mod49_Draw = {{time = 0, sound = "M49_DRAW"}},

	Mod49_Reload = {{time = 0.6, sound = "M49_MAGOUT"},
	{time = 2, sound = "M49_MAGIN"},
	{time = 0.5, sound = "M49_PULL"}}}

SWEP.Chamberable = true

SWEP.SpeedDec = 30

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Cold War"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= "No"
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_smg_m90.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_m90.mdl"
SWEP.UseHands = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 35
SWEP.Primary.DefaultClip	= 350
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x25MM"

SWEP.FireDelay = 60/550
SWEP.FireSound = "M49_FIRE"
SWEP.Recoil = 0.5

SWEP.HipSpread = 0.040
SWEP.AimSpread = 0.0039
SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.045
SWEP.SpreadPerShot = 0.003
SWEP.SpreadCooldown = 0.14
SWEP.Shots = 1
SWEP.Damage = 35
SWEP.DeployTime = 0.5

SWEP.ReloadSpeed = 1.3
SWEP.ReloadTime = 2.4
SWEP.ReloadTime_Empty = 2.6
SWEP.ReloadHalt = 2.8
SWEP.ReloadHalt_Empty = 3