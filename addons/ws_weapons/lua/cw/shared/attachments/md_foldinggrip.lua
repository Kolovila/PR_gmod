local att = {}
att.name = "md_foldinggrip"
att.displayName = "Folding Grip"
att.displayNameShort = "foldgrip"

att.statModifiers = {VelocitySensitivityMult = -0.3,
OverallMouseSensMult = -0.05,
RecoilMult = -0.16}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/foregrip")
end

function att:attachFunc()
	self.ForegripOverride = true
	self.ForegripParent = "md_foldinggrip"
end

function att:detachFunc()
	self.ForegripOverride = false
end


CustomizableWeaponry:registerAttachment(att)