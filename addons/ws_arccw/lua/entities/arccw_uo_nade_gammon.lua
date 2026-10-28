AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Gammon Bomb"

local UO = ArcCW.UO

ENT.GrenadeRadius = 620
ENT.GrenadeDamage = 280
ENT.GrenadeDamageType = DMG_BLAST + DMG_SONIC
ENT.FuseTime = 7

ENT.ImpactFuse = true
ENT.ImpactFuseSpeed = 110
ENT.ArmTime = 0.9

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 55
ENT.ExplosionSoundLevel = 145

ENT.Model = "models/weapons/w_gammon.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 1.1
ENT.PhysElasticity = 0
ENT.PhysMaterial = "cardboard"

ENT.SurfaceDamage = 320
ENT.SurfaceRange = 110
ENT.DoorRange = 2

ENT.ExplosionSounds = UO.Sound({"weapons/c4/c4_detonate_01.wav", "weapons/c4/c4_detonate_02.wav", "weapons/c4/c4_detonate_03.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/c4/c4_detonate_dist_01.wav", "weapons/c4/c4_detonate_dist_02.wav", "weapons/c4/c4_detonate_dist_03.wav"}, UO.Snd.ExplosionIn)

ENT.BounceSounds = false

local bounce = UO.Sound({"weapons/no69/no69_bounce_01.wav", "weapons/no69/no69_bounce_02.wav"}, UO.Snd.BounceSoft)

ENT.ArmSound = UO.Sound("buttons/button17.wav", "buttons/blip1.wav")

if SERVER then

    function ENT:OnArmed()
        self:EmitSound(UO.PickSound(self.ArmSound), 58, 165, 0.35)
    end

    function ENT:OnGrenadeCollide(data, physobj)
        if data.Speed < 40 then return end
        if CurTime() < (self.NextBounce or 0) then return end

        self.NextBounce = CurTime() + 0.1
        self:EmitSound(UO.PickSound(bounce), 64, math.random(92, 102))
    end

    function ENT:PostDetonation()
        local pos = self:GetPos()
        local attacker = self:GetAttacker()
        local into = self.GrenadeDir or Vector(0, 0, -1)

        local tr = util.TraceLine({
            start = pos,
            endpos = pos + into * self.SurfaceRange,
            filter = self,
            mask = MASK_SOLID,
        })

        if IsValid(tr.Entity) and !tr.Entity:IsWorld() then
            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
            d:SetDamage(self.SurfaceDamage * UO.DamageMult())
            d:SetDamageType(DMG_BLAST + DMG_CLUB)
            d:SetDamageForce(into * 24000)
            d:SetDamagePosition(tr.HitPos)
            tr.Entity:TakeDamageInfo(d)
        end

        UO.BustDoors(self, pos, self.GrenadeRadius * self.DoorRange)
    end

end
