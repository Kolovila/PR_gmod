ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "M72 Law Round"
ENT.Author = "Aron"
ENT.Information = "m72"
ENT.Spawnable = false
ENT.AdminSpawnable = false 

ENT.BlastDamage = 500
ENT.BlastRadius = 500

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/weapons/w_missile_launch.mdl") 
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		
		local phys = self:GetPhysicsObject()

		if phys and phys:IsValid() then
			phys:Wake()
		end

		self:GetPhysicsObject():SetBuoyancyRatio(1)

		spd = physenv.GetPerformanceSettings()
		spd.MaxVelocity = 15000

		physenv.SetPerformanceSettings(spd)
	else
		self.Emitter = ParticleEmitter(self:GetPos())
		self.LunchTime = CurTime()
	end
end
