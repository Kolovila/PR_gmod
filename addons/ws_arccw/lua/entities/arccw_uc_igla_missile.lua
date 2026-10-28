AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "9M39 Igla Missile"
ENT.Spawnable = false
ENT.NoPhys = true
ENT.ArcCW_Killable = true

function ENT:Initialize()
    self:SetModel("models/uc_igla/igla_missile.mdl")
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_BBOX)
    self:SetCollisionBounds(Vector(-2, -2, -2), Vector(2, 2, 2))
    self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
    self:DrawShadow(false)
    if CLIENT then
        return
    end
    self.Profile = self.Profile or table.Copy(UCIgla.Rounds.ir)
    self.Kind = self.Kind or "ir"
    self.Direction = (self.CurVel or self:GetForward()):GetNormalized()
    self.Speed = 900
    self.Born = CurTime()
    self.LastThink = self.Born
    self.Travelled = 0
    self:SetHealth(12)
    self:NextThink(CurTime())
end

function ENT:GuidancePoint()
    local owner = self.Attacker
    if self.Kind == "laser" then
        if not IsValid(owner) or not IsValid(self.Launcher) or not self.Launcher:IglaAiming() then
            return
        end
        local tr = util.TraceLine({
            start = owner:GetShootPos(),
            endpos = owner:GetShootPos() + owner:GetAimVector() * self.Profile.range,
            filter = { owner, self.Launcher, self },
            mask = MASK_SHOT,
        })
        return tr.HitPos
    end
    if self.Kind == "passive" then
        if
            not IsValid(self.Launcher)
            or not self.Launcher:IglaAiming()
            or not self.Launcher:GetNW2Bool("UCIglaLocked", false)
        then
            return
        end
        local _, kind = UCIgla.Profile(self.Launcher)
        if kind ~= "passive" then
            return
        end
        self.Target = self.Launcher:GetNW2Entity("UCIglaTarget")
        if not self.Launcher:IglaCheck(self.Target, true) then
            return
        end
    elseif self.Kind == "active" and (self.NextSearch or 0) <= CurTime() then
        self.NextSearch = CurTime() + 0.15

        if not self:Trackable(self.Target) then
            local best, score = NULL, math.huge
            for _, ent in ipairs(ents.FindInSphere(self:GetPos(), 6000)) do
                if self:Trackable(ent) then
                    local distance = self:GetPos():DistToSqr(UCIgla.Point(ent))
                    if distance < score then
                        best, score = ent, distance
                    end
                end
            end
            self.Target = best
        end
    end
    if not self:Trackable(self.Target) then
        return
    end

    local distance = self:GetPos():Distance(UCIgla.Point(self.Target))
    return UCIgla.Point(self.Target)
        + self.Target:GetVelocity() * math.min(distance / math.max(self.Speed, 1), 0.75)
end
function ENT:Trackable(ent)
    if not UCIgla.Target(ent) or UCIgla.Friendly(self.Attacker, ent) then
        return false
    end

    if ent:GetNW2Bool("UCIglaDecoy", false) or hook.Run("UCIglaRejectTarget", self, ent) then
        return false
    end
    local delta = UCIgla.Point(ent) - self:GetPos()
    if delta:Length() > self.Profile.range then
        return false
    end
    if delta:GetNormalized():Dot(self.Direction) < math.cos(math.rad(55)) then
        return false
    end
    return UCIgla.Visible(self:GetPos(), ent, { self, self:GetOwner() })
end

