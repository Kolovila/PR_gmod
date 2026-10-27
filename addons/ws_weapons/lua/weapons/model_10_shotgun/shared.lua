AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

	SWEP.magType = "NONE"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Remington Model 10"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/hud/bf1_model_10")
	killicon.Add( "model_10_shotgun", "vgui/killicons/bf1_model_10", Color(255, 80, 0, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 24 * 39.37
	SWEP.DamageFallOff_Orig = .58
	
	SWEP.Shell = "shotshell"
	SWEP.ShellScale = .41
	SWEP.ShellDelay = .525
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 3.52, y = -.5, z = .45}

	SWEP.IronsightPos = Vector(-2.375, 0, 0.94)
	SWEP.IronsightAng = Vector(-0.05, -0.01, 0)

	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-15.478, 20.96, 0)
	
	SWEP.CustomizePos = Vector(3.6, -1, -2.661)
	SWEP.CustomizeAng = Vector(13.477, 16.809, 5.477)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-40.8947, 40.0455, -12.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.AlternativePos = Vector(0, -0.4, -0.5)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1.2
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.LuaVMRecoilAxisMod = {vert = .2, hor = .15, roll = .15, forward = .75, pitch = .25}
	SWEP.OverallMouseSens = .825
	SWEP.CustomizationMenuScale = 0.025
	
	SWEP.AttachmentModelsVM = {}
	
end

SWEP.MuzzleVelocity = 340

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = false
SWEP.CanRestOnObjects = true

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {-200, 300}, atts = {"am_slugrounds", "am_flechetterounds"}}}

SWEP.Animations = {fire = {"base_fire_cock_1","base_fire_cock_2"},
	fire_aim = {"iron_fire_cock_1","iron_fire_cock_2"},
	reload_start = "base_reload_start",
	insert = "base_reload_insert",
	reload_end = "base_reload_end",
	idle = "base_idle",
	draw = "base_draw"}
	
SWEP.Sounds = {base_reload_start = {{time = 5/30, sound = "ISN2SHARED_LEANIN"}},

	base_reload_insert = {{time = 9/42, sound = "M1897_SHELLINSERT"}},

	base_reload_end = {{time = 5/32, sound = "INS2SHARED_LEANIN"}}}
	
SWEP.SpeedDec = 35

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"pump"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] WW1"

SWEP.Author			= ""
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV		= 70
SWEP.AimViewModelFOV 	= 70
SWEP.ViewModelFlip		= false
SWEP.ViewModel			= "models/weapons/c_m1897.mdl"
SWEP.WorldModel			= "models/weapons/w_m1897.mdl"
SWEP.UseHands 			= true

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/w_m1897.mdl"
SWEP.WMPos = Vector(-1, 2, 0)
SWEP.WMAng = Vector(-16, 2, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = .72
SWEP.FireSound = "CW_M3SUPER90_FIRE"
SWEP.Recoil = 3.2
SWEP.FOVPerShot = 1.2

SWEP.HipSpread = 0.07
--SWEP.AimSpread = 0.014
SWEP.AimSpread = 0.0128
SWEP.VelocitySensitivity = 1.4
SWEP.MaxSpreadInc = 0.029
SWEP.ClumpSpread = 0.03
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.85
SWEP.Shots = 10
SWEP.Damage = 12
SWEP.DeployTime = .55
SWEP.HolsterTime = .6

SWEP.ADSFireAnim = true
SWEP.Chamberable = true
SWEP.ShotgunReload = true
SWEP.PreventQuickScoping = true
--SWEP.AimBreathingEnabled = true
--SWEP.AimBreathingIntensity = .65

SWEP.ReloadSpeed = 1.1
SWEP.ReloadStartTime = 0.5
SWEP.InsertShellTime = .75
SWEP.ReloadFinishWait = .025

local simpleTextColor = Color(255, 210, 0, 255)
local mod = 25

function SWEP:DrawWeaponSelection(x, y, wide, tall, alpha)
	if self.SelectIcon then
		surface.SetTexture(self.SelectIcon)
		
		wide = wide - mod
		
		x = x + (mod / 2)
		y = y + (mod / 4) + (wide / 8)
		
		surface.SetDrawColor(255, 255, 255, alpha)
		
		surface.DrawTexturedRect(x, y, wide, (wide / 2))
	else
		simpleTextColor.a = alpha
		draw.SimpleText(self.IconLetter, self.SelectFont, x + wide / 2, y + tall * 0.2, simpleTextColor, TEXT_ALIGN_CENTER)
	end
end