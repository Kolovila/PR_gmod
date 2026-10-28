AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "M32"

local UO = ArcCW.UO

ENT.GrenadeRadius = 660
ENT.GrenadeDamage = 175
ENT.FuseTime = 4.2

ENT.ExplosionParticle = UO.Particles.HE

ENT.Model = "models/weapons/w_ww2_m32.mdl"
ENT.ModelFallback = "models/weapons/w_grenade.mdl"

ENT.ArmedModel = "models/weapons/w_ww2_m32_activated.mdl"

ENT.PhysMass = 0.5
ENT.PhysElasticity = 0.18

ENT.ExplosionSounds = UO.Sound({"germany_ww2/explosives/grenade_explosion1.wav", "germany_ww2/explosives/grenade_explosion2.wav"}, UO.Snd.Explosion)
ENT.ExplosionSoundsIndoors = UO.Sound({"germany_ww2/explosives/explode_close_indoor_01.wav"}, UO.Snd.ExplosionIn)

if SERVER then

    function ENT:OnArmed()
        if !self.ArmedModel or !util.IsValidModel(self.ArmedModel) then return end

        self:SetModel(self.ArmedModel)

        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)

        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:SetMaterial(self.PhysMaterial)
            if self.PhysMass then phys:SetMass(self.PhysMass) end
            phys:SetVelocity(self.ArmVel or vector_origin)
            phys:Wake()
        else
            self:PhysicsInitSphere(2, self.PhysMaterial)
        end
    end

    function ENT:GrenadeThink()
        if self:GetArmed() then return end
        local phys = self:GetPhysicsObject()
        if IsValid(phys) then self.ArmVel = phys:GetVelocity() end
    end

    function ENT:PostDetonation()
        UO.Shrapnel(self, self:GetAttacker(), 34, 15, 1150)
    end

end
