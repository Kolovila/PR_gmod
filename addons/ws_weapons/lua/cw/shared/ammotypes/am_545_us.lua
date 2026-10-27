local att = {}
att.name = "am_545_us"
att.displayName = "Pociski US"
att.displayNameShort = "US"

att.statModifiers = {
	RecoilMult = -0.25,
	AimSpreadMult = -0.05,
	HipSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539us")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)