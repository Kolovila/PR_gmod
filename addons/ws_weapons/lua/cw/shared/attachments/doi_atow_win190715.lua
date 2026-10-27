local att = {}
att.name = "doi_atow_win190715"
att.displayName = "High Capacity"
att.displayNameShort = "15RND"
att.isBG = true

att.statModifiers = {DrawSpeedMult = -0.1,
ReloadSpeedMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/1907mag")
	att.description = {[1] = {t = "Increases capacity by ten rounds", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.fifteen)
	self.Animations.reload_empty = "base_reloadempty_ext"
	self.Animations.reload = "base_reload_ext"
	self.Primary.ClipSize = 15
	self.Primary.ClipSize_Orig = 15
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.five)
	self:unloadWeapon()
	self.Animations.reload_empty = "base_reloadempty"
	self.Animations.reload = "base_reload"
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)