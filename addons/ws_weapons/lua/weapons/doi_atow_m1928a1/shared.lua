if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		SWEP.magType = "smgMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Thompson 1928A1"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_thompson_m1928a1")
	killicon.Add( "doi_atow_m1928a1", "vgui/inventory/killicons/weapon_thompson_m1928a1", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 55 * 39.37
	SWEP.DamageFallOff_Orig = .50
	
	SWEP.Shell = "khr9x19"
	SWEP.ShellScale = .51
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 5.35, y = -3.5, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = .825
	SWEP.ForeGripOffsetCycle_Reload_Empty = .825
	
	SWEP.IronsightPos = Vector(-2.236, -2.25, 1.048)
	SWEP.IronsightAng = Vector(0.1611, 0.0052, 0)
	
	SWEP.CustomizePos = Vector(10, -4, -2)
	SWEP.CustomizeAng = Vector(20, 45, 15)
	
	SWEP.SprintPos = Vector(2, 0, -1)
	SWEP.SprintAng = Vector(-15.478, 20.96, -15)

	SWEP.AlternativePos = Vector(-.6, .25, -0.45)
	SWEP.AlternativeAng = Vector(0.1611, 0.0052, 0)
	
	SWEP.Alternative1Pos = Vector(-.6, .25, -0.45)
	SWEP.Alternative1Ang = Vector(0.1611, 0.0052, 0)
	
	SWEP.Alternative2Pos = Vector(-1.25, -1.2, -1)
	SWEP.Alternative2Ang = Vector(0.1611, 0.0052, -3)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-50.8947, 35.0455, -25.2273)
	
	SWEP.PronePos = Vector(0, -2, -4.5)
	SWEP.ProneAng = Vector(-10, 42.7368, -50.9474)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.CustomizationMenuScale = 0.019 --  0.022
	
	--pos = Vector(-1.4, -4.3, -.25), angle = Angle(0, -90, 180), size = Vector(0.7, 0.7, 0.7)
	SWEP.AttachmentModelsVM = {["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/unisuppressor.mdl", pos = Vector(0.02, 12.51, 1.35), angle = Angle(0, -90, 0), size = Vector(.9, .9, .9), bone = "M1928A1"}}
	
		SWEP.AttachmentPosDependency = {
	["doi_atow_unisuppressor"] = {
		["doi_atow_m3carbine"] = Vector(1.7, 6.5, 3.14),
		},
	}
	
	SWEP.ForegripOverridePos = {
	["foregrip"] = {
	["L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 14.444, 0) },
	["L ForeTwist2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 8.332) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(.45, -0.301, .4), angle = Angle(-1.111, 3.332, 3.332) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(12.666, -15.111, 61.111) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-5.557, 5.556, 16.666) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(23.333, 10, 1.11) },
	["L Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 15, 0) },
	["L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 10, 0) },
	["L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 58.888, 0) },
	["L Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 36.666, 0) },
	["L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 7.777, 0) },
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 45.555, 0) },
	["L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 16.666, 0) },
	["L ForeTwist4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 6) },
	["L ForeTwist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 2.444) },
	["L ForeTwist1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 15) },
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, -.5, 0), angle = Angle(0, 0, 10) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, -.5, 0), angle = Angle(0, 0, 0) },
	["L ForeTwist5"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 12) }},
	
	["nah"] = {
	["L Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L ForeTwist2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-.25, 0, 0), angle = Angle(0, 0, 0) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, -5, 0) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-6, -2, 0) },
	["L Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 0, 0) },
	["L Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
	["L Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 5, 0) },
	["L ForeTwist4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L ForeTwist"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L ForeTwist1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, .5), angle = Angle(0, 0, 10) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, -.5, 0), angle = Angle(0, 0, 0) },
	["L ForeTwist3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }},
}
	
	SWEP.LuaVMRecoilAxisMod = {vert = -.15, hor = .15, roll = .2, forward = .3, pitch = .2}
end
end

SWEP.MuzzleVelocity = 250

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = false
SWEP.CanRestOnObjects = true

SWEP.GripBGs = {main = 2, off = 0, on = 1}
SWEP.MagBGs = {main = 3, twenty = 0, thirty = 1, fifty = 2}
SWEP.BarrelBGs = {main = 5, smg = 0, carbine = 1}
SWEP.StockBGs = {main = 4, off = 0, on = 1}

SWEP.Attachments = {[3] = {header = "Grip", offset = {200, -350}, atts = {"doi_atow_m1928grip"}},
[2] = {header = "Magazine", offset = {150, 250}, atts = {"doi_atow_thompson30rnd","doi_atow_thompson50rnd"}, exclusions = {["am_atow_riot"] = true}},
[4] = {header = "Stock", offset = {900, -50}, atts = {"doi_atow_thompsonnostock"}},
[1] = {header = "Muzzle", offset = {-450, -300}, atts = {"doi_atow_unisuppressor"}},
["+reload"] = {header = "Ammo", offset = {-435, 100}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy", "am_atow_riot"}}}

SWEP.Animations = {fire = {"base_fire_1"},
	fire_aim = {"iron_fire_1","iron_fire_2"},
	reload = "base_reload",
	reload_empty = "base_reload",
	idle = "base_idle",
	draw = "base_draw"}

SWEP.SpeedDec = 30
SWEP.ADSSpeedMult = {
standing = .85
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

SWEP.ViewModelFOV	= 75 // 67
SWEP.AimViewModelFOV = 65
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/thompson1928.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_thompson1928.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_thompson1928.mdl"
SWEP.WMPos = Vector(-.9, 4, 1.5)
SWEP.WMAng = Vector(-10, 1, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .4
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Chamberable			= false

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "SMG1"
else
SWEP.Primary.Ammo			= ".45 ACP"
end

SWEP.FireDelay = 60/750
SWEP.FireDelayAuto = 60/750
SWEP.FireDelaySemi = 60/700
SWEP.FireSound = "DOITHOM1928_FIRE"
SWEP.FireSoundSuppressed = "DOITHOM1928_FIRE_SUPPRESSED"
SWEP.Recoil = 1
SWEP.RecoilToSpread = .4
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .75,
[HITGROUP_CHEST] = 1,
[HITGROUP_LEFTARM] = 2,
[HITGROUP_RIGHTARM] = 2,
[HITGROUP_RIGHTLEG] = 2,
[HITGROUP_LEFTLEG] = 2}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.056
SWEP.AimSpread = 0.016
SWEP.VelocitySensitivity = .4
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.008
SWEP.SpreadCooldown = 0.175
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = .462
SWEP.HolsterTime = .6

SWEP.ADSFireAnim = true


SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 2.4
SWEP.ReloadHalt = 3.2
SWEP.ReloadTime_Empty = 2.4
SWEP.ReloadHalt_Empty = 3.2

function SWEP:IndividualThink()

if self.FireMode == "semi" then
	self.Owner.ViewAff = 0
	end
	
	self.AlternativePos = (self.ActiveAttachments.doi_atow_thompsonnostock) and self.Alternative2Pos or self.Alternative1Pos
	self.AlternativeAng = (self.ActiveAttachments.doi_atow_thompsonnostock) and self.Alternative2Ang or self.Alternative1Ang

	if not self.ActiveAttachments.doi_atow_m1928grip then
		self.ForegripOverride = true
		self.ForegripParent = "nah"
	end
	if self.ActiveAttachments.doi_atow_thompson50rnd then
		self.ForeGripOffsetCycle_Reload = .855
		self.ForeGripOffsetCycle_Reload_Empty = .855
		else
		self.ForeGripOffsetCycle_Reload = .825
		self.ForeGripOffsetCycle_Reload_Empty = .825
	end
	
	self.EffectiveRange = 55 * 39.37
	self.DamageFallOff = .50
	
		if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.15))
	self.DamageFallOff = ((self.DamageFallOff * .85))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .21))
end
	if self.ActiveAttachments.am_atow_riot then
	self.EffectiveRange = ((self.EffectiveRange * .55))
end
	if self.ActiveAttachments.doi_atow_unisuppressor then
	self.EffectiveRange = ((self.EffectiveRange * .9))
	self.DamageFallOff = ((self.DamageFallOff * 1))
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