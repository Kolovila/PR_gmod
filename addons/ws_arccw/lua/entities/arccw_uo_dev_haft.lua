AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "Hafthohlladung"

local UO = ArcCW.UO

ENT.GrenadeRadius = 260
ENT.GrenadeDamage = 90

ENT.ExplosionParticle = UO.Particles.Directional
ENT.ExplosionShake = 55
ENT.ExplosionSoundLevel = 145

ENT.Model = "models/vietnam/w_hafthohlladung.mdl"
ENT.ModelFallback = "models/uc_grenades/w_eq_charge.mdl"

ENT.PhysMass = 3
ENT.PhysElasticity = 0

ENT.StickMode = "flat"
ENT.StickOffset = 0.5
ENT.StickToProps = true
ENT.ArmTime = 0.4

ENT.Health_ = 35
ENT.DetonateOnDestroyed = true

ENT.ChargeTime = 4.5

ENT.JetDamage = 900
ENT.JetRange = 130

ENT.BeepInterval = 0.6
ENT.LightColorArmed = Color(255, 60, 40)

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/explode_lrg_close_01.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_lrg_dist_01.wav"}, UO.Snd.ExplosionIn)

if SERVER then

    function ENT:OnGrenadeCollide(data, physobj)
        if self:GetPlanted() then return end

        local hit = data.HitEntity

        if IsValid(hit) then
            if hit:IsPlayer() or hit:IsNPC() or hit:IsNextBot() then return end
            local hp = hit:GetPhysicsObject()
            if !IsValid(hp) then return end
        else
            return
        end

        return self.BaseClass.OnGrenadeCollide(self, data, physobj)
    end

    function ENT:OnPlanted()
        self.ChargeAt = CurTime() + self.ChargeTime
        self:SetDetonateAt(self.ChargeAt)
        self:EmitSound(UO.PickSound(self.ArmSound), 70, 150, 0.9)

        self.Host = self:GetParent()
    end

    function ENT:DeviceThink()
        if !self.ChargeAt then return end

        local ct = CurTime()

        if ct >= self.ChargeAt then
            self:Detonate()
            return
        end

        if ct >= (self.NextBeep or 0) then
            local left = self.ChargeAt - ct
            self.NextBeep = ct + math.Clamp(left / self.ChargeTime, 0.15, 1) * self.BeepInterval
            self:EmitSound(UO.PickSound(self.BeepSound), 68, math.Clamp(180 - left * 18, 100, 180), 0.5)
        end
    end

    function ENT:DoDetonation()
        local pos = self:GetPos()
        local attacker = self:GetAttacker()
        local into = -(self.PlantNormal or self:GetUp())

        UO.Blast(self, attacker, pos, self.GrenadeRadius, self.GrenadeDamage)

        local host = self.Host

        if !IsValid(host) then
            local tr = util.TraceLine({
                start = pos,
                endpos = pos + into * self.JetRange,
                filter = self,
                mask = MASK_SOLID,
            })
            host = tr.Entity
        end

        if IsValid(host) and !host:IsWorld() then
            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
            d:SetDamage(self.JetDamage * UO.DamageMult())
            d:SetDamageType(DMG_BLAST + DMG_CLUB)
            d:SetDamageForce(into * 30000)
            d:SetDamagePosition(pos)
            host:TakeDamageInfo(d)
        end

        UO.Shrapnel(self, attacker, 10, 20, self.JetRange, into, 0.2)
        UO.BustDoors(self, pos, self.GrenadeRadius * 2)
    end

end
