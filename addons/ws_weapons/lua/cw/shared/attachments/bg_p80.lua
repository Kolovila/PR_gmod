local att = {}
att.name = "bg_p80"
att.displayName = "G17"
att.displayNameShort = "g17"
att.isBG = true

att.statModifiers = {RecoilMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.slideBGs.main, self.slideBGs.PF940)
end

function att:detachFunc()
	self:setBodygroup(self.slideBGs.main, self.slideBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)