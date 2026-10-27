if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		SWEP.magType = "srMag"
	
	CustomizableWeaponry.shells:addNew("khr79257", "models/khrcw2/doipack/shells/408cheytac.mdl", "CW_SHELL_MAIN")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Gewehr 43"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_gewher43")
	killicon.Add( "doi_atow_g43", "vgui/inventory/killicons/weapon_gewher43", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	
	SWEP.EffectiveRange_Orig = 221 * 39.37
	SWEP.DamageFallOff_Orig = .34
	
	SWEP.Shell = "khr79257"
	SWEP.ShellScale = .5
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2.5, y = -1, z = 0}

	SWEP.IronsightPos = Vector(-2.4370, -3.5, 0.885)
	SWEP.IronsightAng = Vector(0.0762, 0.034, 0)
	
	SWEP.ZF4Pos = Vector(-2.74, -3, 0.3701)
	SWEP.ZF4Ang = Vector(0, 0, 0)
	
	SWEP.ZF41Pos = Vector(-2.74, -1.5, 0.3701)
	SWEP.ZF41Ang = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-15.478, 20.96, 0)
	
	SWEP.CustomizePos = Vector(8.5, -3, .5)
	SWEP.CustomizeAng = Vector(10, 45, 18)
	
	SWEP.AlternativePos = Vector(-0.5, -.75, -0.4)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-60.8947, -2.0455, -5.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.BackupSights = {["doi_atow_zf4"] = {[1] = Vector(-2.4370, -3.5, 0.8812), [2] = Vector(0.0762, 0.034, 0)},
	["doi_atow_zf41"] = {[1] = Vector(-2.4370, -3.5, 0.8812), [2] = Vector(0.0762, 0.034, 0)}}
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.OverallMouseSens = 1 -- .75
	SWEP.CustomizationMenuScale = 0.025 --  0.03
	
	SWEP.AttachmentModelsVM = {
	["doi_atow_zf41"] = {model = "models/khrcw2/doipack/attachments/zf4scope.mdl", pos = Vector(0, 0, 0), angle = Angle(90, 90, 0), size = Vector(1, 1, 1), bone = "A_Optic"},
	["doi_atow_zf4"] = {model = "models/khrcw2/doipack/attachments/zf4scope.mdl", pos = Vector(0, 0, 0), angle = Angle(90, 90, 0), size = Vector(1, 1, 1), bone = "A_Optic"},
	}
	
	SWEP.ForegripOverridePos = {

	["nah"] = {
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-1, .0, -.1), angle = Angle(0, 0, 10) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, .40, -.5), angle = Angle(10, 0, 0) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -15) }}
}
	
	SWEP.M82AxisAlign = {right = .02, up = -.015, forward = 0}
	SWEP.M823AxisAlign = {right = .02, up = -.015, forward = 0}
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = .7, forward = .25, pitch = 0}
end
end

SWEP.SlingBGs = {main = 2, off = 0, on = 1}

SWEP.MuzzleVelocity = 770

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = true
SWEP.CanRestOnObjects = true
--SWEP.AimBreathingEnabled = true

SWEP.Attachments = {[3] = {header = "Optic", offset = {850, -350}, atts = {"doi_atow_zf4"}},
[2] = {header = "Finish", offset = {300, -250}, atts = {"doi_atow_wornfinish"}},
[1] = {header = "Accessory", offset = {-200, 80}, atts = {"doi_atow_sling"}},
["+reload"] = {header = "Ammo", offset = {380, 180}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_ap"}}}

SWEP.Animations = {fire = {"base_fire_1","base_fire_2"},
	fire_aim = {"iron_fire_1","iron_fire_2","iron_fire_3"},
	reload = "base_reloadfull",
	reload_empty = "base_reloadempty",
	idle = "base_idle",
	draw = "base_draw"}
	

SWEP.SpeedDec = 50
SWEP.FOVPerShot = 0
SWEP.ADSSpeedMult = {
standing = .60
}

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Long rifles"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 60
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/gewehr43.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_gewehr43.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_gewehr43.mdl"
SWEP.WMPos = Vector(-1, 11, .55)
SWEP.WMAng = Vector(-12, 2, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "AR2"
else
SWEP.Primary.Ammo			= "7.92x57MM"
end

SWEP.FireDelay = 60/350
SWEP.FireSound = "DOIG43_FIRE"
SWEP.Recoil = 1.5
SWEP.RecoilToSpread = 0
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = 1,
[HITGROUP_CHEST] = 1,
[HITGROUP_LEFTARM] = 1.55,
[HITGROUP_RIGHTARM] = 1.55,
[HITGROUP_RIGHTLEG] = 1.55,
[HITGROUP_LEFTLEG] = 1.55}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.1
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = .5
SWEP.MaxSpreadInc = 0.065
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.2
SWEP.Shots = 1
SWEP.Damage = 50
SWEP.DeployTime = .6
SWEP.HolsterTime = .6

SWEP.ADSFireAnim = true

SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 2.6
SWEP.ReloadHalt = 3.2
SWEP.ReloadTime_Empty = 3.95
SWEP.ReloadHalt_Empty = 5

function SWEP:IndividualThink()

if not self.ActiveAttachments.doi_atow_onehand then
		self.ForegripOverride = true
		self.ForegripParent = "nah"
	end

if self.ActiveAttachments.doi_atow_zf4 then
		self.AimBreathingEnabled = false
		else
		self.AimBreathingEnabled = false
end

	self.Owner.ViewAff = 0

	self.EffectiveRange = 221 * 39.37
	self.DamageFallOff = .34
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.1))
	self.DamageFallOff = ((self.DamageFallOff * .9))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .141))
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
