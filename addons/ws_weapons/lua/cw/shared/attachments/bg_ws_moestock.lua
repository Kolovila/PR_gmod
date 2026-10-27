local att = {}
att.name = "bg_ws_moestock"
att.displayName = "MOE CARBINE STOCK"
att.displayNameShort = "MOE"
att.isBG = true

att.statModifiers = {
	RecoilMult = -0.15,
	OverallMouseSensMult = -0.05
	//OverallMouseSensMult = 0.25,
	//DrawSpeedMult = 0.10
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_moestock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.moestock)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)