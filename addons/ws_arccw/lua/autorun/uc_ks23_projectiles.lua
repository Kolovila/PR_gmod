AddCSLuaFile()
UC_KS23 = UC_KS23 or {}

function UC_KS23.ConfigureProjectile(wep, projectile, kind, model, speed, radius, impact)
    if not SERVER or not IsValid(projectile) then
        return
    end
    projectile.UCKS23GasKind = kind
    projectile.ImpactDamage = impact or 18
    projectile:SetNW2String("UCKS23GasKind", kind)
    projectile:SetModel(model)
    local direction = projectile:GetAngles():Forward()
    local owner = wep:GetOwner()
    local inherited = IsValid(owner) and owner:GetAbsVelocity() or Vector()
    local velocity = direction * speed + inherited
    projectile:PhysicsInitBox(Vector(-radius, -radius, -radius), Vector(radius, radius, radius))
    projectile:SetMoveType(MOVETYPE_VPHYSICS)
    projectile:SetSolid(SOLID_VPHYSICS)
    projectile:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
    local phys = projectile:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:SetMass(0.3)
        phys:SetMaterial("metal")
        phys:SetDragCoefficient(0.25)
        phys:SetBuoyancyRatio(0.1)
        phys:EnableGravity(true)
        phys:SetVelocityInstantaneous(velocity)
    end
    projectile.CurVel = velocity
    projectile.Fuse = CurTime() + 3
end
