local att = {}
att.name = "am_556_warmage"
att.displayName = "Pociski Warmage"
att.displayNameShort = "WG"

att.statModifiers = {
	RecoilMult = 0.10,
	AimSpreadMult = -0.1,
	HipSpreadMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_55645_wg")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)