local att = {}
att.name = "md_hg_m16"
att.displayName = "m16"
att.displayNameShort = "m16"
att.isBG = true

att.statModifiers = {RecoilMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.ris)
		self:updateSoundTo("CW_MK18_fsp", CustomizableWeaponry.sounds.UNSUPPRESSED)

end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
		self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)