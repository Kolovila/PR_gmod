local att = {}
att.name = "bg_ws_ar15_50_ExtMag"
att.displayName = "20 Round Magazine"
att.displayNameShort = "20 Mag"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {ReloadSpeedMult = -0.05,
OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_ar15_50_ExtMag")
	att.description = {[1] = {t = "Increases mag size to 20 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.extMag)
	self:unloadWeapon()
	self.Primary.ClipSize = 20
	self.Primary.ClipSize_Orig = 20
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)