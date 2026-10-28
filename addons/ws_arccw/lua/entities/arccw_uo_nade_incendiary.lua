AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Incendiary Grenade"

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

ENT.Model = "models/weapons/w_anm14.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.9
ENT.PhysElasticity = 0.05
ENT.PhysDamping = {0.7, 2.2}

ENT.BurnTime = 26
ENT.CoreRadius = 165
ENT.CoreDamage = 13
ENT.DamageInterval = 0.35

ENT.SlagCount = 4
ENT.SlagSpread = 90

ENT.BurnThrough = false
ENT.BurnThroughDamage = 55
ENT.BurnThroughRange = 90

ENT.IgniteSound = UO.Sound("weapons/anm14/an_m14_detonate.wav", "nades/molotov/molotov_ignite.wav")
ENT.BurnSound = UO.Sound("weapons/anm14/an_m14_burn_loop.wav", "nades/molotov/molotov_burn_loop.wav")
ENT.BounceSounds = UO.Sound({"weapons/no76/no76_bounce_01.wav", "weapons/no76/no76_bounce_02.wav", "weapons/no76/no76_bounce_03.wav"}, UO.Snd.BounceHard)

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Burning")
    self:NetworkVar("Float", 1, "BurnOutAt")
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

        self:SetBurning(true)
        self:SetBurnOutAt(CurTime() + self.BurnTime)
        self.BurnStart = CurTime()

        local origin = self:GetPos()

        sound.Play(UO.PickSound(self.IgniteSound), origin, 95, math.random(95, 105), 1)

        self.Burn = CreateSound(self, UO.PickSound(self.BurnSound))
        if self.Burn then self.Burn:PlayEx(0.85, 85) end

        self:SetMoveType(MOVETYPE_NONE)

        local phys = self:GetPhysicsObject()
        if IsValid(phys) then phys:EnableMotion(false) end

        if !GetConVar("arccw_uo_incendiary"):GetBool() then return end

        for i = 1, self.SlagCount do
            local dir = (vector_up + VectorRand() * 1.4):GetNormalized()

            local tr = util.TraceLine({
                start = origin,
                endpos = origin + dir * self.SlagSpread,
                mask = MASK_SOLID_BRUSHONLY,
                filter = self,
            })

            local fire = ents.Create("arccw_uo_dev_fire")
            if !IsValid(fire) then break end

            fire:SetPos(tr.HitPos + tr.HitNormal * 4)
            fire:SetOwner(self:GetAttacker())
            fire.FireTime = self.BurnTime * 0.7
            fire:Spawn()
        end
    end

    function ENT:GrenadeThink()
        if !self:GetBurning() then return end

        if CurTime() >= self:GetBurnOutAt() then
            self:Remove()
            return
        end

        if CurTime() < (self.NextBurnTick or 0) then return end
        self.NextBurnTick = CurTime() + self.DamageInterval

        local pos = self:GetPos()
        local attacker = self:GetAttacker()

        local d = DamageInfo()
        d:SetInflictor(self)
        d:SetAttacker(attacker)
        d:SetDamage(self.CoreDamage * UO.DamageMult())
        d:SetDamageType(DMG_BURN)
        util.BlastDamageInfo(d, pos, self.CoreRadius)

        for _, ent in ipairs(UO.FindTargets(pos, self.CoreRadius * 0.85)) do
            if ent.Ignite and !ent:IsOnFire() then
                ent:Ignite(6, 30)
            end
        end

        if !self.BurnThrough then return end

        local down = -(self.PlantNormal or vector_up)

        local tr = util.TraceLine({
            start = pos,
            endpos = pos + down * self.BurnThroughRange,
            filter = self,
            mask = MASK_SOLID,
        })

        if IsValid(tr.Entity) then
            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
            d:SetDamage(self.BurnThroughDamage * UO.DamageMult())
            d:SetDamageType(DMG_BURN + DMG_SLASH)
            d:SetDamagePosition(tr.HitPos)
            tr.Entity:TakeDamageInfo(d)
        end

        if !self.BurnedDoors and CurTime() - (self.BurnStart or CurTime()) > 8 then
            self.BurnedDoors = true
            UO.BustDoors(self, pos, 120)
        end
    end

    function ENT:OnDrowned()
    end

    function ENT:OnRemove()
        if self.Burn then self.Burn:Stop() end
    end

else

    function ENT:GrenadeThinkCL()
        if !self:GetBurning() then return end

        local pos = self:GetPos() + Vector(0, 0, 3)

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = pos
            dl.r, dl.g, dl.b = 255, 240, 200
            dl.Brightness = 3 * math.Rand(0.9, 1.1)
            dl.Decay = 800
            dl.Size = 380
            dl.DieTime = CurTime() + 0.15
        end

        if self.Ticks % 2 != 0 then return end

        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        for i = 1, 3 do
            local p = emitter:Add("effects/spark", pos)
            if !p then continue end
            p:SetVelocity(VectorRand() * 120 + Vector(0, 0, 90))
            p:SetGravity(Vector(0, 0, -320))
            p:SetDieTime(math.Rand(0.3, 0.8))
            p:SetStartAlpha(255)
            p:SetEndAlpha(0)
            p:SetStartSize(3)
            p:SetEndSize(0)
            p:SetColor(255, 250, 225)
            p:SetAirResistance(25)
            p:SetCollide(true)
            p:SetBounce(0.4)
        end

        local f = emitter:Add("sprites/flamelet" .. math.random(1, 5), pos)
        if f then
            f:SetVelocity(VectorRand() * 20 + Vector(0, 0, 60))
            f:SetGravity(Vector(0, 0, 90))
            f:SetDieTime(math.Rand(0.3, 0.6))
            f:SetStartAlpha(240)
            f:SetEndAlpha(0)
            f:SetStartSize(18)
            f:SetEndSize(46)
            f:SetRoll(math.Rand(-180, 180))
            f:SetColor(255, 255, 255)
            f:SetAirResistance(80)
            f:SetLighting(false)
        end

        if math.random(1, 100) <= 45 then
            local s = emitter:Add("particle/smokesprites_000" .. math.random(2, 9), pos)
            if s then
                s:SetVelocity(VectorRand() * 18 + Vector(0, 0, 95))
                s:SetGravity(Vector(0, 0, 45))
                s:SetDieTime(math.Rand(1.5, 2.8))
                s:SetStartAlpha(150)
                s:SetEndAlpha(0)
                s:SetStartSize(10)
                s:SetEndSize(math.Rand(70, 110))
                s:SetRoll(math.Rand(-180, 180))
                s:SetRollDelta(math.Rand(-0.3, 0.3))
                s:SetColor(235, 235, 235)
                s:SetAirResistance(90)
                s:SetLighting(false)
            end
        end

        emitter:Finish()
    end

end
