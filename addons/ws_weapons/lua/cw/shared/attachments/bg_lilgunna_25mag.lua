local att = {}
att.name = "bg_lilgunna_25mag"
att.displayName = "35 Round Magazine"
att.displayNameShort = "35 Mag"
att.isBG = true

att.statModifiers = {
ReloadSpeedMult = -0.10,
OverallMouseSensMult = -0.10}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_lilgunna_25mag")
	att.description = {[1] = {t = "Increases mag size to 35 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.mag25)
	self:unloadWeapon()
	self.Primary.ClipSize = 35
	self.Primary.ClipSize_Orig = 35
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)