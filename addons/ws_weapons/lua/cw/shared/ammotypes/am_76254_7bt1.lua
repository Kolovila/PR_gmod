local att = {}
att.name = "am_76254_7bt1"
att.displayName = "Pociski 7BT1"
att.displayNameShort = "7BT1"

att.statModifiers = {
	RecoilMult = -0.018,
	DamageMult = -0.01,
	AimSpreadMult = 0.02,
	HipSpreadMult = 0.02,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76254_7bt1")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)