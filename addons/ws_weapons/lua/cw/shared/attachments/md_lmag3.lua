local att = {}
att.name = "md_lmag3"
att.displayName = "100mag"
att.displayNameShort = "100mag"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.01,
ReloadSpeedMult = -0.3
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar1560rndmag")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.magsBGs.main, self.magsBGs.mags)
	self:unloadWeapon()
	self.Primary.ClipSize = 100
	self.Primary.ClipSize_Orig = 100
end

function att:detachFunc()
	self:setBodygroup(self.magsBGs.main, self.magsBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end


CustomizableWeaponry:registerAttachment(att)