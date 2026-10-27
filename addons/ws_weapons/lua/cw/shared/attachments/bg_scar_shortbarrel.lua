local att = {}
att.name = "bg_scar_shortbarrel"
att.displayName = "Short barrel"
att.displayNameShort = "Short"
att.isBG = true

att.statModifiers = {DamageMult = -0.1,
AimSpreadMult = 0.1,
RecoilMult = -0.1,
FireDelayMult = -0.2,
OverallMouseSensMult = 0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/scar_short_barrel")
	att.description = {[1] = {t = "A barrel for short range engagements.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
	self:updateSoundTo("CW_BER_SCAR_H_FIRE_SHORT", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_BER_SCAR_H_FIRE_SHORT_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
	
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)