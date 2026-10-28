AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "M26"

local UO = ArcCW.UO

ENT.GrenadeRadius = 640
ENT.GrenadeDamage = 165
ENT.FuseTime = 4.5

ENT.ExplosionParticle = UO.Particles.Grenade

ENT.Model = "models/vietnam/w_nam_m26.mdl"
ENT.ModelFallback = "models/simpnades/w_m67.mdl"

ENT.PhysMass = 0.45
ENT.PhysElasticity = 0.16

ENT.ExplosionSounds = UO.Sound({"weapons/mk2/mk2_detonate_01.wav", "weapons/mk2/mk2_detonate_02.wav", "weapons/mk2/mk2_detonate_03.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/mk2/mk2_detonate_dist_01.wav", "weapons/mk2/mk2_detonate_dist_02.wav", "weapons/mk2/mk2_detonate_dist_03.wav"}, UO.Snd.ExplosionIn)

function ENT:PostDetonation()
    local attacker = self:GetAttacker()

    UO.Shrapnel(self, attacker, 70, 11, 700)
end
