AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "TGG-1"

local UO = ArcCW.UO

ENT.GrenadeRadius = 0
ENT.GrenadeDamage = 0
ENT.FuseTime = 4
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.ExplosionShake = 0
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/uc_grenades/c_uc_tgg1.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.25
ENT.PhysElasticity = 0.15
ENT.PhysDamping = {0.5, 2}

ENT.BurnTime = 90

ENT.GasRadius = 300
ENT.GasDamage = 1
ENT.GasInterval = 0.4
ENT.GasHold = 2.5

ENT.HotRadius = 44
ENT.HotDamage = 2

ENT.IgniteSound = UO.Sound("nades/molotov/molotov_ignite.wav", "ambient/fire/gascan_ignite1.wav")
ENT.HissSound = UO.Sound("nades/molotov/molotov_burn_loop.wav", "ambient/fire/fire_small_loop1.wav")

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Venting")
    self:NetworkVar("Float", 1, "VentOutAt")
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

        self:SetVenting(true)
        self:SetVentOutAt(CurTime() + self.BurnTime)

        sound.Play(UO.PickSound(self.IgniteSound), self:GetPos(), 90, math.random(105, 115), 0.9)

        self.Hiss = CreateSound(self, UO.PickSound(self.HissSound))
        if self.Hiss then self.Hiss:PlayEx(0.6, 70) end
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
                ent.ArcCW_UO_Gassed = CurTime() + self.GasHold
                if ent.SetNPCState then ent:SetNPCState(NPC_STATE_ALERT) end
                ent:SetSchedule(SCHED_RUN_FROM_ENEMY)
            end
        end

        for _, ent in ipairs(UO.FindTargets(pos, self.HotRadius, self)) do
            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(attacker)
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
        if !self:GetVenting() then return end
        if self:WaterLevel() >= 2 then return end
        if self.Ticks % 2 != 0 then return end

        local pos = self:GetPos()
        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        for i = 1, 2 do
            local p = emitter:Add("particle/smokesprites_000" .. math.random(2, 9), pos + Vector(0, 0, 2))
            if !p then continue end

            p:SetVelocity(VectorRand() * 55 + Vector(0, 0, 40))
            p:SetGravity(Vector(math.Rand(-6, 6), math.Rand(-6, 6), -3))
            p:SetDieTime(math.Rand(3, 5.5))
            p:SetStartAlpha(140)
            p:SetEndAlpha(0)
            p:SetStartSize(14)
            p:SetEndSize(math.Rand(120, 180))
            p:SetRoll(math.Rand(-180, 180))
            p:SetRollDelta(math.Rand(-0.25, 0.25))
            p:SetColor(226, 232, 220)
            p:SetAirResistance(110)
            p:SetLighting(false)
        end

        local j = emitter:Add("particle/smokesprites_000" .. math.random(2, 9), pos)
        if j then
            j:SetVelocity(Vector(0, 0, 150) + VectorRand() * 20)
            j:SetGravity(Vector(0, 0, -10))
            j:SetDieTime(0.7)
            j:SetStartAlpha(190)
            j:SetEndAlpha(0)
            j:SetStartSize(5)
            j:SetEndSize(38)
            j:SetColor(240, 245, 235)
            j:SetAirResistance(60)
            j:SetLighting(false)
        end

        emitter:Finish()
    end

end
