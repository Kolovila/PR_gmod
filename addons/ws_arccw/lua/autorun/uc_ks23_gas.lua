AddCSLuaFile()
UC_KS23 = UC_KS23 or {}

UC_KS23.GasProfiles = {
    ch6 = { radius = 200, duration = 16, power = 0.80, recovery = 4, damage = 1.0, punch = 0.9, onset = 0.24 },
    ch12 = {
        radius = 340,
        duration = 22,
        power = 0.90,
        recovery = 5,
        damage = 1.2,
        punch = 1.25,
        onset = 0.28,
    },
    cn = { radius = 140, duration = 12, power = 0.75, recovery = 3, damage = 0.8, punch = 0.75, onset = 0.22 },
    cs = { radius = 190, duration = 18, power = 1.0, recovery = 5.5, damage = 0.6, punch = 1.5, onset = 0.34 },
}
local channel = "uc_ks23_irritant"
if SERVER then
    util.AddNetworkString(channel)
    UC_KS23.GasClouds = UC_KS23.GasClouds or {}
    local exposed = setmetatable({}, { __mode = "k" })
    function UC_KS23.GasPulse(origin, kind, inflictor)
        local profile = UC_KS23.GasProfiles[kind]
        if not profile then
            return
        end
        for _, ent in ipairs(ents.FindInSphere(origin, profile.radius)) do
            local player = ent:IsPlayer()
            if (player and ent:Alive()) or ent:IsNPC() then
                local eye = ent:EyePos()
                local tr = util.TraceLine({
                    start = origin + Vector(0, 0, 8),
                    endpos = eye,
                    filter = inflictor,
                    mask = MASK_OPAQUE,
                })
                if not tr.Hit or tr.Entity == ent then
                    local strength = profile.power
                        * math.Clamp(1 - origin:Distance(eye) / profile.radius, 0, 1)
                    if strength > 0.03 then
                        exposed[ent] = CurTime() + profile.recovery
                        if player then
                            local current = (ent.UCKS23GasUntil or 0) > CurTime()
                                    and (ent.UCKS23GasPower or 0)
                                or 0
                            ent.UCKS23GasUntil =
                                math.max(ent.UCKS23GasUntil or 0, CurTime() + profile.recovery)
                            ent.UCKS23GasPower = math.Clamp(
                                current + strength * profile.onset,
                                0,
                                math.max(current, profile.power)
                            )
                            ent.UCKS23GasPower = math.max(ent.UCKS23GasPower, strength * 0.35)
                            ent:ViewPunch(
                                Angle(
                                    math.Rand(-1, 1) * profile.punch * strength,
                                    math.Rand(-1, 1) * profile.punch * strength,
                                    0
                                )
                            )
                            net.Start(channel)
                            net.WriteFloat(ent.UCKS23GasPower)
                            net.WriteFloat(math.max(0.1, ent.UCKS23GasUntil - CurTime()))
                            net.Send(ent)
                        else
                            if ent.SetNPCState then
                                ent:SetNPCState(NPC_STATE_ALERT)
                            end
                            ent:SetSchedule(SCHED_RUN_FROM_ENEMY or SCHED_COWER)
                        end

                        if CurTime() >= (ent.UCKS23GasDamageAt or 0) then
                            ent.UCKS23GasDamageAt = CurTime() + 0.5
                            local d = DamageInfo()
                            d:SetInflictor(IsValid(inflictor) and inflictor or ent)
                            local owner = IsValid(inflictor) and inflictor.GetOwner and inflictor:GetOwner()
                                or nil
                            d:SetAttacker(
                                IsValid(owner) and owner or (IsValid(inflictor) and inflictor or ent)
                            )
                            d:SetDamage(profile.damage * math.Clamp(strength / profile.power, 0.25, 1))
                            d:SetDamageType(DMG_NERVEGAS)
                            ent:TakeDamageInfo(d)
                        end
                    end
                end
            end
        end
    end
    local nextRecovery = 0
    hook.Add("Think", "uc_ks23_irritant_recovery", function()
        if CurTime() < nextRecovery then
            return
        end
        nextRecovery = CurTime() + 0.5
        for ent, finish in pairs(exposed) do
            if not IsValid(ent) then
                exposed[ent] = nil
            elseif finish <= CurTime() then
                if
                    ent:IsNPC()
                    and (
                        ent:GetCurrentSchedule() == SCHED_COWER
                        or ent:GetCurrentSchedule() == SCHED_RUN_FROM_ENEMY
                    )
                then
                    ent:ClearSchedule()
                end
                exposed[ent] = nil
            end
        end
    end)
    hook.Add("PlayerDeath", "uc_ks23_irritant_cleanup", function(ply)
        ply.UCKS23GasUntil = nil
        ply.UCKS23GasPower = nil
        ply.UCKS23GasDamageAt = nil
        exposed[ply] = nil
        net.Start(channel)
        net.WriteFloat(0)
        net.WriteFloat(0)
        net.Send(ply)
    end)
else
    local power, finish, recovery = 0, 0, 1
    net.Receive(channel, function()
        local received, duration = net.ReadFloat(), net.ReadFloat()
        if duration <= 0 then
            power = 0
            finish = 0
            local ply = LocalPlayer()
            if IsValid(ply) then
                ply.UCKS23GasUntil = nil
                ply.UCKS23GasPower = nil
            end
            return
        end
        power = math.max(power * math.Clamp((finish - CurTime()) / recovery, 0, 1), received)
        recovery = math.max(duration, 0.1)
        finish = CurTime() + recovery
        local ply = LocalPlayer()
        if IsValid(ply) then
            ply.UCKS23GasUntil = finish
            ply.UCKS23GasPower = power
        end
    end)
    hook.Add("RenderScreenspaceEffects", "uc_ks23_irritant_vision", function()
        local ply = LocalPlayer()
        if not IsValid(ply) then
            power = 0
            finish = 0
            return
        end
        if not ply:Alive() then
            power = 0
            finish = 0
            ply.UCKS23GasUntil = nil
            ply.UCKS23GasPower = nil
            return
        end
        if CurTime() >= finish then
            return
        end
        local amount = power * math.Clamp((finish - CurTime()) / recovery, 0, 1)
        DrawMotionBlur(0.45, 0.72 * amount, 0.008)
        DrawColorModify({
            ["$pp_colour_addr"] = 0.015 * amount,
            ["$pp_colour_addg"] = 0.04 * amount,
            ["$pp_colour_addb"] = 0.015 * amount,
            ["$pp_colour_brightness"] = 0.02 * amount,
            ["$pp_colour_contrast"] = 1 - 0.3 * amount,
            ["$pp_colour_colour"] = 1 - 0.6 * amount,
            ["$pp_colour_mulr"] = 0,
            ["$pp_colour_mulg"] = 0,
            ["$pp_colour_mulb"] = 0,
        })
    end)
end

hook.Add("SetupMove", "uc_ks23_irritant_movement", function(ply, move)
    local finish = ply.UCKS23GasUntil or 0
    if finish <= CurTime() then
        ply.UCKS23GasPower = nil
        return
    end
    local amount = (ply.UCKS23GasPower or 0) * math.Clamp((finish - CurTime()) / 3, 0, 1)
    move:SetMaxSpeed(move:GetMaxSpeed() * (1 - 0.35 * amount))
    move:SetMaxClientSpeed(move:GetMaxClientSpeed() * (1 - 0.35 * amount))
end)
