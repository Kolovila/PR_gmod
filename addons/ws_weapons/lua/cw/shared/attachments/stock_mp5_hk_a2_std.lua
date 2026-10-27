local att = {}
att.name = "stock_mp5_hk_a2_std"
att.displayName = "Solid stock"
att.displayNameShort = "S. stock"
att.isBG = true
att.SpeedDec = 5

att.statModifiers = {DrawSpeedMult = -0.2,
OverallMouseSensMult = -0.2,
RecoilMult = -0.2}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/solidstock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.a2)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(14,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(14,0)
	end
end

CustomizableWeaponry:registerAttachment(att)