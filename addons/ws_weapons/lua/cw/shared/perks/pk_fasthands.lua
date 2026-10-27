local att = {}
att.name = "pk_fasthands"
att.displayName = "Fast Hands"
att.displayNameShort = "FastHands"

att.description = {[1] = {t = "Allows you to draw faster and reload faster", c = CustomizableWeaponry.textColors.VPOSITIVE}}


att.statModifiers = {DrawSpeedMult = 1.5,
	ReloadSpeedMult = 1.5}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/magnumrounds")
	att.description = {}
end

CustomizableWeaponry:registerAttachment(att)