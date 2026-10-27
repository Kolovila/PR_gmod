if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		SWEP.magType = "pistolMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Hi-Power"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_browninghp")
	killicon.Add( "doi_atow_browninghp", "vgui/inventory/killicons/weapon_browninghp", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.75
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.7
	
	SWEP.EffectiveRange_Orig = 64 * 39.37
	SWEP.DamageFallOff_Orig = .55
	
	SWEP.Shell = "khr9x19"
	SWEP.ShellScale = .485
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -.25, y = -2.2, z = 3.75}

	SWEP.IronsightPos = Vector(-2.12, 1, 0.7924)
	SWEP.IronsightAng = Vector(-0.0121, 0.065, 0)
	
	SWEP.AltIronPos = Vector(-2.1241, 1, 0.57)
	SWEP.AltIronAng = Vector(0.7222, 0.0454, 0)
	
	SWEP.SprintPos = Vector(2.8409, -10.9318, -8.5227)
	SWEP.SprintAng = Vector(59.3182, 2.0455, 2.0455)
	
	SWEP.CustomizePos = Vector(10, -6, 1)
	SWEP.CustomizeAng = Vector(15, 50, 20)

	SWEP.AlternativePos = Vector(-0.65, 1, -0.45)
	SWEP.AlternativeAng = Vector(-0.0121, 0.0454, 0)
	
	SWEP.Alternative1Pos = Vector(-0.65, -1, -0.45)
	SWEP.Alternative1Ang = Vector(-0.0121, 0.0454, 0)
	
	SWEP.Alternative2Pos = Vector(-0.75, -1, -0.35)
	SWEP.Alternative2Ang = Vector(-0.0121, 0.0454, -4)
	
	SWEP.SwimPos = Vector(0.5, -2.1053, -0.5)
	SWEP.SwimAng = Vector(-50.8947, -3.7895, -46.5263)
	
	SWEP.PronePos = Vector(0, -4, -2.5579)
	SWEP.ProneAng = Vector(10, 12.7368, -8.9474)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.CustomizationMenuScale = 0.013
	
	SWEP.AttachmentModelsVM = {["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/unisuppressor.mdl", pos = Vector(-.018, 3.19, 1.765), angle = Angle(-.25, -90, 0), size = Vector(0.675, 0.675, 0.675), bone = "Weapon"}}
end
end

SWEP.MuzzleVelocity = 350

SWEP.SightBGs = {main = 2, off = 0, on = 1}
SWEP.CompBGs = {main = 3, off = 0, on = 1}
SWEP.BodyBGs = {main = 4, off = 0, on = 1}
SWEP.MagBGs = {main = 5, off = 0, on = 1}

SWEP.ForegripOverridePos = {
	["onehand"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-2, 2, -6), angle = Angle(0, 0, 0) },
	["R Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 5, 0) },
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.65, .0, .1), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.65, .0, .1), angle = Angle(0, 0, 0) },
	["R Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, -.15, 0), angle = Angle(0, 0, 0) },
	["R Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, 5, 0) }},
	
	["nah"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["R Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.8, .0, .1), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.65, .0, .1), angle = Angle(0, 0, 0) },
	["R Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, -.25, 0), angle = Angle(0, 0, 0) },
	["R Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }}
}

SWEP.Attachments = {[2] = {header = "Rear Sight", offset = {-100, -375}, atts = {"doi_atow_altsight"}},
[3] = {header = "Magazine", offset = {50, 250}, atts = {"doi_atow_bhpextmag"}},
[5] = {header = "Accessory", offset = {600, -125}, atts = {"doi_atow_bhpstock", "doi_atow_onehand"}},
[1] = {header = "Muzzle", offset = {-750, -350}, atts = {"doi_atow_bhpcomp","doi_atow_unisuppressor"}},
[4] = {header = "Fire Control", offset = {360, -570}, atts = {"doi_atow_m2carbineconv"}},
["+reload"] = {header = "Ammo", offset = {-600, 100}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy"}}}

SWEP.Animations = {fire = {"base_fire","base_fire2"},
	fire_aim = {"iron_fire","iron_fire2"},
	fire_last = {"base_firelast"},
	fire_last_aim = {"iron_firelast"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	idle = "base_idle",
	draw = "base_draw"}
	
SWEP.ReloadViewBobEnabled = false //

SWEP.SpeedDec = 15
SWEP.FOVPerShot = 0
SWEP.ADSSpeedMult = {
standing = 2
}

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
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

SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 55
SWEP.ZoomAmount = 0
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/browninghp.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_browninghp.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_browninghp.mdl"
SWEP.WMPos = Vector(-1.5, 4, 3.25)
SWEP.WMAng = Vector(-5, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .25
SWEP.RVBYawMod = .5
SWEP.RVBRollMod = .35

SWEP.Primary.ClipSize		= 14
SWEP.Primary.DefaultClip	= 14
SWEP.Primary.Automatic		= false
SWEP.Chamberable			= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "Pistol"
else
SWEP.Primary.Ammo			= "9x19MM"
end

SWEP.FireDelay = 60/500
SWEP.FireSound = "DOIBHP_FIRE"
SWEP.FireSoundSuppressed = "DOIPPK_FIRE_SUPPRESSED"
SWEP.Recoil = .9
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .85, 
[HITGROUP_CHEST] = 1, 
[HITGROUP_LEFTARM] = 2, 
[HITGROUP_RIGHTARM] = 2, 
[HITGROUP_RIGHTLEG] = 2, 
[HITGROUP_LEFTLEG] = 2}

SWEP.HipSpread = 0.06
SWEP.AimSpread = 0.007
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.012
SWEP.SpreadCooldown = 0.2
SWEP.Shots = 1
SWEP.Damage = 22
SWEP.DeployTime = .3
SWEP.HolsterTime = .3

SWEP.ADSFireAnim = true
SWEP.ShootWhileProne = false

SWEP.ForegripOverride = true
SWEP.ForegripParent = "nah"

SWEP.RecoilToSpread = 0
SWEP.RecoilToSpreadAuto = 0
SWEP.RecoilToSpreadSemi = 0

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 1.9
SWEP.ReloadHalt = 2.45
SWEP.ReloadTime_Empty = 2.45
SWEP.ReloadHalt_Empty = 3.05

function SWEP:IndividualThink()
self.Owner.ViewAff = 0
	self.RecoilToSpread = (self.FireMode == "auto") and self.RecoilToSpreadAuto or self.RecoilToSpreadSemi
	self.AlternativePos = (self.ActiveAttachments.doi_atow_onehand) and self.Alternative2Pos or self.Alternative1Pos
	self.AlternativeAng = (self.ActiveAttachments.doi_atow_onehand) and self.Alternative2Ang or self.Alternative1Ang
		
	self.EffectiveRange = 64 * 39.37
	self.DamageFallOff = .55
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.15))
	self.DamageFallOff = ((self.DamageFallOff * .85))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .09))
end
	
	if self.ActiveAttachments.doi_atow_unisuppressor then
	self.EffectiveRange = ((self.EffectiveRange * .8))
	self.DamageFallOff = ((self.DamageFallOff * 1.05))
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