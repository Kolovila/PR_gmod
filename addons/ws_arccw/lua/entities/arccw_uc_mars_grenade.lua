AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "MARS High-Velocity Grenade"
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/items/ar2_grenade.mdl"
ENT.GrenadeDamage = 130
ENT.GrenadeRadius = 240
ENT.FuseTime = 6
ENT.DetonateOnImpact = true
ENT.Gravity = false
ENT.Drag = false

function ENT:Initialize()
    self.BaseClass.Initialize(self)

    local entity = self.Entity or self
    entity:SetMoveType(MOVETYPE_VPHYSICS)
    entity:SetSolid(SOLID_VPHYSICS)
    entity:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
end

function ENT:PhysicsCollide(data, phys)
    if not SERVER or not IsValid(self) then return end
    if data.HitEntity == self:GetOwner() then return end

    self:Detonate()
end
