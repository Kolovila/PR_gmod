AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "DM51"

local UO = ArcCW.UO

ENT.GrenadeRadius = 600
ENT.GrenadeDamage = 165
ENT.FuseTime = 4

ENT.FuseVariance = 0

ENT.ExplosionParticle = UO.Particles.HE

ENT.Model = "models/weapons/w_ins2_dm51_remake_casgirl.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.ArmedModel = "models/weapons/w_ins2_dm51_remake_casgirl_activated_1.mdl"

ENT.PhysMass = 0.45
ENT.PhysElasticity = 0.14

ENT.ExplosionSounds = UO.Sound({"weapons/mk2/mk2_detonate_01.wav", "weapons/mk2/mk2_detonate_02.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/mk2/mk2_detonate_dist_01.wav", "weapons/mk2/mk2_detonate_dist_02.wav"}, UO.Snd.ExplosionIn)

if SERVER then

    function ENT:OnArmed()
        if !self.ArmedModel or !util.IsValidModel(self.ArmedModel) then return end

        local phys = self:GetPhysicsObject()
        local vel = IsValid(phys) and phys:GetVelocity() or vector_origin

        self:SetModel(self.ArmedModel)

        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)

        phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:SetMaterial(self.PhysMaterial)
            if self.PhysMass then phys:SetMass(self.PhysMass) end
            phys:SetVelocity(vel)
            phys:Wake()
        else
            self:PhysicsInitSphere(2, self.PhysMaterial)
        end
    end

    function ENT:PostDetonation()
        local attacker = self:GetAttacker()

        UO.Shrapnel(self, attacker, 34, 13, 900)
        UO.Shrapnel(self, attacker, 22, 13, 900, vector_up, 1.5)
        UO.Shrapnel(self, attacker, 22, 13, 900, -vector_up, 1.5)
    end

end
