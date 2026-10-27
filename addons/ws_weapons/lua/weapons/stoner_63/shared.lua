AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

		SWEP.magType = "smgMag"
	
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Stoner 63"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_m3greasegun")
	killicon.Add( "stoner_63", "vgui/inventory/weapon_m3greasegun", Color(255, 80, 0, 0))

	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 105 * 39.37
	SWEP.DamageFallOff_Orig = .43
	
	SWEP.Shell = "khr9x25"
	SWEP.ShellScale = .78
	SWEP.ShellDelay = .075
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2.75, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = .85
	SWEP.ForeGripOffsetCycle_Reload_Empty = .85

	SWEP.IronsightPos = Vector(-2.813, -2.73, 0.68)
	SWEP.IronsightAng = Vector(0.1, 0.019, 0)
	
	SWEP.SprintPos = Vector(6.39, -14.7, -7.55)
	SWEP.SprintAng = Vector(40.5, 58.5, 26.7)
	
	SWEP.CustomizePos = Vector(10, -4, -2)
	SWEP.CustomizeAng = Vector(20, 45, 12)

	SWEP.AlternativePos = Vector(-.6, 1.5, .5)
	SWEP.AlternativeAng = Vector(0, -1, 9)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-30.8947, 33.0455, -10.2273)
	
	SWEP.PronePos = Vector(0, 0, -2.1579)
	SWEP.ProneAng = Vector(-2, 12.7368, -8.9474)

	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = .9
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.AttachmentModelsVM = {["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/unisuppressor.mdl", pos = Vector(-3.59, 6, 2.2), angle = Angle(0, -90, 0), size = Vector(1.3, 1, 1), bone = "Weapon"}}
	
	SWEP.ForegripOverridePos = {
	["nah"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-3, -.34, -2.1), angle = Angle(0, 0, -5) },
	--["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-3, 6, -20) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-2, 10, 2) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-5, -5, 0) },
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }},
}
	
	SWEP.CustomizationMenuScale = 0.019 --  0.0195
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = .25, forward = .3, pitch = .25}
end

SWEP.MuzzleVelocity = 425

SWEP.LuaViewmodelRecoil = false
SWEP.LuaViewmodelRecoilOverride = false
SWEP.FullAimViewmodelRecoil = false
SWEP.CanRestOnObjects = true
--SWEP.AimBreathingEnabled = true
--SWEP.AimBreathingIntensity = .75

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {200, 150}, atts = {"am_atow_heavy", "am_atow_light"}},
-- [1] = {header = "Grip", offset = {500, 300}, atts = {"stoner_lmg_grip"}},
[2] = {header = "Magazine", offset = {-200, 400}, atts = {"stoner_ext_mag"}}}

SWEP.Sounds = {draw = {{time = 0, sound = "STONER_DEPLOY"}},
	
	bigammo_reload_tac = {
		{time = 12/30, sound = "STONER_OUT"},
		{time = 50/30, sound = "STONER_IN1"},
		{time = 70/30, sound = "STONER_IN2"}},
		
	bigammo_reload_empty = {
		{time = 12/30, sound = "STONER_OUT"},
		{time = 50/30, sound = "STONER_IN1"},
		{time = 120/30, sound = "STONER_IN2"},
		{time = 60/30, sound = "STONER_PULL"},
		{time = 40/30,   sound = "STONER_RELEASE"}},
		
	reload_tac = {
		{time = 12/30, sound = "STONER_OUT"},
		{time = 50/30, sound = "STONER_IN1"},
		{time = 70/30, sound = "STONER_IN2"}},
		
	reload_empty = {
		{time = 12/30, sound = "STONER_OUT"},
		{time = 50/30, sound = "STONER_IN1"},
		{time = 120/30, sound = "STONER_IN2"},
		{time = 60/30, sound = "STONER_PULL"},
		{time = 40/30,   sound = "STONER_RELEASE"}}}
	
SWEP.Animations = {fire = {"fire"},
	fire_aim = {"fire"},
	reload = "reload_tac",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
	
SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "donis"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_bo1_stoner63.mdl"	
SWEP.WorldModel		= "models/weapons/w_bo1_stoner63.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/w_bo1_stoner63.mdl"
SWEP.WMPos = Vector(2, 1, -1)
SWEP.WMAng = Vector(0, -9, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = true
SWEP.RVBPitchMod = .85
SWEP.RVBYawMod = .5
SWEP.RVBRollMod = .85

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 360
SWEP.Primary.Automatic		= true
SWEP.Chamberable			= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 60/700
SWEP.FireSound = "STONER_FIRE"
SWEP.Recoil = 0.95
SWEP.FOVPerShot = 0.05 -- = .6

SWEP.HipSpread = 0.042
SWEP.AimSpread = 0.0039
SWEP.VelocitySensitivity = .35
SWEP.MaxSpreadInc = 0.055
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.17
SWEP.Shots = 1
SWEP.Damage = 33
SWEP.DeployTime = .4
SWEP.HolsterTime = .5
SWEP.ADSFireAnim = true

SWEP.RecoilToSpread = .77

SWEP.ReloadSpeed = 1.325
SWEP.ReloadTime = 2.5
SWEP.ReloadHalt = 2.8
SWEP.ReloadTime_Empty = 2.5
SWEP.ReloadHalt_Empty = 2.8

SWEP.NearWallEnabled = false

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