function ENT:Think()
    if CLIENT then
        local motor = self:GetNW2Bool("UCIglaMotor", false)
        if motor and not self.UCIglaTrail then
            ParticleEffectAttach("rockettrail_smoke", PATTACH_POINT_FOLLOW, self, 2)
            self.UCIglaTrail = true
        elseif not motor and self.UCIglaTrail then
            self:StopParticles()
            self.UCIglaTrail = nil
        end
        return
    end
    if self.Exploded then
        return
    end
    local now = CurTime()
    local dt = math.Clamp(now - self.LastThink, 0.001, 0.05)
    self.LastThink = now
    local age = now - self.Born
    if age >= 16 then
        self:Detonate()
        return
    end
    if self:WaterLevel() >= 3 then
        self:Remove()
        return
    end
    if age >= self.Profile.ignition and not self.Ignited then
        self.Ignited = true
        self:SetNW2Bool("UCIglaMotor", true)
        self:EmitSound("igla/motor_ignition.wav", 105, 100, 0.85)
        self:EmitSound("igla/fire.wav", 95, 100, 0.6)
        self.Hiss = CreateSound(self, "igla/missile_hiss.wav")
        self.Hiss:PlayEx(0.6, 100)
    end
    if self.Ignited then
        if age <= 5 then
            self.Speed = math.Approach(self.Speed, self.Profile.speed, dt * 16000)
        end
        local point = self:GuidancePoint()
        if point then
            self.Direction =
                UCIgla.Turn(self.Direction, (point - self:GetPos()):GetNormalized(), self.Profile.turn * dt)
            self.LastTrack = now
        elseif self.Kind == "ir" and self.LastTrack and now - self.LastTrack > 0.4 then
            self.Target = NULL
        end
    end
    if age > 5 then
        self:SetNW2Bool("UCIglaMotor", false)
        if self.Hiss then
            self.Hiss:Stop()
        end
        self.Speed = math.max(3000, self.Speed - 250 * dt)
        self.Direction = (self.Direction * self.Speed + Vector(0, 0, -250 * dt)):GetNormalized()
    end
    local previous = self:GetPos()
    local fuseTrack = self:Trackable(self.Target)
    local nextpos = previous + self.Direction * self.Speed * dt
    local tr = util.TraceHull({
        start = previous,
        endpos = nextpos,
        mins = Vector(-2, -2, -2),
        maxs = Vector(2, 2, 2),
        filter = { self, self:GetOwner(), self.Launcher },
        mask = MASK_SHOT,
    })
    self.Travelled = self.Travelled + previous:Distance(tr.HitPos)
    self.Armed = age >= 0.4 and self.Travelled >= 450
    self:SetPos(tr.HitPos)
    local ang = self.Direction:Angle()
    ang:RotateAroundAxis(ang:Up(), 90)
    self:SetAngles(ang)
    if tr.HitSky then
        self:Remove()
        return
    end
    if tr.Hit then
        if self.Armed then
            self:Detonate()
        else
            self:EmitSound("igla/clank.wav", 65)
            self:Remove()
        end
        return
    end

    if self.Armed and self.Profile.fuse > 0 and fuseTrack then
        local targetpos = UCIgla.Point(self.Target)
        local segment = nextpos - previous
        local t = math.Clamp((targetpos - previous):Dot(segment) / math.max(segment:LengthSqr(), 1), 0, 1)
        local closest = previous + segment * t
        if
            closest:DistToSqr(targetpos) <= self.Profile.fuse ^ 2
            and UCIgla.Visible(closest, self.Target, { self, self:GetOwner() })
        then
            self:SetPos(closest)
            self:Detonate()
            return
        end
    end
    self:NextThink(now)
    return true
end

function ENT:OnTakeDamage(damage)
    if not SERVER or self.Exploded then
        return
    end
    self:SetHealth(self:Health() - damage:GetDamage())
    if self:Health() <= 0 then
        if self.Armed then
            self:Detonate()
        else
            self:Remove()
        end
    end
end
function ENT:Detonate()
    if not SERVER or self.Exploded then
        return
    end
    self.Exploded = true
    local pos = self:GetPos()
    local attacker = IsValid(self.Attacker) and self.Attacker
        or IsValid(self:GetOwner()) and self:GetOwner()
        or self
    util.BlastDamage(
        self,
        attacker,
        pos,
        self.BlastRadius or self.Profile.radius,
        self.Damage or self.Profile.damage
    )

    if
        IsValid(self.Target)
        and UCIgla.Target(self.Target)
        and pos:Distance(UCIgla.Point(self.Target)) < (self.BlastRadius or self.Profile.radius)
        and UCIgla.Visible(pos, self.Target, { self, self:GetOwner() })
    then
        local damage = DamageInfo()
        damage:SetDamage((self.Damage or self.Profile.damage) * 0.8)
        damage:SetDamageType(DMG_AIRBOAT)
        damage:SetAttacker(attacker)
        damage:SetInflictor(self)
        damage:SetDamagePosition(pos)
        self.Target:TakeDamageInfo(damage)
    end
    local effect = EffectData()
    effect:SetOrigin(pos)
    effect:SetNormal(-self.Direction)
    effect:SetScale(0.8)
    util.Effect("uc_igla_explosion", effect, true, true)
    ParticleEffect("uc_igla_explosion_flash", pos, Angle())
    util.ScreenShake(pos, 6, 18, 0.45, 1200)
    net.Start("UCIglaExplosion")
    net.WriteVector(pos)
    net.Broadcast()
    self:Remove()
end
function ENT:OnRemove()
    self:StopParticles()
    if self.Hiss then
        self.Hiss:Stop()
    end
    if CLIENT and self.Emitter then
        self.Emitter:Finish()
    end
end
if CLIENT then
    function ENT:Draw()
        self:DrawModel()
        if not self:GetNW2Bool("UCIglaMotor", false) or (self.NextTrail or 0) > CurTime() then
            return
        end
        self.NextTrail = CurTime() + 0.025

        local effect = EffectData()
        effect:SetOrigin(self:GetPos() - self:GetRight() * 20)
        effect:SetNormal(-self:GetRight())
        effect:SetScale(0.7)
        util.Effect("uc_igla_thrust", effect)
    end
end
