AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "M67"

local UO = ArcCW.UO

ENT.GrenadeRadius = 838
ENT.GrenadeDamage = 200
ENT.FuseTime = 5

ENT.ExplosionParticle = UO.Particles.HE

ENT.Model = "models/simpnades/w_m67.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.4
ENT.PhysElasticity = 0.08
ENT.PhysDamping = {0.4, 1.5}

function ENT:OnGrenadeSpawned()
    if self:GetBodygroupCount(1) > 1 then
        self:SetBodygroup(1, 1)
    end
end

function ENT:PostDetonation()
    UO.Shrapnel(self, self:GetAttacker(), 44, 16, 1300)
end
