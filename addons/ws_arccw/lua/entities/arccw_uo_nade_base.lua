AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Base Hand Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false

local UO = ArcCW.UO

ENT.GrenadeDamage = false
ENT.GrenadeRadius = 0
ENT.GrenadeDamageType = nil

ENT.FuseTime = 5
ENT.FuseVariance = 0
ENT.ArmTime = 0.15
ENT.ImpactFuse = false
ENT.ImpactFuseSpeed = 0
ENT.WaterDud = false

ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
ENT.PhysMass = nil
ENT.PhysMaterial = "grenade"
ENT.PhysElasticity = nil
ENT.PhysDamping = nil
ENT.PhysDragCoefficient = nil

ENT.Model = "models/weapons/w_grenade.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"
ENT.ModelScale = nil

ENT.ExplosionEffect = true
ENT.ExplosionParticle = nil
ENT.ExplosionShake = 25
ENT.Scorch = true
ENT.ScorchDecal = "Scorch"

ENT.BounceSounds = true
ENT.SmokeTrail = false
ENT.SmokeTrailColor = Color(20, 20, 20)

ENT.ExplosionSounds = UO.Snd.Explosion
ENT.ExplosionSoundsIndoors = UO.Snd.ExplosionIn
ENT.DebrisSounds = UO.Snd.Debris
ENT.ExplosionSoundLevel = 140

ENT.GrenadeDir = Vector(0, 0, -1)

ENT.Ticks = 0
ENT.ArcCW_Killable = false

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
end

if SERVER then

    function ENT:InitPhysics()
        self:SetModel(UO.Model(self.Model, self.ModelFallback))

        if self.ModelScale then self:SetModelScale(self.ModelScale) end

        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)

        local phys = self:GetPhysicsObject()

        if !IsValid(phys) then
            self:PhysicsInitSphere(2, self.PhysMaterial)
            self:SetCollisionBounds(Vector(-2, -2, -2), Vector(2, 2, 2))
            phys = self:GetPhysicsObject()
        end

        if IsValid(phys) then
            phys:SetMaterial(self.PhysMaterial)
            if self.PhysMass then phys:SetMass(self.PhysMass) end
            if self.PhysDragCoefficient then phys:SetDragCoefficient(self.PhysDragCoefficient) end
            if self.PhysDamping then phys:SetDamping(self.PhysDamping[1], self.PhysDamping[2]) end
            phys:Wake()
        end

        if self.PhysElasticity then
            self:SetElasticity(self.PhysElasticity)
        end

        return phys
    end

    function ENT:Initialize()
        self:InitPhysics()

        self.SpawnTime = CurTime()
        self.NextBounceSound = 0

        self:SetArmed(false)
        self:SetDetonateAt(0)

        self:OnGrenadeSpawned()
    end

    function ENT:OnGrenadeSpawned()
    end

    function ENT:OnFuseSet()
        if isnumber(self.FuseTime) and self.FuseTime < math.huge then
            self:SetDetonateAt(self.SpawnTime + self.FuseTime)
        end
    end

    function ENT:Think()
        if !self.FuseRolled then
            self.FuseRolled = true
            if self.FuseVariance > 0 and isnumber(self.FuseTime) and self.FuseTime < math.huge then
                self.FuseTime = math.max(0, self.FuseTime + math.Rand(-self.FuseVariance, self.FuseVariance))
            end
            self:OnFuseSet()
        end

        local ft = self.FuseTime

        if !self:GetArmed() and CurTime() - self.SpawnTime >= self.ArmTime then
            self:SetArmed(true)
            self:OnArmed()
        end

        if self.WaterDud and self:WaterLevel() >= 2 then
            self:OnDrowned()
            return
        end

        if !self.BOOM and isnumber(ft) and ft < math.huge and CurTime() - self.SpawnTime >= ft then
            self:Detonate()
            if !IsValid(self) then return end
        end

        self:GrenadeThink()
        if !IsValid(self) then return end

        self:NextThink(CurTime())
        return true
    end

    function ENT:GrenadeThink()
    end

    function ENT:OnArmed()
    end

    function ENT:OnDrowned()
        if self.Drowned then return end
        self.Drowned = true

        self:EmitSound("ambient/water/water_splash" .. math.random(1, 3) .. ".wav", 60, 100, 0.5)
        SafeRemoveEntityDelayed(self, 6)
    end

    function ENT:PhysicsCollide(data, physobj)
        if self.BOOM then return end

        if self.BounceSounds and CurTime() >= (self.NextBounceSound or 0) then
            if data.Speed > 75 then
                self:EmitSound(UO.PickSound(UO.Snd.BounceHard), 70, math.random(95, 105))
                self.NextBounceSound = CurTime() + 0.06
            elseif data.Speed > 25 then
                self:EmitSound(UO.PickSound(UO.Snd.BounceSoft), 65, math.random(95, 105))
                self.NextBounceSound = CurTime() + 0.06
            end
        end

        self.GrenadeDir = data.OurOldVelocity:GetNormalized()

        self:OnGrenadeCollide(data, physobj)

        if self.ImpactFuse and self:GetArmed() and data.Speed >= self.ImpactFuseSpeed then
            if IsValid(data.HitEntity) and data.HitEntity == self:GetOwner() then return end

            local pos = data.HitPos
            timer.Simple(0, function()
                if !IsValid(self) then return end
                self:Detonate(pos)
            end)
        end
    end

    function ENT:OnGrenadeCollide(data, physobj)
    end

