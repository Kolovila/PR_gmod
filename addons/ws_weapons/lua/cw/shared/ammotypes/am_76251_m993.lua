local att = {}
att.name = "am_76251_m993"
att.displayName = "Pociski M993"
att.displayNameShort = "M993"

att.statModifiers = {
	DamageMult = 0.4,
	RecoilMult = 0.08,
	AimSpreadMult = -0.05,
	HipSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76251_m993")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)