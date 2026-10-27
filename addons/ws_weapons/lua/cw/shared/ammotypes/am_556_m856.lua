local att = {}
att.name = "am_556_m856"
att.displayName = "Pociski M856"
att.displayNameShort = "M856"

att.statModifiers = {DamageMult = 0.07,
	RecoilMult = -0.02,
	AimSpreadMult = 0.05,
	HipSpreadMult = 0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_55645_m856")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)