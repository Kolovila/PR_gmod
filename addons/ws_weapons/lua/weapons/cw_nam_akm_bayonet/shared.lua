AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AKM Type I Bayonet"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/btk/w_nam_akbayonet.mdl"
	SWEP.WMPos = Vector(3.812, -3.5, -2)
	SWEP.WMAng = Vector(99.385, -22.739, 18.048)
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_akbayonet")
	killicon.Add( "cw_nam_akm_bayonet", "vgui/inventory/weapon_akbayonet", Color(255, 0, 0, 0))
	
end

SWEP.Animations = {
	slash_primary = {"hitcenter1"},
	slash_secondary = {"hitcenter2", "hitcenter3"},
	idle = "idle",
	draw = "draw"
}

SWEP.Sounds = {
	hitcenter1 = {{time = 0.05, sound = "CW_KNIFE_SLASH"}},
	hitcenter2 = {{time = 0.1, sound = "CW_KNIFE_SLASH"}},
	hitcenter3 = {{time = 0.1, sound = "CW_KNIFE_SLASH"}},
	draw = {{time = 0.1, sound = "CW_KNIFE_DRAW"}},
}

SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.Base = "cw_melee_base"
SWEP.Category = "[CW2.0] Born To Kill"

SWEP.Author			= "dingo"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel 		= "models/weapons/v_nam_akbayonet.mdl"
SWEP.WorldModel 	= "models/weapons/w_nam_akbayonet.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 0
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ""

SWEP.PrimaryAttackDelay = 0.6
SWEP.SecondaryAttackDelay = 0.85

SWEP.PrimaryAttackDamage = {40, 50}
SWEP.SecondaryAttackDamage = {75, 85}

SWEP.PrimaryAttackRange = 55

SWEP.HolsterTime = 0.6
SWEP.DeployTime = 0.8

SWEP.PrimaryAttackImpactTime = 0.2
SWEP.PrimaryAttackDamageWindow = 0.15

SWEP.SecondaryAttackImpactTime = 0.2
SWEP.SecondaryAttackDamageWindow = 0.15

SWEP.PrimaryHitAABB = {
	Vector(-10, -5, -5),
	Vector(10, 5, 5)
}

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
