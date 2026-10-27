local att = {}
att.name = "am_545_bp"
att.displayName = "Pociski BP"
att.displayNameShort = "BP"

att.statModifiers = {
	RecoilMult = 0.2,
	AimSpreadMult = -0.05,
	HipSpreadMult = -0.05,
	DamageMult = 0.2,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539bp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)