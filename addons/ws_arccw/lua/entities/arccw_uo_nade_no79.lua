AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "No. 79"

local UO = ArcCW.UO

ENT.GrenadeRadius = 0
ENT.GrenadeDamage = 0
ENT.FuseTime = 1.2
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.ExplosionShake = 0
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/weapons/arc9_doi/w_no79.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.5
ENT.PhysElasticity = 0.12

ENT.CloudCount = 4
ENT.CloudSpread = 90
ENT.Lifetime = 11

ENT.BurstSound = UO.Sound({"weapons/no77/no77_detonate_smoke_near_01.wav"}, "nades/molotov/molotov_ignite.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Burst")
end

if SERVER then

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true

        self:SetBurst(true)
        local origin = self:GetPos()

        sound.Play(UO.PickSound(self.BurstSound), origin, 95, math.random(97, 105), 1)

        for i = 1, self.CloudCount do
            local cloud = ents.Create("arccw_smoke")
            if !IsValid(cloud) then break end

            cloud:SetPos(origin + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0):GetNormalized() * math.Rand(0, self.CloudSpread) + Vector(0, 0, 6))
            cloud:SetOwner(self:GetAttacker())
            cloud:Spawn()
        end

        SafeRemoveEntityDelayed(self, self.Lifetime)
    end

else

    function ENT:GrenadeThinkCL()
        if !self:GetBurst() then return end
        if self:WaterLevel() >= 2 then return end
        if self.Ticks % 2 != 0 then return end

        local emitter = ParticleEmitter(self:GetPos())
        if !IsValid(emitter) then return end

        local p = emitter:Add("particle/smokesprites_000" .. math.random(2, 9), self:GetPos() + Vector(0, 0, 3))
        if p then
            p:SetVelocity(VectorRand() * 70 + Vector(0, 0, 60))
            p:SetGravity(Vector(0, 0, 10))
            p:SetDieTime(math.Rand(1, 1.8))
            p:SetStartAlpha(150)
            p:SetEndAlpha(0)
            p:SetStartSize(10)
            p:SetEndSize(math.Rand(70, 110))
            p:SetRoll(math.Rand(-180, 180))
            p:SetColor(225, 225, 228)
            p:SetAirResistance(95)
            p:SetLighting(false)
        end

        emitter:Finish()
    end

end
