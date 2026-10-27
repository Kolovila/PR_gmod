local att = {}
att.name = "bg_ws_ar15_50_Mag5"
att.displayName = "5 Round Magazine"
att.displayNameShort = "5 Mag"
att.isBG = true
att.SpeedDec = -2

att.statModifiers = {ReloadSpeedMult = 0.15,
OverallMouseSensMult = 0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_ar15_50_Mag5")
	att.description = {[1] = {t = "Decreases mag size to 5 rounds.", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.mag5)
	self:unloadWeapon()
	self.Primary.ClipSize = 5
	self.Primary.ClipSize_Orig = 5
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)