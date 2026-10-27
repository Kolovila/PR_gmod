local att = {}
att.name = "bg_dsr_muzzle_brake"
att.displayName = "Default DSR-50 Muzzle Brake"
att.displayNameShort = "Brake"
att.isBG = true
att.SpeedDec = 5

att.statModifiers = {
RecoilMult = -0.25,
AimSpreadMult = -0.25,
OverallMouseSensMult = -0.22,
VelocitySensitivityMult = 0.22,
DamageMult = 0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/dsr_50_muzzle_brake")
	att.description = {[1] = {t = "Decreases muzzle flash", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.Brake)
	self.MuzzleEffect = "muzzleflash_pistol"
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
	self.MuzzleEffect = "muzzleflash_SR25"
end

CustomizableWeaponry:registerAttachment(att)