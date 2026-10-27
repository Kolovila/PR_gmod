local att = {}
att.name = "am_tiger"
att.displayName = "The Train go boom rounds"
att.displayNameShort = "Tiger"

att.statModifiers = {DamageMult = 0.50,
	RecoilMult = 2.25,
	MaxSpreadIncMult = .65,
	FireDelayMult = 2,
	ReloadSpeedMult = -.25}


if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/tigerrounds")
	att.description = {{t = "Let's be gay and have an Orgie yay LMAO", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)