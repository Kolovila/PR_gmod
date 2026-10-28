ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

TPIK.BaseClass = "arccw_base"

local baseCache = {}

function TPIK.IsArcCWWeapon(wep)
    if not IsValid(wep) or not wep.GetClass then return false end
    if wep.ArcCW == true then return true end

    local class = wep:GetClass()
    if not isstring(class) or class == "" then return false end

    local cached = baseCache[class]
    if cached ~= nil then return cached end

    local result = false

    if class == TPIK.BaseClass
        or weapons.IsBasedOn(class, TPIK.BaseClass)
        or weapons.IsBasedOn(class, "arccw_base_melee")
        or weapons.IsBasedOn(class, "arccw_base_nade")
    then
        result = true
    end

    baseCache[class] = result

    return result
end

function TPIK.ClearBaseCache()
    baseCache = {}
end

function TPIK.IsLocal(ply)
    return ply == LocalPlayer()
end

function TPIK.GetState(wep, isLocal)
    if isLocal then return wep:GetState() end

    return wep:GetNWState()
end

function TPIK.GetSightDelta(wep, isLocal)
    local delta

    if isLocal then
        delta = wep:GetSightDelta()
    else
        delta = wep:GetNWSightDelta()
    end

    return math.Clamp(tonumber(delta) or 1, 0, 1)
end

function TPIK.GetSprintDelta(wep, isLocal)
    local delta

    if isLocal then
        delta = wep:GetSprintDelta()
    else
        delta = wep:GetNWSprintDelta()
    end

    return math.Clamp(tonumber(delta) or 0, 0, 1)
end

function TPIK.IsReloading(wep)
    if wep.GetReloading and wep:GetReloading() == true then return true end

    if wep.GetShotgunReloading then
        local ok, stage = pcall(wep.GetShotgunReloading, wep)
        if ok and isnumber(stage) and stage > 0 then return true end
    end

    return false
end

function TPIK.IsCustomizing(wep, isLocal)
    return TPIK.GetState(wep, isLocal) == (ArcCW and ArcCW.STATE_CUSTOMIZE or 4)
end

function TPIK.IsSprinting(wep, isLocal)
    return TPIK.GetState(wep, isLocal) == (ArcCW and ArcCW.STATE_SPRINT or 2)
end

function TPIK.GetActiveSights(wep)
    if not wep.GetActiveSights then return wep.IronSightStruct end

    local ok, sight = pcall(wep.GetActiveSights, wep)

    if ok and istable(sight) then return sight end

    return wep.IronSightStruct
end

function TPIK.GetHoldType(wep)
    local ok, ht = pcall(wep.GetHoldType, wep)

    if ok and isstring(ht) and ht ~= "" then return ht end

    return "normal"
end

local function foreignSolverOwnsArms(ply)
    if not CLIENT then return false end
    if not GCAL or ply ~= LocalPlayer() then return false end
    if not GCAL.IsThirdPersonEnabled or not GCAL:IsThirdPersonEnabled() then return false end

    for id, track in pairs(GCAL.ActiveTracks or {}) do
        if id ~= "legs" and track.thirdperson then return true end
    end

    return false
end

function TPIK.IsBlocked(ply, wep)
    if not IsValid(ply) or not ply:IsPlayer() then return true end
    if not ply:Alive() then return true end
    if ply:InVehicle() then return true end
    if foreignSolverOwnsArms(ply) then return true end

    if not TPIK.IsArcCWWeapon(wep) then return true end
    if not isstring(wep.ViewModel) or wep.ViewModel == "" then return true end

    if TPIK.GetConfig(wep).NoTPIK then return true end
    if not TPIK.FilterAllows(wep) then return true end

    if hook.Run("ArcCW_TPIK_ShouldBlock", ply, wep) then return true end

    return false
end

function TPIK.ShouldDropLeftHand(ply, wep, isLocal, unused)
    local config = TPIK.GetConfig(wep)

    if config.ForceLeftHand then return false end
    if TPIK.IsReloading(wep) then
        if wep.TPIKDetectLeftHandDuringReload then return unused == true end

        return false
    end
    if ply:IsTyping() then return true end

    if TPIK.IsCustomizing(wep, isLocal)
        and not wep.NoHideLeftHandInCustomization
        and (wep.Customize_Hide or 0) > 0.5
    then
        return true
    end

    if config.NoLeftHand then return true end

    return unused == true
end
