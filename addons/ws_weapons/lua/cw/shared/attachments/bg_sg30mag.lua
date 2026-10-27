local att = {}
att.name = "bg_sg30mag"
att.displayName = "30 Round Magazine"
att.displayNameShort = "30 Rnd Mag"
att.isBG = true

att.statModifiers = {
	OverallMouseSensMult = -0.05,
	ReloadSpeedMult = -0.1
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("vgui/fas2atts/sg55xmag")
	att.description = {[1] = {t = "Increases mag size to 30 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.sg30mag)
	self:unloadWeapon()
	self.Primary.ClipSize = 30
	self.Primary.ClipSize_Orig = 30
	self.Animations = {fire = {"fire", "fire2", "fire3"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	reload_nomen = "reload_nomen",
	draw = "deploy"}
	self:sendWeaponAnim("reload_nomen")
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	self.Animations  = {fire = {"fire", "fire2", "fire3"},
	reload = "reload",
	reload_empty = "reload_empty",
	idle = "idle",
	reload_nomen = "reload_nomen",
	draw = "deploy"}
	self:sendWeaponAnim("reload_nomen")
end

CustomizableWeaponry:registerAttachment(att)