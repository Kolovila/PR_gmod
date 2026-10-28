AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Type 97"

local UO = ArcCW.UO

ENT.GrenadeRadius = 620
ENT.GrenadeDamage = 160
ENT.FuseTime = 4.5

ENT.FuseVariance = 1.6

ENT.ExplosionParticle = UO.Particles.Grenade

ENT.Model = "models/weapons/w_type97.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.45
ENT.PhysElasticity = 0.2

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/grenade_explosion4.wav", "germany_ww2/explosives/grenade_explosion5.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_close_indoor_01.wav"}, UO.Snd.ExplosionIn)

function ENT:PostDetonation()
    UO.Shrapnel(self, self:GetAttacker(), 30, 14, 1050)
end
