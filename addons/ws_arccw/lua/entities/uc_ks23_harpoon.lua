AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "KS-23 Line-Throwing Harpoon"
ENT.Spawnable = false
ENT.NoPhys = true
function ENT:Initialize()
    self:SetModel("models/weapons/arccw/uc_ks23/harpoon.mdl")
    if SERVER then
        self:SetMoveType(MOVETYPE_NONE)
        self:SetSolid(SOLID_NONE)
        self.DieAt = CurTime() + 5
    end
end
function ENT:Launch(wep)
    local owner = wep:GetOwner()
    if not IsValid(owner) then
        self:Remove()
        return
    end
    local previous = owner:GetNW2Entity("UCKS23Line")
    if IsValid(previous) then
        previous:Remove()
    end
    self.Weapon = wep
    self:SetOwner(owner)
    self:SetNW2Entity("LineOwner", owner)
    self.Start = self:GetPos()
    local direction = self:GetAngles():Forward()

    self.CurVel = direction
            * math.Clamp(
                (wep:GetBuff("MuzzleVelocity") or 3500)
                    * (wep:GetBuff_Mult("Mult_PhysBulletMuzzleVelocity") or 1),
                1200,
                6000
            )
        + owner:GetVelocity()
    self.LastTime = CurTime()
    owner:SetNW2Entity("UCKS23Line", self)
end
function ENT:Think()
    if CLIENT then
        local owner = self:GetNW2Entity("LineOwner")
        if IsValid(owner) then
            self:SetRenderBoundsWS(owner:GetShootPos(), self:GetPos(), Vector(8, 8, 8))
        end
        return
    end
    local owner = self:GetOwner()
    if
        CurTime() > self.DieAt
        or not IsValid(owner)
        or not owner:Alive()
        or owner:GetActiveWeapon() ~= self.Weapon
        or not self.Weapon:GetBuff_Override("Override_UCKS23Harpoon")
        or owner:KeyDown(IN_USE)
    then
        self:Remove()
        return
    end
    local dt = math.Clamp(CurTime() - (self.LastTime or CurTime()), 0, 0.05)
    if self:GetNW2Bool("Anchored") then
        if self.AnchorEntity and not IsValid(self.AnchorEntity) then
            self:Remove()
            return
        end
        if IsValid(self.AnchorEntity) then
            local ent = self.AnchorEntity
            if
                (ent:IsPlayer() and not ent:Alive())
                or ((ent:IsNPC() or ent:IsNextBot()) and ent:Health() <= 0)
            then
                self:Remove()
                return
            end
            self:SetPos(ent:LocalToWorld(self.AnchorLocal))
        end
        UC_KS23.ReelHarpoonTarget(self, dt)
        if self:GetPos():DistToSqr(owner:GetShootPos()) > 3200 ^ 2 then
            self:Remove()
            return
        end
    elseif self.CurVel then
        self.CurVel = self.CurVel + Vector(0, 0, -300) * dt
        local pos = self:GetPos()
        local tr = util.TraceHull({
            start = pos,
            endpos = pos + self.CurVel * dt,
            mins = Vector(-1, -1, -1),
            maxs = Vector(1, 1, 1),
            filter = { owner, self, self.Weapon },
            mask = MASK_SHOT,
        })
        self:SetPos(tr.HitPos)
        self:SetAngles(self.CurVel:Angle())
        if tr.HitSky or self:GetPos():DistToSqr(self.Start) > 3000 ^ 2 then
            self:Remove()
            return
        end
        if tr.Hit then
            local ent = tr.Entity
            if IsValid(ent) and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot()) then
                local damage = DamageInfo()
                damage:SetDamage(65)
                damage:SetDamageType(DMG_SLASH)
                damage:SetAttacker(owner)
                damage:SetInflictor(self.Weapon)
                damage:SetDamagePosition(tr.HitPos)
                ent:TakeDamageInfo(damage)
                if
                    not IsValid(ent)
                    or (ent:IsPlayer() and not ent:Alive())
                    or ((ent:IsNPC() or ent:IsNextBot()) and ent:Health() <= 0)
                then
                    self:Remove()
                    return
                end
            end
            if not tr.HitWorld then
                local phys = IsValid(ent) and ent:GetPhysicsObject()
                local actor = IsValid(ent) and (ent:IsPlayer() or ent:IsNPC() or ent:IsNextBot())
                if not actor and not IsValid(phys) then
                    self:Remove()
                    return
                end
                self.AnchorEntity = ent
                self.AnchorLocal = ent:WorldToLocal(tr.HitPos)
                self:SetNW2Entity("AnchorTarget", ent)
            end
            self:SetNW2Bool("Anchored", true)
            self.DieAt = CurTime() + 30
            UC_KS23.ReelHarpoonTarget(self, 0)
            self:EmitSound("physics/metal/metal_solid_impact_bullet2.wav", 65, 105)
        end
    end
    self.LastTime = CurTime()
    self:NextThink(CurTime())
    return true
end
function ENT:OnRemove()
    if SERVER then
        local owner = self:GetOwner()
        if IsValid(owner) and owner:GetNW2Entity("UCKS23Line") == self then
            owner:SetNW2Entity("UCKS23Line", NULL)
        end
    end
end
if CLIENT then
    local cable = Material("cable/cable2")
    function ENT:Draw()
        self:DrawModel()
        local owner = self:GetNW2Entity("LineOwner")
        if not IsValid(owner) then
            return
        end
        self:SetRenderBoundsWS(owner:GetShootPos(), self:GetPos(), Vector(8, 8, 8))
        render.SetMaterial(cable)
        local start = owner:GetShootPos() + owner:GetAimVector() * 18 + Vector(0, 0, -5)
        local weapon = owner:GetActiveWeapon()
        local model = IsValid(weapon) and (weapon.WMModel or weapon)
        if owner == LocalPlayer() and not owner:ShouldDrawLocalPlayer() then
            model = owner:GetViewModel()
        end
        if IsValid(model) then
            local muzzle = model:GetAttachment(1)
            if muzzle then
                start = muzzle.Pos
            end
        end
        render.DrawBeam(
            start,
            self:GetPos(),
            0.65,
            0,
            self:GetPos():Distance(start) / 32,
            Color(170, 166, 148)
        )
    end
end
