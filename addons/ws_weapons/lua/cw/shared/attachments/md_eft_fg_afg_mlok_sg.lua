local att = {}
att.name = "md_eft_fg_afg_mlok_sg"
att.displayName = "Magpul M-LOK AFG Tactical grip"
att.displayNameShort = "AFG M-LOK S."

att.statModifiers = {VelocitySensitivityMult = -0.02,
DrawSpeedMult = -0.02,
RecoilMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_mlok_sg")
end

CustomizableWeaponry:registerAttachment(att)