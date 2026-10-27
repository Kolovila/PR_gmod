local att = {}
att.name = "am_76251_m80"
att.displayName = "Pociski M80"
att.displayNameShort = "M80"

att.statModifiers = {
	RecoilMult = -0.05,
	AimSpreadMult = -0.05,
	HipSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_76251_m80")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)