AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "DM51A1"

local UO = ArcCW.UO

ENT.GrenadeRadius = 480
ENT.GrenadeDamage = 215
ENT.GrenadeDamageType = DMG_BLAST + DMG_SONIC
ENT.FuseTime = 4

ENT.FuseVariance = 0

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 36

ENT.Model = "models/weapons/w_ins2_dm51_remake_casgirl_2.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.ArmedModel = "models/weapons/w_ins2_dm51_remake_casgirl_activated_2.mdl"

ENT.PhysMass = 0.24
ENT.PhysElasticity = 0.28
ENT.PhysMaterial = "plastic"

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
        local pos = self:GetPos()
        local attacker = self:GetAttacker()

        for _, ent in ipairs(ents.FindInSphere(pos, self.GrenadeRadius)) do
            if ent == self then continue end

            local delta = ent:WorldSpaceCenter() - pos
            local falloff = 1 - math.Clamp(delta:Length() / self.GrenadeRadius, 0, 1)
            if falloff <= 0 then continue end

            local dir = delta:GetNormalized() + Vector(0, 0, 0.4)
            dir:Normalize()

            if ent:IsPlayer() and ent:Alive() then
                ent:SetVelocity(dir * 380 * falloff)
                ent:SetDSP(35, false)
                ent:ViewPunch(AngleRand() * falloff * 3)
            elseif ent:IsNPC() or ent:IsNextBot() then
                if ent.SetSchedule and falloff > 0.4 then ent:SetSchedule(SCHED_FLINCH_PHYSICS) end
            else
                local phys = ent:GetPhysicsObject()
                if IsValid(phys) and phys:IsMoveable() then
                    phys:ApplyForceCenter(dir * falloff * phys:GetMass() * 650)
                end
            end
        end

        UO.Shrapnel(self, attacker, 6, 0, 220)
    end

end
