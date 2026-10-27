local att = {}
att.name = "bg_heavybarrel"
att.displayName = "Heavy barrel"
att.displayNameShort = "H-BAR"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {DamageMult = 0.08,
AimSpreadMult = -0.05,
RecoilMult = -0.06,
OverallMouseSensMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15longbarrel")
	att.description = {[1] = {t = "A barrel for medium to longe range engagements.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
	self:updateSoundTo("CW_MP7_LONGBARREL_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_MP7_LONGBARREL_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)