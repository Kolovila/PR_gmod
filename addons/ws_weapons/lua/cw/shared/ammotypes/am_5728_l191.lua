local att = {}
att.name = "am_5728_l191"
att.displayName = "Pociski L191"
att.displayNameShort = "L191"

att.statModifiers = {
	DamageMult = 0.15,
	HipSpreadMult = 0.04,
	AimSpreadMult = 0.04,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_5728l191")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)