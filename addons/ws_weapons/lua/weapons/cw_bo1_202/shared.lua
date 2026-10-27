AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

CustomizableWeaponry:registerAmmo("M202 Round", "M202 Rounds", 5, 24)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.CrosshairEnabled = false
	SWEP.PrintName = "M202 FLASH"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "w"
	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
	SWEP.OverallMouseSens = 0.7
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = true
	SWEP.NoShells = true
	
--	SWEP.DryFire = true
--	SWEP.ViewbobEnabled = true
--	SWEP.ViewbobIntensity = 1
--	SWEP.ReloadViewBobEnabled = true

	SWEP.ZoomAmount = 5	
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_bo1_m202.mdl"
	SWEP.WMPos = Vector(-0.9, -7, 2)
	SWEP.WMAng = Vector(-10, 0, 180)
		
    SWEP.IronsightPos = Vector(-1.481, -2.09, -2.435)
	SWEP.IronsightAng = Vector(10.699, 1.299, 0)

	SWEP.LaserPosAdjust = Vector(0, -4, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 
	
	SWEP.SprintPos = Vector(1.692, 0, 0)
	SWEP.SprintAng = Vector(-7.456, 16.545, 0)
	
	SWEP.CustomizePos = Vector(7.839, 0.402, -2.412)
	SWEP.CustomizeAng = Vector(23.215, 46.431, 21.809)
	
--  SWEP.SwimPos = Vector(0, 0, -0.484)
--  SWEP.SwimAng = Vector(-58.392, -26.233, 0)

    SWEP.SwimAPos = Vector(0, 0, -0.504)
    SWEP.SwimAng = Vector(-46.432, -27.112, 0)
	
	SWEP.AlternativePos = Vector(-0.32, 0, -0.64)
	SWEP.AlternativeAng = Vector(0, 0, 0)
  
--	SWEP.CustomizationMenuScale = 0.01
--	SWEP.BoltBonePositionRecoverySpeed = 20 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
end

SWEP.LuaViewmodelRecoil = false
SWEP.FullAimViewmodelRecoil = true
SWEP.AimBreathingEnabled = true
SWEP.CanRestOnObjects = false
SWEP.ADSFireAnim = true

SWEP.AttachmentModelsVM = {}
SWEP.Attachments = {}

SWEP.Animations = {fire = "fire",
	reload = "reload_tac",
	idle = "idle",
	draw = "draw"}
	
	SWEP.Sounds = {
	draw = {
	{time = 0.0, sound = "CW_FOLEY_MEDIUM"},
	{time = 0.7, sound = "M202_SIGHT"}},
	
	reload_tac = {
	[1] = {time = 0.2, sound = "M202_CLOTH1"},
	[2] = {time = 0.22, sound = "M202_SIGHT"},
	[3] = {time = 1.3, sound = "M202_OUT"},
	[4] = {time = 1.4, sound = "M202_CLOTH3"},
	[5] = {time = 1.5, sound = "M202_HIT_GROUND"},
	[6] = {time = 2.85, sound = "M202_IN1"},
	[7] = {time = 2.90, sound = "M202_CLOTH2"},
	[8] = {time = 3.35, sound = "M202_IN2"},
	[9] = {time = 4.7, sound = "M202_CLOTH4"},
	[10] = {time = 4.8, sound = "M202_SIGHT"}}}
	
SWEP.AimViewModelFOV = 70
SWEP.SpeedDec = 70

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Yan's Guns"

SWEP.Author			= "Xxyan700xX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_bo1_m202.mdl"
SWEP.WorldModel		= "models/weapons/w_bo1_m202.mdl"
SWEP.UseHands       = true
SWEP.FOVPerShot = 20

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 4
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "M202 Round"
SWEP.UseHands = true

SWEP.FireDelay = 0.5
SWEP.FireSound = "M202_FIRE"
SWEP.Recoil = 4.5

SWEP.HipSpread = 0.15
SWEP.AimSpread = 0.05
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.15
SWEP.SpreadPerShot = 0.0
SWEP.SpreadCooldown = 0.001
SWEP.Shots = 1
SWEP.Damage = 2500
SWEP.DeployTime = 1
SWEP.Chamberable = false

SWEP.ReloadSpeed = 0.85
SWEP.ReloadTime = 5.5
SWEP.ReloadHalt = 5.5

SWEP.ReloadTime_Empty = 5.5
SWEP.ReloadHalt_Empty = 5.5
SWEP.SnapToIdlePostReload = false

local isAiming

if CLIENT then
	function SWEP:enteredAim()
		return self._KK_DODS_wasAiming == false and self:isAiming()
	end
	
	function SWEP:leftAim()
		return self._KK_DODS_wasAiming == true and not self:isAiming()
	end
	
	function SWEP:IndividualThink_DODS()
		if self:enteredAim() then
			self:playAnim("aim_enter", 0, 0)
		end
			
		if self:leftAim() then
			self:playAnim("aim_leave", 0, 0)
		end
		
		self._KK_DODS_wasAiming = self:isAiming()
	end
end

function SWEP:PrimaryAttack()
	if not self:isAiming() or self.AimTime + 0.0 > CurTime() then return end
	
	weapons.GetStored("cw_base").PrimaryAttack(self)
end

function SWEP:SecondaryAttack()
	weapons.GetStored("cw_base").SecondaryAttack(self)
end

function SWEP:Reload()
	if self:isAiming() then return end
	
	weapons.GetStored("cw_base").Reload(self)
end

function SWEP:FireBullet()
	if SERVER then
		ParticleEffect("", self:GetPos(), Angle(0, 0, 0), self)
		
		CustomizableWeaponry.actionSequence.new(self, 0.0, nil, function()
			local pos = self.Owner:GetShootPos()
			local eyeAng = self.Owner:EyeAngles()
			
			local fwdAng = eyeAng
			fwdAng:RotateAroundAxis(fwdAng:Right(), 0)
			local forward = fwdAng:Forward()
			
		    local offset = forward * 60 + eyeAng:Right() * 5 - eyeAng:Up() * 2
			
		    if SERVER and not self.ActiveAttachments.ins2_atow_hvrocket and not self.ActiveAttachments.ins2_atow_herocket and not self.ActiveAttachments.ins2_atow_hvatrocket and not self.ActiveAttachments.ins2_atow_dudrocket then
		        missile = ents.Create("ent_ins2rpghvrocket_m202")
		        missile:SetPos(pos + offset)
		        missile:SetAngles(eyeAng)
		        missile:Spawn()
		        missile:Activate()
		        missile:SetOwner(self.Owner)
		        local phys = missile:GetPhysicsObject()
		
	            if IsValid(phys) then
		            missile:SetVelocity(forward * 3400)
	            end

			end
		end)
	end
end
