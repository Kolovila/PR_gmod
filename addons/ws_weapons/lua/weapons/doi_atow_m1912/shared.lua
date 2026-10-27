if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

	--SWEP.magType = "NONE"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M1912"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_m1912")
	killicon.Add( "doi_atow_m1912", "vgui/inventory/killicons/weapon_m1912", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 50 * 39.37
	SWEP.DamageFallOff_Orig = .5
	
	SWEP.Shell = "khr12gbuck"
	SWEP.ShellScale = .435
	SWEP.ShellDelay = .52
	SWEP.ShellDelaySlow = .52
	SWEP.ShellDelayFast = .32
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 4.75, y = -.85, z = .45}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	SWEP.ForeGripOffsetCycle_ReloadStart = 0
	SWEP.ForeGripOffsetCycle_ReloadInsert = 0
	SWEP.ForeGripOffsetCycle_ReloadEnd = 0

	SWEP.IronsightPos = Vector(-2.005, -2.25, 0.979)
	SWEP.IronsightAng = Vector(0.555, 0, 0)
	
	SWEP.AltIronPos = Vector(-2.005, -2.25, 0.855)
	SWEP.AltIronAng = Vector(0.85, 0, 0)
	
	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-15.478, 20.96, 0)
	
	SWEP.CustomizePos = Vector(8, -2, .5)
	SWEP.CustomizeAng = Vector(10, 40, 15)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-40.8947, 40.0455, -12.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.AlternativePos = Vector(-.4, -.5, -0.8)
	SWEP.AlternativeAng = Vector(0.555, 0, 0)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.LuaVMRecoilAxisMod = {vert = .5, hor = .5, roll = 3, forward = 1.5, pitch = .8}
	SWEP.OverallMouseSens = 1 -- 1 --  1 --  .825
	SWEP.CustomizationMenuScale = 0.022 --  0.025
	
	SWEP.AttachmentModelsVM = {["md_sgslugsight"] = {model = "models/khrcw2/doipack/attachments/shotgunslugsight.mdl", pos = Vector(-20.745, 3.5, 1.725), angle = Angle(180, -180, 90), size = Vector(.9, .9, .9), bone = "Weapon"},
	["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/unisuppressor.mdl", pos = Vector(0.01, 18.25, .3), angle = Angle(-.35, -90, 0), size = Vector(1.1, 1.1, 1.1), bone = "Weapon"}}
	
		SWEP.ForegripOverridePos = {
	["nah"] = {
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, -.4), angle = Angle(0, 0, 0) },
	["L Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, .40, -.5), angle = Angle(5, 2, -5) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5, -2, -5) }}
}
	
	SWEP.Trivia = {text = "By holding the attack key you will slam-fire, providing high firerate.", x = -50, y = -400}
end
end

SWEP.MuzzleVelocity = 340

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = false
SWEP.CanRestOnObjects = true

SWEP.Attachments = {[1] = {header = "Action", offset = {950, 240}, atts = {"doi_atow_greasedbolt"}},
[2] = {header = "Optic", offset = {-250, 325}, atts = {"md_sgslugsight"}},
["+reload"] = {header = "Ammo", offset = {250, 175}, atts = {"am_flechettem37", "am_slugroundsm37"}}}

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
standing = 1.05
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
SWEP.ViewModel		= "models/khrcw2/doipack/m1912.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_m1912.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_m1912.mdl"
SWEP.WMPos = Vector(-1, 2, 0)
SWEP.WMAng = Vector(-16, 2, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 5
SWEP.Primary.Automatic		= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "Buckshot"
else
SWEP.Primary.Ammo			= "12 Gauge"
end

SWEP.FireDelay = 60/125
SWEP.FireSound = "DOIM37_FIRE"
SWEP.Recoil = 2.6
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .67,
[HITGROUP_CHEST] = 1,
[HITGROUP_LEFTARM] = 1.55,
[HITGROUP_RIGHTARM] = 1.55,
[HITGROUP_RIGHTLEG] = 1.55,
[HITGROUP_LEFTLEG] = 1.55}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = .75
SWEP.MaxSpreadInc = 0.043
SWEP.ClumpSpread = 0.018
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 60/100
SWEP.Shots = 8
SWEP.Damage = 16
SWEP.DeployTime = .425
SWEP.HolsterTime = .6

SWEP.ADSFireAnim = true
SWEP.GlobalDelayOnShoot = 60/125
SWEP.GlobalDelayOnShootSlow = 60/125
SWEP.GlobalDelayOnShootFast = 60/154
SWEP.Chamberable = true
SWEP.ShotgunReload = true
SWEP.PreventQuickScoping = false
SWEP.CrosshairParts = {left = true, right = true, upper = false, lower = true}

SWEP.ForegripOverride = true
SWEP.ForegripParent = "nah"

SWEP.SnapToIdle = true
SWEP.ReloadSpeed = 1.4
SWEP.ReloadStartTime = 0.5
SWEP.InsertShellTime = .75
SWEP.ReloadFinishWait = 1

function SWEP:IndividualThink()
self.Owner.ViewAff = 0
clip = self:Clip1()	

self.ShellDelay = (self.ActiveAttachments.doi_atow_greasedbolt) and self.ShellDelayFast or self.ShellDelaySlow
	self.GlobalDelayOnShoot = (self.ActiveAttachments.doi_atow_greasedbolt) and self.GlobalDelayOnShootFast or self.GlobalDelayOnShootSlow

	--if clip == 0 then	
	--self.Animations.reload_start = "base_reload_start_empty"
	--self.ReloadStartTime = 3
	--end
	
	--if clip < 0 then
	--self.Animations.reload_start = "base_reload_start"
	--self.ReloadStartTime = 0.5
	--end

	self.EffectiveRange = 50 * 39.37
	self.DamageFallOff = .5
	self.ClumpSpread = .018
	
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

 