local att = {}
att.name = "md_eft_fg_afg_blk"
att.displayName = "Magpul AFG grip"
att.displayNameShort = "AFG B."

att.statModifiers = {VelocitySensitivityMult = -0.02,
DrawSpeedMult = -0.02,
RecoilMult = -0.2}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_afg_blk")
end

CustomizableWeaponry:registerAttachment(att)