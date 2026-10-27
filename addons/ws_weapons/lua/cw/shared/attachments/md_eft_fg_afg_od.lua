local att = {}
att.name = "md_eft_fg_afg_od"
att.displayName = "Magpul AFG grip"
att.displayNameShort = "AFG O."

att.statModifiers = {VelocitySensitivityMult = -0.02,
DrawSpeedMult = -0.02,
RecoilMult = -0.2}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_afg_od")
end

CustomizableWeaponry:registerAttachment(att)