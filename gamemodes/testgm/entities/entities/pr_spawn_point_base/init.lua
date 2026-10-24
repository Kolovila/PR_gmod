AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- Активная точка респа каждой фракции: PR_FactionSpawns["SSNK"] = entity
PR_FactionSpawns = PR_FactionSpawns or {}

local function NotifyFaction(faction, text)
	for _, v in ipairs(player.GetAll()) do
		if v:GetNWString("PR_fraction") == faction then
			v:ChatPrint(text)
		end
	end
end

function ENT:Initialize()
	self:SetModel(self.Model)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetHealth(self.BaseHealth)
end

function ENT:SpawnFunction(ply, tr, ClassName)
	if not tr.Hit then return end

	local trace = util.TraceLine({
		start = ply:EyePos(),
		endpos = ply:EyePos() + 95 * ply:GetAimVector(),
		filter = ply
	})

	local ent = ents.Create(ClassName)
	ent:SetPos(trace.HitPos)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Use(activator)
	if not IsValid(activator) or not activator:IsPlayer() then return end
	if self.Faction == "" or not activator:GetNWBool("PR_leader_" .. self.Faction) then return end

	local old = PR_FactionSpawns[self.Faction]
	if IsValid(old) and old ~= self then
		old:SetActivated(false)
		old:SetColor(Color(255, 255, 255))
	end

	PR_FactionSpawns[self.Faction] = self

	if not self:GetActivated() then
		self:SetActivated(true)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)

		local phys = self:GetPhysicsObject()
		if IsValid(phys) then phys:Wake() end
	end

	self:SetColor(Color(255, 0, 0))
	NotifyFaction(self.Faction, "Точка респавна активирована")
end

function ENT:OnTakeDamage(dmg)
	self:SetHealth(self:Health() - dmg:GetDamage())

	if self:Health() <= 0 then
		self:Remove()
	end
end

function ENT:OnRemove()
	if PR_FactionSpawns[self.Faction] == self then
		PR_FactionSpawns[self.Faction] = nil
		NotifyFaction(self.Faction, "Вашу точку респавна сломали!")
	end
end

-- Свободное место рядом с точкой (рандомный разброс, как раньше: ±100 по X/Y)
local function FindSpawnSpot(point)
	local base = point:GetPos()

	for i = 1, 10 do
		local pos = base + Vector(math.random(-100, 100), math.random(-100, 100), 50)
		local tr = util.TraceHull({
			start = pos,
			endpos = pos - Vector(0, 0, 100),
			mins = Vector(-16, -16, 0),
			maxs = Vector(16, 16, 72),
			filter = point
		})

		if not tr.StartSolid then
			return tr.HitPos
		end
	end

	return base + Vector(0, 0, 50)
end

hook.Add("PlayerSpawn", "PR_FactionSpawnPoint", function(ply)
	local point = PR_FactionSpawns[ply:GetNWString("PR_fraction")]
	if IsValid(point) then
		ply:SetPos(FindSpawnSpot(point))
	end
end)
