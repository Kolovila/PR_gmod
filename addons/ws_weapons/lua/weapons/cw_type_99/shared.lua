AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

	--SWEP.magType = "NONE"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Arisaka Type 99"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_k98")
	killicon.Add( "cw_type_99", "vgui/inventory/killicons/weapon_k98", Color(255, 0, 0, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0
	
	SWEP.EffectiveRange_Orig = 430 * 39.37
	SWEP.DamageFallOff_Orig = .48 
	
	SWEP.Shell = "khr79257"
	SWEP.ShellScale = .4
	SWEP.ShellDelay = .79
	SWEP.ShellDelaySlow = .79
	SWEP.ShellDelayFast = .72
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 5.5, y = -2.75, z = .5}

	SWEP.IronsightPos = Vector(0.28, 6.4, 0.92)
	SWEP.IronsightAng = Vector(0, -0.1, 0)
	
	SWEP.SprintPos = Vector(4,10,-14)
	SWEP.SprintAng = Vector(25,30,0)
	
	SWEP.CustomizePos = Vector(8.5, -3, .5)
	SWEP.CustomizeAng = Vector(10, 45, 16)

	SWEP.AlternativePos = Vector(-0.75, -.25, -.3)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-55.8947, 55.0455, -16.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.BackupSights = {["doi_atow_zf39"] = {[1] = Vector(-2.5615, -3, 1.588), [2] = Vector(0.2652, 0.0073, 0)},["doi_atow_zf4"] = {[1] = Vector(-2.5615, -3, 1.588), [2] = Vector(0.2652, 0.0073, 0)},["doi_atow_zf41"] = {[1] = Vector(-2.5615, -3, 1.588), [2] = Vector(0.2652, 0.0073, 0)},}
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1.1
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.OverallMouseSens = 1 -- 1 --  1 --  .75
	SWEP.CustomizationMenuScale = 0.026 --  0.032
	
	SWEP.AttachmentModelsVM = {
	["doi_atow_zf41"] = {model = "models/khrcw2/doipack/attachments/kar98k1xscope.mdl", pos = Vector(2.15, 0, .05), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Optic"},
	["doi_atow_zf4"] = {model = "models/khrcw2/doipack/attachments/kar98k1xscope.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Optic"},
	["doi_atow_zf39"] = {model = "models/khrcw2/doipack/attachments/kar98k7xscope.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "A_Optic"},
	["doi_atow_unisuppressor"] = {model = "models/khrcw2/doipack/attachments/m3a1suppressor.mdl", pos = Vector(2.4, 7, 4.5), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), bone = "K98"},
	}
	
	SWEP.ForegripOverridePos = {
	["nah"] = {
	["L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(1, 0, -.05), angle = Angle(0, 0, 0) },
	["L Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 3, 0) },
	["L Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -8, 0) },
	["L Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 4, 0) }},
}
	
	SWEP.M82AxisAlign = {right = 0, up = -.015, forward = 0}
	SWEP.M823AxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 1, roll = 2, forward = 2, pitch = 2}
end

SWEP.MuzzleVelocity = 760

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = false
SWEP.CanRestOnObjects = true


SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {320, 200}, atts = {"am_atow_heavy", "am_atow_light"}}}

SWEP.Animations = {fire = {"rechamber"},
	fire_aim = {"rechamber_ads"},
	reload = "reload",
	reload_empty = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.SpeedDec = 35

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 95
SWEP.AimViewModelFOV = 70
SWEP.ZoomAmount = 10
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/bo1/c_bo1_arisaka.mdl"
SWEP.WorldModel		= "models/khrcw2/doipack/w_kar98k.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/khrcw2/doipack/w_kar98k.mdl"
SWEP.WMPos = Vector(-.25, 14, .55)
SWEP.WMAng = Vector(-10, .8, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = true
SWEP.RVBPitchMod = .85
SWEP.RVBYawMod = .5
SWEP.RVBRollMod = .85

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.92x57MM"

SWEP.FireDelay = 60/43
SWEP.FireSound = "T99_FIRE"
SWEP.FireSoundSuppressed = "T99_FIRE_S"
SWEP.Recoil = 1
SWEP.FOVPerShot = 0 -- = 1

SWEP.HipSpread = 0.06
SWEP.AimSpread = 0.00077
SWEP.VelocitySensitivity = .32
SWEP.MaxSpreadInc = 0.065
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 79
SWEP.DeployTime = .485
SWEP.HolsterTime = .6

SWEP.ADSFireAnim = true
SWEP.Chamberable = false
SWEP.ShotgunReload = false
SWEP.PreventQuickScoping = false

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 47/30
SWEP.ReloadHalt = 55/30
SWEP.ReloadTime_Empty = 47/30
SWEP.ReloadHalt_Empty = 55/30

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
