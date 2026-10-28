AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "Tellermine 43"

local UO = ArcCW.UO

ENT.GrenadeRadius = 1100
ENT.GrenadeDamage = 380

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 80
ENT.ExplosionSoundLevel = 148

ENT.Model = "models/weapons/t43_mine/w_t43_mine.mdl"
ENT.ModelFallback = "models/uc_grenades/w_eq_landmines_dropped.mdl"

ENT.PhysMass = 8
ENT.PhysElasticity = 0

ENT.StickMode = "flat"
ENT.StickOffset = 0.5
ENT.ArmTime = 2

ENT.Health_ = 50
ENT.DetonateOnDestroyed = true

ENT.TriggerRange = 45
ENT.TriggerMass = 200
ENT.PlateHeight = 40

ENT.FragCount = 20
ENT.FragDamage = 16

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

        for _, ent in ipairs(ents.FindInSphere(pos, self.TriggerRange + self.PlateHeight)) do
            if ent == self or !IsValid(ent) then continue end

            if ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot() then continue end

            local phys = ent:GetPhysicsObject()
            if !IsValid(phys) then continue end
            if phys:GetMass() < self.TriggerMass then continue end

            local delta = ent:WorldSpaceCenter() - pos
            local along = delta:Dot(up)
            local lateral = (delta - up * along):Length()

            if along < 0 or along > self.PlateHeight then continue end
            if lateral > self.TriggerRange then continue end

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
