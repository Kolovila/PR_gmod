local att = {}
att.name = "md_stock3"
att.displayName = "stock"
att.displayNameShort = "M16"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.15
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15sturdystock")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.stoksBGs.main, self.stoksBGs.stoks)
end

function att:detachFunc()
	self:setBodygroup(self.stoksBGs.main, self.stoksBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)