local att = {}
att.name = "mag_mp5_x_products_x_5_9x19_50"
att.displayName = "X Products X-5 MP5 50-round 9x19 magazine"
att.displayNameShort = "50 RND"
att.isBG = true

att.statModifiers = {ReloadSpeedMult = -0.15,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mp550rnd")
	att.description = {[1] = {t = "50 rounds mag.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.round50)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL + 49
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL + 49
	if self.WMEnt then
		self.WMEnt:SetBodygroup(8,3)
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