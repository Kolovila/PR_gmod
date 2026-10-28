AddCSLuaFile()
ENT.Base = "arccw_uo_nade_base"
ENT.PrintName = "No. 74 ST"

local UO = ArcCW.UO

ENT.GrenadeRadius = 620
ENT.GrenadeDamage = 260
ENT.FuseTime = 5

ENT.ExplosionParticle = UO.Particles.Big
ENT.ExplosionShake = 50

ENT.Model = "models/weapons/sticky_gren/sticky_gren_proj.mdl"
ENT.ModelFallback = "models/weapons/sticky_gren/w_sticky_gren.mdl"

ENT.PhysMass = 1
ENT.PhysElasticity = 0
ENT.ArmTime = 0.2

ENT.StickSpeed = 60

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Armed")
    self:NetworkVar("Float", 0, "DetonateAt")
    self:NetworkVar("Bool", 1, "Stuck")
end

if SERVER then

    function ENT:OnGrenadeSpawned()
        self.FuseTime = math.huge
    end

    function ENT:OnGrenadeCollide(data, physobj)
        if self:GetStuck() then return end
        if !self:GetArmed() then return end
        if data.Speed < self.StickSpeed then return end

        local hit = data.HitEntity
        local pos = data.HitPos

        timer.Simple(0, function()
            if !IsValid(self) or self:GetStuck() then return end
            self:Stick(pos, hit)
        end)
    end

    function ENT:Stick(pos, hit)
        if self:GetStuck() then return end
        self:SetStuck(true)

        self:SetPos(pos)
        self:SetMoveType(MOVETYPE_NONE)

        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:EnableMotion(false)
            phys:Sleep()
        end

        if IsValid(hit) and !hit:IsWorld() then
            self:SetParent(hit)
        end

        self:EmitSound(UO.PickSound(UO.Snd.BounceSoft), 65, 80, 0.9)

        self.SpawnTime = CurTime()
        self.FuseTime = self.StickFuse or 5
        self:SetDetonateAt(CurTime() + self.FuseTime)
    end

    function ENT:PostDetonation()
        UO.Shrapnel(self, self:GetAttacker(), 8, 8, 400)
        UO.BustDoors(self, self:GetPos(), self.GrenadeRadius)
    end

end

if CLIENT then
    function ENT:GrenadeThinkCL()
        if !self:GetStuck() then return end
        if self.Ticks % 6 != 0 then return end

        local dl = DynamicLight(self:EntIndex())
        if dl then
            dl.Pos = self:GetPos()
            dl.r, dl.g, dl.b = 255, 200, 120
            dl.Brightness = 0.5
            dl.Decay = 1200
            dl.Size = 50
            dl.DieTime = CurTime() + 0.12
        end
    end
end
