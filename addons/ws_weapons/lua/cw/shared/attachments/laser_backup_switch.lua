local att = {}
att.name = "laser_backup_switch"
att.displayName = "Position Switch"
att.displayNameShort = "Switch"
att.isBG = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/timg")
	att.description = {[1] = {t = "Switch the position of laser and backup sight when you need to.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

CustomizableWeaponry:registerAttachment(att)