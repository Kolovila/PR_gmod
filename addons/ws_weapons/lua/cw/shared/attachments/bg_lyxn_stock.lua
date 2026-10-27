local att = {}
att.name = "bg_lyxn_stock"
att.displayName = "Shotgun Stock"
att.displayNameShort = "Stock"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {
AimSpreadMult = -0.1,
HipSpreadMult = -0.1,
RecoilMult = -0.1,
DrawSpeedMult = -0.1,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/stock")
	att.description = {[1] = {t = "A shotgun Stock", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.Stock)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)