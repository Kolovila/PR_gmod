AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "M26A2"

local UO = ArcCW.UO

ENT.GrenadeRadius = 640
ENT.GrenadeDamage = 165
ENT.FuseTime = 5

ENT.ImpactFuse = true
ENT.ImpactFuseSpeed = 130
ENT.ArmTime = 0.45

ENT.ExplosionParticle = UO.Particles.Grenade

ENT.Model = "models/vietnam/w_nam_m26a2.mdl"
ENT.ModelFallback = "models/simpnades/w_m67.mdl"

ENT.PhysMass = 0.45
ENT.PhysElasticity = 0.16

ENT.PrematureChance = 0.07
ENT.PrematureWindow = 0.5

ENT.ExplosionSounds = UO.Sound({"weapons/mk2/mk2_detonate_01.wav", "weapons/mk2/mk2_detonate_02.wav", "weapons/mk2/mk2_detonate_03.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"weapons/mk2/mk2_detonate_dist_01.wav", "weapons/mk2/mk2_detonate_dist_02.wav", "weapons/mk2/mk2_detonate_dist_03.wav"}, UO.Snd.ExplosionIn)

if SERVER then

    function ENT:OnGrenadeSpawned()
        if math.Rand(0, 1) >= self.PrematureChance then return end

        timer.Simple(math.Rand(0, self.PrematureWindow), function()
            if IsValid(self) and !self.BOOM then self:Detonate() end
        end)
    end

    function ENT:PostDetonation()
        UO.Shrapnel(self, self:GetAttacker(), 70, 11, 700)
    end

end
