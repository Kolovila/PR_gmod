local att = {}
att.name = "mag_mp5_hk_std_curved_9x19_30"
att.displayName = "30 round magazine"
att.displayNameShort = "30 RND"
att.isBG = true

att.statModifiers = {ReloadSpeedMult = -0.1,
OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mp530rnd")
	att.description = {[1] = {t = "30 rounds mag.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.round30)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL + 29
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL + 29
	if self.WMEnt then
		self.WMEnt:SetBodygroup(8,2)
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