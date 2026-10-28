AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "M1A1 Mine"

local UO = ArcCW.UO

ENT.GrenadeRadius = 900
ENT.GrenadeDamage = 300

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 65
ENT.ExplosionSoundLevel = 148

ENT.Model = "models/weapons/m1a1_mine/w_m1a1_mine.mdl"
ENT.ModelFallback = "models/uc_grenades/w_eq_landmines_dropped.mdl"

ENT.PhysMass = 4.5
ENT.PhysElasticity = 0

ENT.StickMode = "flat"
ENT.StickOffset = 0.5
ENT.ArmTime = 2

ENT.Health_ = 32
ENT.DetonateOnDestroyed = true

ENT.TriggerRange = 260
ENT.TriggerMass = 90

ENT.RodHeight = 80

ENT.FragCount = 16
ENT.FragDamage = 14

ENT.BeepInterval = 4

ENT.ExplosionSounds = UO.Sound("germany_ww2/explosives/explode_lrg_close_01.wav", UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound("germany_ww2/explosives/explode_lrg_dist_01.wav", UO.Snd.ExplosionIn)

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
            self:EmitSound(UO.PickSound(self.BeepSound), 55, 85, 0.25)
        end

        if ct < (self.NextScan or 0) then return end
        self.NextScan = ct + 0.2

        local pos = self:GetPos()
        local up = self.PlantNormal or vector_up

        for _, ent in ipairs(ents.FindInSphere(pos, self.TriggerRange)) do
            if ent == self or !IsValid(ent) then continue end

            if ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot() then continue end

            local phys = ent:GetPhysicsObject()
            if !IsValid(phys) then continue end
            if phys:GetMass() < self.TriggerMass then continue end

            local along = (ent:WorldSpaceCenter() - pos):Dot(up)
            if along < -16 or along > self.RodHeight then continue end

            self:Trip()
            return
        end
    end

    function ENT:Trip()
        if self:GetTriggered() then return end
        self:SetTriggered(true)

        self:EmitSound(UO.PickSound(self.BeepSound), 75, 170, 1)

        timer.Simple(0.1, function()
            if !IsValid(self) then return end
            self:Detonate()
        end)
    end

    function ENT:PostDetonation()
        local pos = self:GetPos()
        local up = self.PlantNormal or vector_up

        UO.Shrapnel(self, self:GetAttacker(), self.FragCount, self.FragDamage, 1000, up, 1.5)

        UO.BustDoors(self, pos, self.GrenadeRadius * 1.5)
    end

end
