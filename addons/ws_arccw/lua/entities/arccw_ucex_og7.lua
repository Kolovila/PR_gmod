AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "OG7"

ENT.GrenadeDamage = 75
ENT.GrenadeRadius = 300
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.DragCoefficient = 0.75
ENT.DetonateOnImpact = false
ENT.Gravity = false
ENT.Boost = 2700
ENT.BoostDelay = 0.28

ENT.Model = "models/johnsheppard44/caliber/weapons/launchers/clbr_wpn_rl_og-7 he rocket (bg).mdl"

ENT.NextTraceTime = 0

if SERVER then
    function ENT:Think()
        if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
            self:Detonate()
        end

        if self.SpawnTime + 0.2 < CurTime() and self.NextTraceTime < CurTime() then
            self.NextTraceTime = CurTime() + 0.1

            local dir = self:GetVelocity():GetNormalized()
            local deg = math.Clamp(1.5 - dir:Cross(Vector(0, 0, -1)):Length(), 0.5, 1)

            local tr = util.TraceHull({
                start = self:GetPos(),
                endpos = self:GetPos() + dir * (1024 * deg),
                filter = self,
                mins = Vector(-16, -16, -8),
                maxs = Vector(16, 16, 8)
            })
            if tr.Hit then
                self:Detonate()
            end
        end

    end
end

function ENT:DoDetonation()
    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    local dir = self:GetVelocity():GetNormalized()
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())

    if self:WaterLevel() >= 1 then
        util.Effect("WaterSurfaceExplosion", effectdata)
        self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
    else
        effectdata:SetMagnitude(4)
        effectdata:SetScale(1)
        effectdata:SetRadius(4)
        effectdata:SetNormal(dir)
        util.Effect("Sparks", effectdata)
        self:EmitSound("physics/metal/metal_box_break1.wav", 100, 200)
    end

    local deg = math.Clamp(1.5 - dir:Cross(Vector(0, 0, -1)):Length(), 0.5, 1)

    self:FireBullets({
        Attacker = attacker,
        Damage = 25,
        Force = 5,
        Distance = 2048,
        HullSize = 16,
        Num = 100,
        Tracer = 1,
        Src = self:GetPos(),
        Dir = dir,
        Spread = Vector(1, 1, 0),
        IgnoreEntity = self,
    })
    local dmg = DamageInfo()
    dmg:SetAttacker(IsValid(self:GetOwner()) and self:GetOwner() or self)
    dmg:SetDamageType(DMG_BULLET)
    dmg:SetInflictor(self)
    dmg:SetDamageForce(self:GetVelocity() * 100)
    for _, ent in pairs(ents.FindInCone(self:GetPos(), dir, 1024, 0.707)) do
        local tr = util.QuickTrace(self:GetPos(), ent:WorldSpaceCenter() - self:GetPos(), self)
        if tr.Entity == ent then
            dmg:SetDamage(math.Rand(75, 150) * deg * math.Clamp(tr.Fraction, 0.5, 1))
            ent:TakeDamageInfo(dmg)
        end
    end

    util.BlastDamage(self, attacker, self:GetPos(), self.GrenadeRadius, self.GrenadeDamage or self.Damage or 0)
end
