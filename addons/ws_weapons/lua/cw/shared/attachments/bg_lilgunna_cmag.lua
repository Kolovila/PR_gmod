local att = {}
att.name = "bg_lilgunna_cmag"
att.displayName = "Beta C-Mag"
att.displayNameShort = "C-Mag"
att.isBG = true

att.statModifiers = {
ReloadSpeedMult = -0.20,
OverallMouseSensMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_lilgunna_cmag")
	att.description = {[1] = {t = "Increases mag size to 100 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.cmag)
	self:unloadWeapon()
	self.Primary.ClipSize = 100
	self.Primary.ClipSize_Orig = 100
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)