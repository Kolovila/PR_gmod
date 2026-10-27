local att = {}
att.name = "md_scar_longhg"
att.displayName = "long barrel"
att.displayNameShort = "barrel"
att.isBG = true

att.statModifiers = {DamageMult = -0.1,
AimSpreadMult = 0.1,
RecoilMult = -0.1,
FireDelayMult = -0.05,
OverallMouseSensMult = 0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/scar_short_barrel")
	att.description = {[1] = {t = "A barrel for short range engagements.", c = CustomizableWeaponry.textColors.REGULAR}}
end

CustomizableWeaponry:registerAttachment(att)