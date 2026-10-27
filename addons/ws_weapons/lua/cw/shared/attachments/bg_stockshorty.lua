local att = {}
att.name = "bg_stockshorty"
att.displayName = "Shortened Stock"
att.displayNameShort = "S. Stock"
att.isBG = true
att.SpeedDec = -3

att.statModifiers = {DrawSpeedMult = 0.1,
RecoilMult = 0.15,AimSpreadMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/stockshorty")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.shorty)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)