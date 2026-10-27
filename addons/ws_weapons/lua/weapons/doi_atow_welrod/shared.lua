if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		SWEP.magType = "pistolMag"
		
	CustomizableWeaponry.shells:addNew("khr380", "models/khrcw2/doipack/shells/380acp.mdl", "CW_SHELL_SMALL")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Welrod MkIIA"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_welrod")
	killicon.Add( "doi_atow_welrod", "vgui/inventory/killicons/weapon_welrod", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_suppressed"
	SWEP.IsSuppressed = true
	SWEP.SuppressedOnEquip = true
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 51 * 39.37
	SWEP.DamageFallOff_Orig = .55
	
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0 
	
	SWEP.Shell = "khr380"
	SWEP.ShellDelay = .7
	SWEP.ShellScale = .95
	SWEP.ShellDelaySlow = .7
	SWEP.ShellDelayFast = .6
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2.4, y = -2, z = 0}

	SWEP.IronsightPos = Vector(-2.2947, 3, 0.8344)
	SWEP.IronsightAng = Vector(-0.0609, 0.06, 0)
	
	SWEP.SprintPos = Vector(2.8409, -10.9318, -8.5227)
	SWEP.SprintAng = Vector(59.3182, 2.0455, 2.0455)
	
	SWEP.CustomizePos = Vector(9, -4, .6)
	SWEP.CustomizeAng = Vector(15, 44, 22)

	SWEP.AlternativePos = Vector(-1, .5, -0.654)
	SWEP.AlternativeAng = Vector(-0.0609, 0, 0)
	
	SWEP.SwimPos = Vector(0.5, -2.1053, -0.5)
	SWEP.SwimAng = Vector(-50.8947, -3.7895, -46.5263)
	
	SWEP.PronePos = Vector(0, -3, -3.1579)
	SWEP.ProneAng = Vector(10, 12.7368, -8.9474)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 2, roll = 2, forward = 1, pitch = 1}
	SWEP.CustomizationMenuScale = 0.017 --  0.016
	
	SWEP.AttachmentModelsVM = {
	}
	
	SWEP.ForegripOverridePos = {
	["nah"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["R Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.8, .0, .1), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.65, .0, .1), angle = Angle(0, 0, 0) },
	["R Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, -.25, 0), angle = Angle(0, 0, 0) },
	["R Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }}
}
	
	SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = false
	
	SWEP.M82AxisAlign = {right = .02, up = -.015, forward = 0}
end
end

SWEP.MuzzleVelocity = 170

SWEP.Attachments = {[1] = {header = "Action", offset = {450, -200}, atts = {"doi_atow_greasedboltwelrod"}},
["+reload"] = {header = "Ammo", offset = {-175, 50}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy"}}}

SWEP.Animations = {fire = "base_fire",
	fire_aim = "iron_fire",
	fire_last = "base_firelast",
	fire_last_aim = "iron_firelast",
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	idle = "base_idle",
	draw = "base_draw"}
	

SWEP.SpeedDec = 0
SWEP.FOVPerShot = 0
SWEP.ADSSpeedMult = {
standing = 2
}

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Pistols"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false


SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 50
SWEP.ZoomAmount = 0
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/welrod.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_welrod.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_welrod.mdl"
SWEP.WMPos = Vector(-1.4, 5, 3.25)
SWEP.WMAng = Vector(-8, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Chamberable			= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "Pistol"
else
SWEP.Primary.Ammo			= ".32 ACP"
end

SWEP.FireDelay = 60/50
SWEP.FireSound = "DOIWELROD_FIRE"
SWEP.FireSoundSuppressed = "DOIWELROD_FIRE"
SWEP.Recoil = .25
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = 1.75,
[HITGROUP_CHEST] = 1,
[HITGROUP_LEFTARM] = 2,
[HITGROUP_RIGHTARM] = 2,
[HITGROUP_RIGHTLEG] = 2,
[HITGROUP_LEFTLEG] = 2}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.015
SWEP.AimSpread = 0.015
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0.065
SWEP.SpreadPerShot = 0.025
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 19
SWEP.DeployTime = .15
SWEP.HolsterTime = .15

SWEP.ADSFireAnim = true
SWEP.ShootWhileProne = true

SWEP.ForegripOverride = true
SWEP.ForegripParent = "nah"

SWEP.ReloadSpeed = 1.4
SWEP.ReloadTime = 2.25
SWEP.ReloadHalt = 2.8
SWEP.ReloadTime_Empty = 3.6
SWEP.ReloadHalt_Empty = 4.3

SWEP.NearWallEnabled = false

function SWEP:IndividualThink()
self.Owner.ViewAff = 0
	self.ShellDelay = (self.ActiveAttachments.doi_atow_greasedboltwelrod) and self.ShellDelayFast or self.ShellDelaySlow
	
	self.EffectiveRange = 51 * 39.37
	self.DamageFallOff = .55
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.25))
	self.DamageFallOff = ((self.DamageFallOff * .75))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .15))
end

end

function SWEP:fireAnimFunc()
	clip = self:Clip1()
	cycle = 0
	rate = 1.5
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