else

    function ENT:Initialize()
        self.SpawnTime = CurTime()
    end

    function ENT:Think()
        if !self.Submerged and self:WaterLevel() > 0 then
            self.Submerged = true

            local eff = EffectData()
            eff:SetOrigin(self:GetPos())
            util.Effect("watersplash", eff)
        elseif self.Submerged and self:WaterLevel() == 0 then
            self.Submerged = nil
        end

        if self.SmokeTrail and self.Ticks % 5 == 0 and self:WaterLevel() < 2 then
            local emitter = ParticleEmitter(self:GetPos())
            if IsValid(emitter) then
                local c = self.SmokeTrailColor
                local smoke = emitter:Add("particle/particle_smokegrenade", self:GetPos())
                if smoke then
                    smoke:SetVelocity(VectorRand() * 25)
                    smoke:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-20, -25)))
                    smoke:SetDieTime(math.Rand(1.5, 2.0))
                    smoke:SetStartAlpha(255)
                    smoke:SetEndAlpha(0)
                    smoke:SetStartSize(0)
                    smoke:SetEndSize(100)
                    smoke:SetRoll(math.Rand(-180, 180))
                    smoke:SetRollDelta(math.Rand(-0.2, 0.2))
                    smoke:SetColor(c.r, c.g, c.b)
                    smoke:SetAirResistance(5)
                    smoke:SetLighting(false)
                end
                emitter:Finish()
            end
        end

        self:GrenadeThinkCL()

        self.Ticks = self.Ticks + 1
    end

    function ENT:GrenadeThinkCL()
    end

    function ENT:Draw()
        self:DrawModel()
    end

end

function ENT:GetAttacker()
    local owner = self:GetOwner()
    if IsValid(owner) then return owner end
    if IsValid(self.Inflictor) and IsValid(self.Inflictor:GetOwner()) then return self.Inflictor:GetOwner() end
    return self
end

function ENT:DoDetonation()
    UO.Blast(self, self:GetAttacker(), self:GetPos(),
        self.GrenadeRadius, self.GrenadeDamage or self.Damage or 0, self.GrenadeDamageType)
end

function ENT:PostDetonation()
end

function ENT:Detonate(pos)
    if !IsValid(self) or self.BOOM then return end
    if CLIENT then return end
    self.BOOM = true

    pos = pos or self:GetPos()

    local water = self:WaterLevel() >= 1

    if self.ExplosionEffect then
        if water then
            UO.Explosion(pos, nil, true)
            sound.Play("weapons/underwater_explode3.wav", pos, 125, 100, 1)
        else
            UO.Explosion(pos, self.ExplosionParticle or UO.Particles.Grenade)
            UO.InnyOuty(self, pos)
        end

        if self.ExplosionShake > 0 then
            util.ScreenShake(pos, self.ExplosionShake, 4, 0.75, math.max(self.GrenadeRadius, 128) * 4)
        end
    end

    self:DoDetonation()

    if !water then
        local trace = util.TraceLine({
            start = pos,
            endpos = pos + Vector(0, 0, -45),
            mask = MASK_SOLID_BRUSHONLY,
            filter = self,
        })

        if trace.Hit then
            if self.Scorch then
                util.Decal(self.ScorchDecal, pos + Vector(0, 0, 8), trace.HitPos - trace.HitNormal * 8, self)
            end

            if self.DebrisSounds then
                sound.Play(UO.PickSound(self.DebrisSounds), pos, 85, math.random(96, 104), 1)
            end
        end
    end

    self:PostDetonation()
    self:Remove()
end
