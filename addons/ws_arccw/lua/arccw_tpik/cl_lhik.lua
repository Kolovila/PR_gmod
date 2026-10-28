ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

local ENTITY = FindMetaTable("Entity")
local entityGetBoneMatrix = ENTITY.GetBoneMatrix
local entitySetBoneMatrix = ENTITY.SetBoneMatrix

local getBone = TPIK.GetBone

local TIME_SCALE = 64

TPIK.RemoteLHIK = TPIK.RemoteLHIK or setmetatable({}, {__mode = "k"})

net.Receive("arccw_tpik_lhik", function()
    local ply = net.ReadEntity()
    local seq = net.ReadUInt(12)
    local length = net.ReadUInt(12) / TIME_SCALE

    if not IsValid(ply) or not ply:IsPlayer() then return end
    if ply == LocalPlayer() then return end
    if length <= 0 then return end

    TPIK.RemoteLHIK[ply] = {seq = seq, length = length, start = RealTime()}
end)

local lastSentStart, lastSentSeq

hook.Add("Think", "ArcCW_TPIK.LHIKBroadcast", function()
    local ply = LocalPlayer()
    if not IsValid(ply) then return end

    local wep = ply:GetActiveWeapon()

    if not IsValid(wep) or not TPIK.IsArcCWWeapon(wep) then
        lastSentStart, lastSentSeq = nil, nil
        return
    end

    local start = wep.LHIKAnimationStart
    local seq = wep.LHIKAnimation
    local length = wep.LHIKAnimationTime

    if not isnumber(start) then return end

    if start == lastSentStart and seq == lastSentSeq then return end

    lastSentStart, lastSentSeq = start, seq

    if not isnumber(seq) or seq < 0 then return end
    if not isnumber(length) or length <= 0 then return end

    net.Start("arccw_tpik_lhik")
        net.WriteUInt(math.Clamp(seq, 0, 4095), 12)
        net.WriteUInt(math.Clamp(math.floor(length * TIME_SCALE), 0, 4095), 12)
    net.SendToServer()
end)

local function qerp(delta, a, b)
    local qdelta = math.Clamp(-(delta * delta) + (delta * 2), 0, 1)

    return Lerp(qdelta, a, b)
end

local function findLHIKSlot(wep)
    local attachments = wep.Attachments
    if not istable(attachments) then return nil end

    local atts = ArcCW and ArcCW.AttachmentTable

    for i, slot in pairs(attachments) do
        if slot.Installed and slot.WElement then
            local ok, lhik = pcall(wep.GetBuff_Stat, wep, "LHIK", i)

            if ok and lhik then
                local att = atts and atts[slot.Installed]

                if not (att and att.LHIKHide) then return slot end
            end
        end
    end

    return nil
end

