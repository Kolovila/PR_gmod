AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M24x7 HE IED"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_geballteladung")
	killicon.Add("cw_grenade_thrown", "vgui/inventory/weapon_geballteladung", Color(255, 255, 255, 255))
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 0.8
	SWEP.DisableSprintViewSimulation = true
end

SWEP.CanRestOnObjects = false
SWEP.grenadeEnt = "cw_grenade_thrown"
SWEP.noResupply = false

SWEP.Animations = {throw = {"throw"},
	pullpin = {"pullbacklow"},
	idle = "base_idle",
	draw = "base_draw"}
	
SWEP.Sounds = {pullbacklow = {[1] = {time = 0.3, sound = "RGD5_PULL"},
	[2] = {time = 0.1, sound = "RGD5_ARMDRAW_01"}},
	
	throw = {[1] = {time = 0.1, sound = "RGD5_THROW_01"}}}
	
SWEP.SpeedDec = 5

SWEP.NoFreeAim = true

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "grenade"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_grenade_base"
SWEP.Category = "[CW2.0] Born To Kill"

SWEP.Author			= "doni"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel 		= "models/btk/v_nam_geballteladung.mdl"
SWEP.WorldModel 	= "models/btk/w_nam_geballteladung.mdl"
SWEP.UseHands		= false

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/btk/w_nam_geballteladung.mdl"
SWEP.WMPos = Vector(3.891, 2.295, -1.765)
SWEP.WMAng = Angle(-28.962, 155.365, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 12
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Frag Grenades"

SWEP.swapTime = 0.7

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
