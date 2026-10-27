AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

		--SWEP.magType = "NONE"

CustomizableWeaponry:registerAmmo(".38 Special", ".38 S&W Special", 10.9, 32.6)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = ".38 Colt Detective Special"
	SWEP.CSMuzzleFlashes = true
	SWEP.UseHands = true
	
	SWEP.HUD_MagText = "CYLINDER: "
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_sw1917")
	killicon.Add( "det_38", "vgui/inventory/weapon_sw1917", Color(255, 0, 0, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.SightWithRail = true
	
	SWEP.EffectiveRange_Orig = 130 * 39.37
	SWEP.DamageFallOff_Orig = .62
	
	SWEP.Shell = "smallshell"
	SWEP.ShellScale = .425
	SWEP.NoShells = true
	
	SWEP.ForegripOverridePos = {
	["bipod"] = {
	["A_Muzzle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(180, 0, 0) }},
}

	SWEP.IronsightPos = Vector(-5.655, 0, 3.68)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.AltIronPos = Vector(-2.769, -1, 1.20)
	SWEP.AltIronAng = Vector(-1.3, 0.035, 4.4)
	
	SWEP.SprintPos = Vector(0, -6, -4)
	SWEP.SprintAng = Vector(40, -2, 0)
	
	SWEP.CustomizePos = Vector(10, -5, .5)
	SWEP.CustomizeAng = Vector(15, 45, 20)

	SWEP.AlternativePos = Vector(-.8, 0, -0.3)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.SwimPos = Vector(0.5, -2.1053, -0.5)
	SWEP.SwimAng = Vector(-50.8947, -3.7895, -46.5263)
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = .8
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.LuaVMRecoilAxisMod = {vert = 1, hor = .25, roll = 4, forward = 1, pitch = .5}
	SWEP.CustomizationMenuScale = 0.016 --  0.017
	
	SWEP.AttachmentModelsVM = {
	}
	

end

SWEP.LuaViewmodelRecoil = true
SWEP.LuaViewmodelRecoilOverride = true
SWEP.FullAimViewmodelRecoil = true

SWEP.MuzzleVelocity = 250

SWEP.Attachments = {["+reload"] = {header = "Ammo", offset = {350, -150}, atts = {"am_atow_heavy", "am_atow_light", "am_atow_riot"}}}

SWEP.Animations = {fire = {"fire1"},
	reload = "reload",
	idle = {"idle1" , "idle2", "idle3"},
	draw = "draw"}

SWEP.Sounds = {draw = {{time = 0, sound = "INS2SHARED_DRAW"}},

	reload = {{time = 6/40, sound = "DET_OPEN"},
		{time = 20/40, sound = "DET_SHELLOUT"},
		{time = 54/40, sound = "DET_SHELLIN"},
		{time = 61/40, sound = "DET_SPEEDLOADER"},
		{time = 77/40, sound = "DET_CLOSE"}}}
		
SWEP.ReloadViewBobEnabled = true

SWEP.SpeedDec = 5

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"double"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"

SWEP.Author			= "doni"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""
SWEP.NearWallEnabled = false

SWEP.ViewModelFOV	= 90
SWEP.AimViewModelFOV = 65
SWEP.ZoomAmount = 5
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/svencoop/th/c_th_38.mdl"
SWEP.WorldModel		= "models/weapons/svencoop/th/w_th_38.mdl"

SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/svencoop/th/w_th_38.mdl"
SWEP.WMPos = Vector(-1.4, 4, 2.95)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.ReloadViewBobEnabled = true
--SWEP.RVBPitchMod = .9
--SWEP.RVBYawMod = .7
--SWEP.RVBRollMod = 1

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 36
SWEP.Primary.Automatic		= false
SWEP.Chamberable			= false
SWEP.Primary.Ammo			= ".38 Special"

SWEP.FireDelay = 60/120
SWEP.FireSound = "DET_FIRE"
SWEP.Recoil = 1.3
SWEP.FOVPerShot = 0.25 -- = .5

SWEP.HipSpread = 0.07
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = .35
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread_Orig = nil
SWEP.ClumpSpread = nil
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.58
SWEP.Shots = 1
SWEP.Damage = 38
SWEP.DeployTime = .375
SWEP.HolsterTime = .35

SWEP.ADSFireAnim = true
SWEP.ShootWhileProne = true
SWEP.HolsterOnLadder = false
SWEP.SprintingEnabled = true

SWEP.ReloadSpeed = 1.5
SWEP.ReloadTime = 2.2
SWEP.ReloadHalt = 5.2
SWEP.ReloadTime_Empty = 2.2
SWEP.ReloadHalt_Empty = 4.5

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
