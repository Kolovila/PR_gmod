AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Javelin tandem HEAT missile"
ENT.Spawnable = false
ENT.NoPhys = true
ENT.ArcCW_Killable = true

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "HasTarget")
    self:NetworkVar("Bool", 1, "MotorLit")
end

function ENT:Initialize()
    self:SetModel("models/weapons/tfa_mw2cr/javelin/javelin_missile.mdl")
    self:DrawShadow(false)
    if CLIENT then
        return
    end
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_BBOX)
    self:SetCollisionBounds(Vector(-3, -3, -3), Vector(3, 3, 3))
    self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
    self.Born = CurTime()
    self.LastThink = self.Born
    self.LaunchPos = self:GetPos()
    self.LaunchDir = self:GetForward()
    self.Direction = self.LaunchDir
    self.DistanceTravelled = 0
    self.Speed = 350
    self:SetHealth(15)
    self:SetMotorLit(false)
end

if SERVER then
    function ENT:Detonate(pos, hit)
        if self.Exploded then
            return
        end
        self.Exploded = true
        self:SetHasTarget(false)
        if self.DistanceTravelled < (self.Profile and self.Profile.armingDistance or 220) then
            self:Remove()
            return
        end
        pos = pos or self:GetPos()
        local owner = IsValid(self:GetOwner()) and self:GetOwner() or self
        local inflictor = IsValid(self.Inflictor) and self.Inflictor or self
        local root = UCJavelin.Resolve(hit)
        if IsValid(root) then
            hit = root
        end
        if IsValid(hit) and not hit:IsWorld() then
            local dmg = DamageInfo()

            local jet = self.Profile and self.Profile.jet or 2400
            dmg:SetDamage(jet * (self.DirectAttack and 0.75 or 1))
            dmg:SetDamageType(DMG_AIRBOAT)
            dmg:SetAttacker(owner)
            dmg:SetInflictor(inflictor)
            dmg:SetDamagePosition(pos)
            dmg:SetDamageForce(self.Direction * 24000)
            hit:TakeDamageInfo(dmg)
        end
        local blast = DamageInfo()
        blast:SetDamage(self.Damage or 180)
        blast:SetDamageType(DMG_BLAST)
        blast:SetAttacker(owner)
        blast:SetInflictor(inflictor)
        blast:SetDamagePosition(pos)
        util.BlastDamageInfo(blast, pos, self.Profile and self.Profile.radius or 260)
        local effect = EffectData()
        effect:SetOrigin(pos)
        effect:SetNormal(-self.Direction)
        effect:SetScale(self.Profile and math.max(0.35, self.Profile.scale * 2) or 2)
        util.Effect("Explosion", effect, true, true)
        util.ScreenShake(pos, self.Profile and self.Profile.scale * 12 or 12, 100, 0.7, 900)
        self:EmitSound("BaseExplosionEffect.Sound", self.Profile and self.Profile.scale < 1 and 75 or 100, 95)
        self:Remove()
    end

    function ENT:OnTakeDamage(dmg)
        if self.Exploded then
            return
        end
        local source = dmg:GetInflictor()

        if
            IsValid(source)
            and (
                source == self.Inflictor
                or (source:GetClass() == "arccw_uc_javelin_missile" and source:GetOwner() == self:GetOwner())
            )
        then
            return
        end
        self:SetHealth(self:Health() - dmg:GetDamage())
        if self:Health() <= 0 then
            self:Detonate()
        end
    end

    function ENT:Think()
        local now = CurTime()
        local dt = math.Clamp(now - self.LastThink, 0, 0.1)
        self.LastThink = now
        local age = now - self.Born
        local profile = self.Profile
        local maxSpeed = profile and profile.maxSpeed or 3600
        local motorDelay = (profile and profile.motorDelay or 0.35)
            + math.floor((self.Lane or 0) / (profile and profile.count or 1)) * 0.08
        if
            age > (profile and profile.lifetime or 18)
            or self.DistanceTravelled > (profile and profile.maxDistance or 24000)
            or self:WaterLevel() > 0
        then
            self:SetHasTarget(false)
            self:Remove()
            return
        end
        local pos = self:GetPos()
        if age >= motorDelay and not self:GetMotorLit() then
            self:SetMotorLit(true)
            self:EmitSound(
                "weapons/tfa_mw2r/javelin/h1_wep_jav_ign_mn.wav",
                profile and profile.scale < 1 and 65 or 85,
                100,
                0.8
            )
            util.SpriteTrail(
                self,
                0,
                Color(190, 190, 180, 150),
                false,
                9 * (profile and profile.scale or 1),
                1,
                1,
                0.05,
                "trails/smoke.vmt"
            )
        end
        if self:GetMotorLit() then
            self.Speed = math.Approach(self.Speed, maxSpeed, dt * (profile and profile.acceleration or 2400))
        end
        local target = self.Target

        if
            self:GetMotorLit()
            and not (profile and profile.unguided)
            and Glide
            and Glide.GetClosestFlare
            and not self.Seduced
        then
            local flare, distance = Glide.GetClosestFlare(pos, self.Direction, 1200)
            if IsValid(flare) then
                self.Target = flare
                target = flare
                self.Seduced = true
                self.Terminal = true
                self:SetHasTarget(false)
            end
        end
        if not IsValid(target) then
            self:SetHasTarget(false)
        end
        if
            profile
            and profile.proximity
            and not self.Seduced
            and IsValid(target)
            and self.DistanceTravelled >= profile.armingDistance
            and pos:Distance(target:WorldSpaceCenter()) < profile.proximity
        then
            local line = util.TraceLine({
                start = pos,
                endpos = target:WorldSpaceCenter(),
                mask = MASK_SHOT,
                filter = { self, self:GetOwner(), self.Inflictor },
            })
            if not line.Hit or line.Entity == target or UCJavelin.Resolve(line.Entity) == target then
                self:Detonate(pos)
                return
            end
        end
        if profile and profile.unguided then
            local launch = (self.LaunchDirection or self.LaunchDir):Angle()
            launch.p = launch.p + math.min(age * age * 0.12, 1.6) + math.sin(age * 5 + self.Born) * 0.28
            launch.y = launch.y + math.sin(age * 4.3 + self.Born * 0.7 + (self.Lane or 0)) * 0.28
            self.Direction = launch:Forward()
        end
        if age >= motorDelay and IsValid(target) then
            local point = target:WorldSpaceCenter()
            local distance = pos:Distance(point)
            point = point + target:GetVelocity() * math.Clamp(distance / math.max(self.Speed, 1000), 0, 1.25)
            if not self.InitialRange then
                self.InitialRange = self.LaunchPos:Distance(point)
                self.Loft = math.Clamp(self.InitialRange * 0.32, 450, 2200)
                self.ClimbUntil = now + math.Clamp(self.InitialRange / maxSpeed * 0.65, 0.7, 3.2)
            end
            if not self.DirectAttack and not self.Terminal then
                local waypoint = LerpVector(0.45, self.LaunchPos, point)
                waypoint.z = math.max(self.LaunchPos.z, point.z) + self.Loft
                if pos:Distance(waypoint) < 160 or now >= self.ClimbUntil then
                    self.Terminal = true
                else
                    point = waypoint
                end
            end
            local desired = (point - pos):GetNormalized()
            local angle = self.Direction:Angle()
            local goal = desired:Angle()
            local turn = dt * (self.Terminal and 300 or 180) * (profile and profile.turn or 1)
            angle.p = math.ApproachAngle(angle.p, goal.p, turn)
            angle.y = math.ApproachAngle(angle.y, goal.y, turn)
            self.Direction = angle:Forward()

            local terminalSpeed = math.Clamp(distance * 2, math.min(650, maxSpeed * 0.4), maxSpeed)
            self.Speed = math.Approach(self.Speed, terminalSpeed, dt * 9000)
            if distance < 1800 and not self.ApproachSound and (not profile or profile.scale == 1) then
                self.ApproachSound = true
                self:EmitSound("weapons/tfa_mw2r/javelin/missile_approaching.wav", 85, 100, 0.7)
            end
        end
        local nextPos = pos + self.Direction * self.Speed * dt
        local hull = 3 * (profile and profile.scale or 1)
        local tr = util.TraceHull({
            start = pos,
            endpos = nextPos,
            mins = Vector(-hull, -hull, -hull),
            maxs = Vector(hull, hull, hull),
            mask = MASK_SHOT,
            filter = function(ent)
                return ent ~= self
                    and ent ~= self:GetOwner()
                    and ent ~= self.Inflictor
                    and not (
                        ent:GetClass() == "arccw_uc_javelin_missile" and ent:GetOwner() == self:GetOwner()
                    )
            end,
        })
        self.DistanceTravelled = self.DistanceTravelled + pos:Distance(tr.HitPos)
        if tr.HitSky then
            self:Remove()
            return
        end
        if tr.Hit then
            self:Detonate(tr.HitPos, tr.Entity)
            return
        end
        self:SetPos(nextPos)
        self:SetAngles(self.Direction:Angle())
        self:NextThink(now)
        return true
    end
end

if CLIENT then
    local glow = Material("sprites/light_glow02_add")
    function ENT:Draw()
        self:DrawModel()
        if not self:GetMotorLit() then
            return
        end
        render.SetMaterial(glow)
        local scale = self:GetModelScale()
        render.DrawSprite(
            self:GetPos() - self:GetForward() * 16 * scale,
            24 * scale,
            24 * scale,
            Color(255, 180, 90)
        )
    end
end
