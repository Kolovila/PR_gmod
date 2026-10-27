local att = {}
att.name = "bg_ws_ar15_50_DMRstock"
att.displayName = "DMR stock"
att.displayNameShort = "D. Stock"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {RecoilMult = -0.1,
OverallMouseSensMult = -0.1,
DrawSpeedMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_ar15_50_DMRstock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.DMR)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)