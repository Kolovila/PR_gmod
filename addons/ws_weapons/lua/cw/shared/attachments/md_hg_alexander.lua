local att = {}
att.name = "md_hg_alexander"
att.displayName = "alexander"
att.displayNameShort = "alexander"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.02,
DamageMult = 0.05,
FireDelayMult = 0.05, 
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.ris)
	self:updateSoundTo("CW_MK18_alexander", CustomizableWeaponry.sounds.UNSUPPRESSED)

end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)