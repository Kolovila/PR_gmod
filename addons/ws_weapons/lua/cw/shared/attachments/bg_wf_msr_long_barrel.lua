local att = {}
att.name = "bg_wf_msr_long_barrel"
att.displayName = "Long barrel"
att.displayNameShort = "Long"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {
RecoilMult = 0.1,
VelocitySensitivityMult = -0.05,
AimSpreadMult = -0.1,
DamageMult = 0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/wf_msr_barrel_long")
	att.description = {[2] = {t = "Increases Effective range", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)