local att = {}
att.name = "md_9mm_mag"
att.displayName = "9MM-mag"
att.displayNameShort = "mag"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.3,
ReloadSpeedMult = 0.05,
FireDelayMult = -0.135,
DamageMult = -0.3
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar1560rndmag")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.magBGs.main, self.magBGs.mag)
	self:unloadWeapon()
	self.Primary.ClipSize = 30
	self.Primary.ClipSize_Orig = 30
	self.Animations = {fire = {"shoot2"},
	    fire_dry = "shoot_over",
		reload = "smgreload_cham",
		reload_empty = "smgreload",
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