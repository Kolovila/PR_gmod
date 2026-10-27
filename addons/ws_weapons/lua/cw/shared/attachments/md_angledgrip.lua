local att = {}
att.name = "md_angledgrip"
att.displayName = "Angled Grip"
att.displayNameShort = "Anggrip"

att.statModifiers = {VelocitySensitivityMult = -0.3,
OverallMouseSensMult = -0.15,
RecoilMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/foregrip")
end

function att:attachFunc()
	self.ForegripOverride = true
	self.ForegripParent = "md_angledgrip"
end

function att:detachFunc()
	self.ForegripOverride = false
end

CustomizableWeaponry:registerAttachment(att)