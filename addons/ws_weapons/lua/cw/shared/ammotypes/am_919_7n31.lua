local att = {}
att.name = "am_919_7n31"
att.displayName = "Pociski 7N31"
att.displayNameShort = "7N31"

att.statModifiers = {
	DamageMult = 0.25,
	HipSpreadMult = -0.15,
	AimSpreadMult = -0.15,
	RecoilMult = 0.15,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_9197n31")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)