local att = {}
att.name = "am_76251_m61"
att.displayName = "Pociski M61"
att.displayNameShort = "M61"

att.statModifiers = {
	DamageMult = 0.3,
	RecoilMult = 0.1,
	AimSpreadMult = -0.03,
	HipSpreadMult = -0.03,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76251_m61")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)