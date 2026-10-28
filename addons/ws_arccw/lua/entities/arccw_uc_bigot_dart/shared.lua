AddCSLuaFile()

ENT.Type 				= "anim"
ENT.Base 				= "base_anim"
ENT.PrintName 			= "Bigot Dart"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false
ENT.AdminOnly 			= false
ENT.RenderGroup 		= RENDERGROUP_OPAQUE

ENT.Model 				= "models/crossbow_bolt.mdl"

ENT.Damage 				= 45
ENT.DamageType 			= DMG_SLASH
ENT.ImpactForce 		= 4
ENT.PenetrateFlesh 		= true
ENT.PenetrateSpeedLoss 	= 0.5

ENT.MuzzleVelocity 		= 3000
ENT.GravityScale 		= 0.75
ENT.AirDrag 			= 0.10
ENT.MinStickSpeed 		= 200

ENT.Lifetime 			= 30
ENT.StuckLifetime 		= 20

ENT.ImpactSound 		= "weapons/crossbow/bolt_skewer1.wav"
ENT.HitFleshSound 		= "physics/flesh/flesh_squishy_impact_hard2.wav"

if SERVER then

function ENT:Initialize()
	self:SetModel(self.Model)
	self:DrawShadow(false)

	self:PhysicsInitBox(Vector(-1, -1, -1), Vector(1, 1, 1))
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetMass(2)
		phys:Wake()
	end

	self.SpawnTime = CurTime()
	self.Struck = false
	self.LastPos = self:GetPos()
	self.Filter = {self}

	local owner = self:GetOwner()
	if IsValid(owner) then
		table.insert(self.Filter, owner)
	end

	timer.Simple(0, function()
		if not IsValid(self) then return end
		self:Launch()
	end)

	SafeRemoveEntityDelayed(self, self.Lifetime)
end

function ENT:Launch()
	local vel = self:GetVelocity()
	local speed = vel:Length()
	local dir = speed > 1 and vel:GetNormalized() or self:GetAngles():Forward()

	if speed < self.MuzzleVelocity then
		speed = self.MuzzleVelocity
	end

	self:PhysicsDestroy()
	self:SetMoveType(MOVETYPE_FLYGRAVITY)
	self:SetSolid(SOLID_NONE)
	self:SetGravity(self.GravityScale)
	self:SetLocalVelocity(dir * speed)
	self:SetAngles(dir:Angle())

	self.LastPos = self:GetPos()
	self.Launched = true
end

function ENT:GetAttacker()
	local owner = self:GetOwner()
	if IsValid(owner) then return owner end
	return self
end

function ENT:Think()
	if self.Struck or not self.Launched then return end

	local pos = self:GetPos()
	local last = self.LastPos or pos

	if pos ~= last then
		local tr = util.TraceLine({
			start = last,
			endpos = pos,
			filter = self.Filter,
			mask = MASK_SHOT
		})

		if tr.Hit then
			self:Impact(tr)
			if not IsValid(self) or self.Struck then return end
		end
	end

	local vel = self:GetVelocity()
	if vel:LengthSqr() > 1 then
		self:SetAngles(vel:Angle())

		if self.AirDrag > 0 then
			self:SetLocalVelocity(vel * (1 - self.AirDrag * FrameTime()))
		end
	end

	self.LastPos = self:GetPos()

	self:NextThink(CurTime())
	return true
end

function ENT:Impact(tr)
	local ent = tr.Entity
	local dir = self:GetVelocity():GetNormalized()
	local speed = self:GetVelocity():Length()

	local flesh = IsValid(ent) and (ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot()
		or ent:GetClass() == "prop_ragdoll")

	if IsValid(ent) and not ent:IsWorld() then
		local dmg = DamageInfo()
		dmg:SetAttacker(self:GetAttacker())
		dmg:SetInflictor(self)
		dmg:SetDamage(self.Damage)
		dmg:SetDamageType(self.DamageType)
		dmg:SetDamagePosition(tr.HitPos)
		dmg:SetDamageForce(dir * self.Damage * self.ImpactForce)
		ent:TakeDamageInfo(dmg)
	end

	if flesh then
		self:EmitSound(self.HitFleshSound, 55, math.random(95, 105))

		local eff = EffectData()
		eff:SetOrigin(tr.HitPos)
		eff:SetNormal(-dir)
		eff:SetEntity(ent)
		util.Effect("BloodImpact", eff)

		if self.PenetrateFlesh and speed * self.PenetrateSpeedLoss > self.MinStickSpeed then
			table.insert(self.Filter, ent)
			self:SetPos(tr.HitPos + dir * 8)
			self:SetLocalVelocity(dir * speed * self.PenetrateSpeedLoss)
			self.LastPos = self:GetPos()
			return
		end
	else
		self:EmitSound(self.ImpactSound, 60, math.random(95, 105))

		local eff = EffectData()
		eff:SetOrigin(tr.HitPos)
		eff:SetNormal(tr.HitNormal)
		util.Effect("Impact", eff)
		util.Decal("ManhackCut", tr.HitPos - dir * 8, tr.HitPos + dir * 8, self)
	end

	self:Stick(tr.HitPos, dir, ent)
end

function ENT:Stick(hitpos, dir, hitent)
	if self.Struck then return end
	self.Struck = true

	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_NONE)
	self:SetLocalVelocity(vector_origin)

	if hitpos then
		self:SetPos(hitpos - dir * 4)
	end

	if IsValid(hitent) and not hitent:IsWorld() then
		self:SetParent(hitent)
	end

	SafeRemoveEntityDelayed(self, self.StuckLifetime)
end

end

function ENT:Draw()
	self:DrawModel()
end
