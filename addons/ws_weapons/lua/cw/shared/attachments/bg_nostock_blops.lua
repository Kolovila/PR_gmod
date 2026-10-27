local att = {}
att.name = "bg_nostock_blops"
att.displayName = "No stocks"
att.displayNameShort = "Nope"
att.isBG = true

att.statModifiers = {DrawSpeedMult = 0.5,
OverallMouseSensMult = 0.5,
RecoilMult = 0.5}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/nostock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.nope)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)