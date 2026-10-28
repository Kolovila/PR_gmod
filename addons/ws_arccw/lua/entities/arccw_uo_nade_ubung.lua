AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Ubungsstielhandgranate 24"

local UO = ArcCW.UO

ENT.GrenadeRadius = 170
ENT.GrenadeDamage = 10
ENT.FuseTime = 4.5

ENT.ExplosionParticle = UO.Particles.Grenade
ENT.ExplosionShake = 10
ENT.ExplosionSoundLevel = 150

ENT.Model = "models/uc_grenades/w_ubungsstielhandgranate24_thrown.mdl"
ENT.ModelFallback = "models/uc_grenades/w_ubungsstielhandgranate24.mdl"

ENT.PhysMass = 0.6
ENT.PhysElasticity = 0.1
ENT.PhysDamping = {0.5, 3}

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/grenade_exp1.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_close_indoor_01.wav"}, UO.Snd.ExplosionIn)

ENT.StartleRange = 1100

ENT.BounceSounds = false

local bounce = UO.Sound({"germany_ww2/explosives/gen_stickgrenade_bounce1.wav", "germany_ww2/explosives/gen_stickgrenade_bounce4.wav", "germany_ww2/explosives/gen_stickgrenade_bounce5.wav"}, UO.Snd.BounceSoft)

function ENT:OnGrenadeCollide(data, physobj)
    if data.Speed < 40 then return end
    if CurTime() < (self.NextBounce or 0) then return end

    self.NextBounce = CurTime() + 0.09
    self:EmitSound(UO.PickSound(bounce), 68, math.random(98, 108))
end

function ENT:PostDetonation()
    local pos = self:GetPos()

    for _, e in ipairs(ents.FindInSphere(pos, self.StartleRange)) do
        if !IsValid(e) or !e:IsNPC() then continue end
        if e:Health() <= 0 or !e.SetSchedule then continue end

        if e.SetNPCState then e:SetNPCState(NPC_STATE_ALERT) end
        e:SetSchedule(SCHED_COWER)
    end
end
