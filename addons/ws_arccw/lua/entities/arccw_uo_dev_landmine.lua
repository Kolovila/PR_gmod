AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "No. 6 Mine"

local UO = ArcCW.UO

ENT.GrenadeRadius = 620
ENT.GrenadeDamage = 190

ENT.ExplosionParticle = UO.Particles.HE
ENT.ExplosionShake = 35

ENT.Model = "models/uc_grenades/w_eq_landmines_dropped.mdl"
ENT.ModelFallback = "models/uc_grenades/w_eq_landmines.mdl"

ENT.PhysMass = 2.2
ENT.PhysElasticity = 0

ENT.StickMode = "upright"
ENT.StickOffset = 1
ENT.ArmTime = 2.5

ENT.Health_ = 40
ENT.DetonateOnDestroyed = true

ENT.TriggerRange = 90
ENT.TriggerDelay = 0.15

ENT.FragCount = 34
ENT.FragDamage = 18

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
            self:EmitSound(UO.PickSound(self.BeepSound), 60, 100, 0.4)
        end

        if ct < (self.NextScan or 0) then return end
        self.NextScan = ct + 0.1

        local pos = self:GetPos()

        for _, ent in ipairs(UO.FindTargets(pos, self.TriggerRange, self)) do
            self:Trip()
            return
        end
    end

    function ENT:Trip()
        if self:GetTriggered() then return end
        self:SetTriggered(true)

        self:EmitSound(UO.PickSound(self.BeepSound), 75, 180, 1)

        timer.Simple(self.TriggerDelay, function()
            if !IsValid(self) then return end
            self:Detonate()
        end)
    end

    function ENT:PostDetonation()
        local up = self.PlantNormal or vector_up
        UO.Shrapnel(self, self:GetAttacker(), self.FragCount, self.FragDamage, 900, up, 1.5)
    end

end
