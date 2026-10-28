AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Tabun Grenade"

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

ENT.Model = "models/weapons/tabun_gas/tabun_gas_proj.mdl"
ENT.ModelFallback = "models/weapons/tabun_gas/w_tabun_gas.mdl"

ENT.PhysMass = 0.45
ENT.PhysElasticity = 0.1
ENT.PhysDamping = {0.6, 2}

ENT.BurnTime = 30
ENT.GasRadius = 280
ENT.GasDamage = 11
ENT.GasInterval = 0.5
ENT.GasHold = 3

ENT.BurstSound = UO.Sound({"weapons/tabun_gas/wpn_gas_grenade_boom.wav", "weapons/tabun_gas/wpn_gas_grenade_thump.wav"}, "nades/molotov/molotov_ignite.wav")
ENT.HissSound = UO.Sound({"weapons/tabun_gas/wpn_gas_grenade_hiss.wav"}, "ambient/fire/fire_small_loop1.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Venting")
    self:NetworkVar("Float", 1, "VentOutAt")
end

if SERVER then

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true

        self:SetVenting(true)
        self:SetVentOutAt(CurTime() + self.BurnTime)

        sound.Play(UO.PickSound(self.BurstSound), self:GetPos(), 95, math.random(96, 104), 1)

        self.Hiss = CreateSound(self, UO.PickSound(self.HissSound))
        if self.Hiss then self.Hiss:PlayEx(0.7, 85) end
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
                ent:ViewPunch(Angle(math.Rand(-2.2, 2.2), math.Rand(-2.2, 2.2), 0))
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
            local p = emitter:Add("particle/smokesprites_000" .. math.random(2, 9), pos + Vector(0, 0, 2))
            if !p then continue end

            p:SetVelocity(VectorRand() * 50 + Vector(0, 0, 35))
            p:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), -4))
            p:SetDieTime(math.Rand(3, 5))
            p:SetStartAlpha(130)
            p:SetEndAlpha(0)
            p:SetStartSize(14)
            p:SetEndSize(math.Rand(110, 160))
            p:SetRoll(math.Rand(-180, 180))
            p:SetRollDelta(math.Rand(-0.2, 0.2))
            p:SetColor(196, 188, 150)
            p:SetAirResistance(110)
            p:SetLighting(false)
        end

        emitter:Finish()
    end

end
