AddCSLuaFile()
UC_KS23 = UC_KS23 or {}

function UC_KS23.HarpoonMass(ent)
    if not IsValid(ent) then
        return 85
    end
    local phys = ent:GetPhysicsObject()
    if IsValid(phys) then
        return math.Clamp(phys:GetMass(), 5, 5000)
    end
    return 85
end
function UC_KS23.HarpoonPullShares(owner, target)
    if not IsValid(target) then
        return 1, 0
    end
    local actor = target:IsPlayer() or target:IsNPC() or target:IsNextBot()
    local phys = target:GetPhysicsObject()
    if not actor and (not IsValid(phys) or not phys:IsMotionEnabled()) then
        return 1, 0
    end
    if actor and target:GetMoveType() ~= MOVETYPE_WALK and target:GetMoveType() ~= MOVETYPE_STEP then
        return 1, 0
    end
    local a, b = UC_KS23.HarpoonMass(owner), UC_KS23.HarpoonMass(target)
    local ownerShare
    if b <= a then
        ownerShare = 0.15 * b / a
    else
        ownerShare = 0.15 + 0.85 * (1 - a / b)
    end
    return ownerShare, 1 - ownerShare
end
function UC_KS23.ReelHarpoonTarget(line, dt)
    if not SERVER then
        return
    end
    local owner = line:GetOwner()
    local target = line.AnchorEntity
    local a, b = UC_KS23.HarpoonPullShares(owner, target)
    line:SetNW2Float("OwnerPullShare", a)
    if not IsValid(target) or b <= 0 or dt <= 0 or not owner:KeyDown(IN_ATTACK2) or owner:KeyDown(IN_USE) then
        return
    end
    if owner:GetMoveType() ~= MOVETYPE_WALK then
        return
    end
    local delta = owner:GetShootPos() - line:GetPos()
    local distance = delta:Length()
    if distance < 55 then
        return
    end
    local tr = util.TraceLine({
        start = owner:GetShootPos(),
        endpos = line:GetPos(),
        filter = { owner, line, line.Weapon, target },
        mask = MASK_SOLID,
    })
    if tr.Hit and tr.HitPos:DistToSqr(line:GetPos()) > 32 ^ 2 then
        line:Remove()
        return
    end
    local direction = delta:GetNormalized()
    local actor = target:IsPlayer() or target:IsNPC() or target:IsNextBot()
    local phys = target:GetPhysicsObject()
    local velocity = actor and target:GetVelocity() or phys:GetVelocity()
    local speed = math.min(550, math.max(100, (distance - 45) * 2)) * b
    local increment = direction * math.Clamp(speed - velocity:Dot(direction), 0, 1100 * b * dt)
    if actor then
        if target:IsPlayer() then
            target:SetVelocity(increment)
        else
            target:SetLocalVelocity(velocity + increment)
        end
    elseif IsValid(phys) then
        phys:Wake()
        phys:AddVelocity(increment)
    end
end

hook.Add("SetupMove", "UCKS23HarpoonReel", function(ply, mv)
    local line = ply:GetNW2Entity("UCKS23Line")
    if not IsValid(line) or not line:GetNW2Bool("Anchored") or not ply:Alive() then
        return
    end
    if ply:GetMoveType() ~= MOVETYPE_WALK then
        return
    end
    if not mv:KeyDown(IN_ATTACK2) or mv:KeyDown(IN_USE) then
        return
    end
    local delta = line:GetPos() - ply:GetShootPos()
    local distance = delta:Length()
    if distance < 55 then
        return
    end
    local tr = util.TraceLine({
        start = ply:GetShootPos(),
        endpos = line:GetPos(),
        filter = { ply, line, ply:GetActiveWeapon(), line:GetNW2Entity("AnchorTarget") },
        mask = MASK_SOLID,
    })
    if tr.Hit and tr.HitPos:DistToSqr(line:GetPos()) > 32 ^ 2 then
        if SERVER then
            line:Remove()
        end
        return
    end
    local direction = delta:GetNormalized()
    local velocity = mv:GetVelocity()
    local along = velocity:Dot(direction)
    local share = line:GetNW2Float("OwnerPullShare", 1)
    local target = math.min(550, math.max(100, (distance - 45) * 2)) * share
    velocity = velocity + direction * math.Clamp(target - along, 0, 1100 * share * engine.TickInterval())
    if velocity:Length() > 800 then
        velocity = velocity:GetNormalized() * 800
    end
    mv:SetVelocity(velocity)
end)

if CLIENT then
    hook.Remove("PostDrawViewModel", "UCKS23HarpoonLoadingCable")
end
