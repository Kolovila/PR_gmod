local att = {}
att.name = "am_545_bs"
att.displayName = "Pociski BS"
att.displayNameShort = "BS"

att.statModifiers = {
	DamageMult = 0.24,
	RecoilMult = 0.1,
	AimSpreadMult = 0.03,
	HipSpreadMult = 0.03,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539bs")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)