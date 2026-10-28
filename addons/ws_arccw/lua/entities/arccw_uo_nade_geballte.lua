AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Geballte Ladung"

local UO = ArcCW.UO

ENT.GrenadeRadius = 950
ENT.GrenadeDamage = 320
ENT.GrenadeDamageType = DMG_BLAST + DMG_SONIC
ENT.FuseTime = 5

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 75
ENT.ExplosionSoundLevel = 145

ENT.Model = "models/uc_grenades/w_stielhandgranate24_geballteladung_thrown.mdl"
ENT.ModelFallback = "models/uc_grenades/w_stielhandgranate24_geballteladung.mdl"

ENT.PhysMass = 4.5
ENT.PhysElasticity = 0
ENT.PhysDamping = {0.8, 4}

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/explode_lrg_close_01.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_lrg_dist_01.wav"}, UO.Snd.ExplosionIn)

ENT.SympathyRange = 380

ENT.BounceSounds = false

local fuse = UO.Sound({"germany_ww2/explosives/f1_fuse1.wav", "germany_ww2/explosives/f1_fuse2.wav"}, "ambient/fire/fire_small_loop1.wav")

function ENT:OnGrenadeSpawned()
    self.Fuse = CreateSound(self, UO.PickSound(fuse))
    if self.Fuse then self.Fuse:PlayEx(0.6, 92) end
end

function ENT:OnRemove()
    if self.Fuse then self.Fuse:Stop() end
end

function ENT:PostDetonation()
    local pos = self:GetPos()
    local attacker = self:GetAttacker()

    UO.BustDoors(self, pos, self.GrenadeRadius * 1.5)

    for _, ent in ipairs(ents.FindInSphere(pos, self.SympathyRange)) do
        if ent == self or !IsValid(ent) then continue end
        if ent.BOOM or !ent.Detonate then continue end
        if !string.StartWith(ent:GetClass(), "arccw_uo_") then continue end

        timer.Simple(math.Rand(0.05, 0.22), function()
            if IsValid(ent) and !ent.BOOM then ent:Detonate() end
        end)
    end
end
