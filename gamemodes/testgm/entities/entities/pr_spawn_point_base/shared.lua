-- Общая точка респа фракции. Наследники (spawn_point_SSNK и т. д.) задают только ENT.Faction.
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Category = "Респы для пр"

ENT.PrintName = "Точка респа"
ENT.Author = "Kolovila"
ENT.Spawnable = false

ENT.BaseHealth = 500
ENT.Model = "models/props_c17/FurnitureCouch002a.mdl"

ENT.Faction = ""

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Activated")
end
