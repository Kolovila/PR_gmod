local att = {}
att.name = "md_eft_fg_cobra"
att.displayName = "SI (Cobra tactical) tactical grip"
att.displayNameShort = "Cobra"

att.statModifiers = {VelocitySensitivityMult = -0.02,
DrawSpeedMult = -0.02,
RecoilMult = -0.19}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_cobra")
end

CustomizableWeaponry:registerAttachment(att)