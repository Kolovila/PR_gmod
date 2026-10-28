AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "uc_ks23_gas_round"
ENT.PrintName = "Volna Inert Practice Container"
ENT.Spawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
function ENT:Initialize()
    if CLIENT then
        return
    end
    self.BaseClass.Initialize(self)
    self:SetModel("models/weapons/arccw/uc_ks23/canister_volna.mdl")
    self.DieAt = CurTime() + 8
end
function ENT:PhysicsCollide(data)
    if SERVER and not self.Impacted then
        self.Impacted = true
        self.ImpactDamage = 35
        self:ApplyImpact(data)
        self:EmitSound("physics/plastic/plastic_box_impact_soft1.wav", 55, 110, 0.5)
    end
end
function ENT:Think()
    if CLIENT then
        return
    end
    if CurTime() >= self.DieAt then
        self:Remove()
        return
    end
    self:NextThink(CurTime() + 0.1)
    return true
end
function ENT:BeginCloud() end
