ENT.Base = "npc_vj_human_base"
ENT.Type = "ai"
ENT.PrintName = "Боец патруля"
ENT.Author = "PR"
ENT.Category = "TestPR"

-- Цвет плеермодели (прокси материала player_color)
function ENT:SetupDataTables()
	self:NetworkVar("Vector", 0, "PlayerColor")
end
