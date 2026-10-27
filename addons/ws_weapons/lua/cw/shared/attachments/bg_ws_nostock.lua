local att = {}
att.name = "bg_ws_nostock"
att.displayName = "No stock"
att.displayNameShort = "No stock"
att.isBG = true

att.statModifiers = {
	RecoilMult = 0.5,
	OverallMouseSensMult = 0.5,
	DrawSpeedMult = 0.25
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_nostock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.none)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)