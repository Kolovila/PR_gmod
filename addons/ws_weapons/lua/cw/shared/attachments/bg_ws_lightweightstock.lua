local att = {}
att.name = "bg_ws_lightweightstock"
att.displayName = "Bad LBS lightweight stock"
att.displayNameShort = "LBS"
att.isBG = true

att.statModifiers = {
	RecoilMult = 0.25,
	OverallMouseSensMult = 0.25,
	DrawSpeedMult = 0.10
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_lightweightstock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.lightweight)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)