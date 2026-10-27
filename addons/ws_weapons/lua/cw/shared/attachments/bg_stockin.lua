local att = {}
att.name = "bg_stockin"
att.displayName = "Stock in"
att.displayNameShort = "Stocking"
att.isBG = true

att.statModifiers = {DrawSpeedMult = 0.25,
OverallMouseSensMult = 0.1,
RecoilMult = 0.2}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/retractablestock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.inside)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)