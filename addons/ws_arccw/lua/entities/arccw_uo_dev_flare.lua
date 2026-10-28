AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Signal Flare"

local UO = ArcCW.UO

ENT.GrenadeRadius = 0
ENT.GrenadeDamage = 0
ENT.FuseTime = 0.4
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.DebrisSounds = false
ENT.ExplosionShake = 0
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/uc_grenades/w_flare.mdl"
ENT.ModelFallback = "models/props_junk/PopCan01a.mdl"

ENT.PhysMass = 0.2
ENT.PhysElasticity = 0.15
ENT.PhysDamping = {0.5, 3}

ENT.BurnTime = 75
ENT.LightColor = Color(255, 70, 40)

ENT.BurnRadius = 46
ENT.BurnDamage = 3

ENT.StrikeSound = UO.Sound("nades/molotov/molotov_lighter_strike.wav", "ambient/fire/gascan_ignite1.wav")
ENT.HissSound = UO.Sound("nades/molotov/molotov_burn_loop.wav", "ambient/fire/fire_small_loop1.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Burning")
    self:NetworkVar("Float", 1, "BurnOutAt")
end

if SERVER then

    function ENT:OnGrenadeSpawned()
        if self:GetBodygroupCount(1) > 1 then
            self:SetBodygroup(1, 1)
        end
    end

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true

        self:SetBurning(true)
        self:SetBurnOutAt(CurTime() + self.BurnTime)

        sound.Play(UO.PickSound(self.StrikeSound), self:GetPos(), 75, math.random(95, 105), 1)

        self.Hiss = CreateSound(self, UO.PickSound(self.HissSound))
        if self.Hiss then self.Hiss:PlayEx(0.5, 125) end
    end

    function ENT:GrenadeThink()
        if !self:GetBurning() then return end

        if CurTime() >= self:GetBurnOutAt() then
            self:Remove()
            return
        end

        if self:WaterLevel() >= 2 then
            return
        end

        if CurTime() < (self.NextBurnTick or 0) then return end
        self.NextBurnTick = CurTime() + 0.35

        local pos = self:GetPos()
        local attacker = self:GetAttacker()

        for _, ent in ipairs(UO.FindTargets(pos, self.BurnRadius)) do
            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
            d:SetDamage(self.BurnDamage * UO.DamageMult())
            d:SetDamageType(DMG_BURN)
            ent:TakeDamageInfo(d)

            if ent.Ignite and !ent:IsOnFire() and math.random() < 0.25 then
                ent:Ignite(3, 16)
            end
        end
    end

    function ENT:OnRemove()
        if self.Hiss then self.Hiss:Stop() end
    end

else

    function ENT:GrenadeThinkCL()
        if !self:GetBurning() then return end

        local att = self:LookupAttachment("fuse")
        local pos = self:GetPos() + Vector(0, 0, 2)

        if att and att > 0 then
            local a = self:GetAttachment(att)
            if a then pos = a.Pos end
        end

        local c = self.LightColor

        local flicker = math.Rand(0.85, 1.15)
        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = pos
            dl.r, dl.g, dl.b = c.r, c.g, c.b
            dl.Brightness = 4 * flicker
            dl.Decay = 700
            dl.Size = 620 * flicker
            dl.DieTime = CurTime() + 0.15
        end

        if self:WaterLevel() >= 2 then return end
        if self.Ticks % 2 != 0 then return end

        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        for i = 1, 2 do
            local p = emitter:Add("effects/spark", pos)
            if !p then continue end
            p:SetVelocity(VectorRand() * 90 + Vector(0, 0, 60))
            p:SetGravity(Vector(0, 0, -300))
            p:SetDieTime(math.Rand(0.3, 0.7))
            p:SetStartAlpha(255)
            p:SetEndAlpha(0)
            p:SetStartSize(3)
            p:SetEndSize(0)
            p:SetColor(c.r, math.min(255, c.g + 90), c.b)
            p:SetAirResistance(30)
            p:SetCollide(true)
            p:SetBounce(0.4)
        end

        if math.random(1, 100) <= 40 then
            local p = emitter:Add("particle/smokesprites_000" .. math.random(2, 9), pos)
            if p then
                p:SetVelocity(VectorRand() * 12 + Vector(0, 0, 60))
                p:SetGravity(Vector(0, 0, 40))
                p:SetDieTime(math.Rand(1.5, 3))
                p:SetStartAlpha(90)
                p:SetEndAlpha(0)
                p:SetStartSize(6)
                p:SetEndSize(math.Rand(50, 90))
                p:SetRoll(math.Rand(-180, 180))
                p:SetRollDelta(math.Rand(-0.3, 0.3))
                p:SetColor(c.r, c.g, c.b)
                p:SetAirResistance(80)
                p:SetLighting(false)
            end
        end

        emitter:Finish()
    end

end
