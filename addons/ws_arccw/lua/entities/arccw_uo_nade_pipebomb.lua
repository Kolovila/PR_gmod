AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Pipe Bomb"

local UO = ArcCW.UO

ENT.GrenadeRadius = 838
ENT.GrenadeDamage = 200
ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 40

ENT.Model = "models/weapon/w_eq_pipebomb.mdl"
ENT.ModelFallback = "models/props_junk/PopCan01a.mdl"

ENT.PhysMass = 1.1
ENT.PhysElasticity = 0.05
ENT.PhysMaterial = "metal"

ENT.SmokeTrail = true
ENT.SmokeTrailColor = Color(40, 40, 40)

ENT.WaterDud = true

ENT.FuseVariance = 1.5

ENT.FragCount = 24
ENT.FragDamage = 18
ENT.FragRange = 1400

local wicksound = ArcCW.UO.Sound("nades/molotov/molotov_burn_loop.wav", "ambient/fire/fire_small_loop1.wav")

function ENT:OnGrenadeSpawned()
    self.Wick = CreateSound(self, wicksound)
    if self.Wick then self.Wick:PlayEx(0.4, 115) end
end

function ENT:OnDrowned()
    if self.Drowned then return end
    self.Drowned = true

    if self.Wick then self.Wick:Stop() end
    self:EmitSound("ambient/water/water_splash" .. math.random(1, 3) .. ".wav", 60, 100, 0.6)

    SafeRemoveEntityDelayed(self, 6)
end

function ENT:OnRemove()
    if self.Wick then self.Wick:Stop() end
end

function ENT:PostDetonation()
    UO.Shrapnel(self, self:GetAttacker(), self.FragCount, self.FragDamage, self.FragRange)
end

if CLIENT then
    function ENT:GrenadeThinkCL()
        if self:WaterLevel() >= 2 then return end
        if self.Ticks % 3 != 0 then return end

        local att = self:LookupAttachment("fuse")
        local pos = self:GetPos()

        if att and att > 0 then
            local a = self:GetAttachment(att)
            if a then pos = a.Pos end
        end

        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        local p = emitter:Add("effects/spark", pos)
        if p then
            p:SetVelocity(VectorRand() * 40 + Vector(0, 0, 30))
            p:SetGravity(Vector(0, 0, -180))
            p:SetDieTime(math.Rand(0.2, 0.5))
            p:SetStartAlpha(255)
            p:SetEndAlpha(0)
            p:SetStartSize(2)
            p:SetEndSize(0)
            p:SetColor(255, 220, 140)
            p:SetAirResistance(20)
            p:SetCollide(true)
            p:SetBounce(0.3)
        end

        emitter:Finish()
    end
end
