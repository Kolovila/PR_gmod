local att = {}
att.name = "md_exxmag"
att.displayName = "exxmag"
att.displayNameShort = "exxmag"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.05,
ReloadSpeedMult = -0.1,
FireDelayMult = -0.135,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar1560rndmag")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.magBGs.main, self.magBGs.mag)
	self:unloadWeapon()
	self.Primary.ClipSize = 80
	self.Primary.ClipSize_Orig = 80
	self.Animations = {fire = {"shoot2"},
	    fire_dry = "shoot_over",
		reload = "lmgreload_cham",
		reload_empty = "lmgreload",
		idle = "idle",
		draw = "draw"}
	self:sendWeaponAnim("idle")
end

function att:detachFunc()
	self:setBodygroup(self.magBGs.main, self.magBGs.none)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
		self.Animations = {fire = {"shoot2"},
		fire_dry = "shoot_over",
		reload = "reload_cham",
		reload_empty = "reload",
		idle = "idle",
		draw = "draw"}
	self:sendWeaponAnim("idle")
end



CustomizableWeaponry:registerAttachment(att)