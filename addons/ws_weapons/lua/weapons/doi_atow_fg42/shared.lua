if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		SWEP.magType = "brMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "FG 42"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_fg42")
	killicon.Add( "doi_atow_fg42", "vgui/inventory/killicons/weapon_fg42", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 218 * 39.37
	SWEP.DamageFallOff_Orig = .35
	
	SWEP.Shell = "khr79257"
	SWEP.ShellScale = .4756
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2.4, y = -2.25, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = .75
	SWEP.ForeGripOffsetCycle_Reload_Empty = .8

	SWEP.IronsightPos = Vector(-2.5775, -5, 0.462)
	SWEP.IronsightAng = Vector(0.68, 0.043, 9)
	
	SWEP.ZFG42Pos = Vector(-2.5892, -4.5, 0.4942)
	SWEP.ZFG42Ang = Vector(0, 0, 9)
	
	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-15.478, 20.96, 0)
	
	SWEP.CustomizePos = Vector(8, -2, -1)
	SWEP.CustomizeAng = Vector(15, 45, 10)
	
	SWEP.AlternativePos = Vector(-.25, .5, .05)
	SWEP.AlternativeAng = Vector(0,-.20, 5)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-50.8947, 20.0455, 5.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.OverallMouseSens = 1 -- 1 --  1 --  .8
	SWEP.CustomizationMenuScale = 0.023 --  0.03
	
	SWEP.AttachmentModelsVM = {
	["doi_atow_zfg42"] = {model = "models/khrcw2/doipack/attachments/zfg42scope.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "A_Optic"},
	["doi_atow_zfg41"] = {model = "models/khrcw2/doipack/attachments/zfg42scope.mdl", pos = Vector(0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "A_Optic"},
	["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/unisuppressor.mdl", pos = Vector(0, 18.5, 1.12), angle = Angle(0, -90, 0), size = Vector(1.5, 1.3, 1.3), bone = "Weapon"},
	}
	
	SWEP.ForegripOverridePos = {
	["bipod"] = {
	["Bipod_Right"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 81.111) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-30, 0, 0), angle = Angle(-14.445, 5.556, 1.11) },
	["Bipod_Left"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 74.444) }},
	
	["nah"] = {
	["Bipod_Right"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bipod_Left"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }},
}
	
	SWEP.M82AxisAlign = {right = .02, up = -.015, forward = 0}
	SWEP.LuaVMRecoilAxisMod = {vert = .2, hor = 0, roll = .35, forward = .2, pitch = .5}
	SWEP.Trivia = {text = "Deploying the integrated bipod on a ledge will improve your recoil control.", x = -50, y = -400}
end
end

SWEP.SightBGs = {main = 3, on = 0, off = 1}
SWEP.SlingBGs = {main = 4, on = 1, off = 0}
SWEP.BayonetBGs = {main = 2, on = 1, off = 0}

SWEP.MuzzleVelocity = 750

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = false
SWEP.CanRestOnObjects = true


SWEP.Attachments = {[2] = {header = "Optic", offset = {975, -275}, atts = {"doi_atow_zfg42"}},
[3] = {header = "Fire Control", offset = {700, 250}, atts = {"doi_atow_heavybolt"}},
[1] = {header = "Accessory", offset = {-200, -250}, atts = {"doi_atow_sling"}},
["+reload"] = {header = "Ammo", offset = {-110, 250}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_ap"}}}

SWEP.Animations = {fire = {"base_fire2"},
	fire_aim = {"iron_fire_1","iron_fire_2","iron_fire_3"},
	fire_last = {"base_firelast"},
	fire_last_aim = {"iron_firelast"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	idle = "base_idle",
	draw = "base_draw"}
	
	

SWEP.SpeedDec = 55
SWEP.ADSSpeedMult = {
standing = .75
}

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto","semi"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Machine guns"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 62
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/fg42.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_fg42.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_fg42.mdl"
SWEP.WMPos = Vector(-2, 10, -.9)
SWEP.WMAng = Vector(-12, 2, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "AR2"
else
SWEP.Primary.Ammo			= "7.92x57MM"
end

SWEP.FireDelay = 60/825
SWEP.FireDelayAuto = 60/825
SWEP.FireDelaySemi = 60/750
SWEP.FireSound = "DOIFG42_FIRE"
SWEP.FireSoundSuppressed = "DOIM1A1CAR_FIRE_SUPPRESSED"
SWEP.Recoil = 1.4
SWEP.HorizontalRecoilMod = 1.25
SWEP.BipodRecoilModifier = 0.2 -- = 0.1 -- = 0 --0.4
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .8,
[HITGROUP_CHEST] = 1,
[HITGROUP_STOMACH] = .8,
[HITGROUP_LEFTARM] = 1.45,
[HITGROUP_RIGHTARM] = 1.45,
[HITGROUP_RIGHTLEG] = 1.45,
[HITGROUP_LEFTLEG] = 1.45}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.0033
SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.055
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.22
SWEP.Shots = 1
SWEP.Damage = 52
SWEP.DeployTime = .45
SWEP.HolsterTime = .65

SWEP.ADSFireAnim = true
SWEP.Chamberable = false
SWEP.BipodInstalled = true

SWEP.RecoilToSpread = .5

SWEP.ReloadSpeed = 1.4
SWEP.ReloadTime = 3.7
SWEP.ReloadHalt = 4.7
SWEP.ReloadTime_Empty = 5.3
SWEP.ReloadHalt_Empty = 6.4


function SWEP:IndividualThink()

	
	if self.dt.BipodDeployed then
		self.ForegripOverride = true
		self.ForegripParent = "bipod"
	else
		self.ForegripOverride = true
		self.ForegripParent = "nah"
	end
	
	if self.FireMode == "semi" then
	self.Owner.ViewAff = 0
	end
	
	self.EffectiveRange = 218 * 39.37
	self.DamageFallOff = .35
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.1))
	self.DamageFallOff = ((self.DamageFallOff * .9))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .15))
end
	
	if self.ActiveAttachments.doi_atow_unisuppressor then
	self.EffectiveRange = ((self.EffectiveRange * .75))
	self.DamageFallOff = ((self.DamageFallOff * 1.05))
end
	
end

function SWEP:fireAnimFunc()
	clip = self:Clip1()
	cycle = 0
	rate = 1.1
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


