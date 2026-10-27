local att = {}
att.name = "am_76251_tpzsp"
att.displayName = "Pociski TPZ SP"
att.displayNameShort = "TPZ SP"

att.statModifiers = {
	RecoilMult = -0.05,
	AimSpreadMult = 0.08,
	HipSpreadMult = 0.08,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76251_tpzsp")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)