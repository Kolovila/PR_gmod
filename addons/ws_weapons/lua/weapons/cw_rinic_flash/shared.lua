AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M84 Flash Grenade"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 0.8
	SWEP.DisableSprintViewSimulation = true
end

SWEP.CanRestOnObjects = false
SWEP.grenadeEnt = "cw_flash_rinic"
SWEP.CrosshairParts = {left = true, right = true, upper = false, lower = false}

SWEP.Animations = {throw = {"throw"},
	pullpin = {"pullpin"},
	idle = "idle",
	draw = "deploy"}
	
SWEP.Sounds = {deploy = {[1] = {time = 0, sound = "CW_FOLEY_LIGHT"}},

	pullpin = {[1] = {time = 0.4, sound = "CW_RINIC_PINPULL"}},

	throw = {[1] = {time = 0, sound = "CW_RINIC_THROW"}}}
	
	
SWEP.SpeedDec = 5

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "grenade"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_grenade_base"
SWEP.Category = "CW 2.0 Rinic's Custom"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_m84_flash_rinic.mdl"
SWEP.WorldModel		= "models/weapons/w_m84_flash_rinic.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 3
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Flash Grenades"

SWEP.fuseTime = 2.5
SWEP.HipSpread = 0.015
SWEP.MaxSpreadInc = 0.085