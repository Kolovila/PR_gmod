local att = {}
att.name = "stock_mp5_hk_pistol_end_cap"
att.displayName = "No stock"
att.displayNameShort = "None"
att.isBG = true
att.SpeedDec = 1

att.statModifiers = {DrawSpeedMult = 0.2,
OverallMouseSensMult = -0.05,
RecoilMult = 0.2}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_stock_mp5_cap")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.pcap)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(14,3)
	end
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(14,0)
	end
end

CustomizableWeaponry:registerAttachment(att)