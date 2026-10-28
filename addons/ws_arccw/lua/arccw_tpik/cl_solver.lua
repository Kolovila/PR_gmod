ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK
local cv = TPIK.CVars

local ENTITY = FindMetaTable("Entity")
local entityGetBoneMatrix = ENTITY.GetBoneMatrix
local entitySetBoneMatrix = ENTITY.SetBoneMatrix

local getBone = TPIK.GetBone

local childBoneCache = {}

local function collectChildren(ent, bone, out, stopBone)
    local children = ent:GetChildBones(bone)
    if not children then return end

    for i = 1, #children do
        local id = children[i]

        if id ~= stopBone then
            collectChildren(ent, id, out, stopBone)
            out[#out + 1] = id
        end
    end
end

local function getChildren(ent, bone, stopBone)
    local mdl = ent:GetModel() or ""
    local perModel = childBoneCache[mdl]

    if not perModel then
        perModel = {}
        childBoneCache[mdl] = perModel
    end

    local key = tostring(bone) .. ":" .. tostring(stopBone or "")
    local cached = perModel[key]
    if cached then return cached end

    local bones = {}
    collectChildren(ent, bone, bones, stopBone)
    perModel[key] = bones

    return bones
end

local function applyBoneMatrix(ent, bone, newMatrix, stopBone)
    local matrix = entityGetBoneMatrix(ent, bone)
    if not matrix then return end

    local inverse = matrix:GetInverse()
    if not inverse then return end

    local translate = newMatrix * inverse
    local children = getChildren(ent, bone, stopBone)

    for i = 1, #children do
        local id = children[i]
        local mat = entityGetBoneMatrix(ent, id)

        if mat then
            local moved = translate * mat
            entitySetBoneMatrix(ent, id, moved)
            ent:SetBonePosition(id, moved:GetTranslation(), moved:GetAngles())
        end
    end

    entitySetBoneMatrix(ent, bone, newMatrix)
    ent:SetBonePosition(bone, newMatrix:GetTranslation(), newMatrix:GetAngles())
end

local function tweenAlpha(speed)
    return math.Clamp(1 - math.exp(-math.Clamp(speed * 1.5, 1, 60) * RealFrameTime()), 0, 1)
end

local function tweenVec(s, key, target, alpha)
    if not target then return nil end

    local current = s[key]

    if not current then
        s[key] = Vector(target)
        return s[key]
    end

    current.x = current.x + (target.x - current.x) * alpha
    current.y = current.y + (target.y - current.y) * alpha
    current.z = current.z + (target.z - current.z) * alpha

    return current
end

local function tweenAng(s, key, target, alpha)
    if not target then return nil end

    local current = s[key]

    if not current then
        s[key] = Angle(target)
        return s[key]
    end

    current:Set(LerpAngle(alpha, current, target))

    return current
end

local limbCache = {}

local function measureLimbs(ply)
    local mdl = ply:GetModel() or ""
    local cached = limbCache[mdl]

    if cached then return cached end

    local fallback = TPIK.DefaultLimbLength
    local out = {upper = fallback, fore = fallback}

    local ref = ClientsideModel(mdl, RENDERGROUP_OPAQUE)

    if IsValid(ref) then
        ref:SetNoDraw(true)
        ref:SetPos(vector_origin)
        ref:SetAngles(angle_zero)
        ref:ResetSequence(0)
        ref:SetCycle(0)
        ref:SetPlaybackRate(0)
        ref:InvalidateBoneCache()
        ref:SetupBones()

        local upperIdx = ref:LookupBone(TPIK.ArmBones.Left.UpperArm)
        local foreIdx = ref:LookupBone(TPIK.ArmBones.Left.Forearm)
        local handIdx = ref:LookupBone(TPIK.ArmBones.Left.Hand)

        local upperMat = upperIdx and upperIdx >= 0 and entityGetBoneMatrix(ref, upperIdx)
        local foreMat = foreIdx and foreIdx >= 0 and entityGetBoneMatrix(ref, foreIdx)
        local handMat = handIdx and handIdx >= 0 and entityGetBoneMatrix(ref, handIdx)

        if upperMat and foreMat then
            local length = upperMat:GetTranslation():Distance(foreMat:GetTranslation())
            if length > 0 then out.upper = length end
        end

        if foreMat and handMat then
            local length = foreMat:GetTranslation():Distance(handMat:GetTranslation())
            if length > 0 then out.fore = length end
        end

        ref:Remove()
    end

    limbCache[mdl] = out

    return out
end

local STATE_SIGHTS = 1

local ONE_HAND_ENTER = 32
local ONE_HAND_LEAVE = 26

local function leftHandUnused(wep, mirror, s, isLocal)
    if TPIK.IsReloading(wep) and not wep.TPIKDetectLeftHandDuringReload then
        return s.oneHand or false
    end

    if s.lhikActive then
        s.oneHand = false

        return false
    end

    local lIdx = getBone(mirror, TPIK.ArmBones.Left.Hand)
    local rIdx = getBone(mirror, TPIK.ArmBones.Right.Hand)

    if not lIdx or not rIdx then return false end

    local lMat = entityGetBoneMatrix(mirror, lIdx)
    local rMat = entityGetBoneMatrix(mirror, rIdx)

    if not lMat or not rMat then return false end

    local span = lMat:GetTranslation():Distance(rMat:GetTranslation())

    s.oneHand = span > (s.oneHand and ONE_HAND_LEAVE or ONE_HAND_ENTER)

    return s.oneHand
end

local NO_OFFSETS = {}

local function gatherOffsets(wep, ply, s, isLocal)
    local offsets = cv.CustomPos:GetBool() and TPIK.GetConfig(wep).Offsets or NO_OFFSETS

    local pos = Vector(offsets.Pos or vector_origin)
    local ang = Angle(offsets.Ang or angle_zero)

    local pose = TPIK.PoseOffsets[TPIK.GetHoldType(wep)] or TPIK.PoseOffsets.default

    if pose then
        if pose.Pos then pos:Add(pose.Pos) end
        if pose.Ang then ang:Add(pose.Ang) end
    end

    pos.x = pos.x + cv.OffX:GetFloat()
    pos.y = pos.y + cv.OffY:GetFloat()
    pos.z = pos.z + cv.OffZ:GetFloat()
    ang.p = ang.p + cv.AngP:GetFloat()
    ang.y = ang.y + cv.AngY:GetFloat()
    ang.r = ang.r + cv.AngR:GetFloat()

    local ft = s.repeatPass and 0 or FrameTime()

    local aim = 1 - TPIK.GetSightDelta(wep, isLocal)

    if aim > 0 then
        local eased = math.ease.InOutCubic(aim)

        if offsets.SightPos then pos:Add(offsets.SightPos * eased) end
        if offsets.SightAng then ang:Add(offsets.SightAng * eased) end
    end

    s.reloadSmooth = Lerp(ft * 10, s.reloadSmooth or 0,
        TPIK.IsReloading(wep) and (1 - aim) or 0)

    if s.reloadSmooth > 0.001 then
        if offsets.ReloadPos then pos:Add(offsets.ReloadPos * s.reloadSmooth) end
        if offsets.ReloadAng then ang:Add(offsets.ReloadAng * s.reloadSmooth) end
    end

    local sprint = TPIK.GetSprintDelta(wep, isLocal)

    if sprint > 0.001 then
        if offsets.SprintPos then pos:Add(offsets.SprintPos * sprint) end
        if offsets.SprintAng then ang:Add(offsets.SprintAng * sprint) end
    end

    return pos, ang, aim
end

local SPRINT_VEC_IN  = Vector(-2, 5, 2)
local SPRINT_VEC_OUT = Vector(0, 7, 3)
local SPRINT_ANG_IN  = Angle(-15, -15, 0)
local SPRINT_ANG_OUT = Angle(-15, 15, -22)

local SIGHT_VEC_IN   = Vector(0, 15, -4)
local SIGHT_VEC_OUT  = Vector(1, 5, -1)
local SIGHT_ANG_IN   = Angle(0, 0, -45)
local SIGHT_ANG_OUT  = Angle(-5, 0, -10)


local function buff(wep, name)
    local ok, value = pcall(wep.GetBuff, wep, name, true)

    if ok then return value end

    return nil
end

local function overrideBuff(wep, name, fallback)
    local ok, value = pcall(wep.GetBuff_Override, wep, name, fallback)

    if ok and value ~= nil then return value end

    return fallback
end

local function crouchFraction(ply)
    local stand = ply:GetViewOffset().z
    local ducked = ply:GetViewOffsetDucked().z

    if stand == ducked then return 0 end

    return math.Clamp(math.ease.InOutSine(
        (stand - ply:GetCurrentViewOffset().z) / (stand - ducked)), 0, 1)
end

local function arcCWTarget(wep, ply, s, isLocal)
    local sgtd = TPIK.GetSightDelta(wep, isLocal)
    local sprd = TPIK.GetSprintDelta(wep, isLocal)
    local state = TPIK.GetState(wep, isLocal)
    local reloading = TPIK.IsReloading(wep)

    local apos = overrideBuff(wep, "Override_ActivePos", wep.ActivePos) or vector_origin
    local aang = overrideBuff(wep, "Override_ActiveAng", wep.ActiveAng) or angle_zero

    local pos = Vector(apos)
    local ang = Angle(aang)

    if reloading then
        pos:Set(buff(wep, "ReloadPos") or apos)
        ang:Set(buff(wep, "ReloadAng") or aang)
    else
        local crouch = crouchFraction(ply)

        if crouch > 0 then
            local cpos = buff(wep, "CrouchPos")
            local cang = buff(wep, "CrouchAng")

            if isvector(cpos) then pos:Set(LerpVector(crouch, pos, cpos)) end
            if isangle(cang) then ang:Set(LerpAngle(crouch, ang, cang)) end
        end
    end

    s.customize = Lerp(s.repeatPass and 0 or math.Clamp(FrameTime() * 4, 0, 1),
        s.customize or 0, TPIK.IsCustomizing(wep, isLocal) and 1 or 0)

    if s.customize > 0.001 then
        local cpos = overrideBuff(wep, "Override_CustomizePos", wep.CustomizePos)
        local cang = overrideBuff(wep, "Override_CustomizeAng", wep.CustomizeAng)

        if isvector(cpos) then pos:Set(LerpVector(s.customize, pos, cpos)) end
        if isangle(cang) then ang:Set(LerpAngle(s.customize, ang, cang)) end
    end

    local holstered = false
    local okMode, mode = pcall(wep.GetCurrentFiremode, wep)

    if okMode and istable(mode) and mode.Mode == 0 then holstered = true end

    local shootSprint = false
    local okSprint, allowed = pcall(wep.CanShootWhileSprint, wep)

    if okSprint then shootSprint = allowed == true end

    local sd = 0

    if reloading then
        sd = 0
    elseif holstered then
        sd = 1
    elseif not shootSprint then
        sd = sprd
    end

    sd = math.pow(math.sin(sd * math.pi * 0.5), 2)

    if sd > 0.001 then
        local hpos, spos = buff(wep, "HolsterPos"), buff(wep, "SprintPos")
        local hang, sang = buff(wep, "HolsterAng"), buff(wep, "SprintAng")

        local tpos = holstered and (hpos or spos) or (spos or hpos)
        local tang = holstered and (hang or sang) or (sang or hang)

        if isvector(tpos) then pos:Set(LerpVector(sd, pos, tpos)) end
        if isangle(tang) then ang:Set(LerpAngle(sd, ang, tang)) end

        local d = math.pow(math.sin(sd * math.pi * 0.5), math.pi)
        local swing = d * math.cos(d * math.pi * 0.5)
        local sprinting = sprd > 0.5

        local jo = sprinting and SPRINT_VEC_IN or SPRINT_VEC_OUT
        local ja = sprinting and SPRINT_ANG_IN or SPRINT_ANG_OUT

        pos:Add(jo * swing)
        ang:Add(ja * swing)
    end

    local sight = TPIK.GetActiveSights(wep)

    if cv.AimAlign:GetBool() and istable(sight) and isvector(sight.Pos) then
        local delta = math.pow(math.sin(sgtd * math.pi * 0.5), math.pi)

        pos.z = pos.z - 1
        pos:Set(LerpVector(delta, sight.Pos, pos))
        ang:Set(LerpAngle(delta, isangle(sight.Ang) and sight.Ang or angle_zero, ang))

        local swing = delta * math.cos(delta * math.pi * 0.5)
        local sighted = state == STATE_SIGHTS
        local mid = sight.Midpoint

        local jo = sighted and ((mid and mid.Pos) or SIGHT_VEC_IN) or SIGHT_VEC_OUT
        local ja = sighted and ((mid and mid.Ang) or SIGHT_ANG_IN) or SIGHT_ANG_OUT

        pos:Add(jo * swing)
        ang:Add(ja * swing)

        local forward = math.Clamp(cv.ADSForward:GetFloat(), 0, 1)
        local aimed = 1 - delta

        if forward > 0 then
            pos.y = pos.y - sight.Pos.y * aimed * forward
        end

        if aimed > 0.001 then
            local push = TPIK.ADSPush

            pos.x = pos.x + push.x * aimed
            pos.y = pos.y + push.y * aimed
            pos.z = pos.z + push.z * aimed
        end
    end

    local holdType = TPIK.GetHoldType(wep)

    local hipAmount = math.Clamp(sgtd, 0, 1)
    local aimAmount = 1 - hipAmount

    local hip = TPIK.HipOffsets[holdType]

    if hip and hipAmount > 0.001 then
        pos.x = pos.x + hip.x * hipAmount
        pos.y = pos.y + hip.y * hipAmount
        pos.z = pos.z + hip.z * hipAmount
    end

    local aimOff = TPIK.AimOffsets[holdType]

    if aimOff and aimAmount > 0.001 then
        pos.x = pos.x + aimOff.x * aimAmount
        pos.y = pos.y + aimOff.y * aimAmount
        pos.z = pos.z + aimOff.z * aimAmount
    end

    return pos, ang
end

local function shoulderPoints(ply)
    local leftIdx = getBone(ply, TPIK.ArmBones.Left.UpperArm)
    local rightIdx = getBone(ply, TPIK.ArmBones.Right.UpperArm)

    if not leftIdx or not rightIdx then return nil, nil end

    local leftMat = entityGetBoneMatrix(ply, leftIdx)
    local rightMat = entityGetBoneMatrix(ply, rightIdx)

    if not leftMat or not rightMat then return nil, nil end

    local left, right = leftMat:GetTranslation(), rightMat:GetTranslation()

    return (left + right) * 0.5, right
end

local function proceduralSway(ply, s, hipness)
    local scale = cv.Sway:GetFloat()

    if scale <= 0 or hipness <= 0.001 then return nil, nil end

    local ft = s.repeatPass and 0 or FrameTime()
    local eyeAng = ply:EyeAngles()

    if not s.swayEye then s.swayEye = Angle(eyeAng) end

    s.swayEye:Set(LerpAngle(math.Clamp(ft * 9, 0, 1), s.swayEye, eyeAng))

    local dp = math.Clamp(math.NormalizeAngle(eyeAng.p - s.swayEye.p), -25, 25)
    local dy = math.Clamp(math.NormalizeAngle(eyeAng.y - s.swayEye.y), -25, 25)

    local speed = ply:GetVelocity():Length2D()
    local moving = math.Clamp(speed / 200, 0, 1)

    s.bobPhase = (s.bobPhase or 0) + ft * moving * 9

    local bob = math.sin(s.bobPhase)
    local weight = scale * hipness

    local pos = Vector(
        (-dy * 0.02 + bob * 0.35 * moving) * weight,
        0,
        (dp * 0.02 + math.abs(math.cos(s.bobPhase)) * 0.25 * moving) * weight
    )

    local ang = Angle(
        dp * 0.12 * weight,
        -dy * 0.12 * weight,
        -dy * 0.06 * weight
    )

    return pos, ang
end

local function solveArm(ply, s, side, prefix, sign, eyeAng, fullSolve, alpha, limbUpper, limbFore)
    local bones = TPIK.ArmBones[side]

    local upperIdx = getBone(ply, bones.UpperArm)
    local foreIdx = getBone(ply, bones.Forearm)
    local handIdx = getBone(ply, bones.Hand)

    if not upperIdx or not foreIdx or not handIdx then return false end

    local upperMat = entityGetBoneMatrix(ply, upperIdx)
    local foreMat = entityGetBoneMatrix(ply, foreIdx)
    local handMat = entityGetBoneMatrix(ply, handIdx)

    if not upperMat or not foreMat or not handMat then return false end

    local upperPosKey, upperAngKey = prefix .. "UpperPos", prefix .. "UpperAng"
    local forePosKey, foreAngKey = prefix .. "ForePos", prefix .. "ForeAng"

    local rootPos, rootAng = upperMat:GetTranslation(), upperMat:GetAngles()

    if fullSolve or not s[upperPosKey] then
        local elbow, hand, upperAng, foreAng = TPIK.Solve2PartIK(
            rootPos, handMat:GetTranslation(),
            limbUpper, limbFore, sign, eyeAng
        )

        s[upperPosKey .. "T"], s[upperAngKey .. "T"] = WorldToLocal(elbow, upperAng, rootPos, rootAng)
        s[forePosKey .. "T"], s[foreAngKey .. "T"] = WorldToLocal(hand, foreAng, rootPos, rootAng)
    end

    local localElbowPos = tweenVec(s, upperPosKey, s[upperPosKey .. "T"], alpha)
    local localUpperAng = tweenAng(s, upperAngKey, s[upperAngKey .. "T"], alpha)
    local localHandPos = tweenVec(s, forePosKey, s[forePosKey .. "T"], alpha)
    local localForeAng = tweenAng(s, foreAngKey, s[foreAngKey .. "T"], alpha)

    if not localElbowPos or not localHandPos then return false end

    local elbowPos, upperAng = LocalToWorld(localElbowPos, localUpperAng, rootPos, rootAng)
    local _, foreAng = LocalToWorld(localHandPos, localForeAng, rootPos, rootAng)

    upperMat:SetAngles(upperAng)
    foreMat:SetTranslation(elbowPos)
    foreMat:SetAngles(foreAng)

    applyBoneMatrix(ply, upperIdx, upperMat, foreIdx)
    applyBoneMatrix(ply, foreIdx, foreMat, handIdx)

    return true
end

local headChildCache = setmetatable({}, {__mode = "k"})

local function headChildCount(ply, headIndex)
    local mdl = ply:GetModel() or ""
    local cache = headChildCache[ply]

    if not cache or cache.mdl ~= mdl or cache.headIndex ~= headIndex then
        local children = ply:GetChildBones(headIndex)
        cache = {mdl = mdl, headIndex = headIndex, count = children and #children or 0}
        headChildCache[ply] = cache
    end

    return cache.count
end

local function cameraDelta(wep, mirror, s)
    local scale = TPIK.HeadMotionScale or 0
    if scale == 0 then return nil end

    local att = wep.CamAttachment

    if isfunction(wep.GetBuff_Override) then
        local ok, value = pcall(wep.GetBuff_Override, wep, "Override_CamAttachment", wep.CamAttachment)
        if ok and value then att = value end
    end

    if not isnumber(att) or att <= 0 then return nil end

    local data = mirror:GetAttachment(att)
    if not data then return nil end

    local _, localAng = WorldToLocal(data.Pos, data.Ang, mirror:GetPos(), mirror:GetAngles())

    if not s.camRefAng then
        s.camRefAng = Angle(localAng)
        return nil
    end

    local _, delta = WorldToLocal(vector_origin, localAng, vector_origin, s.camRefAng)

    local limit = TPIK.HeadMotionMax or 18

    return Angle(
        math.Clamp(math.NormalizeAngle(delta.p) * scale, -limit, limit),
        math.Clamp(math.NormalizeAngle(delta.y) * scale, -limit, limit),
        math.Clamp(math.NormalizeAngle(delta.r) * scale, -limit, limit)
    )
end

function TPIK.Solve(ply, wep)
    local mirror = TPIK.EnsureMirror(wep)
    if not IsValid(mirror) then return end

    local s = TPIK.State(wep)
    local isLocal = TPIK.IsLocal(ply)

    s.lastSeen = RealTime()

    local frame = FrameNumber()

    s.repeatPass = s.solveFrame == frame
    s.solveFrame = frame

    local rate = isLocal and cv.RateLocal:GetInt() or cv.RateOthers:GetInt()
    local delay = 1 / math.Clamp(rate, 5, 150)
    local fullSolve = not s.repeatPass and (s.lastSolve or 0) + delay <= CurTime()

    if not s.repeatPass then
        local sd = TPIK.GetSightDelta(wep, isLocal)

        if math.abs(sd - (s.lastSightDelta or sd)) > 0.0005 then fullSolve = true end

        s.lastSightDelta = sd
    end

    if fullSolve then s.lastSolve = CurTime() end

    ply:SetupBones()

    if not getBone(ply, TPIK.AnchorBone) then return end

    local shoulderMid, shoulderRight = shoulderPoints(ply)

    TPIK.SyncAnimation(wep, mirror, ply, isLocal, s)

    local userPos, userAng, aim = gatherOffsets(wep, ply, s, isLocal)

    local localPos, localAng = arcCWTarget(wep, ply, s, isLocal)

    localPos:Add(userPos)
    localAng:Add(userAng)

    local swayPos, swayAng = proceduralSway(ply, s, 1 - aim)

    if swayPos then
        localPos:Add(swayPos)
        localAng:Add(swayAng)
    end

    local eyePos = ply:EyePos()
    local eyeAng = ply:EyeAngles()
    local eyeRight, eyeForward, eyeUp = eyeAng:Right(), eyeAng:Forward(), eyeAng:Up()

    local ang = Angle(eyeAng)
    ang:RotateAroundAxis(eyeRight, localAng.p)
    ang:RotateAroundAxis(eyeUp, localAng.y)
    ang:RotateAroundAxis(eyeForward, localAng.r)

    local place = ang
    local lead = TPIK.ViewLeadMax

    if lead and lead > 0 then
        local diff = math.NormalizeAngle(eyeAng.y - ply:GetRenderAngles().y)

        if math.abs(diff) > lead then
            place = Angle(ang.p, ang.y - (diff - math.Clamp(diff, -lead, lead)), ang.r)
        end
    end

    local pos = Vector(eyePos)
    pos:Add(place:Right() * localPos.x)
    pos:Add(place:Forward() * localPos.y)
    pos:Add(place:Up() * localPos.z)

    local drop = cv.Drop:GetFloat()

    if shoulderMid and drop > 0 then
        local retained = 1 - math.Clamp(cv.ADSAlign:GetFloat(), 0, 1)
        local factor = Lerp(aim, 1, retained)
        local scale = TPIK.HoldDrop[TPIK.GetHoldType(wep)]

        if scale then factor = factor * scale end

        if factor > 0.001 then
            pos:Add((shoulderMid - eyePos) * (drop * factor))
        end
    end

    local toShoulder = cv.ADSShoulder:GetFloat()

    if shoulderRight and toShoulder > 0 and aim > 0.001 then
        local offset = shoulderRight - eyePos
        local lateral = eyeRight * offset:Dot(eyeRight)

        pos:Add(lateral * (toShoulder * aim))
    end

    mirror:SetPos(pos)
    mirror:SetAngles(ang)
    mirror:InvalidateBoneCache()
    mirror:SetupBones()

    local gripIdx = getBone(mirror, TPIK.AnchorBone)
    local gripMat = gripIdx and entityGetBoneMatrix(mirror, gripIdx)

    local gripPos = gripMat and gripMat:GetTranslation() or pos

    TPIK.HideProps(wep, mirror, s, gripPos)

    if TPIK.MagDropTick then TPIK.MagDropTick(wep, mirror, ply, wep.WM, "WMBone") end

    TPIK.ApplyLHIK(wep, mirror, s, isLocal, ply)

    if s.noArmBones then return end

    local dropLeft = TPIK.ShouldDropLeftHand(ply, wep, isLocal,
        leftHandUnused(wep, mirror, s, isLocal))
    local bones = dropLeft and TPIK.RightHandBones or TPIK.HandBones

    local spineIdx = getBone(ply, TPIK.SpineBone)
    local spineMat = spineIdx and entityGetBoneMatrix(ply, spineIdx)
    if not spineMat then return end

    local spinePos = spineMat:GetTranslation()
    local clamp = TPIK.BoneClamp

    for i = 1, #bones do
        local name = bones[i]
        local srcIdx = getBone(mirror, name)

        if srcIdx then
            local srcMat = entityGetBoneMatrix(mirror, srcIdx)
            local dstIdx = getBone(ply, name)
            local dstMat = dstIdx and entityGetBoneMatrix(ply, dstIdx)

            if srcMat and dstMat then
                local bonePos = srcMat:GetTranslation()
                local boneAng = srcMat:GetAngles()

                bonePos.x = math.Clamp(bonePos.x, spinePos.x - clamp, spinePos.x + clamp)
                bonePos.y = math.Clamp(bonePos.y, spinePos.y - clamp, spinePos.y + clamp)
                bonePos.z = math.Clamp(bonePos.z, spinePos.z - clamp, spinePos.z + clamp)

                dstMat:SetTranslation(bonePos)
                dstMat:SetAngles(boneAng)

                entitySetBoneMatrix(ply, dstIdx, dstMat)
                ply:SetBonePosition(dstIdx, bonePos, boneAng)
            end
        end
    end

    local aimAnim = cv.AimAnim:GetBool()

    ply.ArcCW_TPIK_SquintTarget = aimAnim and aim or 0
    ply.ArcCW_TPIK_SquintFrame = FrameNumber()

    local aimHead = aimAnim and (aim > 0.01 or (s.reloadSmooth or 0) > 0.12)
    local motionHead = cv.HeadMotion:GetBool() and cameraDelta(wep, mirror, s) or nil

    if aimHead or motionHead then
        local headIdx = getBone(ply, TPIK.HeadBone)

        if headIdx and headChildCount(ply, headIdx) < 2 then
            local headMat = entityGetBoneMatrix(ply, headIdx)

            if headMat then
                local headAng = headMat:GetAngles()

                if aimHead then
                    headAng:Add(TPIK.HeadSightAng * aim + TPIK.HeadReloadAng * (s.reloadSmooth or 0))
                end

                if motionHead then
                    headAng:RotateAroundAxis(headAng:Right(), motionHead.p)
                    headAng:RotateAroundAxis(headAng:Up(), motionHead.y)
                    headAng:RotateAroundAxis(headAng:Forward(), motionHead.r)
                end

                headMat:SetAngles(headAng)
                entitySetBoneMatrix(ply, headIdx, headMat)
            end
        end
    end

    if not s.limbUpper or s.limbModel ~= ply:GetModel() then
        local limbs = measureLimbs(ply)

        s.limbUpper = limbs.upper
        s.limbFore = limbs.fore
        s.limbModel = ply:GetModel()
    end

    local shoulder = TPIK.ShoulderPush[TPIK.GetHoldType(wep)]

    if shoulder then
        local amount = 1 - math.Clamp(aim, 0, 1)

        if amount > 0.001 then
            local ahead = Angle(0, eyeAng.y, 0):Forward() * (shoulder * amount)

            for i = 1, #TPIK.ShoulderBones do
                local entry = TPIK.ShoulderBones[i]
                local idx = getBone(ply, entry[1])
                local mat = idx and entityGetBoneMatrix(ply, idx)

                if mat then
                    mat:SetTranslation(mat:GetTranslation() + ahead)

                    applyBoneMatrix(ply, idx, mat, getBone(ply, entry[2]))
                end
            end
        end
    end

    local alpha = s.repeatPass and 0 or tweenAlpha(1 / delay)

    if not s.repeatPass then
        local moved = math.abs(aim - (s.lastAim or aim))

        s.lastAim = aim

        if moved > 0 then
            alpha = math.max(alpha, math.min(moved * TPIK.AimTrack, 1))
        end
    end

    solveArm(ply, s, "Right", "r", -1.3, eyeAng, fullSolve, alpha, s.limbUpper, s.limbFore)

    if not dropLeft then
        solveArm(ply, s, "Left", "l", 1, eyeAng, fullSolve, alpha, s.limbUpper, s.limbFore)
    end
end

function TPIK.ShouldRun(ply, wep)
    if not cv.Enabled:GetBool() then return false end

    if ply ~= LocalPlayer() then
        if not cv.Others:GetBool() then return false end

        local limit = cv.DistanceOthers:GetFloat()

        if limit > 0 then
            local running = wep.ArcCW_TPIK ~= nil
            local edge = running and limit * 1.15 or limit

            if EyePos():DistToSqr(ply:GetPos()) > edge * edge then
                return false
            end
        end
    end

    if not cv.Sprint:GetBool() and TPIK.IsSprinting(wep, TPIK.IsLocal(ply)) then
        return false
    end

    if hook.Run("ArcCW_TPIK_ShouldRun", ply, wep) == false then return false end

    return not TPIK.IsBlocked(ply, wep)
end

local flexCache = setmetatable({}, {__mode = "k"})

local function getFlex(ply, name)
    local mdl = ply:GetModel() or ""
    local cache = flexCache[ply]

    if not cache or cache.mdl ~= mdl then
        cache = {mdl = mdl, ids = {}}
        flexCache[ply] = cache
    end

    local cached = cache.ids[name]
    if cached ~= nil then
        return cached ~= false and cached or nil
    end

    local id = ply:GetFlexIDByName(name)
    cache.ids[name] = id or false

    return id
end

hook.Add("Think", "ArcCW_TPIK.Squint", function()
    local frame = FrameNumber()
    local rate = FrameTime() * TPIK.AimEyeSpeed

    for _, ply in player.Iterator() do
        local target = 0

        if ply.ArcCW_TPIK_SquintFrame and frame - ply.ArcCW_TPIK_SquintFrame <= 1 then
            target = ply.ArcCW_TPIK_SquintTarget or 0
        end

        local current = ply.ArcCW_TPIK_Squint or 0

        if current ~= target then
            current = Lerp(rate, current, target)

            if math.abs(current - target) < 0.002 then current = target end

            ply.ArcCW_TPIK_Squint = current
        end
    end
end)

local function applySquint(ply)
    local squint = ply.ArcCW_TPIK_Squint or 0
    local applied = ply.ArcCW_TPIK_SquintApplied or 0

    if squint <= 0.001 and applied <= 0.001 then return end

    for name, weight in pairs(TPIK.AimEyeFlexes) do
        local id = getFlex(ply, name)
        if id then ply:SetFlexWeight(id, weight * squint) end
    end

    for _, name in ipairs(TPIK.AimEyeSuppress) do
        local id = getFlex(ply, name)
        if id then ply:SetFlexWeight(id, 0) end
    end

    ply.ArcCW_TPIK_SquintApplied = squint
end

cvars.AddChangeCallback("arccw_tpik_aim_animation", function(_, _, new)
    if tonumber(new) ~= 0 then return end

    for _, ply in player.Iterator() do
        ply.ArcCW_TPIK_SquintTarget = 0
    end
end, "ArcCW_TPIK.Squint")

local function passiveActivity(ply, velocity)
    if ply:WaterLevel() > 1 then
        return ACT_HL2MP_SWIM_PASSIVE or ACT_HL2MP_SWIM
    end

    if not ply:OnGround() then
        return ACT_HL2MP_JUMP_PASSIVE or ACT_HL2MP_JUMP
    end

    local moving = velocity:Length2DSqr() > 4

    if ply:Crouching() then
        if moving then
            return ACT_HL2MP_WALK_CROUCH_PASSIVE or ACT_HL2MP_WALK_CROUCH
        end

        return ACT_HL2MP_IDLE_CROUCH_PASSIVE or ACT_HL2MP_IDLE_CROUCH
    end

    if moving then
        local running = velocity:Length2D() > (ply:GetWalkSpeed() + 20)

        if running then return ACT_HL2MP_RUN_PASSIVE or ACT_HL2MP_RUN end

        return ACT_HL2MP_WALK_PASSIVE or ACT_HL2MP_WALK
    end

    return ACT_HL2MP_IDLE_PASSIVE or ACT_HL2MP_IDLE
end

                                                                            
                                                                               
                                                                               
hook.Add("CalcMainActivity", "ArcCW_TPIK.NeutralHoldType", function(ply, velocity)
    local wep = ply:GetActiveWeapon()

    if not IsValid(wep) or not wep.TPIKDisableHoldType then return end
    if not TPIK.ShouldRun(ply, wep) then return end

    local activity = passiveActivity(ply, velocity)
    local sequence = ply:SelectWeightedSequence(activity)

    return activity, sequence
end)

if not TPIK.GestureDetour then
    TPIK.GestureDetour = true

    local PLAYER = FindMetaTable("Player")
    local originalAddVCD = PLAYER.AddVCDSequenceToGestureSlot
    local originalRestart = PLAYER.AnimRestartGesture

    local function suppressed(ply)
        if not TPIK.CVars or not TPIK.CVars.Gestures:GetBool() then return false end
        if not TPIK.CVars.Enabled:GetBool() then return false end

        local wep = ply:GetActiveWeapon()
        if not IsValid(wep) then return false end

        local s = wep.ArcCW_TPIK

        if s ~= nil and IsValid(s.mirror) then return true end

        return not TPIK.IsBlocked(ply, wep)
    end

    function PLAYER:AddVCDSequenceToGestureSlot(slot, sequence, cycle, autokill)
        if slot == GESTURE_SLOT_ATTACK_AND_RELOAD and suppressed(self) then return end

        return originalAddVCD(self, slot, sequence, cycle, autokill)
    end

    function PLAYER:AnimRestartGesture(slot, act, autokill)
        if slot == GESTURE_SLOT_ATTACK_AND_RELOAD and suppressed(self) then return end

        return originalRestart(self, slot, act, autokill)
    end
end

hook.Add("PrePlayerDraw", "ArcCW_TPIK", function(ply, flags)
    if not IsValid(ply) then return end

    local frame = FrameNumber()
    local firstPass = ply.ArcCW_TPIK_Frame ~= frame

    ply.ArcCW_TPIK_Frame = frame

    local wep = ply:GetActiveWeapon()

    if firstPass then
        applySquint(ply)

        if ply.ArcCW_TPIK_Weapon ~= wep then
            if IsValid(ply.ArcCW_TPIK_Weapon) then
                TPIK.ReleaseMirror(ply.ArcCW_TPIK_Weapon)
            end

            ply.ArcCW_TPIK_Weapon = IsValid(wep) and wep or nil
        end
    end

    if not IsValid(wep) then return end

    if not TPIK.ShouldRun(ply, wep) then
        local s = wep.ArcCW_TPIK

        if s then
            s.blockedAt = s.blockedAt or CurTime()

            if CurTime() - s.blockedAt >= (TPIK.BlockGrace or 0) then
                TPIK.ReleaseMirror(wep)
            end
        end

        return
    end

    local s = wep.ArcCW_TPIK
    if s then s.blockedAt = nil end

    TPIK.Solve(ply, wep)
end)

hook.Add("PostPlayerDraw", "ArcCW_TPIK", function(ply, flags)
    if not IsValid(ply) then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) then return end

    local s = wep.ArcCW_TPIK
    if not s or not IsValid(s.mirror) then return end

    TPIK.DrawMirror(wep, s.mirror, flags)
end)

local function rebuildAll()
    TPIK.ReleaseAll()
end

TPIK.RebuildAll = rebuildAll

cvars.AddChangeCallback("arccw_tpik", rebuildAll, "ArcCW_TPIK")
cvars.AddChangeCallback("arccw_tpik_viewmodel_ik", rebuildAll, "ArcCW_TPIK.IK")
cvars.AddChangeCallback("arccw_tpik_filter", rebuildAll, "ArcCW_TPIK.Filter")

concommand.Add("arccw_tpik_rebuild", rebuildAll, nil,
    "Throw away every mirrored weapon and build them again")
