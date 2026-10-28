if SERVER then
    AddCSLuaFile()
    return
end

function EFFECT:Init(data)
    local origin = data:GetOrigin()
    local direction = data:GetNormal()
    local scale = math.max(data:GetScale(), 0.5)
    local emitter = ParticleEmitter(origin)

    if not emitter then
        return
    end

    for _ = 1, 18 do
        local particle = emitter:Add(
            "particle/smokesprites_000" .. math.random(1, 9),
            origin + direction * math.Rand(0, 28) + VectorRand() * 5
        )

        if particle then
            local shade = math.random(24, 48)

            particle:SetVelocity(direction * math.Rand(130, 260) * scale + VectorRand() * 45)
            particle:SetDieTime(math.Rand(0.8, 1.45))
            particle:SetStartAlpha(math.random(145, 205))
            particle:SetEndAlpha(0)
            particle:SetStartSize(math.Rand(10, 18) * scale)
            particle:SetEndSize(math.Rand(38, 62) * scale)
            particle:SetRoll(math.Rand(-180, 180))
            particle:SetRollDelta(math.Rand(-0.8, 0.8))
            particle:SetColor(shade, shade, shade)
            particle:SetAirResistance(70)
            particle:SetGravity(Vector(0, 0, math.Rand(18, 34)))
            particle:SetLighting(false)
        end
    end

    emitter:Finish()
end

function EFFECT:Think()
    return false
end

function EFFECT:Render() end
