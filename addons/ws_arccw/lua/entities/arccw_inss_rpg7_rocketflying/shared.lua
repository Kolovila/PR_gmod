ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "RPG-7 HEAT"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false

AddCSLuaFile()

ENT.Model = "models/weapons/projectiles/sandstorm_launcher_rpg_projectile.mdl"
ENT.FuseTime = 4.5

if SERVER then

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
		phys:Wake()
		phys:SetMass(1)
		phys:EnableDrag(false)
		phys:EnableGravity(false)
		phys:SetBuoyancyRatio(0)
    end

    self.SpawnTime = CurTime()
    self.motorsound = CreateSound( self, "rocket/rpg7_rocketsound.wav")
    self.motorsound:Play()

    timer.Simple(0.01, function()
		if IsValid(self) then
			self:SetDTInt(0, 0)
			vel = self:GetVelocity()

			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetMoveType(MOVETYPE_VPHYSICS)
			self:SetSolid(SOLID_VPHYSICS)
			self:SetCollisionGroup(COLLISION_GROUP_NPC)
			phys = self:GetPhysicsObject()

			if phys and phys:IsValid() then
				phys:Wake()
				phys:SetMass(5)
				phys:SetVelocity(vel)
			end

			self.motorsound:FadeOut(0.3)
		end
	end)
end

function ENT:OnRemove()
    self.motorsound:Stop()
end

function ENT:Think()
    if SERVER then
        ParticleEffectAttach( "m79_trail", PATTACH_ABSORIGIN_FOLLOW, self, 0 )
    end
end

end

function ENT:Detonate(isbody)
    if !self:IsValid() then return end
    local effectdata = EffectData()
        effectdata:SetOrigin( self:GetPos() )

    if self:WaterLevel() >= 1 then
        ParticleEffect("water_explosion_final", effectdata:GetOrigin(), Angle(0, 0, 0), nil)
        self:EmitSound("weapons/underwater_explode" .. math.random(3, 4) .. ".wav", 100, 100, 1, CHAN_AUTO)
    else
        ParticleEffect( isbody and "explosion_m79_body" or "explosion_he_grenade", effectdata:GetOrigin(), Angle(-90, 0, math.random(0, 360)), nil)
        self:EmitSound("rocket/rpg7_impact.wav", 100, 100, 1, CHAN_AUTO)
        self:EmitSound("rocket/rpg7_impact_distant.wav", 140, 100, 1, CHAN_WEAPON)
    end

    local attacker = self

    if self.Owner:IsValid() then
        attacker = self.Owner
    end

    util.BlastDamage(self, attacker, self:GetPos(), 300, 100)
    util.BlastDamage(self, attacker, self:GetPos(), 770, 75)

    self:Remove()
end

function ENT:PhysicsCollide(colData, collider)
    local collent = colData.HitEntity
    self:Detonate( IsValid(collent) and ( collent:IsPlayer() or collent:IsNPC() ) )
end

function ENT:Draw()
    self:DrawModel()
    cam.Start3D()
        render.SetMaterial( Material("effects/fas_glow_debris") )
        render.DrawSprite( self:GetPos(), math.random(100, 200), math.random(100, 200), Color(255, 225, 175) )
    cam.End3D()
end
