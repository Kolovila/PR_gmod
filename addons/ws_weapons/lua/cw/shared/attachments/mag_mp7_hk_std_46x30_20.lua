local att = {}
att.name = "mag_mp7_hk_std_46x30_20"
att.displayName = "Standard MP7 20-round 4.6x30 magazine"
att.displayNameShort = "20 RND"
att.isBG = true

att.statModifiers = {OverallMouseSensMult = -0.03}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mag_mp7_hk_std_46x30_20")
	att.description = {[1] = {t = "20 rounds mag.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.Chamberable = true
	self:setBodygroup(self.MagBGs.main, self.MagBGs.mp720)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL + 19
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL + 19
	if self.WMEnt then
		self.WMEnt:SetBodygroup(1,1)
	end
end

function att:detachFunc()
	self.Chamberable = false
	self:setBodygroup(self.MagBGs.main, self.MagBGs.none)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	if self.WMEnt then
		self.WMEnt:SetBodygroup(1,0)
	end
end

CustomizableWeaponry:registerAttachment(att)