AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "No. 77"

local UO = ArcCW.UO

ENT.GrenadeRadius = 180
ENT.GrenadeDamage = 25
ENT.GrenadeDamageType = DMG_BURN
ENT.FuseTime = 3

ENT.ExplosionEffect = false
ENT.Scorch = true
ENT.ScorchDecal = "FadingScorch"
ENT.ExplosionShake = 15
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/weapons/arc9_doi/w_no77.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.5
ENT.PhysElasticity = 0.08

ENT.FirePatches = 9
ENT.FireSpread = 190
ENT.FireTime = 20
ENT.FireRadius = 100
ENT.FireDamage = 7
ENT.FireIgnite = 9
ENT.FireIgniteDamage = 32

ENT.SmokeClouds = 2

ENT.BurstSound = UO.Sound({"weapons/no77/no77_detonate_smoke_near_01.wav"}, "nades/molotov/molotov_ignite.wav")
ENT.BurnSound = UO.Sound({"weapons/no77_incendiary/no77_incendiary_burn.ogg", "weapons/no77_incendiary/no77_burn.wav"}, "ambient/fire/fire_small_loop1.wav")

function ENT:DoDetonation()
    local pos = self:GetPos()
    local attacker = self:GetAttacker()
    local up = self.GrenadeDir and -self.GrenadeDir or vector_up

    sound.Play(UO.PickSound(self.BurstSound), pos, 95, math.random(96, 104), 1)
    sound.Play(UO.PickSound(self.BurnSound), pos, 80, 100, 0.8)

    UO.Explosion(pos, UO.Particles.Grenade)

    UO.Blast(self, attacker, pos, self.GrenadeRadius, self.GrenadeDamage, self.GrenadeDamageType)

    for i = 1, self.SmokeClouds do
        local cloud = ents.Create("arccw_smoke")
        if !IsValid(cloud) then break end

        cloud:SetPos(pos + Vector(math.Rand(-40, 40), math.Rand(-40, 40), 8))
        cloud:SetOwner(attacker)
        cloud:Spawn()
    end

    if !GetConVar("arccw_uo_incendiary"):GetBool() then return end

    for i = 1, self.FirePatches do
        local dir = (up + VectorRand() * 1.5):GetNormalized()

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
            phys:SetVelocityInstantaneous(dir * math.Rand(90, 240))
        end
    end
end
