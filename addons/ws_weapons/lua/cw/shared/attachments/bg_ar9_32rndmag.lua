local att = {}
att.name = "bg_ar9_32rndmag"
att.displayName = "32round mag"
att.displayNameShort = "32round mag"
att.isBG = true

att.statModifiers = {ReloadSpeedMult = -0.1,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("attsIcons/ar9_32mag")
	att.description = {[1] = {t = "Increases mag size to 32 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.round32)
	self:unloadWeapon()
	self.Primary.ClipSize = 32
	self.Primary.ClipSize_Orig = 32
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)