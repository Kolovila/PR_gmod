local att = {}
att.name = "bg_msr_short_barrel"
att.displayName = "Shortened barrel"
att.displayNameShort = "Short"
att.isBG = true
att.categoryFactors = {cqc = 3}
att.SpeedDec = -3

att.statModifiers = {
RecoilMult = -0.1,
OverallMouseSensMult = 0.1,
VelocitySensitivityMult = -0.1,
DrawSpeedMult = 0.05,
AimSpreadMult = 0.15,
DamageMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/msr_barrel_short")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
--	att.description = {[6] = {t = "Decreases Effective range", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)