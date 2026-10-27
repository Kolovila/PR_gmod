local att = {}
att.name = "am_556_m856a1"
att.displayName = "Pociski M856A1"
att.displayNameShort = "M856A1"

att.statModifiers = {DamageMult = 0.1,
	RecoilMult = 0.04,
	AimSpreadMult = 0.02,
	HipSpreadMult = 0.02,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_55645_m856a1")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)