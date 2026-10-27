local att = {}
att.name = "am_76239_hp"
att.displayName = "Pociski HP"
att.displayNameShort = "HP"

att.statModifiers = {
	RecoilMult = 0.1,
	DamageMult = 0.1,
	AimSpreadMult = 0.05,
	HipSpreadMult = 0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76239hp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)