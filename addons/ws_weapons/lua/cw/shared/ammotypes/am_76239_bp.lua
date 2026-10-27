local att = {}
att.name = "am_76239_bp"
att.displayName = "Pociski BP"
att.displayNameShort = "BP"

att.statModifiers = {
	DamageMult = 0.23,
	RecoilMult = 0.05,
	AimSpreadMult = 0.03,
	HipSpreadMult = 0.03,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76239bp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)