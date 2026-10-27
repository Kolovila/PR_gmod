local att = {}
att.name = "md_muzzle_sai"
att.displayName = "SAI"
att.displayNameShort = "SAI"
att.isSuppressor = false

att.statModifiers = {OverallMouseSensMult = -0.033,
RecoilMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/pbs1")
	att.description = {[1] = {t = "Decreases firing noise.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

CustomizableWeaponry:registerAttachment(att)