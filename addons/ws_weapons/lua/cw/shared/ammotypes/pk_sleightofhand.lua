local att = {}
att.name = "pk_sleightofhand"
att.displayName = "Sleight of Hand"
att.displayNameShort = "SOH"
att.description = {[1] = {t = "Allows you to draw faster and reload faster", c = CustomizableWeaponry.textColors.VPOSITIVE}}


att.statModifiers = {DrawSpeedMult = 0.5,
	ReloadSpeedMult = 0.5}

if CLIENT then
	att.displayIcon = surface.GetTextureID("rage_extras/icons/fasthandsboii")

end

CustomizableWeaponry:registerAttachment(att)