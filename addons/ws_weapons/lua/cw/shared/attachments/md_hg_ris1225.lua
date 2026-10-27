local att = {}
att.name = "md_hg_ris1225"
att.displayName = "ris12.25"
att.displayNameShort = "ris12.25"
att.isBG = true

att.statModifiers = {
RecoilMult = 0.05,
DamageMult = 0.26,
FireDelayMult = 0.2, 
OverallMouseSensMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.ris)
	self:updateSoundTo("CW_MK18_RIS1225FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	--self:updateSoundTo("CW_AR15_LONGBARREL_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)