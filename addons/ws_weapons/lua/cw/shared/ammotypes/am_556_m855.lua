local att = {}
att.name = "am_556_m855"
att.displayName = "Pociski M855"
att.displayNameShort = "M855"

att.statModifiers = {
	AimSpreadMult = 0.05,
	HipSpreadMult = 0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_55645_m855")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)