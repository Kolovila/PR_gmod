local att = {}
att.name = "mag_mp5_hk_kurtz_std_9x19_20"
att.displayName = "20 round magazine"
att.displayNameShort = "20 RND"
att.isBG = true

att.statModifiers = {OverallMouseSensMult = -0.03}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mp520rnd")
	att.description = {[1] = {t = "20 rounds mag.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.round20)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL + 19
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL + 19
	if self.WMEnt then
		self.WMEnt:SetBodygroup(8,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.none)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	if self.WMEnt then
		self.WMEnt:SetBodygroup(8,0)
	end
end

CustomizableWeaponry:registerAttachment(att)