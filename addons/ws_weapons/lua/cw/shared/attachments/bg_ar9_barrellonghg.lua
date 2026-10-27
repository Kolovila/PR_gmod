local att = {}
att.name = "bg_ar9_BarrelLongHG"
att.displayName = "Long HandGuard"
att.displayNameShort = "LongHG"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {DamageMult = 0.1,
AimSpreadMult = -0.3,
HipSpreadMult = -0.2,
RecoilMult = 0.2,
OverallMouseSensMult = -0.3}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15longris")
	att.description = {[1] = {t = "A barrel with a long HandGuard", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.longbarrelHG)
	self:updateSoundTo("CW_AR9mm_LONGBARREL_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_AR9mm_LONGBARREL_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)