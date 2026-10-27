local att = {}
att.name = "am_545_fmj"
att.displayName = "Pociski FMJ"
att.displayNameShort = "FMJ"

att.statModifiers = {
	RecoilMult = 0.4,
	AimSpreadMult = -0.05,
	HipSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539fmj")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)