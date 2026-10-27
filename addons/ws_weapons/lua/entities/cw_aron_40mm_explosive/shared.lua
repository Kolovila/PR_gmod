ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Launcher exp grenade"
ENT.Author = "Aron"
ENT.Information = "A 40MM grenade"
ENT.Spawnable = false
ENT.AdminSpawnable = false 

function ENT:SetupDataTables()
	self:DTVar("Bool", 0, "Misfire")
end