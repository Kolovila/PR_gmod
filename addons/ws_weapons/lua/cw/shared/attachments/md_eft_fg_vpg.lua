local att = {}
att.name = "md_eft_fg_vpg"
att.displayName = "KAC Vertical Pistol Grip"
att.displayNameShort = "VPG"

att.statModifiers = {VelocitySensitivityMult = -0.05,
DrawSpeedMult = -0.05,
RecoilMult = -0.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_vpg")
end

CustomizableWeaponry:registerAttachment(att)