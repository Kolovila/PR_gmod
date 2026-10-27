if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

	--SWEP.magType = "NONE"

	CustomizableWeaponry.firemodes:registerFiremode("pumpslamfire", "PUMP-ACTION [SLAMFIRE]", true, 0, 1)
	CustomizableWeaponry.shells:addNew("khr12gbuck", "models/khrcw2/doipack/shells/12g_slug.mdl", "CW_SHELL_SHOT")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Ithaca 37"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_ithaca")
	killicon.Add( "doi_atow_ithaca37", "vgui/inventory/killicons/weapon_ithaca", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = false
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 53 * 39.37
	SWEP.DamageFallOff_Orig = .5
	
	SWEP.Shell = "khr12gbuck"
	SWEP.ShellScale = .55
	SWEP.ShellDelay = .55
	SWEP.ShellDelaySlow = .55
	SWEP.ShellDelayFast = .43
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = -7}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	SWEP.ForeGripOffsetCycle_ReloadStart = 0
	SWEP.ForeGripOffsetCycle_ReloadInsert = 0
	SWEP.ForeGripOffsetCycle_ReloadEnd = 0

	SWEP.IronsightPos = Vector(-2.0885, -2.25, 1.2)
	SWEP.IronsightAng = Vector(0.555, 0, 0)
	
	SWEP.AltIronPos = Vector(-2.0885, -2, 1.235)
	SWEP.AltIronAng = Vector(.45, 0, 0)
	
	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-15.478, 20.96, 0)
	
	SWEP.CustomizePos = Vector(8, -2, .5)
	SWEP.CustomizeAng = Vector(10, 45, 16)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-40.8947, 40.0455, -12.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.AlternativePos = Vector(-0.5, -.5, -.3)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.LuaVMRecoilAxisMod = {vert = .5, hor = .5, roll = 3, forward = 1, pitch = .65}
	SWEP.OverallMouseSens = 1 -- 1 --  1 --  .75
	SWEP.CustomizationMenuScale = 0.022 --  0.025
	
	SWEP.AttachmentModelsVM = {["md_sgslugsight"] = {model = "models/khrcw2/doipack/attachments/shotgunslugsight.mdl", pos = Vector(-20.75, 5.75, 1.55), angle = Angle(180, -180, 90), size = Vector(.9, .9, .9), bone = "Weapon"},
	["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/unisuppressor.mdl", pos = Vector(0.01, 18.25, .3), angle = Angle(-.35, -90, 0), size = Vector(1.1, 1.1, 1.1), bone = "Weapon"}}
	
	SWEP.ForegripOverridePos = {
	["nah"] = {
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, -.1), angle = Angle(0, 0, 10) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, .40, -.5), angle = Angle(5, 2, -5) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, -2, -5) }}
}
	
	SWEP.Trivia = {text = "By holding the attack key you will slam-fire, providing high firerate.", x = -20, y = -400}
end
end

SWEP.MuzzleVelocity = 360

SWEP.SightBGs = {main = 2, off = 0, on = 1}
SWEP.SlingBGs = {main = 3, off = 0, on = 1}

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = false
SWEP.CanRestOnObjects = true
SWEP.CrosshairParts = {left = true, right = true, upper = false, lower = true}

if CustomizableWeaponry_atowins2_optics then
SWEP.Attachments = {[2] = {header = "Accessory", offset = {150, -250}, atts = {"doi_atow_sling"}},
[3] = {header = "Optic", offset = {350, 225}, atts = {"md_sgslugsight"}},
[1] = {header = "Barrel", offset = {-250, -325}, atts = {"doi_atow_altsightm37"}},
[2] = {header = "Muzzle", offset = {-300, 020}, atts = {"doi_atow_unisuppressor"}, dependencies = {["am_slugroundsm37"] = true}},
[4] = {header = "Action", offset = {650, -350}, atts = {"doi_atow_greasedbolt"}},
["+reload"] = {header = "Ammo", offset = {1050, 60}, atts = {"am_flechettem37", "am_slugroundsm37"}}}
else
SWEP.Attachments = {[1] = {header = "Accessory", offset = {150, -250}, atts = {"doi_atow_sling"}},
[4] = {header = "Optic", offset = {-250, 325}, atts = {"md_sgslugsight"}},
[1] = {header = "Barrel", offset = {-250, -325}, atts = {"doi_atow_altsightm37"}},
[2] = {header = "Action", offset = {950, 240}, atts = {"doi_atow_greasedbolt"}},
["+reload"] = {header = "Ammo", offset = {450, 160}, atts = {"am_flechettem37", "am_slugroundsm37"}}}
end

