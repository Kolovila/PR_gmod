AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("7.62x54MM", "7.62x54MM", 7.62, 54)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "DPM"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.16
	
    killicon.Add("ro_dp28", "vgui/hud/zz_mg24", Color(255, 0, 255, 0))
	
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
	SWEP.FireMoveMod = 0.85
	SWEP.OverrideAimMouseSens = 0.9
	SWEP.SelectIcon = surface.GetTextureID("vgui/hud/zz_mg24")
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_ro2_dp28.mdl"
	SWEP.WMPos = Vector(-0.5, 18.5, -7.645)
	SWEP.WMAng = Vector(-10, 0, 180)

    SWEP.IronsightPos = Vector(-4.801, 0, 2.319)
    SWEP.IronsightAng = Vector(-1.4, -0.101, 0)

	SWEP.SprintPos = Vector(7.719, -5.881, -4.64)
	SWEP.SprintAng = Vector(-9.4, 57.7, -17.701)
	
	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomPos = Vector(3.194, -1.764, -0.486)
	SWEP.CustomAng = Vector(15.477, 35.833, 18.066)
	
	SWEP.AimBreathingEnabled = false
	SWEP.CrosshairEnabled = true
	SWEP.AimViewModelFOV = 55
	
	SWEP.HipFireFOVIncrease = false

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	SWEP.RTAlign = {right = 1.2, up = 0.25, forward = 0}
	
		SWEP.AttachmentModelsVM = {
		["ma85_wf_shared_red_dot"] = {model = "models/ma85_wf_attachments/shared/ma85_wf_shared_red_dot.mdl", bone = "main", pos = Vector(-2.214, -1.596, 0.101), angle = Angle(90, -88.709, 0), size = Vector(0.25, 0.25, 0.25)},
		["ma85_wf_shared_holo"] = {model = "models/ma85_wf_attachments/shared/ma85_wf_shared_reflex.mdl", bone = "main", pos = Vector(-2.559, -1.596, 0.017), angle = Angle(90, -88.947, 0), size = Vector(0.17, 0.17, 0.17)},
	    ["md_bipod"] = {model = "models/wystan/attachments/bipod.mdl", bone = "Weapon", pos = Vector(0.138, 6.619, 0.601), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699), bodygroup = {[1] = 1}},
		}
	
end

SWEP.ADSFireAnim = true
SWEP.PreventQuickScoping = false
SWEP.QuickScopeSpreadIncrease = 0.2

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade"}}}

SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "DP28_DRAW"}},

	reload = {{time = 0.0, sound = "DP28_START"},
    {time = 0.8, sound = "DP28_MAGOUT"},
	{time = 2.2, sound = "DP28_MAGIN"},	
	{time = 1.6, sound = "DP28_MAGTAP"},	
	{time = 3.5, sound = "DP28_BOLT"}}}

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

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel			= "models/weapons/v_pach_m249para.mdl"
SWEP.WorldModel			= "models/weapons/w_ro2_dp28.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 47
SWEP.Primary.DefaultClip	= 470
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x54MM"	

SWEP.FireDelay = 60/550
SWEP.FireSound = "DP28_FIRE"
SWEP.FireSoundSuppressed = "CW_MP5_FIRE_SUPPRESSED"
SWEP.Recoil = 1.15

SWEP.HipSpread = 0.050
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 2.5
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 1.54
SWEP.Shots = 1
SWEP.Damage = 32
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 5
SWEP.ReloadTime_Empty = 5.5
SWEP.ReloadHalt = 5.5
SWEP.ReloadHalt_Empty = 6

SWEP.BipodInstalled = true
SWEP.BipodRecoilModifier = 0.45

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = false
SWEP.CanRestOnObjects = true
SWEP.Chamberable = false

function SWEP:getBipodHipSpread()
	return self.HipSpread * 0.025
end
