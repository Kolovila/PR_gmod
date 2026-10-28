AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "TNT"

local UO = ArcCW.UO

ENT.GrenadeRadius = 1000
ENT.GrenadeDamage = 300
ENT.FuseTime = 5

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 80
ENT.ExplosionSoundLevel = 145

ENT.ExplosionSounds = UO.Sound("weapons/tnt_explode_01.wav", UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound("weapons/tnt_explode_02.wav", UO.Snd.ExplosionIn)

ENT.Model = "models/uc_grenades/w_exp_tnt.mdl"
ENT.ModelFallback = "models/props_c17/oildrum001_explosive.mdl"

ENT.PhysMass = 0.7
ENT.PhysElasticity = 0.05
ENT.PhysMaterial = "cardboard"

ENT.SmokeTrail = true
ENT.SmokeTrailColor = Color(60, 60, 60)

ENT.WaterDud = true

ENT.SympathyRange = 420

local wicksound = UO.Sound("weapons/tnt_spark_loop_01.wav",
    "nades/molotov/molotov_burn_loop.wav", "ambient/fire/fire_small_loop1.wav")

function ENT:OnGrenadeSpawned()
    self.Wick = CreateSound(self, wicksound)
    if self.Wick then self.Wick:PlayEx(0.5, 105) end
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
    local pos = self:GetPos()
    local attacker = self:GetAttacker()

    UO.BustDoors(self, pos, self.GrenadeRadius * 1.5)

    for _, ent in ipairs(ents.FindInSphere(pos, self.SympathyRange)) do
        if ent == self or !IsValid(ent) then continue end
        if ent.BOOM or !ent.Detonate then continue end
        if !string.StartWith(ent:GetClass(), "arccw_uo_") then continue end

        timer.Simple(math.Rand(0.05, 0.25), function()
            if IsValid(ent) and !ent.BOOM then ent:Detonate() end
        end)
    end
end

if CLIENT then
    function ENT:GrenadeThinkCL()
        if self:WaterLevel() >= 2 then return end
        if self.Ticks % 3 != 0 then return end

        local pos = self:GetPos()
        local att = self:LookupAttachment("particle")

        if att and att > 0 then
            local a = self:GetAttachment(att)
            if a then pos = a.Pos end
        end

        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        local p = emitter:Add("effects/spark", pos)
        if p then
            p:SetVelocity(VectorRand() * 45 + Vector(0, 0, 35))
            p:SetGravity(Vector(0, 0, -200))
            p:SetDieTime(math.Rand(0.2, 0.5))
            p:SetStartAlpha(255)
            p:SetEndAlpha(0)
            p:SetStartSize(2)
            p:SetEndSize(0)
            p:SetColor(255, 210, 130)
            p:SetAirResistance(20)
            p:SetCollide(true)
            p:SetBounce(0.3)
        end

        emitter:Finish()
    end
end
