if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		SWEP.magType = "brMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MG 34"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_mg34")
	killicon.Add( "doi_atow_mg34", "vgui/inventory/killicons/weapon_mg34", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 216 * 39.37
	SWEP.DamageFallOff_Orig = .35
	
	SWEP.Shell = "khr79257"
	SWEP.ShellScale = .53
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = -15}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = .8
	SWEP.ForeGripOffsetCycle_Reload_Empty = .825
	
	SWEP.IronsightPos = Vector(-3.0321, -2, 1.772)
	SWEP.IronsightAng = Vector(0, 0.0553, 0)
	
	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-15.478, 20.96, 0)
	
	SWEP.CustomizePos = Vector(8, -2, -2.3)
	SWEP.CustomizeAng = Vector(15, 40, 5)
	
	SWEP.AlternativePos = Vector(-0.6, .5, 0.1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-40.8947, 35.0455, -25.2273)
	
	SWEP.PronePos = Vector(0, -2, -.1579)
	SWEP.ProneAng = Vector(6, 15.7368, -5.9474)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.AttachmentModelsVM = {
	}
	
	SWEP.ForegripOverridePos = {
	["bipod"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-10, 0, -10), angle = Angle(0, 0, 0) },
	["Bipod_Main"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }},
	
	["nah"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bipod_Main"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }},
	
	["nobipod"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bipod_Main"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, -250), angle = Angle(0, 0, 0) }},
}
	
	SWEP.CustomizationMenuScale = 0.024 --  0.0275
	SWEP.OverallMouseSens = 1 -- 1 --  1 --  .6
	SWEP.LuaVMRecoilAxisMod = {vert = .015, hor = .15, roll = .4, forward = .65, pitch = .275}
	SWEP.Trivia = {text = "Deploying your bipod will vastly improve your aiming accuracy.", x = 50, y = -400}
end
end

SWEP.MuzzleVelocity = 740

SWEP.LuaViewmodelRecoil = false
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = true
SWEP.CanRestOnObjects = true

SWEP.Attachments = {[1] = {header = "Frame", offset = {-250, -200}, atts = {"doi_atow_bipodremove"}},
["+reload"] = {header = "Ammo", offset = {150, 250}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy", "am_atow_ap"}}}

SWEP.Animations = {fire = {"base_fire_1"},
	fire_aim = {"iron_fire_1","iron_fire_2"},
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	idle = "base_idle",
	draw = "base_draw"}
	

SWEP.SpeedDec = 75
SWEP.ADSSpeedMult = {
standing = .5
}

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Light machine guns"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 64
SWEP.ZoomAmount = 15
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/mg34.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_mg34.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_mg34.mdl"
SWEP.WMPos = Vector(-1, 12, 2)
SWEP.WMAng = Vector(-10, 2, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 75
SWEP.Primary.DefaultClip	= 75
SWEP.Primary.Automatic		= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "AR2"
else
SWEP.Primary.Ammo			= "7.92x57MM"
end

SWEP.FireDelay = 60/770
SWEP.FireSound = "DOIMG34_FIRE"
SWEP.Recoil = 1.45
SWEP.HorizontalRecoilMod = 1.5
SWEP.BipodRecoilModifier = 0.3 --0.1 -- = 0 --.65
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .7,
[HITGROUP_CHEST] = 1,
[HITGROUP_STOMACH] = .8,
[HITGROUP_LEFTARM] = 1.4,
[HITGROUP_RIGHTARM] = 1.4,
[HITGROUP_RIGHTLEG] = 1.4,
[HITGROUP_LEFTLEG] = 1.4}

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.072
SWEP.AimSpread = 0.008
SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.14
SWEP.Shots = 1
SWEP.Damage = 50
SWEP.DeployTime = .8
SWEP.HolsterTime = .8

SWEP.ADSFireAnim = true
SWEP.BipodInstalled = true
SWEP.Chamberable = false

SWEP.RecoilToSpread = .7

SWEP.ReloadSpeed = 1.25
SWEP.ReloadTime = 7
SWEP.ReloadHalt = 8.4
SWEP.ReloadTime_Empty = 9
SWEP.ReloadHalt_Empty = 10

function SWEP:IndividualThink()
	if self.dt.BipodDeployed then
		self.ForegripOverride = true
		self.ForegripParent = "bipod"
	elseif self.ActiveAttachments.doi_atow_bipodremove then
		self.ForegripOverride = true
		self.ForegripParent = "nobipod"
		self.ForeGripOffsetCycle_Reload = 0
		self.ForeGripOffsetCycle_Reload_Empty = 0
		self.ForeGripOffsetCycle_Draw = 0
	else
		self.ForegripOverride = true
		self.ForegripParent = "nah"
		self.ForeGripOffsetCycle_Reload = .82
		self.ForeGripOffsetCycle_Reload_Empty = .825
	end
	
	if self.FireMode == "semi" then
	self.Owner.ViewAff = 0
	end
	
	self.EffectiveRange = 216 * 39.37
	self.DamageFallOff = .35
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.1))
	self.DamageFallOff = ((self.DamageFallOff * .9))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .162))
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

if CLIENT then
	SWEP.RoundBeltBoneNames = {
		"Ammo_01",
		"Ammo_02",
		"Ammo_03",
		"Ammo_04",
	}
	
	local function removeRoundMeshes(wep) -- we hide all rounds left in the belt on a non-empty reload because if we don't we're left with ghost meshes moving around (bullets with no link to the mag get moved back to it)
		wep:adjustVisibleRounds(0)
	end
	
	local function adjustMeshByMaxAmmo(wep)
		wep:adjustVisibleRounds(wep.Owner:GetAmmoCount(wep.Primary.Ammo) + wep:Clip1())
	end
	
	SWEP.Sounds.base_reload[4].callback = adjustMeshByMaxAmmo
	SWEP.Sounds.base_reload_empty[1].callback = adjustMeshByMaxAmmo
end

function SWEP:IndividualInitialize()
	if CLIENT then
		self:initBeltBones()
	end
end

function SWEP:initBeltBones()
	local vm = self.CW_VM
	self.roundBeltBones = {}

	for key, boneName in ipairs(self.RoundBeltBoneNames) do
		local bone = vm:LookupBone(boneName)
		self.roundBeltBones[key] = bone
	end
end

function SWEP:postPrimaryAttack()
	if CLIENT then
		self:adjustVisibleRounds()
	end
end

local fullSize = Vector(1, 1, 1)
local invisible = Vector(0, 0, 0)

function SWEP:adjustVisibleRounds(curMag)
	if not self.roundBeltBones then
		self:initBeltBones()
	end
	
	local curMag = curMag or self:Clip1()
	local boneCount = #self.roundBeltBones
	local vm = self.CW_VM
	
	for i = 1, boneCount do
		local roundID = boneCount - (i - 1)
		local element = self.roundBeltBones[roundID]
		
		local scale = curMag >= roundID and fullSize or invisible
		vm:ManipulateBoneScale(element, scale)
	end
end
	
 