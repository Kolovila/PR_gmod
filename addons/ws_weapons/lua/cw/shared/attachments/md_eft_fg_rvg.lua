local att = {}
att.name = "md_eft_fg_rvg"
att.displayName = "Magpul RVG Grip"
att.displayNameShort = "RVG"

att.statModifiers = {VelocitySensitivityMult = -0.01,
DrawSpeedMult = -0.01,
RecoilMult = -0.4}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_rvg")
end

CustomizableWeaponry:registerAttachment(att)