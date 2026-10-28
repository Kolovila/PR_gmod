AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Molotov Cocktail"

local UO = ArcCW.UO

ENT.GrenadeRadius = 100
ENT.GrenadeDamage = 12
ENT.GrenadeDamageType = DMG_BURN
ENT.FuseTime = 40

ENT.ImpactFuse = true
ENT.ImpactFuseSpeed = 90
ENT.ArmTime = 0.05

ENT.ExplosionEffect = false
ENT.Scorch = true
ENT.ScorchDecal = "FadingScorch"
ENT.ExplosionShake = 0
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/simpnades/w_molotov.mdl"
ENT.ModelFallback = "models/props_junk/glassjug01.mdl"

ENT.PhysMass = 0.9
ENT.PhysElasticity = 0
ENT.PhysMaterial = "glassbottle"

ENT.WaterDud = true

ENT.FirePatches = 7
ENT.FireSpread = 140
ENT.FireTime = 14
ENT.FireRadius = 110
ENT.FireDamage = 4
ENT.FireIgnite = 4
ENT.FireIgniteDamage = 24

ENT.IgniteSound = UO.Sound("nades/molotov/molotov_ignite.wav", "ambient/fire/gascan_ignite1.wav")
ENT.BreakSounds = {
    "physics/glass/glass_bottle_break1.wav",
    "physics/glass/glass_bottle_break2.wav",
}

function ENT:OnGrenadeSpawned()
    if self:SkinCount() > 1 then self:SetSkin(1) end

    self.Burn = CreateSound(self, UO.Sound("nades/molotov/molotov_throw_burning.wav", "ambient/fire/fire_small_loop1.wav"))
    if self.Burn then self.Burn:PlayEx(0.6, 100) end
end

function ENT:OnRemove()
    if self.Burn then self.Burn:Stop() end
end

function ENT:OnDrowned()
    if self.Drowned then return end
    self.Drowned = true

    if self.Burn then self.Burn:Stop() end
    self:EmitSound("ambient/water/water_splash" .. math.random(1, 3) .. ".wav", 65, 100, 0.6)
    SafeRemoveEntityDelayed(self, 4)
end

function ENT:DoDetonation()
    local pos = self:GetPos()
    local attacker = self:GetAttacker()
    local up = self.GrenadeDir and -self.GrenadeDir or vector_up

    sound.Play(self.BreakSounds[math.random(#self.BreakSounds)], pos, 80, math.random(95, 105), 1)
    sound.Play(UO.PickSound(self.IgniteSound), pos, 95, math.random(95, 105), 1)

    UO.Explosion(pos, "explosion_grenade_fas2")

    UO.Blast(self, attacker, pos, self.GrenadeRadius, self.GrenadeDamage, self.GrenadeDamageType)

    if !GetConVar("arccw_uo_incendiary"):GetBool() then return end

    for i = 1, self.FirePatches do
        local dir = (up + VectorRand()):GetNormalized()

        local tr = util.TraceLine({
            start = pos,
            endpos = pos + dir * self.FireSpread,
            mask = MASK_SOLID_BRUSHONLY,
            filter = self,
        })

        local fire = ents.Create("arccw_uo_dev_fire")
        if !IsValid(fire) then break end

        fire:SetPos(tr.HitPos + tr.HitNormal * 4)
        fire:SetOwner(attacker)

        fire.FireTime = self.FireTime
        fire.FireRadius = self.FireRadius
        fire.FireDamage = self.FireDamage
        fire.IgniteTime = self.FireIgnite
        fire.IgniteDamage = self.FireIgniteDamage

        fire:Spawn()

        local phys = fire:GetPhysicsObject()
        if IsValid(phys) then
            phys:SetVelocityInstantaneous(dir * math.Rand(60, 180))
        end
    end
end

if CLIENT then
    function ENT:GrenadeThinkCL()
        if self:WaterLevel() >= 2 then return end
        if self.Ticks % 2 != 0 then return end

        local pos = self:GetPos()

        local att = self:LookupAttachment("tail")
        if att and att > 0 then
            local a = self:GetAttachment(att)
            if a then pos = a.Pos end
        end

        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        local p = emitter:Add("sprites/flamelet" .. math.random(1, 5), pos)
        if p then
            p:SetVelocity(VectorRand() * 15 + Vector(0, 0, 20))
            p:SetGravity(Vector(0, 0, 40))
            p:SetDieTime(math.Rand(0.15, 0.3))
            p:SetStartAlpha(220)
            p:SetEndAlpha(0)
            p:SetStartSize(8)
            p:SetEndSize(18)
            p:SetRoll(math.Rand(-180, 180))
            p:SetRollDelta(math.Rand(-1, 1))
            p:SetColor(255, 255, 255)
            p:SetAirResistance(60)
            p:SetLighting(false)
        end

        emitter:Finish()

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = pos
            dl.r, dl.g, dl.b = 255, 150, 60
            dl.Brightness = 1.2
            dl.Decay = 900
            dl.Size = 140
            dl.DieTime = CurTime() + 0.2
        end
    end
end
