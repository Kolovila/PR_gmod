AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Stielhandgranate 24"

local UO = ArcCW.UO

ENT.GrenadeRadius = 700
ENT.GrenadeDamage = 210
ENT.GrenadeDamageType = DMG_BLAST + DMG_SONIC
ENT.FuseTime = 4.5

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 38

ENT.Model = "models/uc_grenades/w_stielhandgranate24_thrown.mdl"
ENT.ModelFallback = "models/uc_grenades/w_stielhandgranate24.mdl"

ENT.PhysMass = 0.6
ENT.PhysElasticity = 0.08
ENT.PhysDamping = {0.5, 3}

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/grenade_exp1.wav", "germany_ww2/explosives/grenade_exp2.wav", "germany_ww2/explosives/grenade_exp3.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_close_indoor_01.wav"}, UO.Snd.ExplosionIn)

ENT.BounceSounds = false

local bounce = UO.Sound({"germany_ww2/explosives/gen_stickgrenade_bounce1.wav", "germany_ww2/explosives/gen_stickgrenade_bounce2.wav", "germany_ww2/explosives/gen_stickgrenade_bounce3.wav"}, UO.Snd.BounceSoft)

local fuse = UO.Sound({"germany_ww2/explosives/f1_fuse1.wav", "germany_ww2/explosives/f1_fuse2.wav", "germany_ww2/explosives/f1_fuse3.wav"}, "ambient/fire/fire_small_loop1.wav")

function ENT:OnGrenadeSpawned()
    self.Fuse = CreateSound(self, UO.PickSound(fuse))
    if self.Fuse then self.Fuse:PlayEx(0.5, 100) end
end

function ENT:OnRemove()
    if self.Fuse then self.Fuse:Stop() end
end

function ENT:OnGrenadeCollide(data, physobj)
    if data.Speed < 40 then return end
    if CurTime() < (self.NextBounce or 0) then return end

    self.NextBounce = CurTime() + 0.09
    self:EmitSound(UO.PickSound(bounce), 68, math.random(96, 106))
end

function ENT:PostDetonation()
    local pos = self:GetPos()

    UO.Shrapnel(self, self:GetAttacker(), 10, 6, 500)

    UO.BustDoors(self, pos, self.GrenadeRadius)
end
