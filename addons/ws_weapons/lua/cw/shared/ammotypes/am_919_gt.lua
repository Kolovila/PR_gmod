local att = {}
att.name = "am_919_gt"
att.displayName = "Pociski Green Tracer"
att.displayNameShort = "GT"

att.statModifiers = {
	DamageMult = 0.14,
	RecoilMult = -0.06,
	HipSpreadMult = 0.05,
	AimSpreadMult = 0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_919gt")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)