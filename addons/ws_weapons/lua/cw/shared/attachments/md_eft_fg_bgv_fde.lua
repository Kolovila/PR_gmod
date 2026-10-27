local att = {}
att.name = "md_eft_fg_bgv_fde"
att.displayName = "Tango Down Stubby BGV-MK46K tactical grip"
att.displayNameShort = "BGV Fd."

att.statModifiers = {VelocitySensitivityMult = -0.02,
DrawSpeedMult = -0.02,
RecoilMult = -0.32}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_fg_afg_fde")
end

CustomizableWeaponry:registerAttachment(att)