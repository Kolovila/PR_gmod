local att = {}
att.name = "bg_aug_small_barrel"
att.displayName = "Short Barrel"
att.displayNameShort = "SHTRNG"
att.isBG = true

att.statModifiers = {DamageMult = 0.35,
AimSpreadMult = 0.25,
RecoilMult = 0.35,
OverallMouseSensMult = 0.20}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/icons/aug_small")
	att.description = {[1] = {t = "A barrel for CQC fights.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Decreases confidence by 50%", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.aug_small)
	self:updateSoundTo("CW_AUG_CHAN_SMALL_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_AUG_CHAN_SMALL_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)