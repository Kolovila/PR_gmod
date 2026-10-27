local att = {}
att.name = "am_slap"
att.displayName = "Saboted Light Armor Penetrator"
att.displayNameShort = "SLAP"

att.statModifiers = {
	DamageMult = 0.4,
	RecoilMult = -0.1,
	AimSpreadMult = 0.125
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/matchgradeammo")
	att.description = {
		[1] = {t = "A smaller diameter projectile fitted into a .30 casing with discarding sabots.", c = CustomizableWeaponry.textColors.POSITIVE},
	}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)