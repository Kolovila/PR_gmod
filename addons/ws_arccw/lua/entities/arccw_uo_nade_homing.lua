AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Homing Grenade"

local UO = ArcCW.UO

ENT.GrenadeRadius = 560
ENT.GrenadeDamage = 165
ENT.FuseTime = 5.5

ENT.ExplosionParticle = UO.Particles.HE
ENT.ExplosionShake = 30

ENT.Model = "models/uc_grenades/w_synth_grenade.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.5
ENT.PhysElasticity = 0.2
ENT.PhysMaterial = "metal"

ENT.SeekRange = 1600
ENT.SeekForce = 1400
ENT.SeekMaxSpeed = 420
ENT.SeekRetargetTime = 0.4
ENT.ProximityKill = 60

ENT.TickSound = UO.Sound("uc_homing_grenade/tick1.wav", "buttons/blip1.wav")
ENT.TickSlow = 0.55
ENT.TickFast = 0.09
ENT.LockSound = UO.Sound("uc_homing_grenade/tick1.wav", "buttons/button17.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Locked")
end

if SERVER then

    function ENT:OnGrenadeSpawned()
        self.NextTick = CurTime() + 0.25
        self.NextRetarget = 0
        self.Target = NULL
    end

    function ENT:AcquireTarget()
        if self.NoSeek then return nil end

        local pos = self:GetPos()
        local owner = self:GetOwner()

        local best, bestdist
        for _, ent in ipairs(ents.FindInSphere(pos, self.SeekRange)) do
            if ent == self then continue end
            if !UO.IsTarget(ent) then continue end

            if ent == owner and CurTime() - self.SpawnTime < 1.5 then continue end

            local d = ent:WorldSpaceCenter():DistToSqr(pos)
            if bestdist and d >= bestdist then continue end

            best, bestdist = ent, d
        end

        return best
    end

    function ENT:GrenadeThink()
        if !self:GetArmed() then return end

        local ct = CurTime()

        if ct >= self.NextRetarget then
            self.NextRetarget = ct + self.SeekRetargetTime

            local new = self:AcquireTarget()

            if IsValid(new) and new != self.Target then
                sound.Play(UO.PickSound(self.LockSound), self:GetPos(), 70, 140, 0.7)
            end

            self.Target = new or NULL
            self:SetLocked(IsValid(new))
        end

        local tgt = self.Target
        if IsValid(tgt) then
            local phys = self:GetPhysicsObject()
            if IsValid(phys) then
                local delta = tgt:WorldSpaceCenter() - self:GetPos()
                local dist = delta:Length()

                if dist <= self.ProximityKill then
                    self:Detonate()
                    return
                end

                local dir = delta:GetNormalized()
                dir.z = math.Clamp(dir.z, -0.2, 0.25)
                dir:Normalize()

                local vel = phys:GetVelocity()
                if vel:Length() < self.SeekMaxSpeed then
                    phys:ApplyForceCenter(dir * self.SeekForce * phys:GetMass() * FrameTime() * 60)
                end

                phys:AddAngleVelocity(Vector(0, 60, 0))
            end
        end

        if ct >= self.NextTick then
            local ft = self.FuseTime
            local frac = 1

            if isnumber(ft) and ft > 0 and ft < math.huge then
                frac = math.Clamp((ct - self.SpawnTime) / ft, 0, 1)
            end

            local interval = Lerp(frac ^ 2, self.TickSlow, self.TickFast)
            self.NextTick = ct + interval

            self:EmitSound(UO.PickSound(self.TickSound), 68, Lerp(frac, 100, 145), 0.85, CHAN_STATIC)
        end
    end

    function ENT:PostDetonation()
        UO.Shrapnel(self, self:GetAttacker(), 26, 12, 800)
    end

else

    function ENT:GrenadeThinkCL()
        if self.Ticks % 2 != 0 then return end

        local pos = self:GetPos() + Vector(0, 0, 3)

        local locked = self:GetLocked()
        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = pos
            dl.r = locked and 255 or 60
            dl.g = locked and 40 or 160
            dl.b = locked and 40 or 255
            dl.Brightness = locked and 2 or 1
            dl.Decay = 1200
            dl.Size = locked and 110 or 70
            dl.DieTime = CurTime() + 0.15
        end

        if !locked then return end
        if self.Ticks % 8 != 0 then return end

        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        local p = emitter:Add("particle/particle_electrical_arc", pos + VectorRand() * 4)
        if p then
            p:SetVelocity(VectorRand() * 20)
            p:SetDieTime(0.12)
            p:SetStartAlpha(255)
            p:SetEndAlpha(0)
            p:SetStartSize(5)
            p:SetEndSize(0)
            p:SetColor(255, 90, 70)
            p:SetLighting(false)
        end

        emitter:Finish()
    end

end
