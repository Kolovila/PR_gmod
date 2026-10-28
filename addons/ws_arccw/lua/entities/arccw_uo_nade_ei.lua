AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Eihandgranate 39"

local UO = ArcCW.UO

ENT.GrenadeRadius = 420
ENT.GrenadeDamage = 120
ENT.FuseTime = 4.5

ENT.ExplosionParticle = UO.Particles.Grenade
ENT.ExplosionShake = 18

ENT.Model = "models/uc_grenades/w_eihandgranate39_thrown.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.PhysMass = 0.23
ENT.PhysElasticity = 0.3

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/grenade_explosion1.wav", "germany_ww2/explosives/grenade_explosion2.wav", "germany_ww2/explosives/grenade_explosion3.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_close_indoor_01.wav"}, UO.Snd.ExplosionIn)

ENT.BounceSounds = false

local bounce = UO.Sound({"germany_ww2/explosives/gen_grenade_bounce1.wav", "germany_ww2/explosives/gen_grenade_bounce2.wav", "germany_ww2/explosives/gen_grenade_bounce3.wav", "germany_ww2/explosives/gen_grenade_bounce4.wav"}, UO.Snd.BounceHard)

function ENT:OnGrenadeCollide(data, physobj)
    if data.Speed < 35 then return end
    if CurTime() < (self.NextBounce or 0) then return end

    self.NextBounce = CurTime() + 0.07
    self:EmitSound(UO.PickSound(bounce), 68, math.random(100, 112))
end

function ENT:PostDetonation()
    UO.Shrapnel(self, self:GetAttacker(), 22, 12, 850)
end
