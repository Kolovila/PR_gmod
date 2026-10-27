if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

	--SWEP.magType = "NONE"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Gewehr 98"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_g98")
	killicon.Add( "doi_atow_g98", "vgui/inventory/killicons/weapon_g98", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	SWEP.ForeGripOffsetCycle_ReloadStart = 0
	SWEP.ForeGripOffsetCycle_ReloadInsert = 0
	SWEP.ForeGripOffsetCycle_ReloadEnd = 0
	
	SWEP.EffectiveRange_Orig = 231 * 39.37
	SWEP.DamageFallOff_Orig = .34 
	
	SWEP.Shell = "khr79257"
	SWEP.ShellScale = .4
	SWEP.ShellDelay = .69
	SWEP.ShellDelaySlow = .69
	SWEP.ShellDelayFast = .62
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 5.5, y = -2.75, z = .5}

	SWEP.IronsightPos = Vector(-2, -5.25, 2)
	SWEP.IronsightAng = Vector(0.2652, 0.0073, 0)
	
	SWEP.ZF39Pos = Vector(-2, 0, .865)
	SWEP.ZF39Ang = Vector(0, 0, 0)
	
	SWEP.ZF4Pos = Vector(-1.8485, -3, 1.2475)
	SWEP.ZF4Ang = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-15.478, 20.96, 0)
	
	SWEP.CustomizePos = Vector(8.5, -3, .5)
	SWEP.CustomizeAng = Vector(10, 45, 16)

	SWEP.AlternativePos = Vector(-0.35, -1.25, .3)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-55.8947, 55.0455, -16.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.BackupSights = {["doi_atow_zf39"] = {[1] = Vector(-2.5615, -3, 1.588), [2] = Vector(0.2652, 0.0073, 0)},["doi_atow_zf4"] = {[1] = Vector(-2.5615, -3, 1.588), [2] = Vector(0.2652, 0.0073, 0)},["doi_atow_zf41"] = {[1] = Vector(-2.5615, -3, 1.588), [2] = Vector(0.2652, 0.0073, 0)},}
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.OverallMouseSens = 1 -- 1 --  1 --  .75
	SWEP.CustomizationMenuScale = 0.026 --  0.032
	
	SWEP.AttachmentModelsVM = {
	["doi_atow_zf41"] = {model = "models/khrcw2/doipack/attachments/kar98k1xscope.mdl", pos = Vector(2.15, 0, .05), angle = Angle(0, 0, -90), size = Vector(.9, .9, .9), bone = "A_Optic"},
	["doi_atow_zf4"] = {model = "models/khrcw2/doipack/attachments/kar98k1xscope.mdl", pos = Vector(-5, 0, -.2), angle = Angle(0, 0, -90), size = Vector(.9, .9, .9), bone = "A_Optic"},
	["doi_atow_zf39"] = {model = "models/khrcw2/doipack/attachments/kar98k7xscope.mdl", pos = Vector(-5.1, -.15, -.44), angle = Angle(0, 0, -90), size = Vector(.9, .9, .9), bone = "A_Optic"},
	["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/m3a1suppressor.mdl", pos = Vector(2.4, 7, 4.5), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "K98"},
	}
	
	SWEP.ForegripOverridePos = {
	["nah"] = {
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-1.4, .0, -.2), angle = Angle(0, 0, 5) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, .40, -.5), angle = Angle(0, 2, -5) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, -10, -5) }}
}
	
	SWEP.M82AxisAlign = {right = 0, up = -.015, forward = 0}
	SWEP.M823AxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.LuaVMRecoilAxisMod = {vert = .5, hor = 3, roll = 4, forward = 4, pitch = 3}
end
end

SWEP.MagBGs = {main = 3, default = 0, twentyf = 1}
SWEP.ShellsBGs = {main = 5, one = 4, two = 3, three = 2, four = 1, five = 0}

SWEP.MuzzleVelocity = 760

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = false
SWEP.CanRestOnObjects = true


