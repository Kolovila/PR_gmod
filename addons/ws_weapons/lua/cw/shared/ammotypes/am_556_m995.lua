local att = {}
att.name = "am_556_m995"
att.displayName = "Pociski M995"
att.displayNameShort = "M995"

att.statModifiers = {
	DamageMult = 0.15,
	RecoilMult = 0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_55645_m995")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)