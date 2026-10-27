local att = {}
att.name = "am_556_mk255m0"
att.displayName = "Pociski Mk255 Mod 0"
att.displayNameShort = "Mk255 Mo"

att.statModifiers = {
	RecoilMult = 0.4,
	AimSpreadMult = -0.05,
	HipSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_55645_mk255mod0")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)