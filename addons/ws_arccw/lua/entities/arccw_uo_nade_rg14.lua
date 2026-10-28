AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "RG-14"

local UO = ArcCW.UO

ENT.GrenadeRadius = 560
ENT.GrenadeDamage = 175
ENT.GrenadeDamageType = DMG_BLAST + DMG_SONIC
ENT.FuseTime = 4

ENT.ExplosionParticle = UO.Particles.Grenade
ENT.ExplosionShake = 28

ENT.Model = "models/weapons/w_rg14.mdl"
ENT.ModelFallback = "models/uc_grenades/w_stielhandgranate24_thrown.mdl"

ENT.PhysMass = 0.4
ENT.PhysElasticity = 0.12
ENT.PhysDamping = {0.5, 2.5}

ENT.FragCount = 8
ENT.FragDamage = 5
ENT.FragRange = 400

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/grenade_exp1.wav", "germany_ww2/explosives/grenade_exp2.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_close_indoor_01.wav"}, UO.Snd.ExplosionIn)

function ENT:PostDetonation()
    UO.Shrapnel(self, self:GetAttacker(), self.FragCount, self.FragDamage, self.FragRange)
    UO.BustDoors(self, self:GetPos(), self.GrenadeRadius)
end
