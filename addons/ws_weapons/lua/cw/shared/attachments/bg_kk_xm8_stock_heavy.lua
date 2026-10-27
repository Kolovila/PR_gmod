local att = {}
att.name = "bg_kk_xm8_stock_heavy"
att.displayName = "Stock from SL8"
att.displayNameShort = "SL8"
att.isBG = true

att.statModifiers = {
	RecoilMult = -0.2,
	OverallMouseSensMult = -0.05
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_kk_xm8_stock_heavy")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.heavy)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(self.StockBGs.main, self.StockBGs.heavy)
	end
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(self.StockBGs.main, self.StockBGs.regular)
	end
end

CustomizableWeaponry:registerAttachment(att)