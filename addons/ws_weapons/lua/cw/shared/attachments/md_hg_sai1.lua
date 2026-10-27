local att = {}
att.name = "md_hg_sai1"
att.displayName = "SAI"
att.displayNameShort = "SAI-9.5"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.05,
DamageMult = 0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.ris)
	self:updateSoundTo("CW_MK18_sai", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_MK18_sais", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)