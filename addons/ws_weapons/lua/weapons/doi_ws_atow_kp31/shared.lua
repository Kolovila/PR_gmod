if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_soundscript.lua")
include("sh_soundscript.lua")

		SWEP.magType = "smgMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "KP 31"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_suomi")
	killicon.Add( "doi_ws_atow_kp31", "vgui/inventory/killicons/weapon_suomi", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 67.5 * 39.37
	SWEP.DamageFallOff_Orig = .55
	
	SWEP.Shell = "khr9x19"
	SWEP.ShellScale = .7
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 3.25, y = -4, z = -.5}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0

	SWEP.IronsightPos = Vector(-3.065, -1.25, 1.4365)
	SWEP.IronsightAng = Vector(0, .04, 0)
	
	SWEP.SprintPos = Vector(2, 0, -1)
	SWEP.SprintAng = Vector(-15.478, 20.96, -15)
	
	SWEP.CustomizePos = Vector(8, -2, -1)
	SWEP.CustomizeAng = Vector(15, 45, 10)

	SWEP.AlternativePos = Vector(-1.1, .5, .1)
	SWEP.AlternativeAng = Vector(0, .04, 0)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-40.8947, 45.0455, 15.2273)
	
	SWEP.PronePos = Vector(0, 0, -5.1579)
	SWEP.ProneAng = Vector(-10, 32.7368, -50.9474)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.CustomizationMenuScale = 0.022 --  0.025
	
	SWEP.AttachmentModelsVM = {
	["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/m3a1suppressor.mdl", pos = Vector(-1.685, .66, -5.1), angle = Angle(90, 90, 0), size = Vector(.85, .85, .85), bone = "Weapon"}
	}
	
SWEP.ForegripOverridePos = {

	["nah"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(1, 0, -.2), angle = Angle(0, 0, 0) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15, -5, 0) },
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.7, .0, .7), angle = Angle(0, 0, 20) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.65, .0, .1), angle = Angle(0, 0, 0) },
	["R Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }}
}

	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = .5, forward = .25, pitch = .05}
end
end

SWEP.ReloadViewBobEnabled = false //

SWEP.MuzzleVelocity = 400

SWEP.MagBGs = {main = 2, off = 0, on = 1}

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = true
SWEP.CanRestOnObjects = true
--SWEP.AimBreathingEnabled = true
--SWEP.AimBreathingIntensity = .75

SWEP.Attachments = {[2] = {header = "Muzzle", offset = {50, -380}, atts = {"doi_atow_unisuppressor"}},
[1] = {header = "Magazine", offset = {-200, 150}, atts = {"doi_atow_suomi71rnd"}},
[3] = {header = "Fire Control", offset = {750, -250}, atts = {"doi_atow_heavybolt"}},
["+reload"] = {header = "Ammo", offset = {540, 230}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy"}}}

SWEP.Animations = {fire = {"base_fire"},
	fire_aim = {"iron_fire_1"},
	fire_last = {"base_firelast"},
	fire_last_aim = {"iron_firelast"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	idle = "base_idle",
	draw = "base_draw"}
	

SWEP.SpeedDec = 25
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

SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 65
SWEP.ZoomAmount = 15
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/suomi.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_suomi.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_suomi.mdl"
SWEP.WMPos = Vector(2, -4.5, .5)
SWEP.WMAng = Vector(-10, 180, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.ForegripOverride = true
SWEP.ForegripParent = "nah"

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Chamberable			= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "SMG1"
else
SWEP.Primary.Ammo			= "9x19MM"
end

SWEP.FireDelay = 60/880
SWEP.FireSound = "DOIMP40_FIRE"
SWEP.FireSoundSuppressed = "DOIM3_FIRE_SUPP"
SWEP.Recoil = .8
SWEP.RecoilToSpread = .4
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .85, 
[HITGROUP_CHEST] = 1, 
[HITGROUP_LEFTARM] = 1.9, 
[HITGROUP_RIGHTARM] = 1.9, 
[HITGROUP_RIGHTLEG] = 1.9, 
[HITGROUP_LEFTLEG] = 1.9}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.065
SWEP.AimSpread = 0.014
SWEP.VelocitySensitivity = .7
SWEP.MaxSpreadInc = 0.043
SWEP.SpreadPerShot = 0.006
SWEP.SpreadCooldown = 0.2
SWEP.Shots = 1
SWEP.Damage = 21
SWEP.DeployTime = .53
SWEP.HolsterTime = .6

SWEP.ADSFireAnim = true

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 1.775
SWEP.ReloadHalt = 2.3
SWEP.ReloadTime_Empty = 3.1
SWEP.ReloadHalt_Empty = 3.8

function SWEP:IndividualThink()

if self.FireMode == "semi" then
	self.Owner.ViewAff = 0
	end

	--if self.dt.BipodDeployed then
	--	self.ForegripOverride = true
	--	self.ForegripParent = "bipod"
	--else
	--	self.ForegripOverride = true
	--	self.ForegripParent = "nah"
	--end
	
	self.EffectiveRange = 67.5 * 39.37
	self.DamageFallOff = .55
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.15))
	self.DamageFallOff = ((self.DamageFallOff * .85))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .15))
end
	
	if self.ActiveAttachments.doi_atow_unisuppressor then
	self.EffectiveRange = ((self.EffectiveRange * .88))
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

