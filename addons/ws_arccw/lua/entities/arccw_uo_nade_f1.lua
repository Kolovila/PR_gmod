AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "F-1"

local UO = ArcCW.UO

ENT.GrenadeRadius = 500
ENT.GrenadeDamage = 130
ENT.FuseTime = 3.8

ENT.ExplosionParticle = UO.Particles.Grenade

ENT.Model = "models/simpnades/w_f1.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.6
ENT.PhysElasticity = 0.15

function ENT:OnGrenadeSpawned()
    if self:GetBodygroupCount(1) > 1 then
        self:SetBodygroup(1, 1)
    end
end

function ENT:PostDetonation()
    local attacker = self:GetAttacker()

    UO.Shrapnel(self, attacker, 36, 30, 3000)

    UO.Shrapnel(self, attacker, 14, 24, 2000, Vector(0, 0, 1), 1.4)
end
