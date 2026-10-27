AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "CW 2.0 MWR"
	SWEP.CSMuzzleFlashes = true
	SWEP.HUD_3D2DScale = 0.014
	SWEP.CustomizationMenuScale = 0.014
	SWEP.CalcViewCamera = "Camera"
	SWEP.CalcViewCameraIntensity = 2
	SWEP.AimSwayIntensity = 0.3
	SWEP.ViewbobIntensity = 0.25
end

SWEP.FireModes = {"auto"}

SWEP.SpeedDec = 0

SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.Base = "cw_blackops3_base_essential"

SWEP.Author			= "Loyalists"
SWEP.Contact		= "http://steamcommunity.com/profiles/76561198095855095"
SWEP.Purpose		= ""
SWEP.Instructions   = "CONTEXT MENU KEY - Open customization menu\nUSE KEY + RELOAD KEY - Change firemode\nUSE KEY + PRIMARY ATTACK KEY - Quick melee attack"

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.DrawTraditionalWorldModel = false

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.ClipSize		= 0
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ""

SWEP.Secondary.ClipSize		= 0
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= ""

SWEP.HipSpread = 0
SWEP.AimSpread = 0
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0

SWEP.ReloadHalt = 0
SWEP.ReloadHalt_Empty = 0

SWEP.MWRWeapon = true
SWEP.QuickMeleeLogic = false
SWEP.CustomVMArms = true
SWEP.CustomVMArmsPM = true
SWEP.CustomVMArmsConvertRig = "models/loyalists/h1/arms/h1_rig_pm.mdl"
SWEP.CustomVMArmsCSSRig = "models/loyalists/h1/arms/h1_rig_css.mdl"
SWEP.Inspectable = true

SWEP.AttachmentDependencies = {
	["md_blackops3_elo"] = {"blackops3_att_contract"},
	["md_blackops3_reflex"] = {"blackops3_att_contract"},
	["md_blackops3_acog"] = {"blackops3_att_contract"},
	["md_blackops3_hybrid"] = {"blackops3_att_contract"},
	["md_blackops3_holo"] = {"blackops3_att_contract"},
	["md_blackops3_ir"] = {"blackops3_att_contract"},
	}
	
SWEP.AttachmentExclusions = {
	["h1_att_reddot"] = {"blackops3_att_contract"},
	["h1_att_reflex"] = {"blackops3_att_contract"},
	["h1_att_holosight"] = {"blackops3_att_contract"},
	["h1_att_acog"] = {"blackops3_att_contract"},
	}