local att = {}
att.name = "am_556_55hp"
att.displayName = "Pociski 55 HP"
att.displayNameShort = "55 HP"

att.statModifiers = {
	AimSpreadMult = -0.07,
	HipSpreadMult = -0.07,
	RecoilMult = 0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_55645_55hp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)