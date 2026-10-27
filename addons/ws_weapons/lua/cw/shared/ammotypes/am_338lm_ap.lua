local att = {}
att.name = "am_338lm_ap"
att.displayName = "Pociski .338 AP"
att.displayNameShort = "AP"

att.statModifiers = {
	DamageMult = 0.32,
	RecoilMult = 0.05,
	AimSpreadMult = -0.05,
	HipSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_338lm_ap")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)