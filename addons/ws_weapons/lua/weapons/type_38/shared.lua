AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

	SWEP.magType = "NONE"
	
	CustomizableWeaponry:registerAmmo("6.5x50MM", "6.5x50MM Rounds", 6.5, 50)
	CustomizableWeaponry.firemodes:registerFiremode("melee", "READY", true, 0, 0)
	
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Arisaka Type 38"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "i"
	killicon.AddFont("cw_g3a3", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	
	SWEP.EffectiveRange_Orig = 250 * 39.37
	SWEP.DamageFallOff_Orig = .15
	
	SWEP.Shell = "mainshell"
	SWEP.ShellScale = .535
	SWEP.ShellDelay = 1
	SWEP.ShellDelaySlow = 1
	SWEP.ShellDelayFast = .9
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 3.75, y = 0, z = .5}

	SWEP.IronsightPos = Vector(-10.301, -9.322, 3.858)
	SWEP.IronsightAng = Vector(0.36, -0.051, 0.843)
	
	SWEP.SprintPos = Vector(1.3, 0, 1.406)
	SWEP.SprintAng = Vector(-17.813, 3.454, -6.294)
	
	SWEP.CustomizePos = Vector(4.75, -1.627, -1.821)
	SWEP.CustomizeAng = Vector(15.009, 18.971, 16.669)

	SWEP.AlternativePos = Vector(-0.75, 0, -0.1)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-55.8947, 55.0455, -16.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1.3
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.OverallMouseSens = .75
	SWEP.CustomizationMenuScale = 0.03
	
	SWEP.AttachmentModelsVM = {
	["doi_atow_m73"] = {model = "models/khrcw2/doipack/attachments/springfield4xscope.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Optic"},
	["doi_atow_unertl"] = {model = "models/khrcw2/doipack/attachments/springfield8xscope.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Optic"},
	}
	
	SWEP.ForegripOverridePos = {
	["nah"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 3.5, 0) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-2.5,-8, 5) },
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 1, 5) }}}
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = .25, forward = 0, pitch = .75}
end

SWEP.MuzzleVelocity = 762

SWEP.LuaViewmodelRecoil = false
SWEP.LuaViewmodelRecoilOverride = false
SWEP.FullAimViewmodelRecoil = false
SWEP.CanRestOnObjects = true
--SWEP.AimBreathingEnabled = true

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {-150, 250}, atts = {"am_magnum", "am_matchgrade"}}}
	
SWEP.Animations = {fire = {"fire"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "TYPE38_DRAW"}},
	
	fire = {{time = 20/30, sound = "TYPE38_BOLT"}},

	reload = {
		{time = 5/30, sound = "TYPE38_BOLTBACK"},
		{time = 20/30, sound = "TYPE38_CLIPIN"},
		{time = 65/30, sound = "TYPE38_BOLTFORWARD"}}}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] WW1"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.AimViewModelFOV = 65
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_arisaka.mdl"
SWEP.WorldModel		= "models/weapons/w_arisaka.mdl"
SWEP.UseHands = true

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/w_arisaka.mdl"
SWEP.WMPos = Vector(-.25, 14, .55)
SWEP.WMAng = Vector(-10, .8, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "6.5x50MM"

SWEP.FireDelay = 60/33
SWEP.FireSound = "TYPE38_FIRE"
SWEP.Recoil = 1.4
SWEP.FOVPerShot = 1

SWEP.HipSpread = 0.0010
SWEP.AimSpread = 0.0005
SWEP.VelocitySensitivity = 2.7
SWEP.MaxSpreadInc = 0.007
SWEP.SpreadPerShot = 0.00125
SWEP.SpreadCooldown = 1.7
SWEP.Shots = 1
SWEP.Damage = 70
SWEP.DeployTime = .5
SWEP.HolsterTime = .65

SWEP.ADSFireAnim = true
SWEP.Chamberable = false
SWEP.PreventQuickScoping = true

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 1.6
SWEP.ReloadHalt = 3.6
SWEP.ReloadTime_Empty = 1.6
SWEP.ReloadHalt_Empty = 3.6
