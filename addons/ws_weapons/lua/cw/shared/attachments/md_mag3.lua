local att = {}
att.name = "md_mag3"
att.displayName = "mag"
att.displayNameShort = "mag"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.01,
ReloadSpeedMult = 0.1
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar1560rndmag")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.magsBGs.main, self.magsBGs.mags)
	self:unloadWeapon()
end

function att:detachFunc()
	self:setBodygroup(self.magsBGs.main, self.magsBGs.regular)
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)