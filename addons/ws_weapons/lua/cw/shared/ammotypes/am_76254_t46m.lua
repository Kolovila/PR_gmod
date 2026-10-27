local att = {}
att.name = "am_76254_t46m"
att.displayName = "Pociski T-46M"
att.displayNameShort = "T-46M"

att.statModifiers = {
	RecoilMult = -0.05,
	AimSpreadMult = 0.01,
	HipSpreadMult = 0.01,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76254_t46m")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)