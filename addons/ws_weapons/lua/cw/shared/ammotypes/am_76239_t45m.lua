local att = {}
att.name = "am_76239_t45m"
att.displayName = "Pociski T45M"
att.displayNameShort = "T45M"

att.statModifiers = {
	RecoilMult = -0.06,
	AimSpreadMult = 0.04,
	HipSpreadMult = 0.04,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76239t45m")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)