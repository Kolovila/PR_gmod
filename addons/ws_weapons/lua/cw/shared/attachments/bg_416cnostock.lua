local att = {}
att.name = "bg_416cnostock"
att.displayName = "No stock"
att.displayNameShort = "No stock"
att.isBG = true
att.SpeedDec = -5

att.statModifiers = {DrawSpeedMult = 0.2,
RecoilMult = 0.2,
OverallMouseSensMult = 0.2}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/416cnostock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.none)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)