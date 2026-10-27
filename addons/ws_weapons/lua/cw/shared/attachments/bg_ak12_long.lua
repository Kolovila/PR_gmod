local att = {}
att.name = "bg_ak12_longbarrel"
att.displayName = "RPK-12 Barrel"
att.displayNameShort = "Long"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {
DamageMult = 0.45,
FireDelayMult = 0,
AimSpreadMult = -0.5,
HipSpreadMult = -0.1,
MaxSpreadIncMult = -0.1,
RecoilMult = 0.15,
OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/AK12_Long_Barrel")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
	self:updateSoundTo("CW_AK74_RPK_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_AK74_RPK_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)