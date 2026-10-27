local att = {}
att.name = "md_eft_mt_mpr45"
att.displayName = "NcStar MPR45 Backup mount"
att.displayNameShort = "MPR45"

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_mt_mpr45")
	att.description = {[1] = {t = "Provides an extra rail for mount.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

CustomizableWeaponry:registerAttachment(att)