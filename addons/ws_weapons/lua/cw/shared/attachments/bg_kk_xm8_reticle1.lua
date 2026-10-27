local att = {}
att.name = "bg_kk_xm8_reticle1"
att.displayName = "Reticle: Circle with dot"
att.displayNameShort = "CircleDot"
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_hkxm8_receiver_scoped")
	att.description = {
		[1] = {t = "Changes reticle of default scope.", c = CustomizableWeaponry.textColors.POSITIVE},
	}
	
	att.reticle = "qq_sprites/circledot"
end

CustomizableWeaponry:registerAttachment(att)