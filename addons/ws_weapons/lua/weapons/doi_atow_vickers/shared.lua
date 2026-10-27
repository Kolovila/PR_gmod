if CustomizableWeaponry then

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

		SWEP.magType = "brMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Vickers gun"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_vickers")
	killicon.Add( "doi_atow_vickers", "vgui/inventory/killicons/weapon_vickers", Color(255, 120, 40, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 200 * 39.37
	SWEP.DamageFallOff_Orig = .38
	
	SWEP.Shell = "khr303"
	SWEP.ShellScale = .6
	SWEP.ShellDelay = 0
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 0, y = 0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = .85
	SWEP.ForeGripOffsetCycle_Reload_Empty = .85
	
	SWEP.IronsightPos = Vector(-2, -2, -0.0059)
	SWEP.IronsightAng = Vector(0, -1.25, 0)
	
	SWEP.BipodPos = Vector(-5.304, -4.23, 3.44)
	SWEP.BipodAng = Vector(-2.65, 1.5, 0)
	
	SWEP.SprintPos = Vector(0, 0, -2)
	SWEP.SprintAng = Vector(-5.478, 5.96, 0)
	
	SWEP.CustomizePos = Vector(8, -2, -3)
	SWEP.CustomizeAng = Vector(14, 40, 5)

	SWEP.AlternativePos = Vector(-1, 0, 0)
	SWEP.AlternativeAng = Vector(-4.7469, -2.8829, 0)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-40.8947, -35.0455, 35.2273)
	
	SWEP.PronePos = Vector(0, -2, -.1579)
	SWEP.ProneAng = Vector(6, 15.7368, -5.9474)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.AttachmentModelsVM = {
	}
	
	SWEP.ForegripOverridePos = {
	["bipod"] = {
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, .5), angle = Angle(0, 0, 0) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-10, 0, -10), angle = Angle(0, 0, 0) },
	["BELT_FULL_01"] = { scale = Vector(1, 1, 1), pos = Vector(0.185, 0.185, 3.3), angle = Angle(3.332, 18.888, -5.557) },
	["Carry_Handle_Base"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(125.555, 0, 0) },
	["Weapon"] = { scale = Vector(1, 1, 1), pos = Vector(0, 1, 2), angle = Angle(-18.889, -3.333, 5.556) },
	["Bipod_Right"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -21.112) },
	["Bipod_Left"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, -21.112) }},
	
	["nah"] = {
	["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(-.75, .0, 0.5), angle = Angle(0, 0, 0) },
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["BELT_FULL_01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Carry_Handle_Base"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Weapon"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bipod_Right"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["Bipod_Left"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }},
}

	SWEP.CustomizationMenuScale = 0.025 --  0.03
	SWEP.OverallMouseSens = 1 -- 1 --  1 --  .5
	SWEP.BipodDeployHeightRequirement = -1
	SWEP.LuaVMRecoilAxisMod = {vert = .25, hor = .25, roll = .55, forward = 1.5, pitch = .5}
	SWEP.Trivia = {text = "Deploying your bipod will vastly improve your aiming accuracy.", x = -50, y = -450}
end
end

SWEP.MuzzleVelocity = 740

SWEP.LuaViewmodelRecoil = false
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = true
SWEP.CanRestOnObjects = true

SWEP.Attachments = {
[1] = {header = "Belt", offset = {550, -250}, atts = {"doi_atow_150rndbelt","doi_atow_50rndbelt"}},
["+reload"] = {header = "Ammo", offset = {-50, 50}, atts = {"am_atow_light", "am_atow_lowvel", "am_atow_heavy"}}}

SWEP.Animations = {fire = {"base_fire_2"},
	fire_aim = {"base_fire_2"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	idle = "base_idle",
	draw = "base_draw"}
	

SWEP.SpeedDec = 100
SWEP.ADSSpeedMult = {
standing = .65
}

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base_khr"
SWEP.Category = "CW 2.0 - ATOW"
SWEP.SubCategory = "Light machine guns"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 75 // 65
SWEP.AimViewModelFOV = 60
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/khrcw2/doipack/vickers.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_vickers.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_vickers.mdl"
SWEP.WMPos = Vector(-1, 14.25, 1.5)
SWEP.WMAng = Vector(-11, 2, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = false //
SWEP.RVBPitchMod = .5
SWEP.RVBYawMod = 0
SWEP.RVBRollMod = .5

SWEP.Primary.ClipSize		= 200
SWEP.Primary.DefaultClip	= 200
SWEP.Primary.Automatic		= true

if CustomizableWeaponry_doi_atow_hl2ammo then
SWEP.Primary.Ammo			= "AR2"
else
SWEP.Primary.Ammo			= ".303"
end

SWEP.FireDelay = 60/520
SWEP.FireSound = "DOIVICKERS_FIRE"
SWEP.Recoil = 1.75
SWEP.HorizontalRecoilMod = 1.25
SWEP.BipodRecoilModifier = 0.3 --0.1 -- = 0 --0.8
SWEP.BodyDamageMults = {[HITGROUP_HEAD] = .8,
[HITGROUP_CHEST] = 1,
[HITGROUP_STOMACH] = .87,
[HITGROUP_LEFTARM] = 1.45,
[HITGROUP_RIGHTARM] = 1.45,
[HITGROUP_RIGHTLEG] = 1.45,
[HITGROUP_LEFTLEG] = 1.45}

SWEP.BipodDeployTime = 0.5
SWEP.BipodUndeployTime = 0.5

SWEP.LoseAimVelocity = 10
SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.023
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.08
SWEP.SpreadCooldown = 0.12
SWEP.SpreadPerShot = 0.012
SWEP.Shots = 1
SWEP.Damage = 50
SWEP.DeployTime = .725
SWEP.HolsterTime = .8

SWEP.ADSFireAnim = true
SWEP.BipodInstalled = true
SWEP.Chamberable = false

SWEP.RecoilToSpread = .65

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 6
SWEP.ReloadHalt = 8.1
SWEP.ReloadTime_Empty = 6
SWEP.ReloadHalt_Empty = 8.1

SWEP.NearWallEnabled = false

function SWEP:IndividualThink()
	if self.dt.BipodDeployed then
		self.ForegripOverride = true
		self.ForegripParent = "bipod"
	else
		self.ForegripOverride = true
		self.ForegripParent = "nah"
	end
	
	self.EffectiveRange = 200 * 39.37
	self.DamageFallOff = .38
	
	if self.ActiveAttachments.am_atow_light then
	self.EffectiveRange = ((self.EffectiveRange * 1.1))
	self.DamageFallOff = ((self.DamageFallOff * .9))
end
	if self.ActiveAttachments.am_atow_heavy then
	self.DamageFallOff = ((self.DamageFallOff - .175))
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
		"BELT_FULL_02",
		"BELT_FULL_03",
		"BELT_FULL_04",
		"BELT_FULL_05",
		"BELT_FULL_06",
		"BELT_FULL_07",
		"BELT_FULL_08",
		"BELT_FULL_09",
		"BELT_FULL_10",
		"BELT_FULL_11",
		"BELT_FULL_12",
		"BELT_FULL_13",
		"BELT_FULL_14",
		"BELT_FULL_15",
		"BELT_FULL_16",
		"BELT_FULL_17",
		"BELT_FULL_18",
		"BELT_FULL_19",
		"BELT_FULL_20",
		"BELT_FULL_21",
		"BELT_FULL_22",
		"BELT_FULL_23",
	}
	
	local function removeRoundMeshes(wep) -- we hide all rounds left in the belt on a non-empty reload because if we don't we're left with ghost meshes moving around (bullets with no link to the mag get moved back to it)
		wep:adjustVisibleRounds(0)
	end
	
	local function adjustMeshByMaxAmmo(wep)
		wep:adjustVisibleRounds(wep.Owner:GetAmmoCount(wep.Primary.Ammo) + wep:Clip1())
	end
	
	SWEP.Sounds.base_reload[5].callback = adjustMeshByMaxAmmo
	SWEP.Sounds.base_reloadempty[5].callback = adjustMeshByMaxAmmo
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

 