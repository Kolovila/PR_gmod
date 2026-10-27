local att = {}
att.name = "md_eft_fg_afg_fde"
att.displayName = "Magpul AFG grip"
att.displayNameShort = "AFG Fd."

att.statModifiers = {VelocitySensitivityMult = -0.02,
DrawSpeedMult = -0.02,
RecoilMult = -0.2}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_afg_fde")
end

CustomizableWeaponry:registerAttachment(att)