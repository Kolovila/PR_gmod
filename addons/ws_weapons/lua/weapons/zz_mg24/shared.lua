AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("7.62x54mm", "7.62x54mm", 7.62, 54)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "DP-28"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.16
	
	
    killicon.Add("zz_mg24", "vgui/hud/zz_mg24", Color(255, 0, 255, 0))
	
	SWEP.SimpleTelescopicsFOV = 75
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellDelay = 0
	SWEP.ShellPosOffset = {x = -2, y = -0, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	SWEP.OverrideAimMouseSens = 0.9
	SWEP.SelectIcon = surface.GetTextureID("vgui/hud/zz_mg24")
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_zz_mg24_tp.mdl"
	SWEP.WMPos = Vector(-0.5, 18.5, -7.645)
	SWEP.WMAng = Vector(-10, 0, 180)


    SWEP.IronsightPos = Vector(-5.16, -2.06, 1.6)
    SWEP.IronsightAng = Vector(-3.846, -4.732, 0)

    SWEP.WFRDSPos = Vector(-5.24, -2.221, 0.593)
    SWEP.WFRDSAng = Vector(-3.606, -4.977, 0)

	SWEP.WFHoloPos = Vector(-5.16, -2.264, 1.029)
    SWEP.WFHoloAng = Vector(-3.606, -4.777, 0)
	
	SWEP.SprintPos = Vector(1.786, 0, -1)
	SWEP.SprintAng = Vector(-10.778, 27.573, 0)
	
	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomPos = Vector(3.194, -1.764, -0.486)
	SWEP.CustomAng = Vector(15.477, 35.833, 18.066)
	
	SWEP.AimBreathingEnabled = false
	SWEP.CrosshairEnabled = true
	SWEP.AimViewModelFOV = 75
	
	SWEP.HipFireFOVIncrease = false

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	SWEP.RTAlign = {right = 1.2, up = 0.25, forward = 0}
	
		SWEP.AttachmentModelsVM = {
		["ma85_wf_shared_red_dot"] = {model = "models/ma85_wf_attachments/shared/ma85_wf_shared_red_dot.mdl", bone = "main", pos = Vector(-2.214, -1.596, 0.101), angle = Angle(90, -88.709, 0), size = Vector(0.25, 0.25, 0.25)},
		["ma85_wf_shared_holo"] = {model = "models/ma85_wf_attachments/shared/ma85_wf_shared_reflex.mdl", bone = "main", pos = Vector(-2.559, -1.596, 0.017), angle = Angle(90, -88.947, 0), size = Vector(0.17, 0.17, 0.17)},
	    ["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "Weapon", pos = Vector(0.138, 6.619, 0.601), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699), bodygroup = {[1] = 1}},
		}
	
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.MuzzleBGs = {main = 2, sil = 1, normal = 0, off = 0}
SWEP.ADSFireAnim = true
SWEP.PreventQuickScoping = false
SWEP.QuickScopeSpreadIncrease = 0.2

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}
--[2] = {header = "Camo", offset = {180, 500}, atts = {"zz_mg24_gold"}}}

	SWEP.Animations = {fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload_full",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0.47, sound = "CW_FOLEY_MEDIUM"}},

	reload_full = {{time = 0.0, sound = "ZZ_MG24_WPNUP"},
    {time = 0.74, sound = "ZZ_MG24_CLIPOUT"},
	{time = 2.28, sound = "ZZ_MG24_CLIPIN"},
    {time = 3.35, sound = "ZZ_MG24_PUNCH"}},	

	reload = {{time = 0.0, sound = "ZZ_MG24_WPNUP"},
    {time = 0.74, sound = "ZZ_MG24_CLIPOUT"},
	{time = 2.58, sound = "ZZ_MG24_CLIPIN"},	
	{time = 3.38, sound = "ZZ_MG24_PUNCH"},	
	{time = 4.57, sound = "ZZ_MG24_TEST1"}}
	

}

SWEP.SpeedDec = 50

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] WW2"

SWEP.Author			= "Doni Danger"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= "Hold off the Werhmacht advances on the Eastern Front."

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_zz_mg24.mdl"
SWEP.WorldModel		= "models/weapons/w_zz_mg24_tp.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 47
SWEP.Primary.DefaultClip	= 470
SWEP.Primary.Automatic		= true
SWEP.Chamberable = false
SWEP.Primary.Ammo			= "7.62x54MM"	

SWEP.FireDelay = 60/650
SWEP.FireSound = "ZZ_MG24_FIRE"
SWEP.FireSoundSuppressed = "CW_MP5_FIRE_SUPPRESSED"
SWEP.Recoil = 1.15

SWEP.HipSpread = 0.080
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 2.5
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 1.54
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 5
SWEP.ReloadTime_Empty = 5.5
SWEP.ReloadHalt = 5.5
SWEP.ReloadHalt_Empty = 6

SWEP.BipodInstalled = true
SWEP.BipodRecoilModifier = 0.85

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = false
SWEP.CanRestOnObjects = true

function SWEP:getBipodHipSpread()
	return self.HipSpread * 0.2
end
