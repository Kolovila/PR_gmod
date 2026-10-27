local att = {}
att.name = "doi_atow_g98extmag"
att.displayName = "High Capacity - Trench"
att.displayNameShort = "25RND"
att.isBG = true
att.SpeedDec = 25

att.statModifiers = {DrawSpeedMult = -0.2}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/magazine_extended_g98_20rd")
	att.description = {[1] = {t = "Increases capacity by twenty rounds", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.Primary.ClipSize = 25
	self.Primary.ClipSize_Orig = 25
	self:setBodygroup(self.MagBGs.main, self.MagBGs.twentyf)
end

function att:detachFunc()
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	self:setBodygroup(self.MagBGs.main, self.MagBGs.default)
end

CustomizableWeaponry:registerAttachment(att)