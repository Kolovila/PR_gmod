local att = {}
att.name = "pk_impact"
att.displayName = "Impact"
att.displayNameShort = "Impact"

att.statModifiers = {DamageMult = 0.15,
	RecoilMult = 0.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/magnumrounds")
	att.description = {}
end

CustomizableWeaponry:registerAttachment(att)