AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "RGD-1 Smoke Grenade"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/hud/cw_nam_rdg1")
	killicon.Add("cw_rgd_smoke_thrown", "vgui/hud/cw_nam_rdg1", Color(255, 255, 255, 255))
	
	SWEP.ViewModelMovementScale = 0.8
	SWEP.DisableSprintViewSimulation = true
end

SWEP.CanRestOnObjects = false
SWEP.grenadeEnt = "cw_rgd_smoke_thrown"
SWEP.noResupply = false -- for ground control

SWEP.Animations = {throw = {"throw"},
	pullpin = {"pullbackhigh"},
	idle = "base_idle",
	draw = "base_draw"}
	
SWEP.Sounds = {pullbackhigh = {[1] = {time = 0.3, sound = "RGD1_PULL"},
	[2] = {time = 0.1, sound = "RGD1_ARMDRAW_01"}},
	
	pullbackhigh = {[1] = {time = 0.1, sound = "RGD1_THROW_01"}}}

	
SWEP.SpeedDec = 5

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "grenade"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_grenade_base"
SWEP.Category = "[CW2.0] Born To Kill"

SWEP.Author			= "donli"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.NoFreeAim = true

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/btk/v_nam_rdg1.mdl"
SWEP.WorldModel		= "models/btk/w_nam_rdg1.mdl"
SWEP.UseHands		= false

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/btk/w_nam_rdg1.mdl"
SWEP.WMPos = Vector(-3, 2, 2)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 12
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Smoke Grenades"

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
