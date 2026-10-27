local att = {}
att.name = "am_545_sp"
att.displayName = "Pociski SP"
att.displayNameShort = "SP"

att.statModifiers = {
	RecoilMult = -0.15,
	AimSpreadMult = -0.1,
	HipSpreadMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_54539sp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)