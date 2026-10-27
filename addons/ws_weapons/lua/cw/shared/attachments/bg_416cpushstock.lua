local att = {}
att.name = "bg_416cpushstock"
att.displayName = "Push stock"
att.displayNameShort = "P. stock"
att.isBG = true

att.statModifiers = {DrawSpeedMult = 0.15,
RecoilMult = 0.1,
OverallMouseSensMult = 0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/416cpushstock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.push)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)