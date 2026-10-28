AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Mk 2"

local UO = ArcCW.UO

ENT.GrenadeRadius = 760
ENT.GrenadeDamage = 185
ENT.FuseTime = 4.5

ENT.FuseVariance = 0.9

ENT.ExplosionParticle = UO.Particles.HE

ENT.Model = "models/weapons/arc9_doi/w_mk2.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.6
ENT.PhysElasticity = 0.22
ENT.PhysMaterial = "metal"

ENT.ExplosionSounds = UO.Sound({"weapons/mk2/mk2_detonate_01.wav", "weapons/mk2/mk2_detonate_02.wav", "weapons/mk2/mk2_detonate_03.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/mk2/mk2_detonate_dist_01.wav", "weapons/mk2/mk2_detonate_dist_02.wav", "weapons/mk2/mk2_detonate_dist_03.wav"}, UO.Snd.ExplosionIn)

ENT.BounceSounds = false

local bounce = UO.Sound({"weapons/no69/no69_bounce_01.wav", "weapons/no69/no69_bounce_02.wav", "weapons/mk2/mk2_bounce_03.wav", "weapons/mk2/mk2_bounce_04.wav"}, UO.Snd.BounceHard)

function ENT:OnGrenadeCollide(data, physobj)
    if data.Speed < 40 then return end
    if CurTime() < (self.NextBounce or 0) then return end

    self.NextBounce = CurTime() + 0.08
    self:EmitSound(UO.PickSound(bounce), 70, math.random(95, 106))
end

function ENT:PostDetonation()
    UO.Shrapnel(self, self:GetAttacker(), 38, 15, 1150)
end
