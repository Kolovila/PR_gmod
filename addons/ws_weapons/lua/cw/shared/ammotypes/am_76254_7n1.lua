local att = {}
att.name = "am_76254_7n1"
att.displayName = "Pociski 7N1"
att.displayNameShort = "7N1"

att.statModifiers = {
	DamageMult = 0.2,
	RecoilMult = 0.08,
	AimSpreadMult = -0.1,
	HipSpreadMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76254_7n1")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)