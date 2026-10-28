AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "M84 Stun Grenade"

local UO = ArcCW.UO

ENT.GrenadeRadius = 200
ENT.GrenadeDamage = 25
ENT.GrenadeDamageType = DMG_BLAST
ENT.FuseTime = 1.6

ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.ExplosionShake = 0
ENT.DebrisSounds = false

ENT.Model = "models/simpnades/w_m84.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.24
ENT.PhysElasticity = 0.4
ENT.PhysMaterial = "metal"

ENT.FlashPower = 700
ENT.FlashTime = 4

ENT.DetonateSound = UO.Sound("nades/m84/m84_detonate.wav", "ambient/explosions/explode_4.wav")
ENT.BounceSounds = false

local bounce = UO.Sound("nades/m84/m84_bounce_01.wav", UO.Snd.BounceHard)

function ENT:OnGrenadeCollide(data, physobj)
    if data.Speed < 40 then return end
    if CurTime() < (self.NextCageSound or 0) then return end

    self.NextCageSound = CurTime() + 0.08
    self:EmitSound(UO.PickSound(bounce), 72, math.random(94, 108))
end

function ENT:OnGrenadeSpawned()
    if self:GetBodygroupCount(1) > 1 then
        self:SetBodygroup(1, 1)
    end
end

function ENT:DoDetonation()
    local pos = self:GetPos()
    local attacker = self:GetAttacker()

    if self:WaterLevel() >= 1 then
        UO.Explosion(pos, nil, true)
        sound.Play("weapons/underwater_explode3.wav", pos, 110, 130, 0.6)
        return
    end

    sound.Play(UO.PickSound(self.DetonateSound), pos, 140, math.random(97, 103), 1)

    UO.Sparks(pos, vector_up, 8, 2)

    local ed = EffectData()
    ed:SetOrigin(pos)
    ed:SetMagnitude(4)
    ed:SetScale(2)
    ed:SetRadius(4)
    util.Effect("arccw_flashexplosion", ed)

    UO.Blast(self, attacker, pos, self.GrenadeRadius, self.GrenadeDamage, self.GrenadeDamageType)

    UO.Flash(pos, attacker, self.FlashPower, self.FlashTime)

    UO.BustDoors(self, pos, self.GrenadeRadius)
end
