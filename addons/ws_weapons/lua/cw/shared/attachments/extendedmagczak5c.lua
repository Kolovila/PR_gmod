local att = {}
att.name = "bg_ak5cmagazine"
att.displayName = "Extended Magazine"
att.displayNameShort = "Extended"
att.isBG = true

att.statModifiers = {ReloadSpeedMult = -0.1, RecoilMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar1560rndmag")
	att.description = {[1] = {t = "Increases magazine size and reduces recoil", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.ak5cmagazine)
	self:unloadWeapon()
	if self.Primary.ClipSize_ORIG_REAL >= 100 then
		self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL * 1.0
		self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL * 1.0
	else
		self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL + 10
		self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL + 10
	end
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)