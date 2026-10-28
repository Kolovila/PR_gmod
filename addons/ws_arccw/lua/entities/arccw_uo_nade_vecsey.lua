AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "36M Vécsey"

local UO = ArcCW.UO

ENT.GrenadeRadius = 640
ENT.GrenadeDamage = 185
ENT.FuseTime = 2.7

ENT.ExplosionParticle = UO.Particles.HE
ENT.ExplosionShake = 30

ENT.Model = "models/weapons/w_ww2_36m_vecsey.mdl"
ENT.ModelFallback = "models/uc_grenades/w_stielhandgranate24_thrown.mdl"

ENT.PhysMass = 0.5
ENT.PhysElasticity = 0.1
ENT.PhysDamping = {0.5, 2.5}

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/grenade_exp2.wav", "germany_ww2/explosives/grenade_exp3.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_close_indoor_01.wav"}, UO.Snd.ExplosionIn)

function ENT:PostDetonation()
    UO.Shrapnel(self, self:GetAttacker(), 28, 15, 1100)
end
