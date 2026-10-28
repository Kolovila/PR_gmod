AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "KS-23 Irritant Canister"
ENT.Spawnable = false
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
function ENT:Initialize()
    if CLIENT then
        return
    end
    self:SetModel("models/weapons/arccw/uc_ks23/canister_cheremukha.mdl")
    self:PhysicsInitBox(Vector(-0.48, -0.48, -0.48), Vector(0.48, 0.48, 0.48))
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:SetMass(0.15)
        phys:SetMaterial("metal")
        phys:SetDragCoefficient(0.25)
        phys:EnableGravity(true)
    end
    self.Fuse = CurTime() + 1.5
    self.Armed = CurTime() + 0.1
    self.NextPulse = 0
end
function ENT:ApplyImpact(data)
    if not SERVER or self.ImpactApplied then
        return
    end
    self.ImpactApplied = true
    local ent = data.HitEntity
    if not IsValid(ent) or ent:IsWorld() or ent == self:GetOwner() then
        return
    end
    local dmg = DamageInfo()
    dmg:SetAttacker(IsValid(self:GetOwner()) and self:GetOwner() or self)
    dmg:SetInflictor(self)
    dmg:SetDamage(self.ImpactDamage or 18)
    dmg:SetDamageType(DMG_CRUSH)
    dmg:SetDamagePosition(data.HitPos or self:GetPos())
    dmg:SetDamageForce((data.OurOldVelocity or Vector()) * 2)
    ent:TakeDamageInfo(dmg)
end
function ENT:PhysicsCollide(data)
    if not SERVER or self.Impacted then
        return
    end
    if CurTime() < self.Armed and (not IsValid(data.HitEntity) or data.HitEntity == self:GetOwner()) then
        return
    end
    self.Impacted = true
    self:ApplyImpact(data)

    timer.Simple(0, function()
        if not IsValid(self) then
            return
        end
        self:SetMoveType(MOVETYPE_NONE)
        self:SetSolid(SOLID_NONE)
        self:BeginCloud()
    end)
end
function ENT:BeginCloud()
    if self.CloudEnd then
        return
    end
    local kind = self.UCKS23GasKind or "cn"
    local profile = UC_KS23.GasProfiles[kind] or UC_KS23.GasProfiles.cn
    self.CloudEnd = CurTime() + profile.duration
    self:SetNW2String("UCKS23GasKind", kind)
    self:SetNW2Float("UCKS23CloudEnd", self.CloudEnd)
    self.Hiss = CreateSound(self, "ambient/gas/steam2.wav")
    if self.Hiss then
        self.Hiss:SetSoundLevel(55)
        self.Hiss:PlayEx(0.22, 110)
    end
    local clouds = UC_KS23.GasClouds
    for i = #clouds, 1, -1 do
        if not IsValid(clouds[i]) then
            table.remove(clouds, i)
        end
    end
    if #clouds >= 16 then
        local oldest = table.remove(clouds, 1)
        if IsValid(oldest) then
            oldest:Remove()
        end
    end
    clouds[#clouds + 1] = self
end
function ENT:Think()
    if CLIENT then
        if self:WaterLevel() >= 2 then
            return
        end
        local finish = self:GetNW2Float("UCKS23CloudEnd", 0)
        if finish <= CurTime() then
            return
        end
        if (self.NextPuff or 0) > CurTime() then
            return
        end
        self.NextPuff = CurTime() + 0.15
        self.Emitter = self.Emitter or ParticleEmitter(self:GetPos())
        if not self.Emitter then
            return
        end
        local profile = UC_KS23.GasProfiles[self:GetNW2String("UCKS23GasKind", "cn")]
        if not profile then
            return
        end
        local particle = self.Emitter:Add("particle/particle_smokegrenade", self:GetPos() + Vector(0, 0, 8))
        if particle then
            particle:SetVelocity(VectorRand() * 45 + Vector(0, 0, 25))
            particle:SetDieTime(4)
            particle:SetStartAlpha(100)
            particle:SetEndAlpha(0)
            particle:SetStartSize(14)
            particle:SetEndSize(profile.radius * 0.65)
            particle:SetRoll(math.Rand(0, 360))
            particle:SetRollDelta(math.Rand(-0.2, 0.2))
            particle:SetColor(226, 232, 220)
            particle:SetAirResistance(110)
            particle:SetLighting(false)
        end
        return
    end
    if not self.CloudEnd and CurTime() >= self.Fuse then
        self:BeginCloud()
    end
    if self.CloudEnd and CurTime() >= self.CloudEnd then
        self:StopVentingSound()
        self:Remove()
        return
    end
    if self:WaterLevel() >= 2 then
        self:StopVentingSound()
        self:NextThink(CurTime() + 0.2)
        return true
    end
    if self.CloudEnd then
        if CurTime() >= self.CloudEnd then
            self:StopVentingSound()
            self:Remove()
            return
        end
        if CurTime() >= self.NextPulse then
            self.NextPulse = CurTime() + 0.5
            UC_KS23.GasPulse(self:GetPos(), self.UCKS23GasKind or "cn", self)
        end
    end
    self:NextThink(CurTime() + 0.05)
    return true
end
function ENT:StopVentingSound()
    if self.Hiss then
        self.Hiss:Stop()
        self.Hiss = nil
    end
    self:StopSound("ambient/gas/steam2.wav")
end
function ENT:OnRemove()
    self:StopVentingSound()
    if CLIENT and self.Emitter then
        self.Emitter:Finish()
        self.Emitter = nil
    end
end
