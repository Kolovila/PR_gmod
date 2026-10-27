local att = {}
att.name = "bg_ws_pmag"
att.displayName = "PMAG M2 WINDOW"
att.displayNameShort = "PMAG"
att.isBG = true

att.statModifiers = {
	ReloadSpeedMult = 0.05
	//OverallMouseSensMult = -0.05 //-0.01
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_pmag")
	//att.description = {[1] = {t = "Increases mag size to 40 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.pmag)
	self:unloadWeapon()
	//self.Primary.ClipSize = 40
	//self.Primary.ClipSize_Orig = 40
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	//self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	//self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)