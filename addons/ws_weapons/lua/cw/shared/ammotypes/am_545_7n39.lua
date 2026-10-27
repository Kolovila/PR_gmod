local att = {}
att.name = "am_545_7n39"
att.displayName = "Pociski 7N39 Igolnik"
att.displayNameShort = "Igolnik"

att.statModifiers = {
	RecoilMult = 0.15,
	AimSpreadMult = -0.1,
	HipSpreadMult = -0.1,
	DamageMult = 0.15,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kk_ins2_545397n39")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)