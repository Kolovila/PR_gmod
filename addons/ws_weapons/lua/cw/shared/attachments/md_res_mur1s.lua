local att = {}
att.name = "md_res_mur1s"
att.displayName = "mur1s"
att.displayNameShort = "mur1s"
att.isBG = true

att.statModifiers = {RecoilMult = -0.01}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.recieverBGs.main, self.recieverBGs.default)
end

function att:detachFunc()
	self:setBodygroup(self.recieverBGs.main, self.recieverBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)