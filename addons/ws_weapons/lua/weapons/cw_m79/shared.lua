AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

-- it appears you have extracted my addon.

-- good for you!

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M79 GL"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.2
	SWEP.CustomizationMenuScale = 0.015
	
	SWEP.IconLetter = "k"
	
	killicon.AddFont("cw_m79", "HL2MPTypeDeath", "7", Color(255, 80, 0, 150))
	
	-- there's a grenade launcher crosshair i made but didn't enable because it's pretty gay
	SWEP.CrosshairEnabled = false -- set this to true to enable it
	SWEP.CrosshairParts = {left = false, right = false, upper = false, lower = false}
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = Vector(2, 0, 0)
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/r_rif_m79.mdl"
	SWEP.WMPos = Vector(-1.25, 1, -1.5)
	SWEP.WMAng = Vector(-10, 0, 180)
	
	SWEP.Shell = false
	SWEP.HUD_MagText = "BARREL: "
	SWEP.FullAimViewmodelRecoil = true
	
	SWEP.IronsightPos = Vector(-3.35, -6.416, -0.433)
	SWEP.IronsightAng = Vector(0, 0.27, 0)
	
	-- old irons in case i need them
	--SWEP.IronsightPos = Vector(-3.35, -6.416, 1.4)
	--SWEP.IronsightAng = Vector(-6.183, 0.27, 0)

	SWEP.ShortenedPos = Vector(-3.41, -5.232, 1.66)
	SWEP.ShortenedAng = Vector(-6.308, 0, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)

	SWEP.AimViewModelFOV = 55
	
	SWEP.OverallMouseSens = 0.7

	SWEP.AlternativePos = Vector(-0.3, 0, -1.2)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = 2, roll = 1, forward = 2, pitch = 3}
end

SWEP.BarrelBGs = {main = 1, normal = 0, short = 1}
SWEP.StockBGs = {main = 2, normal = 0, short = 1}
SWEP.SightBGs = {main = 3, up = 0, down = 1, none = 2}

SWEP.LuaViewmodelRecoil = true

SWEP.Attachments = {[1] = {header = "Barrel", offset = {-400, -200}, atts = {"bg_m79_shortbarrel"}},
	[2] = {header = "Stock", offset = {600, -200}, atts = {"bg_m79_shortstock"}},
	["+reload"] = {header = "Ammo", offset = {200, 400}, atts = {"am_m79_ammo"}}}

SWEP.Animations = {reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_HEAVY"},
	{time = 0.5, sound = "CW_FOLEY_CLOTH"}},

	reload = {{time = 0, sound = "CW_FOLEY_LIGHT"},
	{time = 0.5, sound = "CW_M79_OPEN"},
	{time = 0.5, sound = "CW_M79_REMOVE"},
	{time = 1.6, sound = "CW_M79_INSERT"},
	{time = 2.4, sound = "CW_M79_CLOSE"},
	{time = 2.8, sound = "CW_FOLEY_LIGHT"}},
}

SWEP.SpeedDec = 50

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"break"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "han solo"
SWEP.Contact		= "aids"
SWEP.Purpose		= "blow up shit"
SWEP.Instructions	= "point at terrorist"

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/special/r_m79.mdl"
SWEP.WorldModel		= "models/weapons/r_rif_m79.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "40MM"

SWEP.NoDistance = true

SWEP.Grenade40MM = 0

SWEP.FireDelay = 0.5
SWEP.FireSound = "CW_M79_FIRE"
SWEP.Recoil = 2.4

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 0.1
SWEP.ClumpSpread = 0.1
SWEP.PreventQuickScoping = true
SWEP.QuickScopeSpreadIncrease = 0.02
SWEP.Damage = 0
SWEP.Shots = 0
SWEP.DrawSpeed = 0.8
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 0.75
SWEP.ReloadTime = 2.2
SWEP.ReloadTime_Empty = 2.2
SWEP.ReloadHalt = 3.0
SWEP.ReloadHalt_Empty = 3.0

SWEP.Chamberable = false

-- replaced clump spread function

if CLIENT then
	local surface = surface
	local ClumpSpread = surface.GetTextureID("cw2/gui/clumpspread_ring")
	local GLCrosshair = surface.GetTextureID("cw2/gui/crosshair_gl")

	function SWEP:drawClumpSpread(x, y, spread, alpha)
		local curGrenade = CustomizableWeaponry.grenadeTypes:get(self.Grenade40MM)
				
		if curGrenade and curGrenade.clumpSpread then
			local size = math.ceil(curGrenade.clumpSpread * 2500)
			surface.SetDrawColor(0, 0, 0, self.CrossAlpha * 0.35)
			surface.SetTexture(ClumpSpread)
			surface.DrawTexturedRect(x - size * 0.5 - 1, y - size * 0.5 - 1, size + 2, size + 2)
						
			surface.SetDrawColor(255, 255, 255, self.CrossAlpha * 0.35)
			surface.DrawTexturedRect(x - size * 0.5, y - size * 0.5, size, size)
		else
			surface.SetTexture(GLCrosshair)
			surface.SetDrawColor(255, 255, 255, self.CrossAlpha)
			surface.DrawTexturedRect(x - 16, y, 32, 32)
		end
	end
end

-- actual grenade launching script from the m203

function SWEP:postPrimaryAttack()
	local target = CustomizableWeaponry.grenadeTypes.registered[self.Grenade40MM]
			
	if not target then
		CustomizableWeaponry.grenadeTypes.defaultFireFunc(self)
	else
		target.fireFunc(self)
	end
		
	CustomizableWeaponry.grenadeTypes.selectFireSound(self, target)
end

-- give the ammo type swap

local attachments = {"am_m79_ammo"}

function SWEP:equipFunc()
	if SERVER then
		if not CustomizableWeaponry:hasSpecifiedAttachments(self.Owner, attachments) then
			CustomizableWeaponry.giveAttachments(self.Owner, attachments)
		end
	end
end

-- are you done yet?