AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Mk 3A2"

local UO = ArcCW.UO

ENT.GrenadeRadius = 440
ENT.GrenadeDamage = 260
ENT.GrenadeDamageType = DMG_BLAST + DMG_SONIC
ENT.FuseTime = 4.5

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 45

ENT.Model = "models/uc_grenades/w_grenade.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.44
ENT.PhysElasticity = 0.1
ENT.PhysMaterial = "cardboard"

ENT.Scorch = true

function ENT:OnGrenadeSpawned()
    if self:GetBodygroupCount(0) > 1 then
        self:SetBodygroup(0, 1)
    end
end

function ENT:PostDetonation()
    local pos = self:GetPos()
    local attacker = self:GetAttacker()

    for _, ent in ipairs(ents.FindInSphere(pos, self.GrenadeRadius)) do
        if ent == self then continue end

        local delta = ent:WorldSpaceCenter() - pos
        local dist = delta:Length()
        local falloff = 1 - math.Clamp(dist / self.GrenadeRadius, 0, 1)
        if falloff <= 0 then continue end

        local dir = delta:GetNormalized() + Vector(0, 0, 0.5)
        dir:Normalize()

        if ent:IsPlayer() and ent:Alive() then
            ent:SetVelocity(dir * 500 * falloff)
            ent:SetDSP(35, false)
            ent:ViewPunch(AngleRand() * falloff * 4)
        elseif ent:IsNPC() or ent:IsNextBot() then
            if ent.SetSchedule and falloff > 0.35 then ent:SetSchedule(SCHED_FLINCH_PHYSICS) end
        else
            local phys = ent:GetPhysicsObject()
            if IsValid(phys) and phys:IsMoveable() then
                phys:ApplyForceCenter(dir * falloff * phys:GetMass() * 900)
            end
        end
    end

    UO.Shrapnel(self, attacker, 8, 0, 300)
end
