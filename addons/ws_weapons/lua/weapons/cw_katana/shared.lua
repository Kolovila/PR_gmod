AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Imperial Katana"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_wakizast.mdl"
	SWEP.WMPos = Vector(-1, 1, 2)
	SWEP.WMAng = Vector(-30, -10, 180)

	SWEP.SelectIcon = surface.GetTextureID("vgui/null")
end


SWEP.Animations = {
	slash_primary = {"midslash1", "midslash2"},
	slash_secondary = "stab",
	draw = "draw",
	idle = "idle"}

SWEP.Sounds = {
	midslash1 = {{time = 0.05, sound = "CW_KNIFE_SLASH"}},
	midslash2 = {{time = 0.05, sound = "CW_KNIFE_SLASH"}},
	stab = {{time = 0.06, sound = "BANZAI"}},
	draw = {{time = 0.1, sound = "weapons/blades/deploy.mp3"}}}

SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.Base = "cw_melee_base"
SWEP.Category = "[CW2.0] WW2"
SWEP.NormalHoldType = "melee2"

SWEP.Author			= "doni"
SWEP.Contact		= "doni"
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 90
SWEP.ViewModelFlip	= false
SWEP.ViewModel = "models/weapons/v_wakizas.mdl"
SWEP.WorldModel = "models/weapons/w_wakizast.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 0
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ""

SWEP.PrimaryAttackDelay = 0.70
SWEP.SecondaryAttackDelay = 2.5

SWEP.PrimaryAttackDamage = {75, 65}
SWEP.SecondaryAttackDamage = {120, 90}

SWEP.PrimaryAttackRange = 85

SWEP.HolsterTime = 1.1
SWEP.DeployTime = 1.4

SWEP.PrimaryAttackImpactTime = 0.06
SWEP.PrimaryAttackDamageWindow = 0.06

SWEP.SecondaryAttackImpactTime = 0.25
SWEP.SecondaryAttackDamageWindow = 0.15

SWEP.PrimaryHitAABB = {
	Vector(-10, -5, -5),
	Vector(10, 5, 5)}