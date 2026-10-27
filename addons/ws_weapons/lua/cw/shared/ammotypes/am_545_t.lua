local att = {}
att.name = "am_545_t"
att.displayName = "Pociski T"
att.displayNameShort = "T"

att.statModifiers = {
	RecoilMult = -0.05,
	AimSpreadMult = 0.05,
	HipSpreadMult = 0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539t")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)