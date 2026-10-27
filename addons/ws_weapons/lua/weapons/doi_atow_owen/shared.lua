if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		SWEP.magType = "smgMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Owen gun"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_owen")
	killicon.Add( "doi_atow_owen", "vgui/inventory/killicons/weapon_owen", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	
	SWEP.EffectiveRange_Orig = 68 * 39.37
	SWEP.DamageFallOff_Orig = .55
	
	SWEP.Shell = "khr9x19"
	SWEP.ShellScale = .725
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 3}

	SWEP.IronsightPos = Vector(-3.76, -2.5, 2.75)
	SWEP.IronsightAng = Vector(0.25, 1.25, -11.684)

	SWEP.SprintPos = Vector(2, 0, -1)
	SWEP.SprintAng = Vector(-15.478, 30.96, -15)
	
	SWEP.CustomizePos = Vector(10, -4, -2)
	SWEP.CustomizeAng = Vector(20, 45, 15)

	SWEP.AlternativePos = Vector(-1.0526, -1.0526, 0.5)
	SWEP.AlternativeAng = Vector(0, 0, -1.35)

    SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-70.8947, 32.0455, -37.2273)
	
	SWEP.PronePos = Vector(0, 0, -2.1579)
	SWEP.ProneAng = Vector(-2, 12.7368, -8.9474)

	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.CustomizationMenuScale = 0.021 --  0.022
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = .5, forward = .1, pitch = 0}
	
	SWEP.AttachmentModelsVM = {}
	
		SWEP.ForegripOverridePos = {
	["nah"] = {
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, -.4), angle = Angle(0, 0, 0) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, .40, -.5), angle = Angle(5, 2, -5) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, -2, -5) }}
}
end
end

SWEP.MuzzleVelocity = 430

SWEP.BodyBGs = {main = 1, off = 0, on = 1}
SWEP.SlingBGs = {main = 2, off = 0, on = 1}

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = true
SWEP.CanRestOnObjects = true
--SWEP.AimBreathingEnabled = true
--SWEP.AimBreathingIntensity = .75

SWEP.Attachments = {[2] = {header = "Model", offset = {550, -150}, atts = {"doi_atow_owenmk2"}},
[1] = {header = "Accessory", offset = {-250, 50}, atts = {"doi_atow_sling"}},
["+reload"] = {header = "Ammo", offset = {-150, -450}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy"}}}

SWEP.Animations = {fire = {"base_fire_1","base_fire_2"},
	fire_aim = {"iron_fire_1","iron_fire_2","iron_fire_3"},
	fire_last = {"base_firelast"},
	fire_last_aim = {"iron_firelast"},
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	idle = "base_idle",
	draw = "base_draw"}
	

SWEP.SpeedDec = 20
SWEP.ADSSpeedMult = {
standing = .9
}

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto","semi"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Submachine guns"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 61
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/owengun.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_owengun.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_owengun.mdl"
SWEP.WMPos = Vector(-.75, 10, .5)
SWEP.WMAng = Vector(-10, -2, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .4
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 33
SWEP.Primary.DefaultClip	= 33
SWEP.Primary.Automatic		= true
SWEP.Chamberable			= false


SWEP.ForegripOverride = true
SWEP.ForegripParent = "nah"

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "SMG1"
else
SWEP.Primary.Ammo			= "9x19MM"
end

SWEP.FireDelay = 60/790
SWEP.FireSound = "DOIOWEN_FIRE"
SWEP.Recoil = 1
SWEP.HorizontalRecoilMod = .75
SWEP.RecoilToSpread = .2
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .85, 
[HITGROUP_CHEST] = 1, 
[HITGROUP_LEFTARM] = 1.9, 
[HITGROUP_RIGHTARM] = 1.9, 
[HITGROUP_RIGHTLEG] = 1.9, 
[HITGROUP_LEFTLEG] = 1.9}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.012
SWEP.VelocitySensitivity = .4
SWEP.MaxSpreadInc = 0.045
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.17
SWEP.Shots = 1
SWEP.Damage = 23
SWEP.DeployTime = .4
SWEP.HolsterTime = .5
SWEP.ADSFireAnim = true

SWEP.ReloadSpeed = 1.25
SWEP.ReloadTime = 2.6
SWEP.ReloadHalt = 3.7
SWEP.ReloadTime_Empty = 3.7
SWEP.ReloadHalt_Empty = 4.75

function SWEP:IndividualThink()
	
	if self.FireMode == "semi" then
	self.Owner.ViewAff = 0
	end
	
	self.EffectiveRange = 68 * 39.37
	self.DamageFallOff = .55
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.15))
	self.DamageFallOff = ((self.DamageFallOff * .85))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .126))
end
	
	if self.ActiveAttachments.doi_atow_owenmk2 then
	self.EffectiveRange = ((self.EffectiveRange * 1.05))
	self.DamageFallOff = ((self.DamageFallOff * .95))
end
end

function SWEP:fireAnimFunc()
	clip = self:Clip1()
	cycle = 0
	rate = 1
	anim = "safe"
	prefix = ""
	suffix = ""
	
		if clip == 1 then
		suffix = suffix .. "_last"
	end
	
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

