AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "RDG-1"

local UO = ArcCW.UO

ENT.GrenadeRadius = 0
ENT.GrenadeDamage = 0
ENT.FuseTime = 2.5
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.ExplosionShake = 0
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/weapons/w_nam_rdg1.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.5
ENT.PhysElasticity = 0.12
ENT.PhysDamping = {0.6, 2}

ENT.BurnTime = 70
ENT.CloudInterval = 9

ENT.HotRadius = 36
ENT.HotDamage = 1

ENT.IgniteSound = UO.Sound("nades/molotov/molotov_ignite.wav", "ambient/fire/gascan_ignite1.wav")
ENT.HissSound = UO.Sound("germany_ww2/explosives/m24_smoke_loop.wav", "nades/molotov/molotov_burn_loop.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Burning")
    self:NetworkVar("Float", 1, "BurnOutAt")
end

if SERVER then

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true

        self:SetBurning(true)
        self:SetBurnOutAt(CurTime() + self.BurnTime)

        sound.Play(UO.PickSound(self.IgniteSound), self:GetPos(), 85, math.random(92, 100), 0.9)

        self.Hiss = CreateSound(self, UO.PickSound(self.HissSound))
        if self.Hiss then self.Hiss:PlayEx(0.6, 90) end

        self:SpawnCloud()
    end

    function ENT:SpawnCloud()
        if self:WaterLevel() >= 2 then return end

        local cloud = ents.Create("arccw_smoke")
        if !IsValid(cloud) then return end

        cloud:SetPos(self:GetPos() + Vector(0, 0, 4))
        cloud:SetOwner(self:GetAttacker())
        cloud:Spawn()
    end

    function ENT:GrenadeThink()
        if !self:GetBurning() then return end

        if CurTime() >= self:GetBurnOutAt() then
            self:Remove()
            return
        end

        if CurTime() >= (self.NextCloud or 0) then
            self.NextCloud = CurTime() + self.CloudInterval
            self:SpawnCloud()
        end

        if CurTime() < (self.NextBurnTick or 0) then return end
        self.NextBurnTick = CurTime() + 0.5

        for _, ent in ipairs(UO.FindTargets(self:GetPos(), self.HotRadius, self)) do
            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(self:GetAttacker())
            d:SetDamage(self.HotDamage * UO.DamageMult())
            d:SetDamageType(DMG_BURN)
            ent:TakeDamageInfo(d)
        end
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
            p:SetVelocity(VectorRand() * 30 + Vector(0, 0, 85))
            p:SetGravity(Vector(0, 0, 14))
            p:SetDieTime(math.Rand(2, 3.2))
            p:SetStartAlpha(150)
            p:SetEndAlpha(0)
            p:SetStartSize(8)
            p:SetEndSize(math.Rand(80, 130))
            p:SetRoll(math.Rand(-180, 180))
            p:SetRollDelta(math.Rand(-0.3, 0.3))
            p:SetColor(205, 205, 200)
            p:SetAirResistance(95)
            p:SetLighting(false)
        end

        emitter:Finish()
    end

end
