local att = {}
att.name = "md_mag4"
att.displayName = "9MM-mag"
att.displayNameShort = "mag"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.3,
ReloadSpeedMult = 0.05,
FireDelayMult = -0.165,
DamageMult = -0.3
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar1560rndmag")
	att.description = {[1] = {t = "A rail interface.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.magsBGs.main, self.magsBGs.mags)
	self:unloadWeapon()
	self.Primary.ClipSize = 30
	self.Primary.ClipSize_Orig = 30
	self.Animations = {fire = {"shoot1"},
		reload = "smgreload",
		reload_empty = "reload_empty",
		idle = "idle",
		draw = "draw"}
	self:sendWeaponAnim("idle")
end

function att:detachFunc()
	self:setBodygroup(self.magsBGs.main, self.magsBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	self.Animations = {fire = {"shoot1"},
		reload = "reload",
		reload_empty = "reload_empty",
		idle = "idle",
		draw = "draw"}
	self:sendWeaponAnim("idle")
end

CustomizableWeaponry:registerAttachment(att)