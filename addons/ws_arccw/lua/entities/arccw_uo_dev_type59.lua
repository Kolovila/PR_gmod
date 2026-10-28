AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "Type 59"

local UO = ArcCW.UO

ENT.GrenadeRadius = 560
ENT.GrenadeDamage = 165

ENT.ExplosionParticle = UO.Particles.HE
ENT.ExplosionShake = 30

ENT.Model = "models/weapons/w_type59_mine.mdl"
ENT.ModelFallback = "models/uc_grenades/w_eq_landmines_dropped.mdl"

ENT.PhysMass = 6
ENT.PhysElasticity = 0

ENT.StickMode = "flat"
ENT.StickOffset = 0.5
ENT.ArmTime = 2

ENT.Health_ = 35
ENT.DetonateOnDestroyed = true

ENT.TriggerRange = 110
ENT.TriggerDelay = 0.12

ENT.FragCount = 18
ENT.FragDamage = 13
ENT.FragRange = 700

ENT.ChainRange = 420
ENT.ChainStagger = 0.22

ENT.BeepInterval = 2.5

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Planted")
    self:NetworkVar("Bool", 2, "Triggered")
end

if SERVER then

    function ENT:DeviceThink()
        if self:GetTriggered() then return end

        local ct = CurTime()

        if ct >= (self.NextBeep or 0) then
            self.NextBeep = ct + self.BeepInterval
            self:EmitSound(UO.PickSound(self.BeepSound), 58, 95, 0.3)
        end

        if ct < (self.NextScan or 0) then return end
        self.NextScan = ct + 0.1

        for _, ent in ipairs(UO.FindTargets(self:GetPos(), self.TriggerRange, self)) do
            self:Trip()
            return
        end
    end

    function ENT:Trip()
        if self:GetTriggered() then return end
        self:SetTriggered(true)

        self:EmitSound(UO.PickSound(self.BeepSound), 72, 175, 1)

        timer.Simple(self.TriggerDelay, function()
            if !IsValid(self) then return end
            self:Detonate()
        end)
    end

    function ENT:PostDetonation()
        local pos = self:GetPos()

        UO.Shrapnel(self, self:GetAttacker(), self.FragCount, self.FragDamage, self.FragRange)

        for _, e in ipairs(ents.FindByClass("arccw_uo_dev_type59")) do
            if e == self or !IsValid(e) then continue end
            if e.BOOM or e.Chaining or !e:GetArmed() then continue end

            local dist = e:GetPos():Distance(pos)
            if dist > self.ChainRange then continue end

            e.Chaining = true

            timer.Simple(0.05 + (dist / self.ChainRange) * self.ChainStagger, function()
                if !IsValid(e) or e.BOOM then return end
                e:SetTriggered(true)
                e:Detonate()
            end)
        end
    end

end
