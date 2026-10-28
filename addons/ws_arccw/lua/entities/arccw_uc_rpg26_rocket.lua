AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "PG-26 HEAT"
ENT.Spawnable = false
ENT.NoPhys = true
ENT.ArcCW_Killable = false

if SERVER then
    function ENT:Initialize()
        self:SetModel("models/weapons/arccw/uc_rpg26/pg26.mdl")
        self:SetMoveType(MOVETYPE_NONE)
        self:SetSolid(SOLID_NONE)
        self.Velocity = self.CurVel or self:GetForward() * (144 / 0.0254)
        self.LastFlight = CurTime()
        self.DieAt = CurTime() + 10
        self.DistanceFlown = 0
    end
    function ENT:Impact(tr)
        if self.Impacted then
            return
        end
        self.Impacted = true
        if tr.HitSky then
            self:Remove()
            return
        end
        local owner = IsValid(self:GetOwner()) and self:GetOwner() or self
        local inflictor = IsValid(self.Inflictor) and self.Inflictor or self

        if self.DistanceFlown < 8 / 0.0254 then
            self:EmitSound("physics/metal/metal_grenade_impact_hard1.wav", 75)
            local effect = EffectData()
            effect:SetOrigin(tr.HitPos)
            effect:SetNormal(tr.HitNormal)
            util.Effect("Sparks", effect)
            self:Remove()
            return
        end
        if IsValid(tr.Entity) then
            local dmg = DamageInfo()
            dmg:SetAttacker(owner)
            dmg:SetInflictor(inflictor)
            dmg:SetDamage(1600)
            dmg:SetDamageType(DMG_BLAST)
            dmg:SetDamagePosition(tr.HitPos)
            dmg:SetDamageForce(self.Velocity:GetNormalized() * 25000)
            tr.Entity:TakeDamageInfo(dmg)
        end
        util.BlastDamage(inflictor, owner, tr.HitPos + tr.HitNormal * 2, 180, self.Damage or 145)
        local fx = EffectData()
        fx:SetOrigin(tr.HitPos)
        fx:SetNormal(tr.HitNormal)
        util.Effect("Explosion", fx, true, true)
        util.Decal("Scorch", tr.HitPos + tr.HitNormal * 8, tr.HitPos - tr.HitNormal * 8)
        self:Remove()
    end
    function ENT:Think()
        local now = CurTime()
        if now >= self.DieAt then
            self:Remove()
            return
        end
        local elapsed = math.min(now - self.LastFlight, 0.25)
        self.LastFlight = now
        local gravity = Vector(0, 0, -386.09 * GetConVar("sv_gravity"):GetFloat() / 600)
        while elapsed > 0 do
            local dt = math.min(elapsed, 0.01)
            elapsed = elapsed - dt
            local start = self:GetPos()
            local dest = start + self.Velocity * dt + gravity * (0.5 * dt * dt)
            local tr = util.TraceHull({
                start = start,
                endpos = dest,
                mins = Vector(-1, -1, -1),
                maxs = Vector(1, 1, 1),
                filter = { self, self:GetOwner() },
                mask = MASK_SHOT,
            })
            self.DistanceFlown = self.DistanceFlown + start:Distance(tr.HitPos)
            if tr.Hit then
                self:SetPos(tr.HitPos)
                self:Impact(tr)
                return
            end
            self:SetPos(dest)
            self.Velocity = self.Velocity + gravity * dt
        end
        self:SetAngles(self.Velocity:Angle())
        self:NextThink(now)
        return true
    end
end
if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end
end
