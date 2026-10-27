local att = {}
att.name = "mw3_camo_hearts"
att.displayName = "#" .. att.name
att.displayNameShort = ""
att.skin = "hearts"

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("mw3_icons/camos/custom/heart")
	att.description = {
		[1] = {t = "#mw3_camo_custom_desc", c = CustomizableWeaponry.textColors.COSMETIC},
	} 
end

CustomizableWeaponry:registerAttachment(att)