local function blend(wep, s, isLocal, attachmentBusy)
    if attachmentBusy then
        s.lhikBlend = 1

        return 1, nil
    end

    local timeline = isLocal and wep.LHIKTimeline or nil

    if not istable(timeline) or #timeline == 0 then
        local target = 1

        if not isLocal and TPIK.IsReloading(wep) then target = 0 end

        s.lhikBlend = Lerp(math.Clamp(FrameTime() * 6, 0, 1), s.lhikBlend or 1, target)

        return s.lhikBlend, nil
    end

    local now = UnPredictedCurTime()
    local start = wep.LHIKStartTime or 0
    local nextIndex

    for i, entry in ipairs(timeline) do
        if entry.t and entry.t + start > now then
            nextIndex = i
            break
        end
    end

    local stage, nextStage

    if nextIndex == 1 then
        stage, nextStage = {t = 0, lhik = 0}, timeline[1]
    elseif nextIndex then
        stage, nextStage = timeline[nextIndex - 1], timeline[nextIndex]
    else
        stage = timeline[#timeline]
        nextStage = {t = wep.LHIKEndTime or start, lhik = stage.lhik}
    end

    local span = nextStage.t - stage.t
    local fraction = span ~= 0 and ((now - start) - stage.t) / span or 1

    s.lhikBlend = qerp(fraction, stage.lhik, nextStage.lhik)

    local key

    if stage.lhik > nextStage.lhik then
        key = "in"
    elseif nextStage.lhik > stage.lhik then
        key = "out"
    end

    return s.lhikBlend, key
end

local function activeAnimation(wep, ply, isLocal)
    if isLocal then
        local seq = wep.LHIKAnimation
        local start = wep.LHIKAnimationStart
        local length = wep.LHIKAnimationTime

        if not isnumber(seq) or seq < 0 then return nil end
        if not isnumber(start) or not isnumber(length) or length <= 0 then return nil end

        local cycle = (UnPredictedCurTime() - start) / length

        if cycle >= 0 and cycle < 1 then return seq, cycle end

        return nil
    end

    local remote = TPIK.RemoteLHIK[ply]
    if not remote then return nil end

    local cycle = (RealTime() - remote.start) / remote.length

    if cycle >= 0 and cycle < 1 then return remote.seq, cycle end

    return nil
end

local function animate(wep, model, s, key, delta, seq, cycle, isLocal)
    if seq then
        if model:GetSequence() ~= seq then model:SetSequence(seq) end

        model:SetCycle(cycle)
        model:SetPlaybackRate(0)

        return
    end

    if key then
        local ok, translated = pcall(wep.GetBuff_Hook, wep, "Hook_LHIK_TranslateAnimation", key)
        if ok and isstring(translated) then key = translated end

        local seqIn = model:LookupSequence(key)

        if seqIn and seqIn > 0 then
            model:SetSequence(seqIn)
            model:SetCycle(math.Clamp(delta, 0, 1))
            model:SetPlaybackRate(0)

            return
        end
    end

    if isLocal and wep.LHIKAnimation_IsIdle == false then
        wep.LHIKAnimation_IsIdle = true
    end

    local ok, translated = pcall(wep.GetBuff_Hook, wep, "Hook_LHIK_TranslateAnimation", "idle")
    local idleKey = (ok and isstring(translated)) and translated or "idle"

    if idleKey == "DoNotPlayIdle" then return end

    local seq = model:LookupSequence(idleKey)
    if not seq or seq < 0 then return end

    if model:GetSequence() ~= seq then
        model:ResetSequence(seq)
        model:SetPlaybackRate(1)
    end

    local duration = model:SequenceDuration() or 0

    if duration > 0 then
        model:SetCycle((model:GetCycle() + RealFrameTime() / duration) % 1)
    end
end

function TPIK.ApplyLHIK(wep, mirror, s, isLocal, ply)
    s.lhikActive = false

    local bones = ArcCW and ArcCW.LHIKBones
    if not istable(bones) then return end

    local slot = findLHIKSlot(wep)

    if not slot then
        s.lhikBlend = nil
        return
    end

    local element = slot.WElement
    local model = element and element.Model

    if not IsValid(model) then return end

    local pos, ang = TPIK.PlaceElement(mirror, slot, element)
    if not pos then return end

    local seq, cycle = activeAnimation(wep, ply, isLocal)
    local delta, key = blend(wep, s, isLocal, seq ~= nil)

    model:SetPos(pos)
    model:SetAngles(ang)

    animate(wep, model, s, key, delta, seq, cycle, isLocal)

    model:InvalidateBoneCache()
    model:SetupBones()

    if delta <= 0.001 then return end

    s.lhikActive = true

    for i = 1, #bones do
        local name = bones[i]
        local srcIdx = getBone(model, name)
        local dstIdx = getBone(mirror, name)

        if srcIdx and dstIdx then
            local srcMat = entityGetBoneMatrix(model, srcIdx)
            local dstMat = entityGetBoneMatrix(mirror, dstIdx)

            if srcMat and dstMat then
                local blended = Matrix()

                blended:SetTranslation(LerpVector(delta, dstMat:GetTranslation(), srcMat:GetTranslation()))
                blended:SetAngles(LerpAngle(delta, dstMat:GetAngles(), srcMat:GetAngles()))

                entitySetBoneMatrix(mirror, dstIdx, blended)
            end
        end
    end
end
