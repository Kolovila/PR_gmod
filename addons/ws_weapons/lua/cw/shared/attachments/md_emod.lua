local att = {}
att.name = "md_emod"
att.displayName = "stock"
att.displayNameShort = "stock"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.01,
ReloadSpeedMult = 0.1
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

CustomizableWeaponry:registerAttachment(att)