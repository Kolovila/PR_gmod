local att = {}
att.name = "md_arstock"
att.displayName = "stock"
att.displayNameShort = "stock"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.01
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.stockBGs.main, self.stockBGs.stk)
end

function att:detachFunc()
	self:setBodygroup(self.stockBGs.main, self.stockBGs.none)
end

CustomizableWeaponry:registerAttachment(att)