AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "No. 69"

local UO = ArcCW.UO

ENT.GrenadeRadius = 430
ENT.GrenadeDamage = 240
ENT.GrenadeDamageType = DMG_BLAST + DMG_SONIC
ENT.FuseTime = 6

ENT.ImpactFuse = true
ENT.ImpactFuseSpeed = 100
ENT.ArmTime = 0.95

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 40

ENT.Model = "models/weapons/arc9_doi/w_no69.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.38
ENT.PhysElasticity = 0.05
ENT.PhysMaterial = "plastic"

ENT.ExplosionSounds = UO.Sound({"weapons/mk2/mk2_detonate_01.wav", "weapons/mk2/mk2_detonate_02.wav", "weapons/mk2/mk2_detonate_03.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/mk2/mk2_detonate_dist_01.wav", "weapons/mk2/mk2_detonate_dist_02.wav", "weapons/mk2/mk2_detonate_dist_03.wav"}, UO.Snd.ExplosionIn)

ENT.BounceSounds = false

local bounce = UO.Sound({"weapons/no69/no69_bounce_01.wav", "weapons/no69/no69_bounce_02.wav", "weapons/mk2/mk2_bounce_03.wav", "weapons/mk2/mk2_bounce_04.wav"}, UO.Snd.BounceSoft)

function ENT:OnGrenadeCollide(data, physobj)
    if data.Speed < 35 then return end
    if CurTime() < (self.NextBounce or 0) then return end

    self.NextBounce = CurTime() + 0.08
    self:EmitSound(UO.PickSound(bounce), 66, math.random(98, 110))
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
            ent:SetVelocity(dir * 420 * falloff)
            ent:SetDSP(35, false)
            ent:ViewPunch(AngleRand() * falloff * 3.5)
        elseif ent:IsNPC() or ent:IsNextBot() then
            if ent.SetSchedule and falloff > 0.35 then ent:SetSchedule(SCHED_FLINCH_PHYSICS) end
        else
            local phys = ent:GetPhysicsObject()
            if IsValid(phys) and phys:IsMoveable() then
                phys:ApplyForceCenter(dir * falloff * phys:GetMass() * 700)
            end
        end
    end

    UO.Shrapnel(self, attacker, 6, 0, 250)
end
