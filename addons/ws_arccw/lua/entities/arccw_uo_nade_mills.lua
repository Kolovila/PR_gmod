AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Mills Bomb"

local UO = ArcCW.UO

ENT.GrenadeRadius = 560
ENT.GrenadeDamage = 150
ENT.FuseTime = 7

ENT.ExplosionParticle = UO.Particles.Grenade

ENT.Model = "models/weapons/arc9_doi/w_mills.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.77
ENT.PhysElasticity = 0.1
ENT.PhysDamping = {0.4, 1.6}

ENT.ExplosionSounds = UO.Sound({"weapons/mk2/mk2_detonate_01.wav", "weapons/mk2/mk2_detonate_02.wav", "weapons/mk2/mk2_detonate_03.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/mk2/mk2_detonate_dist_01.wav", "weapons/mk2/mk2_detonate_dist_02.wav", "weapons/mk2/mk2_detonate_dist_03.wav"}, UO.Snd.ExplosionIn)

ENT.BounceSounds = false

local bounce = UO.Sound({"weapons/no69/no69_bounce_01.wav", "weapons/no69/no69_bounce_02.wav", "weapons/mk2/mk2_bounce_03.wav", "weapons/mk2/mk2_bounce_04.wav"}, UO.Snd.BounceHard)

function ENT:OnGrenadeCollide(data, physobj)
    if data.Speed < 40 then return end
    if CurTime() < (self.NextBounce or 0) then return end

    self.NextBounce = CurTime() + 0.08
    self:EmitSound(UO.PickSound(bounce), 70, math.random(94, 104))
end

function ENT:PostDetonation()
    local attacker = self:GetAttacker()

    UO.Shrapnel(self, attacker, 26, 34, 2600)

    UO.Shrapnel(self, attacker, 12, 26, 1800, nil, 0.6)
end
