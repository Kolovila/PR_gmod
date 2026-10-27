local att = {}
att.name = "bg_kk_xm8_reticle3"
att.displayName = "Reticle: Big Circle"
att.displayNameShort = "BCircle"
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_hkxm8_receiver_scoped")
	att.description = {
		[1] = {t = "Changes reticle of default scope.", c = CustomizableWeaponry.textColors.REGULAR},
	}
	
	att.reticle = "qq_sprites/bigcircle"
end

CustomizableWeaponry:registerAttachment(att)