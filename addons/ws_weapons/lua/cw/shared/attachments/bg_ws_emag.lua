local att = {}
att.name = "bg_ws_emag"
att.displayName = "EMAG (Export MAGazine)"
att.displayNameShort = "EMAG"
att.isBG = true

att.statModifiers = {
	ReloadSpeedMult = -0.05,
	OverallMouseSensMult = -0.05 //-0.01
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_emag")
	att.description = {[1] = {t = "Increases mag size to 40 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.emag)
	self:unloadWeapon()
	self.Primary.ClipSize = 40
	self.Primary.ClipSize_Orig = 40
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)