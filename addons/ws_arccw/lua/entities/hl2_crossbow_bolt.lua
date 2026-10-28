AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Crossbow Bolt"
ENT.Author			= "FiLzO"
ENT.Information		= ""
ENT.Category		= "Half-Life 2"

ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

function ENT:Initialize()

	self:SetModel("models/weapons/shell.mdl")
	self:SetNoDraw(true)
	self:DrawShadow(false)

	self.cross_bolt = ents.Create("crossbow_bolt")
	self.cross_bolt:SetPos( self:GetPos() + Vector(0,0,30) )
	self.cross_bolt:SetAngles( self:GetAngles() )
	self.cross_bolt:SetOwner( self.Owner )
	self.cross_bolt:Spawn()
	self.cross_bolt:Activate()
	local cross_bolt_name = "cross_bolt" .. self.cross_bolt:EntIndex()
	self.cross_bolt:SetName( cross_bolt_name )

end
function ENT:Think()
	if !IsValid (self.cross_bolt) then
	self:Remove()
	end
end
function ENT:OnRemove()
	if IsValid (self.cross_bolt) then
	self.cross_bolt:Remove()
	end
end
end
