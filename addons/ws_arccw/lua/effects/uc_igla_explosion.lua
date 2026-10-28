AddCSLuaFile()

function EFFECT:Init(data)
    self.Start = data:GetOrigin()
    self.Scale = data:GetScale()
    self.DirVec = data:GetNormal()

    self.Emitter = ParticleEmitter(self.Start)
    if not self.Emitter then
        return
    end

    for i = 1, 2 * self.Scale do
        local Expl = self.Emitter:Add("particles/iw4_muzzleflash", self.Start)
        if Expl then
            Expl:SetDieTime(math.Rand(0.5, 1))
            Expl:SetStartAlpha(255)
            Expl:SetEndAlpha(0)
            Expl:SetStartSize(120 * self.Scale)
            Expl:SetEndSize(110 * self.Scale)
            Expl:SetRollDelta(math.Rand(-0.5, 0.5))
            Expl:SetAirResistance(1200)
            Expl:SetGravity(Vector(0, 0, math.Rand(-100, -400)))
            Expl:SetColor(255, 255, 255)
        end
    end

    for i = 1, 10 * self.Scale do
        local Fire = self.Emitter:Add("sprites/iw4_smoke1", self.Start)
        if Fire then
            Fire:SetVelocity((VectorRand():GetNormalized() + self.DirVec) * 1000)
            Fire:SetDieTime(math.Rand(0.8, 1.5))
            Fire:SetStartAlpha(255)
            Fire:SetEndAlpha(0)
            Fire:SetStartSize(50 * self.Scale)
            Fire:SetEndSize(70 * self.Scale)
            Fire:SetRollDelta(math.Rand(-0.5, 0.5))
            Fire:SetAirResistance(800)
            Fire:SetGravity(Vector(0, 0, math.Rand(-100, -400)))
            Fire:SetColor(50, 50, 50)
        end
    end

    for i = 1, 10 * self.Scale do
        local Fire = self.Emitter:Add("sprites/iw4_basicglow", self.Start)
        if Fire then
            Fire:SetVelocity((VectorRand():GetNormalized() + self.DirVec) * 1500)
            Fire:SetDieTime(math.Rand(0.2, 0.6))
            Fire:SetStartAlpha(255)
            Fire:SetEndAlpha(0)
            Fire:SetStartSize(40 * self.Scale)
            Fire:SetEndSize(50 * self.Scale)
            Fire:SetRollDelta(math.Rand(-0.5, 0.5))
            Fire:SetAirResistance(700)
            Fire:SetGravity(Vector(0, 0, math.Rand(-100, -400)))
            Fire:SetColor(255, 255, 255)
        end
    end

    local Flash = self.Emitter:Add("effects/muzzleflash" .. math.random(1, 4), self.Start)
    if Flash then
        Flash:SetVelocity(self.DirVec * 50)
        Flash:SetAirResistance(200)
        Flash:SetDieTime(0.15)
        Flash:SetStartAlpha(255)
        Flash:SetEndAlpha(50)
        Flash:SetStartSize(self.Scale * 200)
        Flash:SetEndSize(self.Scale * 100)
        Flash:SetRoll(math.Rand(180, 480))
        Flash:SetRollDelta(math.Rand(-1, 1))
        Flash:SetColor(255, 255, 255)
    end

    for i = 1, 30 * self.Scale do
        local Debris = self.Emitter:Add("effects/fleck_cement" .. math.random(1, 2), self.Start)
        if Debris then
            Debris:SetVelocity(
                self.DirVec * math.random(0, 300) * self.Scale
                    + VectorRand():GetNormalized() * math.random(0, 500) * self.Scale
            )
            Debris:SetDieTime(math.random(1, 2) * self.Scale)
            Debris:SetStartAlpha(255)
            Debris:SetEndAlpha(0)
            Debris:SetStartSize(math.random(5, 10) * self.Scale)
            Debris:SetRoll(math.Rand(0, 360))
            Debris:SetRollDelta(math.Rand(-5, 5))
            Debris:SetAirResistance(40)
            Debris:SetColor(50, 53, 45)
            Debris:SetGravity(Vector(0, 0, -600))
        end
    end

    self.Emitter:Finish()
end

function EFFECT:Think()
    return false
end
function EFFECT:Render() end
