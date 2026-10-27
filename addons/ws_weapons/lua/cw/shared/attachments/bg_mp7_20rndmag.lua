local att = {}
att.name = "bg_mp7_20rndmag"
att.displayName = "Extended Magazine"
att.displayNameShort = "Extended"
att.isBG = true

att.statModifiers = {ReloadSpeedMult = -0.12, RecoilMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mp530rnd")
	att.description = {[1] = {t = "Increases magazine size by 10 and reduces recoil", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.mp740rndmag)
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