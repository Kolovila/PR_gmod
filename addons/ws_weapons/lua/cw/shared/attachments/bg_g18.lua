local att = {}
att.name = "bg_g18"
att.displayName = "G18"
att.displayNameShort = "g18"
att.isBG = true

att.statModifiers = {RecoilMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.slideBGs.main, self.slideBGs.g18c)
end

function att:detachFunc()
	self:setBodygroup(self.slideBGs.main, self.slideBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)