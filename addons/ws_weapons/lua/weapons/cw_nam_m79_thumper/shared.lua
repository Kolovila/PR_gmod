AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

CustomizableWeaponry:registerAmmo("40MM", "40MM Rounds", 40, 40)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M79 Smoke"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.25
	SWEP.MoveType = 1
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_nam_m79")
	killicon.Add( "cw_40mm_smoke", "vgui/inventory/weapon_nam_m79", Color(255, 0, 0, 0))
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = true
	SWEP.DryFire = true
	SWEP.ViewbobEnabled = true
	SWEP.ViewbobIntensity = 1
	SWEP.ZoomAmount = 5	
	SWEP.ReloadViewBobEnabled = true
	SWEP.CanCustomize = false
	
	SWEP.Noshells = true
--	SWEP.Shell = ""
--	SWEP.ShellScale = 0
--	SWEP.ShellOffsetMul = 0
--	SWEP.ShellPosOffset = {x = 0, y = 1, z = 1}
	SWEP.MuzzlePosOffset = {x = -10, y = 0, z = 0}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_m79.mdl"
	SWEP.WMPos = Vector(-1, 4.2, 1)
	SWEP.WMAng = Vector(-15, 0, 180)

	SWEP.IronsightPos = Vector(-2.2518, -2, -1.4316)
	SWEP.IronsightAng = Vector(7.531, 0.0067, 0)
	
--	SWEP.IronSightsPos = Vector(-3.461, 0, 0.671)
--  SWEP.IronSightsAng = Vector(-3.389, -0.02, 0)

	SWEP.LaserPosAdjust = Vector(0, -4, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 
	
	SWEP.SprintPos = Vector(7.775, -2.221, -0.511)
	SWEP.SprintAng = Vector(-6.4, 40, 0)

	SWEP.CustomizePos = Vector(7.839, 0.402, -2.412)
	SWEP.CustomizeAng = Vector(23.215, 46.431, 21.809)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.026 --  0.03
	
--  SWEP.md_iron200MPos = Vector(-3.461, 0, 0.671)
--  SWEP.md_iron200MPos = Vector(-3.389, -0.02, 0)
  
--	SWEP.CustomizationMenuScale = 0.01
--	SWEP.BoltBonePositionRecoverySpeed = 20 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
--  SWEP.BackupSights = {["md_Ironsight"] = {[1] = Vector(-3.461, 0, 0.671), [2] = Vector(-3.389, -0.02, 0)}}
end

SWEP.SlingBGs = {main = 2, off = 0, on = 1}

SWEP.ADSFireAnim = true
SWEP.LuaViewmodelRecoil = false
SWEP.CanRestOnObjects = false

SWEP.AttachmentModelsVM = {}

SWEP.Attachments = {}

SWEP.Animations = {fire = {"base_fire"},
	reload = {"base_reload", "base_reload2", "base_reload3"},
	idle = "base_idle",
	draw = "base_draw"}
	
SWEP.AimViewModelFOV = 70
SWEP.SpeedDec = 20

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"break"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Born To Kill"
SWEP.SuppressedOnEquip = false

SWEP.Author			= "dongi"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_nam_m79.mdl"
SWEP.WorldModel		= "models/weapons/w_m79.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 32
SWEP.Primary.Ammo			= "40MM"
SWEP.Primary.Automatic		= false

SWEP.FireDelay = 0.5
SWEP.FireSound = "NAM_M79_FIRE"
SWEP.Recoil = 2.2

SWEP.HipSpread = 0.082
SWEP.AimSpread = 0.015
SWEP.VelocitySensitivity = 1
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.03
SWEP.SpreadCooldown = 0.2
SWEP.ClumpSpread = 0.015
SWEP.Shots = 1
SWEP.Damage = 4500
SWEP.DeployTime = 0.8

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 3.2
SWEP.ReloadHalt = 4.6
SWEP.ReloadTime_Empty = 3.2
SWEP.ReloadHalt_Empty = 4.6
SWEP.SnapToIdlePostReload = false

SWEP.ShotgunReload = false
SWEP.Chamberable = false

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

function SWEP:FireBullet()
	if SERVER then
		
		CustomizableWeaponry.actionSequence.new(self, 0, nil, function()
			local pos = self.Owner:GetShootPos()
			local eyeAng = self.Owner:EyeAngles()
			
			local fwdAng = eyeAng
			fwdAng:RotateAroundAxis(fwdAng:Right(), 0)
			local forward = fwdAng:Forward()
			
			local offset = eyeAng:Right() * 0 - eyeAng:Up() * 0
			
			local nade = ents.Create("cw_40mm_smoke")
			nade:SetPos(pos + offset)
			nade:SetAngles(fwdAng)
			nade:Spawn()
			nade:Activate()
			nade:SetOwner(self.Owner)
			
			local phys = nade:GetPhysicsObject()
			
			if IsValid(phys) then
				phys:SetVelocity(forward * 3100)
			end
		end)
	end
end
