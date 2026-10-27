local att = {}
att.name = "am_919_quakemaker"
att.displayName = "Pociski QuakeMaker"
att.displayNameShort = "QuakeMak"

att.statModifiers = {
	DamageMult = 0.40,
	RecoilMult = 0.1,
	HipSpreadMult = -0.1,
	AimSpreadMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_919quakemaker")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)