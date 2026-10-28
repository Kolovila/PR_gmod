AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "M1917 Chemical Grenade"

local UO = ArcCW.UO

ENT.GrenadeRadius = 0
ENT.GrenadeDamage = 0
ENT.FuseTime = 3
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.ExplosionShake = 0
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/weapons/w_tannenberg_chemical_grenade.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.5
ENT.PhysElasticity = 0.05
ENT.PhysMaterial = "glassbottle"

ENT.BurnTime = 45
ENT.GasStart = 150
ENT.GasEnd = 520
ENT.GasDamage = 4
ENT.GasInterval = 0.5
ENT.GasHold = 3

ENT.BurstSound = UO.Sound({"weapons/tfa_tannenberg_m1917_chemical_grenade/ww1_tannenberg_gas.wav"}, "nades/molotov/molotov_ignite.wav")
ENT.HissSound = UO.Sound({"weapons/tfa_tannenberg_m1917_chemical_grenade/ww1_tannenberg_gas.wav"}, "ambient/fire/fire_small_loop1.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Venting")
    self:NetworkVar("Float", 1, "VentOutAt")
    self:NetworkVar("Float", 2, "GasRadius")
end

if SERVER then

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true

        self:SetVenting(true)
        self:SetVentOutAt(CurTime() + self.BurnTime)
        self:SetGasRadius(self.GasStart)
        self.VentStart = CurTime()

        sound.Play(UO.PickSound(self.BurstSound), self:GetPos(), 95, math.random(96, 104), 1)

        self.Hiss = CreateSound(self, UO.PickSound(self.HissSound))
        if self.Hiss then self.Hiss:PlayEx(0.5, 80) end

        self:SetMoveType(MOVETYPE_NONE)
        local phys = self:GetPhysicsObject()
        if IsValid(phys) then phys:EnableMotion(false) end
    end

    function ENT:GrenadeThink()
        if !self:GetVenting() then return end

        if CurTime() >= self:GetVentOutAt() then
            self:Remove()
            return
        end

        local frac = math.Clamp((CurTime() - (self.VentStart or CurTime())) / self.BurnTime, 0, 1)
        self:SetGasRadius(Lerp(frac, self.GasStart, self.GasEnd))

        if CurTime() < (self.NextGas or 0) then return end
        self.NextGas = CurTime() + self.GasInterval
        if self:WaterLevel() >= 2 then return end

        local pos = self:GetPos()
        local attacker = self:GetAttacker()

        for _, ent in ipairs(UO.FindTargets(pos, self:GetGasRadius(), self)) do
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
                ent:ViewPunch(Angle(math.Rand(-1.2, 1.2), math.Rand(-1.2, 1.2), 0))
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
        local r = self:GetGasRadius()
        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        for i = 1, 2 do
            local a = math.Rand(0, math.pi * 2)
            local out = Vector(math.cos(a), math.sin(a), 0)

            local p = emitter:Add("particle/smokesprites_000" .. math.random(2, 9), pos + Vector(0, 0, 2))
            if !p then continue end

            p:SetVelocity(out * math.Rand(25, r * 0.35) + Vector(0, 0, math.Rand(2, 14)))
            p:SetGravity(Vector(0, 0, -2))
            p:SetDieTime(math.Rand(3.5, 6))
            p:SetStartAlpha(105)
            p:SetEndAlpha(0)
            p:SetStartSize(18)
            p:SetEndSize(math.Rand(120, 190))
            p:SetRoll(math.Rand(-180, 180))
            p:SetRollDelta(math.Rand(-0.15, 0.15))
            p:SetColor(190, 200, 160)
            p:SetAirResistance(130)
            p:SetLighting(false)
        end

        emitter:Finish()
    end

end
