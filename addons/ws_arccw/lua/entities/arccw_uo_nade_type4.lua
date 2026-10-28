AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Type 4"

local UO = ArcCW.UO

ENT.GrenadeRadius = 380
ENT.GrenadeDamage = 105
ENT.FuseTime = 4.5
ENT.FuseVariance = 0.4

ENT.WaterDud = true

ENT.ExplosionParticle = UO.Particles.Grenade
ENT.ExplosionShake = 22

ENT.Model = "models/uc_grenades/w_rock_thrown.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.55
ENT.PhysElasticity = 0.05
ENT.PhysMaterial = "pottery"

ENT.ShatterSpeed = 265
ENT.ShatterMult = 1

ENT.ShardCount = 30
ENT.ShardDamage = 10
ENT.ShardRange = 420

ENT.LowOrderRadius = 240
ENT.LowOrderDamage = 55

ENT.HCN = false
ENT.BurnTime = 9
ENT.GasRadius = 210
ENT.GasDamage = 16
ENT.GasInterval = 0.4
ENT.GasHold = 2.5

ENT.BounceSounds = false

local bounce = UO.Sound({"weapons/no76/no76_bounce_01.wav", "weapons/no76/no76_bounce_02.wav", "weapons/no76/no76_bounce_03.wav"}, UO.Snd.BounceHard)
local shatter = UO.Sound({"physics/glass/glass_bottle_break1.wav", "physics/glass/glass_bottle_break2.wav"}, {"weapons/no76/no76_bounce_01.wav"})

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/grenade_explosion4.wav", "germany_ww2/explosives/grenade_explosion5.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_close_indoor_01.wav"}, UO.Snd.ExplosionIn)

ENT.HissSound = UO.Sound({"weapons/tabun_gas/wpn_gas_grenade_hiss.wav"}, "ambient/fire/fire_small_loop1.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Venting")
    self:NetworkVar("Float", 1, "VentOutAt")
end

if SERVER then

    function ENT:OnGrenadeCollide(data, physobj)
        if self.BOOM or self.Shattered then return end

        if data.Speed > 30 and CurTime() >= (self.NextClink or 0) then
            self.NextClink = CurTime() + 0.08
            self:EmitSound(UO.PickSound(bounce), 68, math.random(94, 108))
        end

        if data.Speed < self.ShatterSpeed * self.ShatterMult then return end

        if IsValid(data.HitEntity) and data.HitEntity == self:GetOwner() then return end

        self.Shattered = true

        self.GrenadeRadius = self.LowOrderRadius
        self.GrenadeDamage = self.LowOrderDamage
        self.ExplosionShake = 14

        self:EmitSound(UO.PickSound(shatter), 76, math.random(96, 108))

        local pos = data.HitPos
        timer.Simple(0, function()
            if !IsValid(self) then return end
            self:Detonate(pos)
        end)
    end

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end

        if self.HCN then
            self.BOOM = true
            pos = pos or self:GetPos()

            self:SetVenting(true)
            self:SetVentOutAt(CurTime() + self.BurnTime)

            self:EmitSound(UO.PickSound(shatter), 74, math.random(98, 110))

            self.Hiss = CreateSound(self, UO.PickSound(self.HissSound))
            if self.Hiss then self.Hiss:PlayEx(0.45, 105) end
            return
        end

        return self.BaseClass.Detonate(self, pos)
    end

    function ENT:PostDetonation()
        if self.Shattered then return end

        UO.Shrapnel(self, self:GetAttacker(), self.ShardCount, self.ShardDamage, self.ShardRange)
    end

    function ENT:GrenadeThink()
        if !self:GetVenting() then return end

        if CurTime() >= self:GetVentOutAt() then
            self:Remove()
            return
        end

        if CurTime() < (self.NextGas or 0) then return end
        self.NextGas = CurTime() + self.GasInterval

        if self:WaterLevel() >= 2 then return end

        local pos = self:GetPos()
        local attacker = self:GetAttacker()

        for _, ent in ipairs(UO.FindTargets(pos, self.GasRadius, self)) do
            local tr = util.TraceLine({
                start = pos,
                endpos = UO.EyePos(ent),
                filter = self,
                mask = MASK_OPAQUE,
            })
            if tr.Hit then continue end

            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
            d:SetDamage(self.GasDamage * UO.DamageMult())
            d:SetDamageType(DMG_NERVEGAS)
            ent:TakeDamageInfo(d)

            if !IsValid(ent) then continue end

            if ent:IsPlayer() then
                UO.Gas(ent, self.GasHold)
                ent:ViewPunch(Angle(math.Rand(-1.6, 1.6), math.Rand(-1.6, 1.6), 0))
            elseif ent.SetSchedule then
                if ent.SetNPCState then ent:SetNPCState(NPC_STATE_ALERT) end
                ent:SetSchedule(SCHED_RUN_FROM_ENEMY)
            end
        end
    end

    function ENT:OnRemove()
        if self.Hiss then self.Hiss:Stop() end
    end

else

    function ENT:GrenadeThinkCL()
        if !self:GetVenting() then return end
        if self:WaterLevel() >= 2 then return end
        if self.Ticks % 2 != 0 then return end

        local pos = self:GetPos()
        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        for i = 1, 2 do
            local p = emitter:Add("particle/smokesprites_000" .. math.random(2, 9), pos + Vector(0, 0, 1))
            if !p then continue end

            p:SetVelocity(VectorRand() * 26 + Vector(0, 0, 20))
            p:SetGravity(Vector(math.Rand(-3, 3), math.Rand(-3, 3), 1))
            p:SetDieTime(math.Rand(1.4, 2.4))
            p:SetStartAlpha(26)
            p:SetEndAlpha(0)
            p:SetStartSize(10)
            p:SetEndSize(math.Rand(70, 100))
            p:SetRoll(math.Rand(-180, 180))
            p:SetRollDelta(math.Rand(-0.3, 0.3))
            p:SetColor(226, 232, 226)
            p:SetAirResistance(120)
            p:SetLighting(false)
        end

        emitter:Finish()
    end

end
