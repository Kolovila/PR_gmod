local att = {}
att.name = "bg_tac338_short_barrel"
att.displayName = "Shortened barrel"
att.displayNameShort = "Short"
att.isBG = true
att.categoryFactors = {cqc = 3}
att.SpeedDec = -3

att.statModifiers = {
RecoilMult = -0.2,
OverallMouseSensMult = 0.2,
VelocitySensitivityMult = -0.2,
DrawSpeedMult = 0.2,
AimSpreadMult = 0.2,
DamageMult = -0.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/tac338_barrel")
	att.description = {[6] = {t = "Decreases Effective range", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)