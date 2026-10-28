function EFFECT:Init(data)
    local pos, scale = data:GetOrigin(), data:GetScale()
    local emitter = ParticleEmitter(pos)
    if not emitter then
        return
    end
    for i = 1, 3 do
        local smoke = emitter:Add("sprites/iw4_smoke" .. i, pos)
        if smoke then
            smoke:SetVelocity(data:GetNormal() * math.Rand(120, 240) + VectorRand() * 30)
            smoke:SetDieTime(math.Rand(0.6, 1.1))
            smoke:SetStartAlpha(130)
            smoke:SetEndAlpha(0)
            smoke:SetStartSize(3 * scale)
            smoke:SetEndSize(45 * scale)
            smoke:SetColor(190, 190, 180)
            smoke:SetRoll(math.Rand(0, 360))
            smoke:SetRollDelta(math.Rand(-1, 1))
            smoke:SetAirResistance(120)
            smoke:SetGravity(Vector(0, 0, 25))
            smoke:SetLighting(true)
        end
    end
    local flame = emitter:Add("particles/iw4_muzzleflash", pos)
    if flame then
        flame:SetVelocity(data:GetNormal() * 300)
        flame:SetDieTime(0.045)
        flame:SetStartAlpha(255)
        flame:SetEndAlpha(0)
        flame:SetStartSize(12 * scale)
        flame:SetEndSize(2 * scale)
        flame:SetColor(255, 200, 130)
        flame:SetLighting(false)
    end
    local spark = emitter:Add("sprites/iw4_nicespark", pos)
    if spark then
        spark:SetVelocity(data:GetNormal() * 550 + VectorRand() * 70)
        spark:SetDieTime(0.15)
        spark:SetStartAlpha(220)
        spark:SetEndAlpha(0)
        spark:SetStartSize(2)
        spark:SetEndSize(0)
        spark:SetColor(255, 180, 80)
        spark:SetLighting(false)
    end
    emitter:Finish()
end
function EFFECT:Think()
    return false
end
function EFFECT:Render() end
