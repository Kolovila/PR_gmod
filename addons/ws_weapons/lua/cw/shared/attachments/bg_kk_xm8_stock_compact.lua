local att = {}
att.name = "bg_kk_xm8_stock_compact"
att.displayName = "Compact Stock"
att.displayNameShort = "Compact"
att.isBG = true

att.statModifiers = {
	RecoilMult = 0.5,
	OverallMouseSensMult = 0.5,
	DrawSpeedMult = 0.25
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_kk_xm8_stock_compact")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.compact)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(self.StockBGs.main, self.StockBGs.compact)
	end
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(self.StockBGs.main, self.StockBGs.regular)
	end
end

CustomizableWeaponry:registerAttachment(att)