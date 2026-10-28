AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "arccw_ucex_projectile_base"
ENT.PrintName = "SMAW 83mm HEDP"
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/johnsheppard44/caliber/weapons/launchers/clbr_wpn_rl_pg-7l heat rocket (bg).mdl"

ENT.Drag = false
ENT.Gravity = true
ENT.Boost = 0
ENT.Lift = 0

ENT.FuseTime = 0.05
ENT.Damage = 150
ENT.Radius = 400
ENT.ImpactDamage = 1200

ENT.PenetrationDepth = 40

if SERVER then
    function ENT:FindBreakthrough(hitpos, dir)
        local step = 4
        local travelled = 0
        while travelled < self.PenetrationDepth do
            travelled = travelled + step
            local probe = hitpos + dir * travelled
            if !util.PointContents(probe) or bit.band(util.PointContents(probe), CONTENTS_SOLID) == 0 then
                return probe, travelled
            end
        end
        return nil
    end

    function ENT:Detonate()
        if !self:IsValid() or self.Defused then return end

        local origin = self:GetPos()
        local dir = (self.HitVelocity or self:GetVelocity())
        dir:Normalize()

        local through, depth = self:FindBreakthrough(origin, dir)
        if through then
            origin = through
            self:SetPos(origin)
            self:EmitSound("uc_smaw/mech2.wav", 90, 70, 1, CHAN_AUTO)
        end

        local effectdata = EffectData()
        effectdata:SetOrigin(origin)

        if self:WaterLevel() > 0 then
            util.Effect("WaterSurfaceExplosion", effectdata)
        else
            util.Effect("Explosion", effectdata)
            ParticleEffect("ucex_generic_explosion1", origin, Angle(0, 0, 0), nil)
        end

        local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self

        util.BlastDamage(self, attacker, origin, self.Radius * 0.4, self.DamageOverride or self.Damage)
        util.BlastDamage(self, attacker, origin, self.Radius, (self.DamageOverride or self.Damage) * 0.45)

        util.Decal("Scorch", origin - dir * 8, origin + dir * 32, self)

        self.Defused = true
        self:Remove()
    end
end
