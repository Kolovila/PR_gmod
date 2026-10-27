local att = {}
att.name = "am_76251_ultranosler"
att.displayName = "Pociski Ultra Nosler"
att.displayNameShort = "Ultra Nosler"

att.statModifiers = {
	RecoilMult = -0.05,
	AimSpreadMult = -0.1,
	HipSpreadMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76251_ultranosler")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)