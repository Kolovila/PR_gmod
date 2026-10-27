AddCSLuaFile()

ENT.Type 			= "anim"
ENT.PrintName		= "7.62x35mm Tokarev Ammo Box"
ENT.Category		= "Nikolai's CW Ammunition"

ENT.Spawnable		= true
ENT.AdminSpawnable	= true

ENT.Model 			= "models/Items/BoxMRounds.mdl"

function ENT:Use(activator, caller)

	if (activator:IsPlayer()) then
		local wep = activator:GetActiveWeapon()
		self:EmitSound("Nik.AmmoPickup")
		activator:GiveAmmo(100, "7.62x25MM Tokarev")
		self:StopSound( "Player.PickupWeapon" )
		self:Remove()
	end

end

if CLIENT then
	function ENT:Initialize()

	end
	function ENT:Draw()
		self:DrawModel()
	end
end

if SERVER then
	function ENT:SpawnFunction(ply, tr, ClassName)

		if (!tr.Hit) then return end
		
		local SpawnPos = tr.HitPos + tr.HitNormal * 16
		
		local ent = ents.Create(ClassName)
			ent:SetPos(SpawnPos)
		ent:Spawn()
		ent:Activate()
		
		return ent
	end

	function ENT:Initialize()

		self:SetModel(self.Model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(true)

		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		
		local phys = self:GetPhysicsObject()
		
		if (phys:IsValid()) then
			phys:Wake()
		end

		self:SetUseType(SIMPLE_USE)
	end

	function ENT:PhysicsCollide(data, physobj)
		if (data.Speed > 80 and data.DeltaTime > 0.2) then
			self:EmitSound("Nik.CrateImpactSoft")
		end
	end

	function ENT:OnTakeDamage(dmginfo)
		self:TakePhysicsDamage(dmginfo)
	end
end