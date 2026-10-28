AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "Satchel Charge"

local UO = ArcCW.UO

ENT.GrenadeRadius = 900
ENT.GrenadeDamage = 320

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 60

ENT.Model = "models/weapons/ins/c4/w_c4.mdl"
ENT.ModelFallback = "models/uc_grenades/w_eq_c4.mdl"

ENT.ExplosionSounds = UO.Sound({"weapons/c4/c4_detonate_01.wav", "weapons/c4/c4_detonate_02.wav", "weapons/c4/c4_detonate_03.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/c4/c4_detonate_dist_01.wav", "weapons/c4/c4_detonate_dist_02.wav", "weapons/c4/c4_detonate_dist_03.wav"}, UO.Snd.ExplosionIn)

ENT.BounceSounds = false

ENT.PhysMass = 2.5
ENT.PhysElasticity = 0

ENT.StickMode = "flat"
ENT.StickOffset = 0.5
ENT.ArmTime = 0.75

ENT.Health_ = 45
ENT.DetonateOnDestroyed = true

ENT.FragCount = 14
ENT.FragDamage = 12

ENT.BeepInterval = 2.5
ENT.TimerBeepInterval = 0.6
ENT.PlantGrace = 4
ENT.LightColorArmed = Color(255, 30, 30)
ENT.LightColorIdle = Color(255, 160, 30)

ENT.UO_Remote = true

if SERVER then

    local bounce = UO.Sound({"weapons/c4/c4_bounce_01.wav", "weapons/c4/c4_bounce_02.wav", "weapons/c4/c4_bounce_03.wav"}, UO.Snd.BounceSoft)

    function ENT:OnGrenadeCollide(data, physobj)
        if data.Speed > 40 and CurTime() >= (self.NextBounce or 0) then
            self.NextBounce = CurTime() + 0.1
            self:EmitSound(UO.PickSound(bounce), 68, math.random(96, 106))
        end

        return self.BaseClass.OnGrenadeCollide(self, data, physobj)
    end

    function ENT:OnArmed()
        self:EmitSound(UO.PickSound(self.ArmSound), 65, 130, 0.7)
    end

    function ENT:DeviceThink()
        if self.ChargeTime then return end
        if CurTime() < (self.NextBeep or 0) then return end
        self.NextBeep = CurTime() + self.BeepInterval

        self:EmitSound(UO.PickSound(self.BeepSound), 55, 90, 0.3)
    end

    function ENT:StartCountdown()
        if self.ChargeAt then return end

        self.ChargeAt = CurTime() + self.ChargeTime
        self:SetDetonateAt(self.ChargeAt)
        self:EmitSound(UO.PickSound(self.ArmSound), 70, 140, 0.8)
    end

    function ENT:Think()
        if !self.FuseResolved then
            self.FuseResolved = true

            local ft = self.FuseTime
            if isnumber(ft) and ft > 0 and ft < math.huge then
                self.ChargeTime = ft
            end
        end

        if self.ChargeTime and !self.BOOM then
            if !self.ChargeAt and (self:GetPlanted() or CurTime() - self.SpawnTime >= self.PlantGrace) then
                self:StartCountdown()
            end

            if self.ChargeAt then
                if CurTime() >= self.ChargeAt then
                    self:Detonate()
                    return
                end

                if CurTime() >= (self.NextTimerBeep or 0) then
                    local left = self.ChargeAt - CurTime()
                    self.NextTimerBeep = CurTime() + math.Clamp(left / self.ChargeTime, 0.12, 1) * self.TimerBeepInterval
                    self:EmitSound(UO.PickSound(self.BeepSound), 68, math.Clamp(180 - left * 16, 100, 180), 0.6)
                end
            end
        end

        return self.BaseClass.Think(self)
    end

    function ENT:RemoteDetonate()
        if !self:GetArmed() then return end
        self:Detonate()
    end

    function ENT:PostDetonation()
        UO.Shrapnel(self, self:GetAttacker(), self.FragCount, self.FragDamage, 700)
    end

end
