local att = {}
att.name = "bg_ar9_nostock"
att.displayName = "No AR9 stock"
att.displayNameShort = "No Stock"
att.isBG = true
att.SpeedDec = -4

att.statModifiers = {RecoilMult = 0.2,
OverallMouseSensMult = 0.2,
DrawSpeedMult = 0.2
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("attsIcons/ar9nostock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.none)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)