SWEP.Animations = {fire = {"base_fire_1","base_fire_2"},
	fire_aim = {"iron_fire_1","iron_fire_2"},
	reload_start = "base_reload_start",
	insert = "base_reload_insert",
	reload_end = "base_reload_end",
	idle = "base_idle",
	draw = "base_draw"}
	

SWEP.SpeedDec = 40
SWEP.FOVPerShot = 0
SWEP.ADSSpeedMult = {
standing = 1
}

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"pumpslamfire"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Shotguns"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 60
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/ithaca37.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_ithaca37.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_ithaca37.mdl"
SWEP.WMPos = Vector(-1.5, 11, -1)
SWEP.WMAng = Vector(-16, 2, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = 1
SWEP.RVBYawMod = 1
SWEP.RVBRollMod = 1

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "Buckshot"
else
SWEP.Primary.Ammo			= "12 Gauge"
end

SWEP.FireDelay = 60/100
SWEP.FireSound = "DOIM37_FIRE"
SWEP.FireSoundSuppressed = "DOIK98_FIRE_SUPPRESSED"
SWEP.Recoil = 2

SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .67,
[HITGROUP_CHEST] = 1,
[HITGROUP_LEFTARM] = 1.6,
[HITGROUP_RIGHTARM] = 1.6,
[HITGROUP_RIGHTLEG] = 1.6,
[HITGROUP_LEFTLEG] = 1.6}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.06
SWEP.AimSpread = 0.009
SWEP.VelocitySensitivity = .8
SWEP.MaxSpreadInc = 0.04
SWEP.ClumpSpread = 0.015
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 60/80
SWEP.Shots = 8
SWEP.Damage = 17
SWEP.DeployTime = .475
SWEP.HolsterTime = .6

SWEP.SnapToIdle = true
SWEP.GlobalDelayOnShoot = 60/100
SWEP.GlobalDelayOnShootSlow = 60/100
SWEP.GlobalDelayOnShootFast = 60/123
SWEP.ADSFireAnim = true
SWEP.Chamberable = true
SWEP.ShotgunReload = true
SWEP.PreventQuickScoping = false

SWEP.ReloadSpeed = 1.3
SWEP.ReloadStartTime = 0.5
SWEP.InsertShellTime = .85
SWEP.ReloadFinishWait = 1

function SWEP:IndividualThink()
self.Owner.ViewAff = 0
    self.EffectiveRange = 53 * 39.37
	self.DamageFallOff = .5
	self.ClumpSpread = .015
	
	self.ShellDelay = (self.ActiveAttachments.doi_atow_greasedbolt) and self.ShellDelayFast or self.ShellDelaySlow
	self.GlobalDelayOnShoot = (self.ActiveAttachments.doi_atow_greasedbolt) and self.GlobalDelayOnShootFast or self.GlobalDelayOnShootSlow
	
	if not self.ActiveAttachments.doi_atow_onehand then
		self.ForegripOverride = true
		self.ForegripParent = "nah"
	end

	if (self.ActiveAttachments.am_slugroundsm37) then
	self.EffectiveRange = ((self.EffectiveRange * 1.33))
	self.DamageFallOff = ((self.DamageFallOff * 1.2))
	self.ClumpSpread = nil
end
	if (self.ActiveAttachments.am_flechettem37) then
	self.EffectiveRange = ((self.EffectiveRange * .9))
	self.DamageFallOff = ((self.DamageFallOff * 1.25))
	self.ClumpSpread = ((self.ClumpSpread * 1.33))
end
	if self.ActiveAttachments.doi_atow_unisuppressor then
	self.EffectiveRange = ((self.EffectiveRange - 0))
	self.DamageFallOff = ((self.DamageFallOff + 0))
end
	
end

function SWEP:fireAnimFunc()
	clip = self:Clip1()
	cycle = 0
	rate = 1.1
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

