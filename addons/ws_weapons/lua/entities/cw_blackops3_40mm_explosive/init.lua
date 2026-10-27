AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.BlastDamage = 100
ENT.BlastRadius = 384

function ENT:Initialize()
	self:SetModel("models/Items/AR2_Grenade.mdl") 
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	local phys = self:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
	end
	
	self:GetPhysicsObject():SetBuoyancyRatio(0)
	self.ArmTime = CurTime() + 0.2
	
	spd = physenv.GetPerformanceSettings()
    spd.MaxVelocity = 2996
	
    physenv.SetPerformanceSettings(spd)
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 

local vel, len

function ENT:PhysicsCollide(data, physobj)
	if self.dt.Misfire then
		vel = physobj:GetVelocity()
		len = vel:Length()
		
		if len > 500 then
			physobj:SetVelocity(vel * 0.6)
		end
	
		return
	end
	
	if CurTime() > self.ArmTime then
		util.BlastDamage(self, self:GetOwner(), self:GetPos(), self.BlastRadius, self.BlastDamage)
		local ef = EffectData()
		ef:SetOrigin(self:GetPos())
		ef:SetMagnitude(1)
		util.Effect("Explosion", ef)
		ParticleEffect("explosion_m79", self:GetPos(), Angle(-90, 0, math.random(0, 360)), nil)
		if CLIENT then
			local dlight = DynamicLight(self:EntIndex())
			dlight.r = 255 
			dlight.g = 218
			dlight.b = 74
			-- dlight.style = math.pow(6,math.random(0,1))
			dlight.Brightness = 2
			dlight.Pos = self:GetPos()
			dlight.Size = 512
			dlight.Decay = 2000
			dlight.DieTime = CurTime() + FrameTime()
		end
		self:EmitSound("weapons/explosive_m79/m79_explode1.wav", 120, math.random(95, 105))
		self:Remove()
	else
		self:EmitSound("physics/metal/metal_grenade_impact_hard" .. math.random(1, 3) .. ".wav", 80, 100)
		self.dt.Misfire = true
		SafeRemoveEntityDelayed(self, 10)
		
		vel = physobj:GetVelocity()
		len = vel:Length()
		
		if len > 500 then
			physobj:SetVelocity(vel * 0.6)
		end
	end
end
