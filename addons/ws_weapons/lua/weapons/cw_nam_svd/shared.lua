AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SVD-63"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = false
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_nam_svd")
	killicon.Add( "cw_nam_svd", "vgui/inventory/weapon_nam_svd", Color(255, 0, 0, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 450 * 39.37
	SWEP.DamageFallOff_Orig = .47
	
	SWEP.Shell = "khr79257"
	SWEP.ShellScale = .5
	SWEP.ShellDelay = .03
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 2.5, y = -1, z = 0}
	
	SWEP.IronsightPos = Vector(-2.0166, -2, 0.5294)
	SWEP.IronsightAng = Vector(0.0934, -0.0015, 0)
	
	SWEP.KobraPos = Vector(-2.0341, -2, -0.3)
	SWEP.KobraAng = Vector(0, 0, 0)
	
	SWEP.ShortDotPos = Vector(-2.0341, 3.6, 0.1)
	SWEP.ShortDotAng = Vector(0, 0, 0)
	
	SWEP.PSOPos = Vector(-1.85, -4, -0.6)
	SWEP.PSOAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-15.478, 20.96, 0)
	
	SWEP.CustomizePos = Vector(8.5, -3, .5)
	SWEP.CustomizeAng = Vector(10, 45, 18)
	
	SWEP.AlternativePos = Vector(-0.5, -.75, -0.4)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SwimPos = Vector(0.5682, -1.7045, 1.0526)
	SWEP.SwimAng = Vector(-60.8947, -2.0455, -5.2273)
	
	SWEP.PronePos = Vector(0, 0, -3.1579)
	SWEP.ProneAng = Vector(-2, 22.7368, -28.9474)
	
	SWEP.BackupSights = {["doi_atow_zf4"] = {[1] = Vector(-2.4370, -3.5, 0.8812), [2] = Vector(0.0762, 0.034, 0)},
	["doi_atow_zf41"] = {[1] = Vector(-2.4370, -3.5, 0.8812), [2] = Vector(0.0762, 0.034, 0)}}
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = .95
	SWEP.DisableSprintViewSimulation = false
	
	SWEP.OverallMouseSens = 1 -- .75
	SWEP.CustomizationMenuScale = 0.025 --  0.03
	
	SWEP.AttachmentModelsVM = {
	["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", pos = Vector(0.05, 31, -0.25), angle = Angle(0, 0, 0), size = Vector(.75, .75, .75), bone = "Weapon"},
	["md_kobra"] = {model = "models/cw2/attachments/kobra.mdl", bone = "Weapon", pos = Vector(0.6, 1, -3.4), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)},
	["md_pso1"] = {model = "models/cw2/attachments/pso.mdl", bone = "Weapon", pos = Vector(0, -1, -1.1), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)},
	["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "Weapon", pos = Vector(-0.3, -4.5, -3), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)}
	}
	
	SWEP.PSO1AxisAlign = {right = 0, up = 0.4, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = -0.4, forward = 0}
	SWEP.M82AxisAlign = {right = .02, up = -.015, forward = 0}
	SWEP.M823AxisAlign = {right = .02, up = -.015, forward = 0}
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = .7, forward = .25, pitch = 0}
end

SWEP.MuzzleVelocity = 830

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = true
SWEP.CanRestOnObjects = true
--SWEP.AimBreathingEnabled = true

SWEP.Attachments = {[1] = {header = "Optic", offset = {850, -350}, atts = {"md_pso1"}},
[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_pbs1"}},
["+reload"] = {header = "Ammo", offset = {380, 180}, atts = {"am_atow_light", "am_atow_heavy", "am_atow_ap"}}}

SWEP.Animations = {fire = {"base_fire"},
	fire_aim = {"iron_fire"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	idle = "base_idle",
	draw = "base_ready"}
	
SWEP.SpeedDec = 50

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Born To Kill"

SWEP.Author			= "Khris"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/btk/v_nam_svd.mdl"
SWEP.WorldModel		= "models/btk/w_nam_svd.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/btk/w_nam_svd.mdl"
SWEP.WMPos = Vector(-2, 0.786, 0)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = true
SWEP.RVBPitchMod = .9
SWEP.RVBYawMod = .5
SWEP.RVBRollMod = .85

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x54MM"

SWEP.FireDelay = 60/300
SWEP.FireSound = "NAM_SVD_FIRE"
SWEP.FireSoundSuppressed = "NAM_SVD_FIRE_SUPPRESSED"
SWEP.Recoil = 1.4
SWEP.FOVPerShot = 0 -- = 1

SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 2.5
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 2
SWEP.Shots = 1
SWEP.Damage = 74
SWEP.DeployTime = 1.7
SWEP.HolsterTime = 0.8

SWEP.ADSFireAnim = true

SWEP.ReloadSpeed = 1.2
SWEP.ReloadTime = 2.55
SWEP.ReloadHalt = 3.2
SWEP.ReloadTime_Empty = 2.85
SWEP.ReloadHalt_Empty = 4.5

function SWEP:fireAnimFunc()
	clip = self:Clip1()
	cycle = 0
	rate = 1
	anim = "safe"
	prefix = ""
	suffix = ""
	
	if self:isAiming() then
		suffix = suffix .. "_aim"
		cycle = self.ironFireAnimStartCycle
	end
	
	self:sendWeaponAnim(prefix .. "fire" .. suffix, rate, cycle)
end //*/

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
