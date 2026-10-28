AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "Rock"

local UO = ArcCW.UO

ENT.GrenadeRadius = 0
ENT.GrenadeDamage = 0
ENT.FuseTime = math.huge
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.ExplosionShake = 0
ENT.DebrisSounds = false
ENT.ExplosionSounds = false
ENT.ExplosionSoundsIndoors = false
ENT.BounceSounds = false

ENT.Model = "models/uc_grenades/w_rock_thrown.mdl"
ENT.ModelFallback = "models/props_junk/rock001a.mdl"

ENT.PhysMass = 1.2
ENT.PhysElasticity = 0.18
ENT.PhysMaterial = "rock"

ENT.Lifetime = 45

ENT.NoiseRange = 1500
ENT.DistractTime = 6

ENT.ImpactDamage = 9
ENT.ImpactSpeed = 320

ENT.ImpactSounds = UO.Sound({
    "physics/concrete/concrete_impact_hard1.wav",
    "physics/concrete/concrete_impact_hard2.wav",
    "physics/concrete/concrete_impact_hard3.wav",
}, UO.Snd.BounceHard)

if SERVER then

    function ENT:OnGrenadeSpawned()
        self.ExpireAt = CurTime() + self.Lifetime
    end

    function ENT:OnGrenadeCollide(data, physobj)
        if data.Speed < 110 then return end
        if CurTime() < (self.NextKnock or 0) then return end
        self.NextKnock = CurTime() + 0.15

        local pos = data.HitPos

        sound.Play(UO.PickSound(self.ImpactSounds), pos, 85, math.random(90, 110), 1)
        self:Distract(pos)

        local hit = data.HitEntity

        if IsValid(hit) and UO.IsTarget(hit) and data.Speed >= self.ImpactSpeed then
            local d = DamageInfo()
            d:SetInflictor(self)
            d:SetAttacker(self:GetAttacker())
            d:SetDamage(self.ImpactDamage * UO.DamageMult())
            d:SetDamageType(DMG_CLUB)
            d:SetDamageForce(data.OurOldVelocity:GetNormalized() * 3000)
            d:SetDamagePosition(pos)
            hit:TakeDamageInfo(d)

            if hit:IsPlayer() then hit:ViewPunch(AngleRand() * 2) end
        end
    end

    function ENT:Distract(pos)
        for _, ent in ipairs(ents.FindInSphere(pos, self.NoiseRange)) do
            if !ent:IsNPC() then continue end
            if ent:Health() <= 0 then continue end
            if !ent.SetLastPosition or !ent.SetSchedule then continue end

            ent:SetLastPosition(pos)
            if ent.SetNPCState then ent:SetNPCState(NPC_STATE_ALERT) end
            ent:SetSchedule(SCHED_FORCED_GO)

            ent.ArcCW_UO_Distracted = CurTime() + self.DistractTime
        end
    end

    function ENT:GrenadeThink()
        if self.ExpireAt and CurTime() >= self.ExpireAt then
            self:Remove()
        end
    end

    function ENT:Detonate(pos)
        if !IsValid(self) or self.BOOM then return end
        self.BOOM = true
        self:Remove()
    end

end
