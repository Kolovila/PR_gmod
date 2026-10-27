local att = {}
att.name = "md_eft_fg_afg_mlok_blk"
att.displayName = "Magpul M-LOK AFG Tactical grip"
att.displayNameShort = "AFG M-LOK B."

att.statModifiers = {VelocitySensitivityMult = -0.02,
DrawSpeedMult = -0.02,
RecoilMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_mlok_blk")
end

CustomizableWeaponry:registerAttachment(att)