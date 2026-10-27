local att = {}
att.name = "am_556_55fmj"
att.displayName = "Pociski 55 FMJ"
att.displayNameShort = "55 FMJ"

att.statModifiers = {
	AimSpreadMult = -0.1,
	HipSpreadMult = -0.1,
	RecoilMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_55645_55fmj")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)