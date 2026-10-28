ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "KS-23 ZVEZDA Round"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/shells/454casull.mdl"   

AddCSLuaFile()

if SERVER then

    function ENT:Initialize()
        self:SetModel(self.Model)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_NONE)

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
        end
    end

    function ENT:Think()
        timer.Simple(0.05, function()
            if !IsValid(self) then return end
            self:Remove()
        end)
    end

end

function ENT:Detonate(isbody)
    if SERVER then
        if !self:IsValid() then return end
        if self:WaterLevel() >= 1 then self:Remove() return end
        self:EmitSound("fas2/m84/flashbang_explode1.wav", 100, 100, 1, CHAN_ITEM)
        self:EmitSound("fas2/m84/flashbang_explode1_distant.wav", 160, 100, 1, CHAN_WEAPON)

		    pos = self:GetPos()
		    own = self:GetOwner()

        local effectdata = EffectData()
			        effectdata:SetOrigin( self:GetPos() )
			        ParticleEffect("explosion_flashbang", pos, Angle(0, 0, 0), nil)
                local targets = ents.FindInSphere(self:GetPos(), 128)
                    for _, k in pairs(targets) do
            if k:IsPlayer() then
                local dp = (k:EyePos() - self:GetPos()):DotProduct(k:EyeAngles():Forward())
            if dp < 0.5 then
                local time = Lerp( self:GetPos():Distance(k:GetPos()) / 128, 1, 0.25 )
                    if self:Visible( k ) then
                        k:ScreenFade( SCREENFADE.IN, Color( 255, 255, 255, 255 ), 1, time )
					    k:SetDSP( 37, false )
                    end
                end
            end
        end
        self:Remove()
    end
end

function ENT:PhysicsCollide(colData, collider)
    local collent = colData.HitEntity
    self:Detonate( IsValid(collent) and ( collent:IsPlayer() or collent:IsNPC() ) )
end

function ENT:Draw()
    self:DrawModel()
end