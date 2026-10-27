AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")



if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M202"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "w"
	killicon.Add( "cw_aron_bo_m202", "aron_icons/m202", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("aron_icons/m202")
	
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = true
	SWEP.DryFire = true
	SWEP.ViewbobEnabled = true
	SWEP.ViewbobIntensity = 1
	SWEP.ZoomAmount = 6	
	SWEP.ReloadViewBobEnabled = true
	SWEP.CanCustomize = true
	
	SWEP.Shell = ""
	SWEP.ShellScale = 0
	SWEP.ShellOffsetMul = 0
	SWEP.ShellPosOffset = {x = 0, y = 1, z = 1}
	SWEP.MuzzlePosOffset = {x = -10, y = 0, z = 0}
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/my_black_ops_weapons/m202/w_aron_m202.mdl"
	SWEP.WMPos = Vector(-16, -2, 2.5)
	SWEP.WMAng = Vector(-12, 90, 180)

		
    SWEP.IronsightPos = Vector(-1.721, -2.8, -2.411)
	SWEP.IronsightAng = Vector(10.777, 0, 0)

	SWEP.LaserPosAdjust = Vector(0, -4, 0)
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 
	
	SWEP.SprintPos = Vector(3.417, 4.421, -2.01)
	SWEP.SprintAng = Vector(-12.664, 30.25, 0)
	
	SWEP.CustomizePos = Vector(3.825, -6.685, 0.344)
	SWEP.CustomizeAng = Vector(18.716, 41.417, 10.024)
	
	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	
	SWEP.MoveType = 1
	SWEP.ViewModelMovementScale = 1
  
	SWEP.CustomizationMenuScale = 0.022
	SWEP.BoltBonePositionRecoverySpeed = 20 -- how fast does the bolt bone move back into it's initial position after the weapon has fired
	
	

end
SWEP.LuaViewmodelRecoil = false
SWEP.CanRestOnObjects = true
SWEP.ADSFireAnim = true

SWEP.AttachmentModelsVM = 	{
}

SWEP.Attachments = {[1] = {header = "Hands", offset = {-400,-400}, atts = {"bo_hand_macvsog"}}}

SWEP.Animations = {fire = "shoot1",
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
	
	SWEP.Sounds = {
	
	reload = {[1] = {time = 0.4, sound = "my_weapons/bo_m202/m202_sights.wav"},
	[2] = {time = 1.2, sound = "my_weapons/bo_generic3.wav"},
	[3] = {time = 2, sound = "my_weapons/bo_m202/m202_magout.wav"},
	[4] = {time = 2.4, sound = "my_weapons/bo_m202/m202_start.wav"},
	[5] = {time = 3.2, sound = "my_weapons/bo_generic4.wav"},
	[6] = {time = 4.3, sound = "my_weapons/bo_generic1.wav"},
	[7] = {time = 5.2, sound = "my_weapons/bo_m202/m202_tap.wav"},
	[8] = {time = 6.3, sound = "my_weapons/bo_generic3.wav"},
	[9] = {time = 7.55, sound = "my_weapons/bo_m202/m202_sights.wav"}},
	
	
	draw = {{time = 0.2, sound = "my_weapons/bo_generic1.wav"},
	{time = 1, sound = "my_weapons/bo_m202/m202_sights.wav"}}}
	
SWEP.AimViewModelFOV = 70
SWEP.SpeedDec = 0

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "[CW2.0] Cold War"
SWEP.SuppressedOnEquip = false


SWEP.Author			= "Doni Danger"
SWEP.Contact		= "youtube, or steam"
SWEP.Purpose		= "macVsog"
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/my_black_ops_weapons/m202/v_blackops1_m202.mdl"
SWEP.WorldModel		= "models/my_black_ops_weapons/m202/w_aron_m202.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 4
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "rpg_round"

SWEP.FireDelay = 0.7
SWEP.FireSound = "ARON_M72_FIRE"
SWEP.FireSoundSuppressed = "ARON_M72_FIRE"
SWEP.Recoil = 7


SWEP.HipSpread = 0.15
SWEP.AimSpread = 0.0
SWEP.VelocitySensitivity = 0.9
SWEP.MaxSpreadInc = 0.15
SWEP.SpreadPerShot = 0.0
SWEP.SpreadCooldown = 0.001
SWEP.Shots = 1
SWEP.Damage = 300
SWEP.DeployTime = 2.8
SWEP.Chamberable = false

SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 9.5
SWEP.ReloadHalt = 9.5

SWEP.ReloadTime_Empty = 9.5
SWEP.ReloadHalt_Empty = 9.5
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
