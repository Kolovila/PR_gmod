local att = {}
att.name = "md_eft_mt_rm35"
att.displayName = "Trijicon RMR mount for ACOG scopes"
att.displayNameShort = "RM35"

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_mt_mpr45")
	att.description = {[1] = {t = "Provides a mount point on ACOG for RMR.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

CustomizableWeaponry:registerAttachment(att)