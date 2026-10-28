AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "RGO"

local UO = ArcCW.UO

ENT.GrenadeRadius = 600
ENT.GrenadeDamage = 180
ENT.FuseTime = 4

ENT.ImpactFuse = true
ENT.ImpactFuseSpeed = 140
ENT.ArmTime = 0.9

ENT.ExplosionParticle = UO.Particles.HE

ENT.Model = "models/weapons/w_rgo.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.53
ENT.PhysElasticity = 0.12
ENT.PhysDamping = {0.3, 1.2}

ENT.FragCount = 40
ENT.FragDamage = 15
ENT.FragRange = 1100

ENT.ArmSound = UO.Sound("buttons/button17.wav", "buttons/blip1.wav")

function ENT:OnGrenadeSpawned()
    if self:GetBodygroupCount(1) > 1 then
        self:SetBodygroup(1, 1)
    end
end

if SERVER then

    function ENT:OnArmed()
        if !self.ImpactFuse then return end
        self:EmitSound(UO.PickSound(self.ArmSound), 60, 170, 0.4)
    end

    function ENT:PostDetonation()
        UO.Shrapnel(self, self:GetAttacker(), self.FragCount, self.FragDamage, self.FragRange)
    end

end

if CLIENT then
    function ENT:GrenadeThinkCL()
        if !self:GetArmed() then return end
        if self.Ticks % 6 != 0 then return end

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = self:GetPos()
            dl.r, dl.g, dl.b = 255, 120, 60
            dl.Brightness = 0.6
            dl.Decay = 1200
            dl.Size = 45
            dl.DieTime = CurTime() + 0.1
        end
    end
end
