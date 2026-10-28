AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "TMRP-6"

local UO = ArcCW.UO

ENT.GrenadeRadius = 300
ENT.GrenadeDamage = 65

ENT.ExplosionParticle = UO.Particles.Directional
ENT.ExplosionShake = 45
ENT.ExplosionSoundLevel = 146

ENT.Model = "models/weapons/w_tmrp6.mdl"
ENT.ModelFallback = "models/weapons/m1a1_mine/w_m1a1_mine.mdl"

ENT.PhysMass = 5.5
ENT.PhysElasticity = 0

ENT.StickMode = "flat"
ENT.StickOffset = 0.5
ENT.ArmTime = 2

ENT.Health_ = 30
ENT.DetonateOnDestroyed = true

ENT.TriggerRange = 130
ENT.TriggerHeight = 150
ENT.TriggerDelay = 0.1

ENT.JetAngle = 15
ENT.JetRange = 700
ENT.JetDamage = 420
ENT.SlugCount = 3
ENT.SlugDamage = 45

ENT.BeepInterval = 3

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Planted")
    self:NetworkVar("Bool", 2, "Triggered")
end

if SERVER then

    function ENT:JetDir()
        local up = self.PlantNormal or self:GetUp()
        if up:LengthSqr() < 0.01 then up = vector_up end
        up = Vector(up)
        up:Normalize()
        return up
    end

    function ENT:DeviceThink()
        if self:GetTriggered() then return end

        local ct = CurTime()

        if ct >= (self.NextBeep or 0) then
            self.NextBeep = ct + self.BeepInterval
            self:EmitSound(UO.PickSound(self.BeepSound), 58, 105, 0.3)
        end

        if ct < (self.NextScan or 0) then return end
        self.NextScan = ct + 0.1

        local pos = self:GetPos()
        local up = self:JetDir()

        for _, ent in ipairs(UO.FindTargets(pos, self.TriggerRange + self.TriggerHeight, self)) do
            local delta = ent:WorldSpaceCenter() - pos
            local along = delta:Dot(up)
            local lateral = (delta - up * along):Length()

            if along < 0 or along > self.TriggerHeight then continue end
            if lateral > self.TriggerRange then continue end

            self:Trip()
            return
        end
    end

    function ENT:Trip()
        if self:GetTriggered() then return end
        self:SetTriggered(true)

        self:EmitSound(UO.PickSound(self.BeepSound), 72, 190, 1)

        timer.Simple(self.TriggerDelay, function()
            if !IsValid(self) then return end
            self:Detonate()
        end)
    end

    function ENT:DoDetonation()
        local pos = self:GetPos() + self:JetDir() * 4
        local up = self:JetDir()
        local attacker = self:GetAttacker()

        UO.Blast(self, attacker, pos, self.GrenadeRadius, self.GrenadeDamage)

        local cos = math.cos(math.rad(self.JetAngle))

        for _, ent in ipairs(UO.FindTargets(pos, self.JetRange, self)) do
            local delta = ent:WorldSpaceCenter() - pos
            local dist = delta:Length()
            if dist < 1 then continue end

            local dir = delta:GetNormalized()
            if dir:Dot(up) < cos then continue end

            local tr = util.TraceLine({
                start = pos,
                endpos = ent:WorldSpaceCenter(),
                filter = self,
                mask = MASK_SHOT,
            })
            if tr.Entity != ent and tr.Fraction < 0.95 then continue end

            local falloff = Lerp(math.Clamp(dist / self.JetRange, 0, 1), 1, 0.7)

            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
            d:SetDamage(self.JetDamage * falloff * UO.DamageMult())
            d:SetDamageType(DMG_BLAST + DMG_SNIPER)
            d:SetDamageForce(dir * 14000 * falloff)
            d:SetDamagePosition(tr.HitPos)
            ent:TakeDamageInfo(d)
        end

        UO.Shrapnel(self, attacker, self.SlugCount, self.SlugDamage, self.JetRange, up, 0.12)
    end

    function ENT:PostDetonation()
        UO.BustDoors(self, self:GetPos(), self.GrenadeRadius * 0.5)
    end

end
