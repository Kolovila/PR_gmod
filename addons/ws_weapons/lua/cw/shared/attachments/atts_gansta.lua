local att = {}
att.name = "atts_gansta"
att.displayName = "Gangsta Style"
att.displayNameShort = "Gangsta"

att.statModifiers = {DamageMult = 0.15,
AimSpreadMult = -0.50,
HipSpreadMult = -0.50,
RecoilMult = -0.50,
ReloadSpeedMult= 0.50,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/atts_gansta")
	att.description = {[1] = {t = "I'm a gangster, and gangsters don't ask questions.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	//self.ForegripOverride = true
	self.ForegripParent = "gangsta"
end

function att:detachFunc()
	self.ForegripParent = "default"
end

CustomizableWeaponry:registerAttachment(att)