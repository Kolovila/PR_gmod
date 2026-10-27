local att = {}
att.name = "bg_sleeveak"
att.displayName = "Sleeve Change"
att.displayNameShort = "Sleeve"
att.isBG = true


if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ak74heavystock")
	att.description = {
	[1] = {t = "Changes Viewmodel Arms", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.heavy)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)