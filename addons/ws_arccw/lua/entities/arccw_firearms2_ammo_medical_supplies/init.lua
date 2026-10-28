AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/medical/fas2/medical_supplies.mdl") 
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	local phys = self:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
	end
end

ENT.Uses = 4
ENT.CurrentUses = 4
ENT.Bodygroup = 0
ENT.CanUse = true

function ENT:OnTakeDamage(dmginfo)
	self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)
end

function ENT:Use(activator, caller)
	if activator:IsPlayer() and self.CanUse and self.Uses >= 1 then
		activator:GiveAmmo(2, "Bandages")
		activator:GiveAmmo(1, "Quikclots")
		activator:GiveAmmo(2, "Hemostats")
		activator:GiveAmmo(1, "Tourniquets")

		self.Uses = self.Uses - 1
		self.Bodygroup = self.Bodygroup + 1
		self:SetBodygroup(1, self.Bodygroup)
		self.CanUse = false

		timer.Simple(1, function()
			self.CanUse = true
		end)
	end

	if self.Uses <= 0 then
		self:Remove()
	end
end

function ENT:Think()
end


-- function ENT:Give()

--     local lp = LocalPlayer()

-- 	if activator:IsPlayer() and self.Uses >= 1 then
-- 		activator:GiveAmmo(1, "Bandages")
-- 		activator:GiveAmmo(1, "Quikclots")
-- 		activator:GiveAmmo(1, "Hemostats")
-- 		activator:GiveAmmo(1, "Tourniquets")
-- 		self.Uses = self.Uses - 1
-- 		self:SetBodygroup(0, self.Bodygroup - 1)
-- 	end
-- end

function ENT:OnRemove()
	return false
end
-- self:Remove()