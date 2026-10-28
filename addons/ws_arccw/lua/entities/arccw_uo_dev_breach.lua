AddCSLuaFile()
ENT.Base = "arccw_uo_dev_base"
ENT.PrintName = "Breaching Charge"

local UO = ArcCW.UO

ENT.GrenadeRadius = 220
ENT.GrenadeDamage = 150

ENT.ExplosionParticle = UO.Particles.Directional
ENT.ExplosionShake = 45

ENT.Model = "models/uc_grenades/w_eq_charge.mdl"
ENT.ModelFallback = "models/uc_grenades/w_eq_c4.mdl"

ENT.PhysMass = 1.4
ENT.PhysElasticity = 0

ENT.StickMode = "flat"
ENT.StickOffset = 0.5
ENT.ArmTime = 0.4

ENT.Health_ = 30
ENT.DetonateOnDestroyed = true

ENT.JetRange = 200
ENT.JetDamage = 260
ENT.JetCount = 18

ENT.BeepInterval = 2
ENT.LightColorArmed = Color(255, 40, 40)

ENT.UO_Remote = true

if SERVER then

    function ENT:OnPlanted()
        self:EmitSound(UO.PickSound(self.ArmSound), 70, 140, 0.8)
    end

    function ENT:DeviceThink()
        if CurTime() < (self.NextBeep or 0) then return end
        self.NextBeep = CurTime() + self.BeepInterval

        self:EmitSound(UO.PickSound(self.BeepSound), 55, 110, 0.3)
    end

    function ENT:RemoteDetonate()
        if !self:GetArmed() then return end
        self:Detonate()
    end

    function ENT:DoDetonation()
        local pos = self:GetPos()
        local attacker = self:GetAttacker()

        local into = -(self.PlantNormal or self:GetUp())

        UO.Blast(self, attacker, pos, self.GrenadeRadius, self.GrenadeDamage)

        UO.Shrapnel(self, attacker, self.JetCount, self.JetDamage / self.JetCount * 3, self.JetRange, into, 0.25)

        UO.BustDoors(self, pos, self.GrenadeRadius * 3)

        local tr = util.TraceLine({
            start = pos,
            endpos = pos + into * self.JetRange,
            filter = self,
            mask = MASK_SOLID,
        })

        if IsValid(tr.Entity) then
            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
            d:SetDamage(self.JetDamage * UO.DamageMult())
            d:SetDamageType(DMG_BLAST + DMG_CLUB)
            d:SetDamageForce(into * 20000)
            d:SetDamagePosition(tr.HitPos)
            tr.Entity:TakeDamageInfo(d)
        end
    end

end
