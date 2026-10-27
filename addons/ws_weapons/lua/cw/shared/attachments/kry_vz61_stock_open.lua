local att = {}
att.name = "kry_vz61_stock_open"
att.displayName = "Deploy buttstock"
att.displayNameShort = "Unfolded"
att.isBG = true

att.statModifiers = {DrawSpeedMult = -0.12,
RecoilMult = -0.17, AimSpreadMult = -0.11, HipSpreadMult = -0.1, ReloadSpeedMult = -0.05, OverallMouseSensMult = -0.04 }

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/cw_vz61_unf")
end

function att:attachFunc()
	self:setBodygroup(self.StocksBGs.stock, self.StocksBGs.unfolded)
	self.WorldModel = "models/weapons/krycek/w_vz61u_m9k.mdl"
end

function att:detachFunc()
	self:setBodygroup(self.StocksBGs.stock, self.StocksBGs.folded)
	self.WorldModel = "models/weapons/krycek/w_vz61_m9k.mdl"
end

CustomizableWeaponry:registerAttachment(att)