if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		SWEP.magType = "pistolMag"
		
if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M1903 Hammerless"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_ppk")
	killicon.Add( "doi_atow_ppk", "vgui/inventory/killicons/weapon_ppk", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.ForeGripOffsetCycle_Draw = 0
	
	SWEP.EffectiveRange_Orig = 150 * 39.37
	SWEP.DamageFallOff_Orig = .43
	
	SWEP.Shell = "khr380"
	SWEP.ShellScale = .8
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -1.45, y = -1.75, z = -.3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	
	SWEP.IronsightPos = Vector(-2.188, -2, 1.08)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1, -7.2632, -8.3158)
	SWEP.SprintAng = Vector(51.6842, -0.5789, -3.7895)
	
	SWEP.CustomizePos = Vector(5, -3, .2)
	SWEP.CustomizeAng = Vector(15, 20, 20)

	SWEP.AlternativePos = Vector(-0.75, -1, -0.25)
	SWEP.AlternativeAng = Vector(-0.054, 0.067, 0)
	
	SWEP.SwimPos = Vector(0.5, -2.1053, -0.5)
	SWEP.SwimAng = Vector(-50.8947, -3.7895, -46.5263)
	
	SWEP.PronePos = Vector(0, -3, -3.1579)
	SWEP.ProneAng = Vector(10, 12.7368, -8.9474)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 2, roll = 2, forward = 1.5, pitch = 2}
	SWEP.CustomizationMenuScale = 0.01 --  0.012
	
	SWEP.ForegripOverridePos = {

	["nah"] = {
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, -.4), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.26, 0), angle = Angle(0, 0, 0) },
	["R Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, -.35, 0), angle = Angle(0, 0, 0) }}
}
	SWEP.AttachmentModelsVM = {["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/unisuppressor.mdl", pos = Vector(-.021, 1.85, .3), angle = Angle(0, -90, 0), size = Vector(0.675, 0.675, 0.675), bone = "Weapon"}}
	
end
end

SWEP.MuzzleVelocity = 260

SWEP.LuaViewmodelRecoil = false
SWEP.CanRestOnObjects = true

SWEP.Attachments = {
[1] = {header = "Muzzle", offset = {-550, -300}, atts = {"doi_atow_unisuppressor"}},
["+reload"] = {header = "Ammo", offset = {-580, 390}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy"}}}

SWEP.Animations = {fire = {"iron_fire","iron_fire2","iron_fire3"},
	fire_aim = {"iron_fire","iron_fire2","iron_fire3"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	idle = "base_idle",
	draw = "base_draw"}
	
SWEP.ReloadViewBobEnabled = false //

SWEP.SpeedDec = 15
SWEP.FOVPerShot = 0

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Pistols"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 65
SWEP.AimViewModelFOV = 55
SWEP.ZoomAmount = 0
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/fn1903.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_ppk.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_ppk.mdl"
SWEP.WMPos = Vector(-1.45, 5, 4)
SWEP.WMAng = Vector(-5, 0, 180)

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = .25
SWEP.RVBRollMod = .5


SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= false
SWEP.Chamberable			= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "Pistol"
else
SWEP.Primary.Ammo			= ".32 ACP"
end

SWEP.FireDelay = 60/500
SWEP.FireSound = "DOIPPK_FIRE"
SWEP.FireSoundSuppressed = "DOIPPK_FIRE_SUPPRESSED"
SWEP.Recoil = .6
 -- = .34

SWEP.HipSpread = 0.041
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0.035
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 25
SWEP.DeployTime = .25
SWEP.HolsterTime = .25

SWEP.ADSFireAnim = true
SWEP.HolsterOnLadder = false
SWEP.SprintingEnabled = false
SWEP.ShootWhileProne = true

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.8
SWEP.ReloadHalt = 2.4
SWEP.ReloadTime_Empty = 2.5
SWEP.ReloadHalt_Empty = 2.9

function SWEP:IndividualThink()
	
	if not self.ActiveAttachments.doi_atow_onehand then
		self.ForegripOverride = true
		self.ForegripParent = "nah"
	end
	
	self.EffectiveRange = 150 * 39.37
	self.DamageFallOff = .43
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange + 35 * 39.37))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .129))
end
	
	if self.ActiveAttachments.doi_atow_unisuppressor then
	self.EffectiveRange = ((self.EffectiveRange - 25 * 39.37))
	self.DamageFallOff = ((self.DamageFallOff + .15))
end
end

function SWEP:fireAnimFunc()
	clip = self:Clip1()
	cycle = 0
	rate = .85
	anim = "safe"
	prefix = ""
	suffix = ""
	
	if self:isAiming() then
		suffix = suffix .. "_aim"
		cycle = self.ironFireAnimStartCycle
	end
	
	self:sendWeaponAnim(prefix .. "fire" .. suffix, rate, cycle)
end //*/

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