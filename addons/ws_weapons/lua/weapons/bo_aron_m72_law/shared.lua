AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M72 LAW"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "w"
	killicon.Add( "cw_aron_bo_m72", "aron_icons/m72", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("aron_icons/m72")
	
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.DryFire = true
	SWEP.ViewbobEnabled = true
	SWEP.ViewbobIntensity = 1
	SWEP.ZoomAmount = 5	
	SWEP.ReloadViewBobEnabled = true
	SWEP.CanCustomize = false
	
	SWEP.Shell = ""
	SWEP.ShellScale = 0
	SWEP.ShellOffsetMul = 0
	SWEP.ShellPosOffset = {x = 0, y = 1, z = 1}
	SWEP.MuzzlePosOffset = {x = -10, y = 0, z = 0}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/my_black_ops_weapons/m72_law/w_aron_m72law.mdl"
	SWEP.WMPos = Vector(-0.9, 1, 1)
	SWEP.WMAng = Vector(-10, 0, 180)

		
    SWEP.IronsightPos = Vector(-3.228, -0.603, -3.05)
	SWEP.IronsightAng = Vector(11.96, 0, 0)

	SWEP.LaserPosAdjust = Vector(0, -4, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 
	
	SWEP.SprintPos = Vector(3.417, 4.421, -2.01)
	SWEP.SprintAng = Vector(-12.664, 30.25, 0)
	
	SWEP.CustomizePos = Vector(7.839, 0.402, -2.412)
	SWEP.CustomizeAng = Vector(23.215, 46.431, 21.809)
	
	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1.5
  
	SWEP.CustomizationMenuScale = 0.01
	SWEP.BoltBonePositionRecoverySpeed = 20 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	

end
SWEP.LuaViewmodelRecoil = false
SWEP.CanRestOnObjects = false
SWEP.ADSFireAnim = true

SWEP.AttachmentModelsVM = {
}

SWEP.Attachments = {
}

SWEP.Attachments = {}


SWEP.Animations = {fire = "fire",
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
	
	SWEP.Sounds = {
	
	reload = {[1] = {time = 0.2, sound = "my_weapons/bo_m72_law/m72_law_tap.wav"},
	[2] = {time = 0.8, sound = "my_weapons/bo_m72_law/m72_law_tap.wav"},
	[3] = {time = 1.0, sound = "my_weapons/bo_m72_law/foly_generic_gun_drop01.wav", "my_weapons/bo_m72_law/foly_generic_gun_drop02.wav"},
	[4] = {time = 1.9, sound = "my_weapons/bo_m72_law/m72_law_tap.wav"}},
	
	draw = {{time = 0.0, sound = "my_weapons/bo_generic2.wav"},
	{time = 0.6, sound = "my_weapons/bo_m72_law/m72_law_arm.wav"},
	{time = 1.3, sound = "my_weapons/bo_m72_law/m72_law_open.mp3"},
	{time = 1.7, sound = "my_weapons/bo_m72_law/m72_law_tap.wav"}}}
	
SWEP.AimViewModelFOV = 70
SWEP.SpeedDec = 0

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Vietnam"
SWEP.SuppressedOnEquip = false


SWEP.Author			= "Doni Danger"
SWEP.Contact		= "Google.com"
SWEP.Purpose		= "Take out that fucking tank,Mason!"
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/my_black_ops_weapons/m72_law/fix/v_aron_m72law.mdl"
SWEP.WorldModel		= "models/my_black_ops_weapons/m72_law/w_aron_m72law.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 5
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "rpg_round"

SWEP.FireDelay = 0.5
SWEP.FireSound = "ARON_M72_FIRE"
SWEP.FireSoundSuppressed = "ARON_M72_FIRE2"
SWEP.Recoil = 5


SWEP.HipSpread = 0.15
SWEP.AimSpread = 0.0
SWEP.VelocitySensitivity = 0.9
SWEP.MaxSpreadInc = 0.15
SWEP.SpreadPerShot = 0.0
SWEP.SpreadCooldown = 0.001
SWEP.Shots = 1
SWEP.Damage = 1500
SWEP.DeployTime = 2.4
SWEP.Chamberable = false

SWEP.ReloadSpeed = 0.7
SWEP.ReloadTime = 2.4
SWEP.ReloadHalt = 2.4

SWEP.ReloadTime_Empty = 2.4
SWEP.ReloadHalt_Empty = 2.4
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
			
			local offset = eyeAng:Right() * 0 - eyeAng:Up() * 0
			
			local nade = ents.Create("cw_aron_m72_round")
			nade:SetPos(pos + offset)
			nade:SetAngles(fwdAng)
			nade:Spawn()
			nade:Activate()
			nade:SetOwner(self.Owner)
			
			local phys = nade:GetPhysicsObject()
			
			if IsValid(phys) then
				phys:SetVelocity(forward * 16000)
			end
		end)
	end
end

if CLIENT then
	function SWEP:CreateMuzzle()
		if IsValid(self.WMEnt) then
			local att = self.WMEnt:GetAttachment(1)
			local pos = att.Pos
			local ang = att.Ang
			
			ang:RotateAroundAxis(ang:Right(), 0)

			ParticleEffect("muzzleflash_M3", pos, ang, self.WMEnt)
			ParticleEffect("muzzleflash_M3", pos, ang, self.WMEnt)
			ParticleEffect("muzzleflash_M3", pos, ang, self.WMEnt)
			
			local dlight = DynamicLight(self:EntIndex())
			dlight.r = 255 
			dlight.g = 218
			dlight.b = 74
			dlight.Brightness = 4
			dlight.Pos = pos
			dlight.Size = 128
			dlight.Decay = 128
			dlight.DieTime = CurTime() + FrameTime()
		end
		
		if self.Owner:ShouldDrawLocalPlayer() then
			return
		end

		vm = self.CW_VM
		
		if IsValid(vm) then
			vm:StopParticles()

			muz = vm:LookupAttachment(self.MuzzleAttachmentName)
			
			if muz then
				muz2 = vm:GetAttachment(muz)
				
				if muz2 then
					EA = EyeAngles()
					
					local pos = muz2.Pos
					local ang = EA
					
					if self.MuzzleEffect then
						if (self.dt.State == CW_AIMING and self.SimulateCenterMuzzle) or (self.dt.State == CW_AIMING and self:canUseSimpleTelescopics()) then
							ParticleEffect(self.MuzzleEffect, pos + self.Owner:GetVelocity() * 0.03 + EA:Forward() * 70 - EA:Up() * 3, EA, vm)
						else
							if self.PosBasedMuz then
								ParticleEffect(self.MuzzleEffect, pos + self.Owner:GetVelocity() * 0.03, EA, vm)
							else
								ParticleEffectAttach(self.MuzzleEffect, PATTACH_POINT_FOLLOW, vm, muz)
							end
						end
					end
					
					dlight = DynamicLight(self:EntIndex())
					
					dlight.r = 255 
					dlight.g = 218
					dlight.b = 74
					dlight.Brightness = 4
					dlight.Pos = pos + self.Owner:GetAimVector() * 3
					dlight.Size = 96
					dlight.Decay = 128
					dlight.DieTime = CurTime() + FrameTime()
				end
			end
		end
	end
	
end
