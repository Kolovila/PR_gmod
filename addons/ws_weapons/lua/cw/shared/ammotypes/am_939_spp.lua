local att = {}
att.name = "am_939_spp"
att.displayName = "Pociski 7N9 SPP"
att.displayNameShort = "SPP"

att.statModifiers = {
	DamageMult = 0.2,
	RecoilMult = 0.2,
	AimSpreadMult = -0.1,
	HipSpreadMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_939_spp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)