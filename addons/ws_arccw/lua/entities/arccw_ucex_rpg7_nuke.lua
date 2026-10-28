AddCSLuaFile()

ENT.Base = "arccw_uc_riflegrenade"
ENT.PrintName = "Fat Man"

ENT.GrenadeDamage = false
ENT.GrenadeRadius = 1600
ENT.DragCoefficient = 0.75
ENT.ExplosionEffect = false

ENT.Model = "models/johnsheppard44/caliber/weapons/launchers/clbr_wpn_rl_pg-7l heat rocket (bg).mdl"

function ENT:DoDetonation()
    for _,prop in pairs(ents.FindInSphere(self:GetPos(),self.GrenadeRadius)) do
        constraint.RemoveAll(prop)
    end

    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    util.BlastDamage(self, attacker, self:GetPos(), self.GrenadeRadius, self.GrenadeDamage or self.Damage or 0)

    ParticleEffect("nqb_explo",self:GetPos(),Angle(0,0,0))
    self:EmitSound("phx/explode0"..math.random(0,6)..".wav", 125, 100, 1, CHAN_AUTO)
    util.ScreenShake(self:GetPos(),45,5,1.5,self.GrenadeRadius * 5)

    local rads = ents.Create("arccw_uce_radiation")
    rads:SetPos(self:GetPos())
    rads.Creator = attacker
    rads.Duration = math.random(20,30)
    rads:Spawn()
    rads:Activate()
end
