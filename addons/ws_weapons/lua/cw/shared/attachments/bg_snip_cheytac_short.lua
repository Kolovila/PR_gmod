local att = {}
att.name = "bg_cheytac_short_barrel"
att.displayName = "Shortened barrel"
att.displayNameShort = "Short"
att.isBG = true
att.categoryFactors = {cqc = 3}
att.SpeedDec = -5

att.statModifiers = {
RecoilMult = -0.25,
OverallMouseSensMult = 0.25,
VelocitySensitivityMult = -0.25,
DrawSpeedMult = 0.05,
AimSpreadMult = 0.25,
DamageMult = -0.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/wf_m200_barrel")
	att.description = {[2] = {t = "Decreases Effective range", c = CustomizableWeaponry.textColors.NEGATIVE},
	[3] = {t = "Increases Damage drop", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)