local att = {}
att.name = "cod_bo_rapid_fire"
att.displayName = "Rapid Fire"
att.displayNameShort = "RF"

att.statModifiers = {FireDelayMult = -0.25}

if CLIENT then
	att.description = {[1] = {t = "Increased fire rate.", c = CustomizableWeaponry.textColors.POSITIVE}}
	att.displayIcon = surface.GetTextureID("aron_icons/rapid_fire")
end



CustomizableWeaponry:registerAttachment(att)