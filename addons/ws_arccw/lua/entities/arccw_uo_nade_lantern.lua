AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "M1912 Lantern Grenade"

local UO = ArcCW.UO

ENT.GrenadeRadius = 720
ENT.GrenadeDamage = 215
ENT.GrenadeDamageType = DMG_BLAST + DMG_SONIC
ENT.FuseTime = 5

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 42

ENT.Model = "models/weapons/w_tannenberg_m1912_lantern_grenade.mdl"
ENT.ModelFallback = "models/uc_grenades/w_grenade.mdl"

ENT.PhysMass = 0.55
ENT.PhysElasticity = 0.1
ENT.PhysMaterial = "wood"

ENT.WaterDud = true

ENT.NoticeRange = 900

ENT.ExplosionSounds = UO.Sound({"weapons/tfa_tannenberg_m1912_lantern_grenade/explosion-1.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_close_indoor_01.wav"}, UO.Snd.ExplosionIn)

local fusesnd = UO.Sound("nades/molotov/molotov_burn_loop.wav", "ambient/fire/fire_small_loop1.wav")

if SERVER then

    function ENT:OnGrenadeSpawned()
        self.Fuse = CreateSound(self, UO.PickSound(fusesnd))
        if self.Fuse then self.Fuse:PlayEx(0.45, 120) end
    end

    function ENT:OnRemove()
        if self.Fuse then self.Fuse:Stop() end
    end

    function ENT:GrenadeThink()
        if CurTime() < (self.NextNotice or 0) then return end
        self.NextNotice = CurTime() + 0.5

        local pos = self:GetPos()

        for _, ent in ipairs(ents.FindInSphere(pos, self.NoticeRange)) do
            if !IsValid(ent) or !ent:IsNPC() then continue end
            if ent:Health() <= 0 or !ent.SetLastPosition then continue end

            ent:SetLastPosition(pos)
            if ent.SetNPCState then ent:SetNPCState(NPC_STATE_ALERT) end
        end
    end

    function ENT:PostDetonation()
        UO.Shrapnel(self, self:GetAttacker(), 12, 7, 450)
        UO.BustDoors(self, self:GetPos(), self.GrenadeRadius)
    end

end

if CLIENT then
    function ENT:GrenadeThinkCL()
        if self:WaterLevel() >= 2 then return end

        local pos = self:GetPos()

        local dl = DynamicLight(self:EntIndex())
        if dl then
            local f = math.Rand(0.85, 1.15)
            dl.Pos = pos + Vector(0, 0, 3)
            dl.r, dl.g, dl.b = 255, 180, 90
            dl.Brightness = 2.6 * f
            dl.Decay = 800
            dl.Size = 420 * f
            dl.DieTime = CurTime() + 0.15
        end

        if self.Ticks % 3 != 0 then return end

        local emitter = ParticleEmitter(pos)
        if !IsValid(emitter) then return end

        local p = emitter:Add("effects/spark", pos)
        if p then
            p:SetVelocity(VectorRand() * 45 + Vector(0, 0, 40))
            p:SetGravity(Vector(0, 0, -180))
            p:SetDieTime(math.Rand(0.25, 0.6))
            p:SetStartAlpha(255)
            p:SetEndAlpha(0)
            p:SetStartSize(3)
            p:SetEndSize(0)
            p:SetColor(255, 210, 140)
            p:SetAirResistance(25)
            p:SetCollide(true)
            p:SetBounce(0.3)
        end

        emitter:Finish()
    end
end
