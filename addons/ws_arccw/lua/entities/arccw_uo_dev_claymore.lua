AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "Directional Mine"

local UO = ArcCW.UO

ENT.GrenadeRadius = 260
ENT.GrenadeDamage = 60

ENT.ExplosionParticle = UO.Particles.Directional
ENT.ExplosionShake = 35

ENT.Model = "models/uc_grenades/w_claymore.mdl"
ENT.ModelFallback = "models/props_junk/wood_crate001a.mdl"

ENT.PhysMass = 1.6
ENT.PhysElasticity = 0

ENT.StickMode = "upright"
ENT.StickOffset = 1
ENT.ArmTime = 2

ENT.Health_ = 30
ENT.DetonateOnDestroyed = false

ENT.ConeRange = 700
ENT.ConeAngle = 62
ENT.ConeDamage = 190
ENT.FragCount = 40
ENT.FragDamage = 26

ENT.TriggerDelay = 0.35

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Planted")
    self:NetworkVar("Bool", 2, "Triggered")
end

if SERVER then

    function ENT:DeviceThink()
        if self:GetTriggered() then return end
        if CurTime() < (self.NextScan or 0) then return end
        self.NextScan = CurTime() + 0.1

        local pos = self:GetPos() + self:GetUp() * 4
        local fwd = self:GetForward()
        local cos = math.cos(math.rad(self.ConeAngle))

        for _, ent in ipairs(UO.FindTargets(pos, self.ConeRange, self)) do
            local delta = ent:WorldSpaceCenter() - pos
            local dist = delta:Length()
            if dist < 1 then continue end

            if delta:GetNormalized():Dot(fwd) < cos then continue end

            local tr = util.TraceLine({
                start = pos,
                endpos = ent:WorldSpaceCenter(),
                filter = self,
                mask = MASK_SHOT,
            })
            if tr.Entity != ent and tr.Fraction < 0.95 then continue end

            self:Trip()
            return
        end
    end

    function ENT:Trip()
        if self:GetTriggered() then return end
        self:SetTriggered(true)

        self:EmitSound(UO.PickSound(self.BeepSound), 75, 160, 1)

        timer.Simple(self.TriggerDelay, function()
            if !IsValid(self) then return end
            self:Detonate()
        end)
    end

    function ENT:DoDetonation()
        local pos = self:GetPos() + self:GetUp() * 6
        local fwd = self:GetForward()
        local attacker = self:GetAttacker()

        UO.Blast(self, attacker, pos, self.GrenadeRadius, self.GrenadeDamage)

        local cos = math.cos(math.rad(self.ConeAngle))

        for _, ent in ipairs(UO.FindTargets(pos, self.ConeRange, self)) do
            local delta = ent:WorldSpaceCenter() - pos
            local dist = delta:Length()
            if dist < 1 then continue end

            local dir = delta:GetNormalized()
            if dir:Dot(fwd) < cos then continue end

            local tr = util.TraceLine({
                start = pos,
                endpos = ent:WorldSpaceCenter(),
                filter = self,
                mask = MASK_SHOT,
            })
            if tr.Entity != ent and tr.Fraction < 0.95 then continue end

            local falloff = Lerp(math.Clamp(dist / self.ConeRange, 0, 1), 1, 0.33)

            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
            d:SetDamage(self.ConeDamage * falloff * UO.DamageMult())
            d:SetDamageType(DMG_BLAST + DMG_BUCKSHOT)
            d:SetDamageForce(dir * 8000 * falloff)
            d:SetDamagePosition(tr.HitPos)
            ent:TakeDamageInfo(d)
        end

        UO.Shrapnel(self, attacker, self.FragCount, self.FragDamage, self.ConeRange, fwd, 0.55)

        UO.BustDoors(self, pos, self.ConeRange * 0.4)
    end

    function ENT:PostDetonation()
    end

else

    function ENT:GrenadeThinkCL()
        if self.Ticks % 2 != 0 then return end
        if !self:GetPlanted() then return end

        local armed = self:GetArmed()
        local c = armed and self.LightColorArmed or self.LightColorIdle

        local on = true
        if armed then on = (CurTime() % 1) < 0.12 end
        if !on then return end

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = self:GetPos() + self:GetUp() * 5
            dl.r, dl.g, dl.b = c.r, c.g, c.b
            dl.Brightness = armed and 1.4 or 0.5
            dl.Decay = 1500
            dl.Size = armed and 70 or 40
            dl.DieTime = CurTime() + 0.15
        end
    end

end
