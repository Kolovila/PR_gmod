local att = {}
att.name = "bg_rpk_12_mag"
att.displayName = "RPK-12 70 Mag"
att.displayNameShort = "RPK-12"
att.isBG = true

att.statModifiers = {
DamageMult = 0,
RecoilMult = 0,
FireDelayMult = 0,
OverallMouseSensMult = -0.10,
ReloadSpeedMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/rpk1270_mag")
	att.description = {[1] = {t = "Increases mag size to 70 rounds.", c = CustomizableWeaponry.textColors.POSITIVE},
	[2] = {t = "Increase the effective range.", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Decrease the damage fall.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.round7_rpk12)
	self:unloadWeapon()
	self.Primary.ClipSize = 70
	self.Primary.ClipSize_Orig = 70
	self.Primary.Ammo = "5.45x39MM"
    self.Animations = {fire = {"shoot3"},
	   reload = "reload_unsil",
	   idle = "idle",
	   draw = "draw"}
	self:sendWeaponAnim("idle")
    self.ReloadTime = 2.9
    self.ReloadHalt = 2.9
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	self.Primary.Ammo = "5.45x39MM"
    self.Animations = {fire = {"shoot3"},
	   reload = "reload",
	   reload_empty = "reload_unsil",
	   idle = "idle",
	   draw = "draw"}
	self:sendWeaponAnim("idle")
    self.ReloadTime = 2.6
    self.ReloadHalt = 2.6
end

CustomizableWeaponry:registerAttachment(att)