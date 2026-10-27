local att = {}
att.name = "mp7a2_stock_fold"
att.displayName = "Fold Stock"
att.displayNameShort = "F. stock"
att.isBG = true
att.SpeedDec = 5

att.statModifiers = {DrawSpeedMult = 0.2,
OverallMouseSensMult = 0.2,
RecoilMult = 0.5}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mp7a2_stock_fold")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.folded)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(2,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.extended)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(2,0)
	end
end

CustomizableWeaponry:registerAttachment(att)