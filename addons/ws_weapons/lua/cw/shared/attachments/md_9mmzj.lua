local att = {}
att.name = "md_9mmzj"
att.displayName = "mag"
att.displayNameShort = "mag"
att.isBG = true

att.statModifiers = {
ReloadSpeedMult = 0.005
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15ris")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.magBGs.main, self.magBGs.mag)
		self:unloadWeapon()
end

function att:detachFunc()
	self:setBodygroup(self.magBGs.main, self.magBGs.none)
		self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)