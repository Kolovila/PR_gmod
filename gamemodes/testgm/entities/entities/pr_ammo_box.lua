-- Патроны из магазина снаряжения (вместо подсумков и ящиков CW 2.0, которые знали только стволы CW).
-- «Использовать» — магазин патронов к стволу в руках, не больше 12 магазинов в запасе; запас
-- ящика — Charges раз, потом ящик исчезает. Размеры — pr_ammo_kit_small / pr_ammo_kit /
-- pr_ammo_crate_small / pr_ammo_crate.
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Патроны"
ENT.Category = "PR"
ENT.Spawnable = false
ENT.Model = "models/Items/BoxSRounds.mdl"
ENT.Charges = 6
ENT.MaxMags = 12
ENT.UseDelay = 0.5

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Left")
end

if SERVER then
	function ENT:Initialize()
		self:SetModel(self.Model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		local phys = self:GetPhysicsObject()
		if IsValid(phys) then phys:Wake() end
		self:SetLeft(self.Charges)
	end

	-- Магазин ствола: у ArcCW — с учётом обвеса
	local function MagSize(wep)
		local n = wep.GetCapacity and wep:GetCapacity() or wep:GetMaxClip1()
		return math.max(tonumber(n) or 0, 1)
	end

	function ENT:Use(ply)
		if not (IsValid(ply) and ply:IsPlayer() and ply:Alive()) then return end
		if CurTime() < (ply.PR_AmmoBoxAt or 0) then return end
		ply.PR_AmmoBoxAt = CurTime() + self.UseDelay
		local wep = ply:GetActiveWeapon()
		if not IsValid(wep) then return end
		local ammo = wep:GetPrimaryAmmoType()
		if ammo < 0 then return end
		local mag = MagSize(wep)
		local have = ply:GetAmmoCount(ammo)
		local cap = mag * self.MaxMags
		if have >= cap then return end
		ply:SetAmmo(math.min(have + mag, cap), ammo)
		ply:EmitSound("items/ammo_pickup.wav", 60, 100)
		self:SetLeft(self:GetLeft() - 1)
		if self:GetLeft() <= 0 then SafeRemoveEntity(self) end
	end
else
	function ENT:Draw()
		self:DrawModel()
		local ply = LocalPlayer()
		if ply:GetPos():DistToSqr(self:GetPos()) > 250 * 250 then return end
		local pos = self:GetPos() + Vector(0, 0, self:OBBMaxs().z + 8)
		local ang = (ply:EyePos() - pos):Angle()
		ang:RotateAroundAxis(ang:Up(), 90)
		ang:RotateAroundAxis(ang:Forward(), 90)
		cam.Start3D2D(pos, Angle(0, ang.y, 90), 0.08)
			draw.SimpleTextOutlined(self.PrintName .. ": " .. self:GetLeft(), "DermaLarge", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, color_black)
		cam.End3D2D()
	end
end
