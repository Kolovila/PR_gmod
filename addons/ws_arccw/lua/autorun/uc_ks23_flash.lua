AddCSLuaFile()
UC_KS23 = UC_KS23 or {}
local channel = "uc_ks23_zvezda"

if SERVER then
    util.AddNetworkString(channel)

    function UC_KS23.Flash(wep)
        if not IsValid(wep) then
            return
        end
        local owner = wep:GetOwner()
        if not IsValid(owner) then
            return
        end
        local aim, eye = owner:GetAimVector(), owner:GetShootPos()
        local muzzle = util.TraceLine({
            start = eye,
            endpos = eye + aim * 28,
            filter = { owner, wep },
            mask = MASK_SOLID,
        })
        local origin = muzzle.Hit and (muzzle.HitPos - aim * 2) or muzzle.HitPos
        local radius = 10 / 0.0254
        for _, ent in ipairs(ents.FindInSphere(origin, radius)) do
            local player = ent:IsPlayer()
            if ent ~= owner and (player or ent:IsNPC()) and (not player or ent:Alive()) then
                local target = ent:EyePos()
                local offset = target - origin
                local distance = offset:Length()
                local direction = offset:GetNormalized()
                local alignment = aim:Dot(direction)
                local beam = math.Clamp((alignment - 0.72) / 0.22, 0, 1)
                if beam > 0 then
                    local tr = util.TraceLine({
                        start = origin,
                        endpos = target,
                        mask = MASK_OPAQUE,
                        filter = { owner, wep },
                    })
                    if not tr.Hit or tr.Entity == ent then
                        local falloff = math.Clamp(1 - distance / radius, 0, 1)
                        local facing = player
                                and math.Clamp((ent:GetAimVector():Dot(-direction) + 1) * 0.5, 0, 1)
                            or 1
                        local strength = falloff * beam * (0.18 + 0.82 * facing)
                        local duration = 4 * strength
                        if duration > 0.08 then
                            if player then
                                local now = CurTime()
                                local hold = math.min(2.3, duration * 0.65)
                                local recovery = 0.65 + duration * 0.65
                                ent:ScreenFade(
                                    SCREENFADE.IN,
                                    Color(255, 255, 255, math.floor(255 * math.min(1, strength * 1.8))),
                                    recovery,
                                    hold
                                )
                                ent:ViewPunch(Angle(-1.5, 0, 2) * strength)
                                local id = "uc_ks23_hearing_" .. ent:EntIndex()

                                ent.UC_KS23HearingUntil =
                                    math.max(ent.UC_KS23HearingUntil or 0, now + 0.8 + 3 * falloff * beam)
                                ent:SetDSP(37, false)
                                timer.Create(id, 0.2, 0, function()
                                    if not IsValid(ent) then
                                        timer.Remove(id)
                                        return
                                    end
                                    if not ent:Alive() or CurTime() >= (ent.UC_KS23HearingUntil or 0) then
                                        ent:SetDSP(0, false)
                                        ent.UC_KS23HearingUntil = nil
                                        timer.Remove(id)
                                    end
                                end)
                                net.Start(channel)
                                net.WriteFloat(strength)
                                net.WriteFloat(hold)
                                net.WriteFloat(recovery + 1)
                                net.WriteVector(origin)
                                net.Send(ent)
                            else
                                ent.UC_KS23FlashedUntil =
                                    math.max(ent.UC_KS23FlashedUntil or 0, CurTime() + duration)
                                ent:SetSchedule(SCHED_COWER)
                                local id = "uc_ks23_cower_" .. ent:EntIndex()
                                timer.Create(id, 0.25, 0, function()
                                    if not IsValid(ent) then
                                        timer.Remove(id)
                                        return
                                    end
                                    if CurTime() >= (ent.UC_KS23FlashedUntil or 0) then
                                        ent.UC_KS23FlashedUntil = nil
                                        ent:ClearSchedule()
                                        timer.Remove(id)
                                    else
                                        ent:SetSchedule(SCHED_COWER)
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end
        local fx = EffectData()
        fx:SetOrigin(origin)
        util.Effect("arccw_flashexplosion", fx, true, true)
        wep:EmitSound("weapons/arccw/flashbang/flashbang_explode1.wav", 110, 112, 0.85)
    end
    hook.Add("PlayerDeath", "uc_ks23_flash_cleanup", function(ply)
        if ply.UC_KS23HearingUntil then
            ply:SetDSP(0, false)
        end
        ply.UC_KS23HearingUntil = nil
        timer.Remove("uc_ks23_hearing_" .. ply:EntIndex())
    end)
else
    local state
    local glow = Material("sprites/light_glow02_add")
    net.Receive(channel, function()
        local power = net.ReadFloat()
        local hold = net.ReadFloat()
        local recovery = net.ReadFloat()
        local pos = net.ReadVector():ToScreen()
        local now = CurTime()
        if not state or now >= state.finish then
            state = { power = 0, finish = 0 }
        end
        state.power = math.max(state.power, power)
        state.start = now
        state.fade = now + hold
        state.finish = math.max(state.finish, now + hold + recovery)
        state.x, state.y = math.Clamp(pos.x / ScrW(), 0.15, 0.85), math.Clamp(pos.y / ScrH(), 0.15, 0.85)
    end)
    hook.Add("RenderScreenspaceEffects", "uc_ks23_flash_recovery", function()
        if not state then
            return
        end
        local ply = LocalPlayer()
        if not IsValid(ply) or not ply:Alive() or CurTime() >= state.finish then
            state = nil
            return
        end
        local remaining =
            math.Clamp((state.finish - CurTime()) / math.max(state.finish - state.fade, 0.01), 0, 1)
        local amount = state.power * remaining
        DrawColorModify({
            ["$pp_colour_addr"] = 0,
            ["$pp_colour_addg"] = 0,
            ["$pp_colour_addb"] = 0.025 * amount,
            ["$pp_colour_brightness"] = 0.035 * amount,
            ["$pp_colour_contrast"] = 1 - 0.3 * amount,
            ["$pp_colour_colour"] = 1 - 0.8 * amount,
            ["$pp_colour_mulr"] = 0,
            ["$pp_colour_mulg"] = 0,
            ["$pp_colour_mulb"] = 0,
        })
        DrawMotionBlur(0.15, 0.45 * amount, 0.01)
    end)
    hook.Add("HUDPaint", "uc_ks23_retinal_afterimage", function()
        if not state or CurTime() < state.fade then
            return
        end
        local remaining =
            math.Clamp((state.finish - CurTime()) / math.max(state.finish - state.fade, 0.01), 0, 1)
        surface.SetMaterial(glow)
        surface.SetDrawColor(145, 175, 230, math.floor(60 * state.power * remaining))
        local size = ScrH() * (0.22 + 0.12 * state.power)
        surface.DrawTexturedRect(ScrW() * state.x - size / 2, ScrH() * state.y - size / 2, size, size)
    end)
end
