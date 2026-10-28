AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "M34"

local UO = ArcCW.UO

ENT.GrenadeRadius = 340
ENT.GrenadeDamage = 70
ENT.GrenadeDamageType = DMG_BLAST + DMG_BURN
ENT.FuseTime = 4

ENT.ExplosionEffect = false
ENT.Scorch = true
ENT.ScorchDecal = "FadingScorch"
ENT.ExplosionShake = 30
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false

ENT.Model = "models/vietnam/w_nam_m34.mdl"
ENT.ModelFallback = "models/weapons/arc9_doi/w_no77.mdl"

ENT.PhysMass = 0.9
ENT.PhysElasticity = 0.06

ENT.FirePatches = 14
ENT.FireSpread = 340
ENT.FireTime = 26
ENT.FireRadius = 115
ENT.FireDamage = 8
ENT.FireIgnite = 11
ENT.FireIgniteDamage = 36

ENT.SmokeClouds = 3

ENT.WreckRange = 220
ENT.WreckDamage = 140

ENT.BurstSound = UO.Sound({"weapons/no77/no77_detonate_smoke_near_01.wav"}, "nades/molotov/molotov_ignite.wav")
ENT.BurnSound = UO.Sound({"weapons/no77_incendiary/no77_incendiary_burn.ogg"}, "ambient/fire/fire_small_loop1.wav")

function ENT:DoDetonation()
    local pos = self:GetPos()
    local attacker = self:GetAttacker()
    local up = self.GrenadeDir and -self.GrenadeDir or vector_up

    sound.Play(UO.PickSound(self.BurstSound), pos, 100, math.random(94, 102), 1)
    sound.Play(UO.PickSound(self.BurnSound), pos, 85, 100, 0.9)

    UO.Explosion(pos, UO.Particles.Grenade)

    UO.Blast(self, attacker, pos, self.GrenadeRadius, self.GrenadeDamage, self.GrenadeDamageType)

    for i = 1, self.SmokeClouds do
        local cloud = ents.Create("arccw_smoke")
        if !IsValid(cloud) then break end
        cloud:SetPos(pos + Vector(math.Rand(-50, 50), math.Rand(-50, 50), 8))
        cloud:SetOwner(attacker)
        cloud:Spawn()
    end

    for _, ent in ipairs(ents.FindInSphere(pos, self.WreckRange)) do
        if ent == self or !IsValid(ent) then continue end
        if ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot() then continue end

        local phys = ent:GetPhysicsObject()
        if !IsValid(phys) then continue end

        local d = DamageInfo()
        d:SetInflictor(self)
        d:SetAttacker(attacker)
        d:SetDamage(self.WreckDamage * UO.DamageMult())
        d:SetDamageType(DMG_BURN + DMG_BLAST)
        d:SetDamagePosition(ent:WorldSpaceCenter())
        ent:TakeDamageInfo(d)
    end

    if !GetConVar("arccw_uo_incendiary"):GetBool() then return end

    for i = 1, self.FirePatches do
        local dir = (up + VectorRand() * 1.6):GetNormalized()

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
            phys:SetVelocityInstantaneous(dir * math.Rand(120, 300))
        end
    end
end
