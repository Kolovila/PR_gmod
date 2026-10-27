local att = {}
att.name = "bg_sgstock"
att.displayName = "Modified stock"
att.displayNameShort = "M. stock"
att.isBG = true

att.statModifiers = {RecoilMult = -0.05,
OverallMouseSensMult = -0.07}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15sturdystock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.sturdy)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)