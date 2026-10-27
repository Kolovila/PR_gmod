local att = {}
att.name = "md_cg_hk"
att.displayName = "hk"
att.displayNameShort = "hk"
att.isBG = true

att.statModifiers = {RecoilMult = -0.01}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.raptorBGs.main, self.raptorBGs.ljb)
end

function att:detachFunc()
	self:setBodygroup(self.raptorBGs.main, self.raptorBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)