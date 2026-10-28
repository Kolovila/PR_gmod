AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "M18 Smoke Grenade"

local UO = ArcCW.UO

ENT.GrenadeRadius = 0
ENT.GrenadeDamage = 0
ENT.FuseTime = 1.5
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.DebrisSounds = false
ENT.ExplosionShake = 0
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/weapons/arc9_doi/w_m18.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.6
ENT.PhysElasticity = 0.1
ENT.PhysDamping = {0.6, 2}

ENT.BurnTime = 18

ENT.IgniteSound = UO.Sound("weapons/tfa_csgo/smokegrenade/sg_explode.wav", "nades/molotov/molotov_ignite.wav")
ENT.HissSound = UO.Sound("weapons/tfa_csgo/smokegrenade/smoke_emit.wav", "nades/molotov/molotov_burn_loop.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Burning")
end

function ENT:OnGrenadeSpawned()
    if self:GetBodygroupCount(1) > 1 then
        self:SetBodygroup(1, 1)
    end
end

if SERVER then

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true
        self:LightFiller()
    end

    function ENT:LightFiller()
        self:SetBurning(true)
        self.BurnStart = CurTime()

        sound.Play(UO.PickSound(self.IgniteSound), self:GetPos(), 90, math.random(95, 105), 1)

        self.Hiss = CreateSound(self, UO.PickSound(self.HissSound))
        if self.Hiss then self.Hiss:PlayEx(0.7, 90) end

        self:SpawnCloud()

        timer.Simple(self.BurnTime * 0.45, function()
            if !IsValid(self) then return end
            self:SpawnCloud()
        end)

        timer.Simple(self.BurnTime, function()
            if !IsValid(self) then return end
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

    function ENT:GrenadeThink()
        if !self:GetBurning() then return end

        if CurTime() < (self.NextBurnTick or 0) then return end
        self.NextBurnTick = CurTime() + 0.4

        for _, ent in ipairs(UO.FindTargets(self:GetPos(), 48)) do
            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(self:GetAttacker())
            d:SetDamage(2 * UO.DamageMult())
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
            p:SetVelocity(VectorRand() * 25 + Vector(0, 0, 110))
            p:SetGravity(Vector(0, 0, 20))
            p:SetDieTime(math.Rand(1.2, 2))
            p:SetStartAlpha(170)
            p:SetEndAlpha(0)
            p:SetStartSize(6)
            p:SetEndSize(math.Rand(50, 80))
            p:SetRoll(math.Rand(-180, 180))
            p:SetRollDelta(math.Rand(-0.4, 0.4))
            p:SetColor(215, 215, 215)
            p:SetAirResistance(90)
            p:SetLighting(false)
        end

        emitter:Finish()
    end

end
