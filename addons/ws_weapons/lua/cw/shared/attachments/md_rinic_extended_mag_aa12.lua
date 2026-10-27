local att = {}
att.name = "md_rinic_extended_mag_aa12"
att.displayName = "Extended Magzine"
att.displayNameShort = "Ext Mag"
att.isBG = false

att.statModifiers = {ReloadSpeedMult = -0.15,
OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/icons/md_extended_mag")
	att.description = {[1] = {t = "Increases mag size to 15%", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:unloadWeapon()
	self.Primary.ClipSize = 16
	self.Primary.ClipSize_Orig = 16
end

function att:detachFunc()
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)