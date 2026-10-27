local att = {}
att.name = "stoner_ext_mag"
att.displayName = "Stoner ExtMag"
att.displayNameShort = "Stoner 75rnd"
att.isBG = false
att.SpeedDec = 10

att.statModifiers = {DrawSpeedMult = -0.3,
RecoilMult = 0.15,
ReloadSpeedMult = -0.3,
MaxSpreadIncMult = 0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("vgui/entities/stoner_ext_mag")
	att.description = {
	[1] = {t = "Increases capacity to 75.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:unloadWeapon()
	self.Primary.ClipSize = 75
	self.Primary.ClipSize_Orig = 75
	self.Animations = {fire = {"fire"},
	fire_aim = {"fire"},
	reload = "bigammo_reload_tac",
	reload_empty = "bigammo_reload_empty",
	idle = "idle",
	draw = "draw"}
end

function att:detachFunc()
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	self.Animations = {fire = {"fire"},
	fire_aim = {"fire"},
	reload = "reload_tac",
	reload_empty = "reload_empty",
	idle = "idle",
	draw = "draw"}
end

CustomizableWeaponry:registerAttachment(att)