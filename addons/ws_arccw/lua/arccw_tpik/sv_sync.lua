ArcCW_TPIK = ArcCW_TPIK or {}

local TPIK = ArcCW_TPIK

util.AddNetworkString("arccw_tpik_anim")
util.AddNetworkString("arccw_tpik_lhik")

local LHIK_COOLDOWN = 0.05

net.Receive("arccw_tpik_lhik", function(_, ply)
    if not IsValid(ply) then return end

    local now = CurTime()

    if (ply.ArcCW_TPIK_LHIKNext or 0) > now then return end
    ply.ArcCW_TPIK_LHIKNext = now + LHIK_COOLDOWN

    local seq = net.ReadUInt(12)
    local length = net.ReadUInt(12)

    net.Start("arccw_tpik_lhik")
        net.WriteEntity(ply)
        net.WriteUInt(seq, 12)
        net.WriteUInt(length, 12)
    net.SendPVS(ply:GetPos())
end)

local RESYNC_INTERVAL = 1

local RATE_SCALE = 128
local RATE_BIAS = 4
local RATE_MAX = 4095

local tracked = setmetatable({}, {__mode = "k"})

local function send(ply, seq, rate, cycle, toPlayer)
    net.Start("arccw_tpik_anim")
        net.WriteEntity(ply)
        net.WriteUInt(math.Clamp(seq, 0, 4095), 12)
        net.WriteUInt(math.Clamp(math.floor((rate + RATE_BIAS) * RATE_SCALE), 0, RATE_MAX), 12)
        net.WriteUInt(math.Clamp(math.floor(cycle * 255), 0, 255), 8)

    if toPlayer then
        net.Send(toPlayer)
    else
        net.SendPVS(ply:GetPos())
    end
end

local function cycleNow(vm, seq, rate, startTime)
    local duration = vm:SequenceDuration(seq) or 0
    if duration <= 0 then return 0 end

    local elapsed = CurTime() - (startTime or CurTime())
    if elapsed <= 0 then return 0 end

    local cycle = elapsed * rate / duration
    local info = vm:GetSequenceInfo(seq)
    if istable(info) and bit.band(info.flags or 0, 1) ~= 0 then
        return cycle % 1
    end

    -- A completed reload must stay finished during periodic resyncs.
    return math.Clamp(cycle, 0, 1)
end

hook.Add("Think", "ArcCW_TPIK.Sync", function()
    local now = CurTime()

    for _, ply in player.Iterator() do
        local wep = ply:GetActiveWeapon()

        if not IsValid(wep) or not TPIK.IsArcCWWeapon(wep) then
            tracked[ply] = nil
            continue
        end

        local vm = ply:GetViewModel()
        if not IsValid(vm) then continue end

        local seq = vm:GetSequence() or 0
        local rate = vm:GetPlaybackRate() or 1
        local start = wep.LastAnimStartTime or 0

        local state = tracked[ply]

        if state and state.wep == wep and state.seq == seq
            and state.rate == rate and state.start == start
        then
            if now >= state.resync then
                state.resync = now + RESYNC_INTERVAL
                send(ply, seq, rate, cycleNow(vm, seq, rate, start))
            end

            continue
        end

        tracked[ply] = {
            wep = wep,
            seq = seq,
            rate = rate,
            start = start,
            resync = now + RESYNC_INTERVAL
        }

        send(ply, seq, rate, 0)
    end
end)

local function fullResync(target)
    if not IsValid(target) then return end

    for _, ply in player.Iterator() do
        local state = tracked[ply]
        if not state then continue end

        local vm = ply:GetViewModel()
        if not IsValid(vm) then continue end

        send(ply, state.seq, state.rate,
            cycleNow(vm, state.seq, state.rate, state.start), target)
    end
end

hook.Add("PlayerInitialSpawn", "ArcCW_TPIK.Sync", function(ply)
    timer.Simple(5, function() fullResync(ply) end)
end)

hook.Add("PlayerDisconnected", "ArcCW_TPIK.Sync", function(ply)
    tracked[ply] = nil
end)
