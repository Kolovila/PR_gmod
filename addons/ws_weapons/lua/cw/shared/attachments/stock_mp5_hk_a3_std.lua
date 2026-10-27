local att = {}
att.name = "stock_mp5_hk_a3_std"
att.displayName = "Retractable stock"
att.displayNameShort = "R. stock"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {DrawSpeedMult = 0.1,
OverallMouseSensMult = 0.1,
RecoilMult = 0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_stock_mp5a3")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.a3)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(14,2)
	end
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(14,0)
	end
end

CustomizableWeaponry:registerAttachment(att)