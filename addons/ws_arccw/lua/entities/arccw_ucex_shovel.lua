AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

local STICK_DEPTH = 15
local WELD_FORCE = 0

function ENT:Initialize()
    if CLIENT then return end

    self:SetModel("models/rs2vietnamznalecc/props_weapons_shovel.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetTrigger(true)

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:SetMass(20)
    end

    self.HasHit = false
end

function ENT:PhysicsCollide(colData, collider)
    if CLIENT or self.HasHit then return end

    local ent = colData.HitEntity
    if not IsValid(ent) and not ent:IsWorld() then return end

    self.HasHit = true
    local hitPos = colData.HitPos
    local hitNormal = colData.HitNormal
    local forward = colData.OurOldVelocity:GetNormalized()
    local owner = self:GetOwner()

    if IsValid(ent) then
        local dmg = DamageInfo()
        dmg:SetDamage(colData.OurOldVelocity:Length() / 10)
        dmg:SetAttacker(IsValid(owner) and owner or self)
        dmg:SetInflictor(self)
        dmg:SetDamageType(DMG_NEVERGIB)
        ent:TakeDamageInfo(dmg)
    end

    timer.Simple(0, function()
        if not IsValid(self) then return end

        self:SetMoveType(MOVETYPE_NONE)
        self:SetSolid(SOLID_NONE)

        local finalPos = hitPos + (forward * STICK_DEPTH)
        self:SetPos(finalPos)

        self:SetAngles(forward:Angle())

        if ent:IsWorld() then
        elseif IsValid(ent) then
            if ent:IsPlayer() or ent:IsNPC() or ent:IsRagdoll() then
                local bone = ent:TranslatePhysBoneToBone(colData.TheirPhysicsBone or 0) or 0
                self:SetParent(ent, bone)
            else
                constraint.Weld(self, ent, 0, colData.TheirPhysicsBone or 0, WELD_FORCE, true, false)
            end
        end

        self:EmitSound("physics/metal/sawblade_stick" .. math.random(1, 3) .. ".wav", 75, 100)
    end)
end

function ENT:Touch(ent)
    if self.HasHit then return end
    if ent:IsPlayer() or ent:IsNPC() then
        local fakeCol = {
            HitEntity = ent,
            OurOldVelocity = self:GetVelocity(),
            HitPos = self:GetPos(),
            HitNormal = self:GetAngles():Forward() * -1,
            TheirPhysicsBone = 0
        }
        self:PhysicsCollide(fakeCol, nil)
    end
end
