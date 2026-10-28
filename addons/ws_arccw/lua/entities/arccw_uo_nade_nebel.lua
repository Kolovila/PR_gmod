AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Nebelhandgranate 39"

local UO = ArcCW.UO

ENT.GrenadeRadius = 0
ENT.GrenadeDamage = 0
ENT.FuseTime = 2
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.ExplosionShake = 0
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/uc_grenades/w_nebelhandgranate39_thrown.mdl"
ENT.ModelFallback = "models/uc_grenades/w_nebelhandgranate39.mdl"

ENT.PhysMass = 0.6
ENT.PhysElasticity = 0.08
ENT.PhysDamping = {0.5, 3}

ENT.BurnTime = 20

ENT.IgniteSound = UO.Sound("germany_ww2/explosives/m24_smoke_start.wav", "nades/molotov/molotov_ignite.wav")
ENT.HissSound = UO.Sound("germany_ww2/explosives/m24_smoke_loop.wav", "nades/molotov/molotov_burn_loop.wav")
ENT.EndSound = UO.Sound("germany_ww2/explosives/m24_smoke_end.wav", "ambient/water/water_splash1.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Burning")
end

if SERVER then

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true
        self:LightFiller()
    end

    function ENT:LightFiller()
        self:SetBurning(true)

        sound.Play(UO.PickSound(self.IgniteSound), self:GetPos(), 90, math.random(96, 104), 1)

        self.Hiss = CreateSound(self, UO.PickSound(self.HissSound))
        if self.Hiss then self.Hiss:PlayEx(0.7, 95) end

        self:SpawnCloud()

        timer.Simple(self.BurnTime * 0.45, function()
            if !IsValid(self) then return end
            self:SpawnCloud()
        end)

        timer.Simple(self.BurnTime, function()
            if !IsValid(self) then return end
            sound.Play(UO.PickSound(self.EndSound), self:GetPos(), 70, 100, 0.7)
            self:Remove()
        end)
    end

    function ENT:SpawnCloud()
        if self:WaterLevel() >= 2 then return end

        local cloud = ents.Create("arccw_smoke")
        if !IsValid(cloud) then return end

        cloud:SetPos(self:GetPos() + Vector(0, 0, 4))
        cloud:SetOwner(self:GetAttacker())
        cloud:Spawn()
    end

    function ENT:OnRemove()
        if self.Hiss then self.Hiss:Stop() end
    end

else

    function ENT:GrenadeThinkCL()
        if !self:GetBurning() then return end
        if self:WaterLevel() >= 2 then return end
        if self.Ticks % 2 != 0 then return end

        local emitter = ParticleEmitter(self:GetPos())
        if !IsValid(emitter) then return end

        local p = emitter:Add("particle/smokesprites_000" .. math.random(2, 9), self:GetPos() + Vector(0, 0, 2))
        if p then
            p:SetVelocity(VectorRand() * 25 + Vector(0, 0, 100))
            p:SetGravity(Vector(0, 0, 18))
            p:SetDieTime(math.Rand(1.4, 2.2))
            p:SetStartAlpha(165)
            p:SetEndAlpha(0)
            p:SetStartSize(7)
            p:SetEndSize(math.Rand(55, 85))
            p:SetRoll(math.Rand(-180, 180))
            p:SetRollDelta(math.Rand(-0.35, 0.35))
            p:SetColor(210, 210, 205)
            p:SetAirResistance(90)
            p:SetLighting(false)
        end

        emitter:Finish()
    end

end
