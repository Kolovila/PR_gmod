local att = {}
att.name = "bg_mk11magpulstock"
att.displayName = "Magpul Moe stock"
att.displayNameShort = "MM stock"
att.isBG = true

att.statModifiers = {RecoilMult = -0.1,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_mk11magpulstock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.sturdy)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)