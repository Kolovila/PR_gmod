UCJavelin = UCJavelin or {}
local J = UCJavelin
J.ArmourNPCs = {
    npc_helicopter = true,
    npc_combinegunship = true,
    npc_combinedropship = true,
    npc_combineapc = true,
    npc_strider = true,
}

function J.Resolve(ent, personnel)
    if not IsValid(ent) then
        return NULL
    end
    local original = ent
    if ent:IsPlayer() then
        ent = ent:GetVehicle()
    end
    local current, fallback = ent, NULL
    for _ = 1, 8 do
        if not IsValid(current) then
            break
        end
        if current.IsGlideVehicle then
            return current
        end
        if current:IsVehicle() or J.ArmourNPCs[current:GetClass()] then
            fallback = current
        end
        current = current:GetParent()
    end
    if IsValid(fallback) then
        return fallback
    end
    if
        personnel
        and IsValid(original)
        and original:Health() > 0
        and (original:IsPlayer() or original:IsNPC())
        and (not original:IsPlayer() or original:Alive())
    then
        return original
    end
    return NULL
end

function J.Targets(weapon)
    local personnel = IsValid(weapon) and weapon:GetBuff_Override("Override_UCJPersonnel") == true
    if personnel then
        if (J.NextPersonnelScan or 0) > CurTime() then
            return J.PersonnelCache or {}
        end
        J.NextPersonnelScan = CurTime() + 0.5
        J.PersonnelCache = {}
        local seen = {}
        for _, ent in ipairs(ents.GetAll()) do
            local root = J.Resolve(ent, true)
            if IsValid(root) and not seen[root] then
                seen[root] = true
                J.PersonnelCache[#J.PersonnelCache + 1] = root
            end
        end
        return J.PersonnelCache
    end
    if (J.NextScan or 0) > CurTime() then
        return J.Cache or {}
    end
    J.NextScan = CurTime() + 0.5
    J.Cache = {}
    local seen = {}
    for _, ent in ipairs(ents.GetAll()) do
        local root = J.Resolve(ent)
        if IsValid(root) and not seen[root] then
            seen[root] = true
            J.Cache[#J.Cache + 1] = root
        end
    end
    return J.Cache
end

function J.AimPoint(ent)
    return ent:WorldSpaceCenter()
end

function J.Visible(owner, ent)
    local tr = util.TraceLine({
        start = owner:GetShootPos(),
        endpos = J.AimPoint(ent),
        mask = MASK_SHOT,
        filter = { owner, owner:GetActiveWeapon() },
    })
    return not tr.Hit or tr.Entity == ent or J.Resolve(tr.Entity) == ent
end

function J.Warn(ent, missile)
    if not SERVER or not Glide or not IsValid(ent) then
        return
    end
    local recipients
    if ent.IsGlideVehicle and ent.GetAllPlayers then
        recipients = ent:GetAllPlayers()
    elseif ent:IsVehicle() and IsValid(ent:GetDriver()) then
        recipients = ent:GetDriver()
    end
    if not recipients then
        return
    end
    if IsValid(missile) and Glide.SendMissileDanger then
        Glide.SendMissileDanger(recipients, missile)
    elseif Glide.SendLockOnDanger then
        Glide.SendLockOnDanger(recipients)
    end
end
