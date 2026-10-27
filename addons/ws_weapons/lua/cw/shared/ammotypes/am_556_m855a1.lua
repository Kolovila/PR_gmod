local att = {}
att.name = "am_556_m855a1"
att.displayName = "Pociski M855A1"
att.displayNameShort = "M855A1"

att.statModifiers = {
	AimSpreadMult = 0.1,
	HipSpreadMult = 0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_55645_m855a1")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)