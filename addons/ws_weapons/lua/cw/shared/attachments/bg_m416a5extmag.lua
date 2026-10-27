local att = {}
att.name = "bg_m416a5extmag"
att.displayName = "Extended mag"
att.displayNameShort = "Extended"
att.isBG = true

att.statModifiers = {ReloadSpeedMult = -0.075,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar1560rndmag")
	att.description = {[1] = {t = "Increases mag size to 45 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.extended)
	self:unloadWeapon()
	self.Primary.ClipSize = 45
	self.Primary.ClipSize_Orig = 45
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)