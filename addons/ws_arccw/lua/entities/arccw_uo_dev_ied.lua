AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "IED"

local UO = ArcCW.UO

ENT.GrenadeRadius = 1050
ENT.GrenadeDamage = 340

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 80
ENT.ExplosionSoundLevel = 148

ENT.Model = "models/weapons/ins/w_ied.mdl"
ENT.ModelFallback = "models/props_c17/oildrum001_explosive.mdl"

ENT.PhysMass = 6
ENT.PhysElasticity = 0

ENT.StickMode = "flat"
ENT.StickOffset = 0.5
ENT.ArmTime = 1.5

ENT.Health_ = 40
ENT.DetonateOnDestroyed = true

ENT.VictimOperated = false
ENT.TriggerRange = 150

ENT.FragCount = 26
ENT.FragDamage = 18

ENT.DudChance = 0.12
ENT.HangfireMax = 1.4

ENT.BeepInterval = 3

ENT.ExplosionSounds = UO.Sound({"weapons/ied/ied_detonate_01.wav", "weapons/ied/ied_detonate_02.wav", "weapons/ied/ied_detonate_03.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/ied/ied_detonate_dist_01.wav", "weapons/ied/ied_detonate_dist_02.wav", "weapons/ied/ied_detonate_dist_03.wav"}, UO.Snd.ExplosionIn)

ENT.UO_Remote = true

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Planted")
    self:NetworkVar("Bool", 2, "Triggered")
end

if SERVER then

    local bounce = UO.Sound({"weapons/ied/ied_bounce_01.wav", "weapons/ied/ied_bounce_02.wav", "weapons/ied/ied_bounce_03.wav"}, UO.Snd.BounceSoft)

    function ENT:OnGrenadeCollide(data, physobj)
        if data.Speed > 40 and CurTime() >= (self.NextBounce or 0) then
            self.NextBounce = CurTime() + 0.1
            self:EmitSound(UO.PickSound(bounce), 70, math.random(94, 104))
        end

        return self.BaseClass.OnGrenadeCollide(self, data, physobj)
    end

    function ENT:OnArmed()
        self:EmitSound(UO.PickSound(self.ArmSound), 62, 120, 0.6)
    end

    function ENT:DeviceThink()
        if !self.VictimOperated then
            if CurTime() < (self.NextBeep or 0) then return end
            self.NextBeep = CurTime() + self.BeepInterval
            self:EmitSound(UO.PickSound(self.BeepSound), 50, 80, 0.2)
            return
        end

        if self:GetTriggered() then return end
        if CurTime() < (self.NextScan or 0) then return end
        self.NextScan = CurTime() + 0.1

        for _, ent in ipairs(UO.FindTargets(self:GetPos(), self.TriggerRange, self)) do
            self:Trip()
            return
        end
    end

    function ENT:Trip()
        if self:GetTriggered() then return end
        self:SetTriggered(true)
        self:Initiate()
    end

    function ENT:RemoteDetonate()
        if !self:GetArmed() then return end
        if self.VictimOperated then return end
        self:Initiate()
    end

    function ENT:Initiate()
        if self.BOOM or self.Firing then return end
        self.Firing = true

        if math.Rand(0, 1) < self.DudChance then
            self:EmitSound(UO.PickSound(self.BeepSound), 60, 60, 0.4)
            self.Firing = false
            self.Dudded = true
            return
        end

        timer.Simple(math.Rand(0, self.HangfireMax), function()
            if IsValid(self) and !self.BOOM then self:Detonate() end
        end)
    end

    function ENT:PostDetonation()
        local pos = self:GetPos()

        UO.Shrapnel(self, self:GetAttacker(), self.FragCount, self.FragDamage, 1300)
        UO.BustDoors(self, pos, self.GrenadeRadius * 1.4)
    end

end

if CLIENT then
    function ENT:GrenadeThinkCL()
        if !self:GetPlanted() then return end
        if self.Ticks % 4 != 0 then return end
        if (CurTime() % 2) > 0.25 then return end

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = self:GetPos() + self:GetUp() * 2
            dl.r, dl.g, dl.b = 120, 190, 255
            dl.Brightness = 0.7
            dl.Decay = 1200
            dl.Size = 45
            dl.DieTime = CurTime() + 0.12
        end
    end
end
