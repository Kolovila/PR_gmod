local att = {}
att.name = "am_545_bt"
att.displayName = "Pociski BT"
att.displayNameShort = "BT"

att.statModifiers = {
	DamageMult = 0.05,
	RecoilMult = 0.03,
	AimSpreadMult = 0.02,
	HipSpreadMult = 0.02,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539bt")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)