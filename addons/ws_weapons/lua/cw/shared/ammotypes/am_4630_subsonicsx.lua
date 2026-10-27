local att = {}
att.name = "am_4630_subsonicsx"
att.displayName = "Pociski Subsonic SX"
att.displayNameShort = "Subsonic"

att.statModifiers = {
	RecoilMult = -0.22,
	AimSpreadMult = -0.1,
	HipSpreadMult = -0.1,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_46030subsonicsx")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)