SWEP.Attachments = {--[4] = {header = "Reload", offset = {-150, 120}, atts = {"doi_atow_stripperclips"}, exclusions = {["doi_atow_zf39"] = true, ["doi_atow_zf4"] = true}},
[1] = {header = "Optic", offset = {250, -400}, atts = { "doi_atow_zf4", "doi_atow_zf39"}},
[2] = {header = "Magazine", offset = {1050, -200}, atts = {"doi_atow_g98extmag"}},
[3] = {header = "Action", offset = {950, 240}, atts = {"doi_atow_greasedboltg98"}},
["+reload"] = {header = "Ammo", offset = {20, 200}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_ap"}}}

SWEP.Animations = {fire = {"base_fire"},
	fire_aim = {"iron_fire"},
	reload_start = "base_reload_start_empty",
	insert = "base_reload_insert",
	reload_end = "base_reload_end",
	reload = "base_reload_clip",
	reload_empty = "base_reload_empty_clip",
	idle = "base_reload_end",
	draw = "base_draw"}
	

SWEP.SpeedDec = 50
SWEP.FOVPerShot = 0
SWEP.ADSSpeedMult = {
standing = 1.1
}



SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Long rifles"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 70
SWEP.AimViewModelFOV = 65
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/gewehr98.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_kar98k.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_kar98k.mdl"
SWEP.WMPos = Vector(-.25, 14, .55)
SWEP.WMAng = Vector(-10, .8, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 5
SWEP.Primary.Automatic		= false

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "AR2"
else
SWEP.Primary.Ammo			= "7.92x57MM"
end

SWEP.FireDelay = 60/40
SWEP.FireSound = "DOIG98_FIRE"
SWEP.FireSoundSuppressed = "DOIK98_FIRE_SUPPRESSED"
SWEP.Recoil = 1
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = 1.05,
[HITGROUP_CHEST] = 1,
[HITGROUP_LEFTARM] = 2,
[HITGROUP_RIGHTARM] = 2,
[HITGROUP_RIGHTLEG] = 2,
[HITGROUP_LEFTLEG] = 2}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0.23
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 52
SWEP.DeployTime = .485
SWEP.HolsterTime = .6

SWEP.ADSFireAnim = true
SWEP.GlobalDelayOnShoot = 60/55
SWEP.GlobalDelayOnShootSlow = 60/55
SWEP.GlobalDelayOnShootFast = 60/63
SWEP.Chamberable = false
SWEP.ShotgunReload = true
SWEP.PreventQuickScoping = false

SWEP.ForegripOverride = true
SWEP.ForegripParent = "nah"

SWEP.ReloadStartTime = 1.21
SWEP.InsertShellTime = 0.99
SWEP.ReloadFinishWait = 1.41

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 2.5
SWEP.ReloadHalt = 4.1
SWEP.ReloadTime_Empty = 2.5
SWEP.ReloadHalt_Empty = 4.1

function SWEP:IndividualThink()

self.Owner.ViewAff = 0
	self.ShellDelay = (self.ActiveAttachments.doi_atow_greasedboltg98) and self.ShellDelayFast or self.ShellDelaySlow
	self.GlobalDelayOnShoot = (self.ActiveAttachments.doi_atow_greasedboltg98) and self.GlobalDelayOnShootFast or self.GlobalDelayOnShootSlow


	
		if self.ActiveAttachments.doi_atow_zf39 or self.ActiveAttachments.doi_atow_zf4 then
		self.AimBreathingEnabled = false
		else
		self.AimBreathingEnabled = false
		end
		
	self.EffectiveRange = 231 * 39.37
	self.DamageFallOff = .34
		
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.15))
	self.DamageFallOff = ((self.DamageFallOff * .85))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .144))
end
		
	if self.ActiveAttachments.doi_atow_unisuppressor then
	self.EffectiveRange = ((self.EffectiveRange - 100 * 39.37))
	self.DamageFallOff = ((self.DamageFallOff + .48))
	end
	
end

function SWEP:fireAnimFunc()
	clip = self:Clip1()
	cycle = 0
	rate = 1
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
