ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Grenade Launcher Grenade"
ENT.Author = "L337N008"
ENT.Information = "A grenade for the Grenade Launcher attachment for the Modern Warfare 3 rifles"
ENT.Spawnable = false
ENT.AdminSpawnable = false 

function ENT:SetupDataTables()
	self:DTVar("Bool", 100, "Misfire")
end