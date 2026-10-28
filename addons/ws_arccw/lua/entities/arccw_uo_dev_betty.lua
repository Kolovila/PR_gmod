AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "S-Mine 44"

local UO = ArcCW.UO

ENT.GrenadeRadius = 640
ENT.GrenadeDamage = 195

ENT.ExplosionParticle = UO.Particles.HE
ENT.ExplosionShake = 38

ENT.Model = "models/weapons/smi44_betty/w_smi44_betty.mdl"
ENT.ModelFallback = "models/uc_grenades/w_eq_landmines_dropped.mdl"

ENT.PhysMass = 4
ENT.PhysElasticity = 0

ENT.StickMode = "upright"
ENT.StickOffset = 1
ENT.ArmTime = 2.5

ENT.Health_ = 40
ENT.DetonateOnDestroyed = true

ENT.TriggerRange = 120
ENT.HopHeight = 300
ENT.HopDelay = 0.45

ENT.FragCount = 44
ENT.FragDamage = 19

ENT.ArmSound = UO.Sound({"weapons/smi44_betty/wpn_betty_activate_01.wav", "weapons/smi44_betty/wpn_betty_activate_02.wav"}, "buttons/button17.wav")
ENT.LaunchSound = UO.Sound({"weapons/smi44_betty/wpn_betty_low_lyr.wav"}, "weapons/mortar/mortar_fire1.wav")
ENT.ExplosionSounds = UO.Sound({"weapons/smi44_betty/wpn_betty_exp_01.wav", "weapons/smi44_betty/wpn_betty_exp_02.wav", "weapons/smi44_betty/wpn_betty_exp_03.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/smi44_betty/wpn_betty_boom_lyr_01.wav", "weapons/smi44_betty/wpn_betty_boom_lyr_02.wav"}, UO.Snd.ExplosionIn)
ENT.ShrapnelSound = UO.Sound({"weapons/smi44_betty/wpn_betty_shrapnel_01.wav", "weapons/smi44_betty/wpn_betty_shrapnel_02.wav", "weapons/smi44_betty/wpn_betty_shrapnel_03.wav"}, "")

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

        for _, ent in ipairs(UO.FindTargets(self:GetPos(), self.TriggerRange, self)) do
            self:Trip()
            return
        end
    end

    function ENT:Trip()
        if self:GetTriggered() then return end
        self:SetTriggered(true)

        self:EmitSound(UO.PickSound(self.LaunchSound), 80, 130, 0.9)
        self:EmitSound(UO.PickSound(self.BeepSound), 75, 180, 1)

        self:SetParent(NULL)
        self:SetMoveType(MOVETYPE_VPHYSICS)

        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:EnableMotion(true)
            phys:Wake()
            phys:SetVelocityInstantaneous(Vector(0, 0, self.HopHeight) + VectorRand() * 25)
            phys:AddAngleVelocity(VectorRand() * 400)
        else
            self:SetPos(self:GetPos() + Vector(0, 0, 40))
        end

        UO.Sparks(self:GetPos(), vector_up, 3, 1)

        timer.Simple(self.HopDelay, function()
            if !IsValid(self) then return end
            self:Detonate()
        end)
    end

    function ENT:PostDetonation()
        local pos = self:GetPos()

        UO.Shrapnel(self, self:GetAttacker(), self.FragCount, self.FragDamage, 1200)

        if self.ShrapnelSound then
            sound.Play(UO.PickSound(self.ShrapnelSound), pos, 85, math.random(96, 104), 0.9)
        end
    end

    function ENT:OnGrenadeCollide(data, physobj)
        if self:GetTriggered() then return end
        return self.BaseClass.OnGrenadeCollide(self, data, physobj)
    end

end
