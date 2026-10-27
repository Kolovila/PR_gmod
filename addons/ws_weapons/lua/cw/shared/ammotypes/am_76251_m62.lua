local att = {}
att.name = "am_76251_m62"
att.displayName = "Pociski M62"
att.displayNameShort = "M62"

att.statModifiers = {
	DamageMult = 0.15,
	RecoilMult = -0.05,
	HipSpreadMult = 0.06,
	AimSpreadMult = 0.06,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76251_m62")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)