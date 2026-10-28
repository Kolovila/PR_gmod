ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

local RATE_SCALE = 128
local RATE_BIAS = 4

TPIK.RemoteAnim = TPIK.RemoteAnim or setmetatable({}, {__mode = "k"})

net.Receive("arccw_tpik_anim", function()
    local ply = net.ReadEntity()
    local seq = net.ReadUInt(12)
    local rate = net.ReadUInt(12) / RATE_SCALE - RATE_BIAS
    local cycle = net.ReadUInt(8) / 255

    if not IsValid(ply) or not ply:IsPlayer() then return end

    local state = TPIK.RemoteAnim[ply]

    if not state then
        state = {}
        TPIK.RemoteAnim[ply] = state
    end

    state.seq = seq
    state.rate = rate
    state.cycle = cycle
    state.stamp = RealTime()
end)

function TPIK.GetRemoteAnim(ply)
    return TPIK.RemoteAnim[ply]
end

local STUDIO_LOOPING = 1

local loopCache = {}

function TPIK.IsLoopingSequence(ent, seq)
    local mdl = ent:GetModel() or ""
    local perModel = loopCache[mdl]

    if not perModel then
        perModel = {}
        loopCache[mdl] = perModel
    end

    local cached = perModel[seq]
    if cached ~= nil then return cached end

    local info = ent:GetSequenceInfo(seq)
    local looping = istable(info) and bit.band(info.flags or 0, STUDIO_LOOPING) ~= 0 or false

    perModel[seq] = looping

    return looping
end

local isLooping = TPIK.IsLoopingSequence

function TPIK.AdvanceCycle(ent, seq, rate, dt)
    local duration = ent:SequenceDuration(seq) or 0
    if duration <= 0 then return nil end

    local cycle = ent:GetCycle() + dt * (rate or 1) / duration

    if isLooping(ent, seq) then
        return cycle % 1
    end

    return math.Clamp(cycle, 0, 1)
end

function TPIK.AdvanceModel(ent, state)
    if not IsValid(ent) or not state or not state.seq then return end

    if ent:GetSequence() ~= state.seq then
        ent:ResetSequence(state.seq)
    end

    -- Derive the pose from the packet timestamp, not the number of render passes.
    -- Playback is manual so the engine cannot advance or wrap it a second time.
    ent:SetPlaybackRate(0)
    local duration = ent:SequenceDuration(state.seq) or 0
    local cycle = state.cycle or 0
    if duration > 0 then
        local elapsed = math.max(RealTime() - (state.stamp or RealTime()), 0)
        cycle = cycle + elapsed * (state.rate or 1) / duration
    end

    if isLooping(ent, state.seq) then
        cycle = cycle % 1
    else
        cycle = math.Clamp(cycle, 0, 1)
    end

    ent:SetCycle(cycle)
end
