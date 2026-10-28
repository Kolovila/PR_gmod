AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "arccw_ucex_projectile_base"
ENT.PrintName = "SMAW 9x51mm Spotting Round"
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/johnsheppard44/caliber/weapons/launchers/clbr_wpn_rl_pg-7l heat rocket (bg).mdl"
ENT.BoxSize = Vector(1, 1, 1)
ENT.SmokeTrail = false

ENT.Drag = false
ENT.Gravity = true
ENT.Boost = 0
ENT.Lift = 0

ENT.FuseTime = 0
ENT.Damage = 0
ENT.Radius = 0

ENT.HitDamage = 85
ENT.MarkTime = 12

if SERVER then
    function ENT:Detonate()
        if !self:IsValid() or self.Defused then return end

        local origin = self.HitPos or self:GetPos()
        local dir = (self.HitVelocity or self:GetVelocity())
        dir:Normalize()

        util.Decal("Impact.Concrete", origin - dir * 8, origin + dir * 16, self)
        self:EmitSound("uc_smaw/mech1_ranger.wav", 75, 130, 0.8, CHAN_AUTO)

        local effectdata = EffectData()
        effectdata:SetOrigin(origin)
        effectdata:SetNormal(-dir)
        util.Effect("cball_bounce", effectdata)

        self.Defused = true
        self.Marked = CurTime()
        self:SetNWFloat("SpotTime", CurTime())

        self:SetPos(origin - dir * 2)
        self:SetMoveType(MOVETYPE_NONE)
        self:SetSolid(SOLID_NONE)
        local phys = self:GetPhysicsObject()
        if IsValid(phys) then phys:EnableMotion(false) end

        local owner = self:GetOwner()
        if IsValid(owner) and owner.GetActiveWeapon then
            local wep = owner:GetActiveWeapon()
            if IsValid(wep) and wep.ArcCW then
                wep.SMAW_SpotPos = origin
                wep.SMAW_SpotTime = CurTime()
                wep.SMAW_SpotRange = (origin - owner:EyePos()):Length() * ArcCW.HUToM
            end
        end

        SafeRemoveEntityDelayed(self, self.MarkTime)
    end

    function ENT:PhysicsCollide(colData, physobj)
        if !self:IsValid() or self.Defused then return end

        local tgt = colData.HitEntity
        if IsValid(tgt) and (tgt:IsPlayer() or tgt:IsNPC()) then
            local dmg = DamageInfo()
            dmg:SetAttacker(IsValid(self:GetOwner()) and self:GetOwner() or self)
            dmg:SetInflictor(self)
            dmg:SetDamageType(DMG_BULLET)
            dmg:SetDamage(self.HitDamage)
            dmg:SetDamagePosition(colData.HitPos)
            dmg:SetDamageForce(colData.OurOldVelocity * 0.1)
            tgt:TakeDamageInfo(dmg)
        end

        self.HitPos = colData.HitPos
        self.HitVelocity = colData.OurOldVelocity
        self:Detonate()
    end
end

if CLIENT then
    local tracer = Material("effects/fas_glow_debris")
    local mark = Material("sprites/light_glow02_add")

    function ENT:Draw()
        local marked = self:GetNWFloat("SpotTime", 0)

        if marked > 0 then
            local age = CurTime() - marked
            local a = math.Clamp(1 - (age / (self.MarkTime or 12)), 0, 1)
            local pulse = 0.75 + math.sin(CurTime() * 6) * 0.25
            render.SetMaterial(mark)
            render.DrawSprite(self:GetPos(), 14 * pulse, 14 * pulse,
                Color(255, 90, 60, 255 * a))
        else
            render.SetMaterial(tracer)
            render.DrawSprite(self:GetPos(), 5, 5, Color(255, 200, 120, 220))
        end
    end
end
