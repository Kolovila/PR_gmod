local att = {}
att.name = "md_eft_fg_cqr"
att.displayName = "Hera Arms CQR tactical grip"
att.displayNameShort = "CQR"

att.statModifiers = {VelocitySensitivityMult = -0.015,
DrawSpeedMult = -0.015,
RecoilMult = -0.45}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_cqr")
end

CustomizableWeaponry:registerAttachment(att)