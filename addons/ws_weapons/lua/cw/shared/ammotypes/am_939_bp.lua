local att = {}
att.name = "am_939_bp"
att.displayName = "Pociski 7N12 BP"
att.displayNameShort = "BP"

att.statModifiers = {
	DamageMult = 0.3,
	RecoilMult = 0.22,
	AimSpreadMult = -0.1,
	HipSpreadMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_939_bp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)