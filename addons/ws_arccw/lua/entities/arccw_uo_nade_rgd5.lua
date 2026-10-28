AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "RGD-5"

local UO = ArcCW.UO

ENT.GrenadeRadius = 628
ENT.GrenadeDamage = 172
ENT.FuseTime = 3.4

ENT.ExplosionParticle = UO.Particles.Grenade

ENT.Model = "models/weapons/w_eq_fraggrenade_thrown.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.31
ENT.PhysElasticity = 0.25

function ENT:PostDetonation()
    UO.Shrapnel(self, self:GetAttacker(), 30, 14, 900)
end
