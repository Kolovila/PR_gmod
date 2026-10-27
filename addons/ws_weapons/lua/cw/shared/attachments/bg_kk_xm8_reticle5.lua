local att = {}
att.name = "bg_kk_xm8_reticle5"
att.displayName = "Reticle: Chevron"
att.displayNameShort = "Chevron"
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_hkxm8_receiver_scoped")
	att.description = {
		[1] = {t = "Changes reticle of default scope.", c = CustomizableWeaponry.textColors.REGULAR},
	}
	
	att.reticle = "qq_sprites/chevron"
end

CustomizableWeaponry:registerAttachment(att)