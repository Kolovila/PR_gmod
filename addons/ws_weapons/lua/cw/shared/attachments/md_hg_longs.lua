local att = {}
att.name = "md_hg_longs"
att.displayName = "Long-star"
att.displayNameShort = "Long-star"
att.isBG = true

att.statModifiers = {
RecoilMult = 0.3,
DamageMult = 0.35,
FireDelayMult = 0.4, 
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.ris)
	self:updateSoundTo("CW_MK18_longs", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_MK18_longss", CustomizableWeaponry.sounds.SUPPRESSED)


end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)