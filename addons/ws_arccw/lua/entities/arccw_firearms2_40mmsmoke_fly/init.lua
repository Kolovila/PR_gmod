AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local spd, ent

ENT.SmokeDuration = 19

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
	
	spd = physenv.GetPerformanceSettings()
    spd.MaxVelocity = 2996
	
    physenv.SetPerformanceSettings(spd) -- set grenade's max. speed to it's real life muzzle velocity
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 

function ENT:PhysicsCollide(data, physobj)
	ent = data.HitEntity
	
	//if IsValid(ent) and ent:Health() > 0 then
	//	ent:TakeDamage(30, self.Owner, self.Owner:GetActiveWeapon())
	//end

	local cloud = self

	timer.Simple( self.SmokeDuration, function() 
		SafeRemoveEntity( cloud )
		if self:IsValid() then self:StopParticles() end
		-- if self:IsValid() then self:Remove() end
	end )
	
	self:EmitSound("fas2/m18/smoke.wav", 90, 100, 1, CHAN_AUTO)
	ParticleEffect("smoke_grenade_smoke", self:GetPos(), Angle(0, 0, 0), nil)
	self:Remove()
end

function ENT:CreateParticles()
	self:EmitSound("fas2/m18/smoke.wav", 90, 100, 1, CHAN_AUTO)
	ParticleEffectAttach( "smoke_grenade_smoke", PATTACH_ABSORIGIN_FOLLOW, self, 0 )
end