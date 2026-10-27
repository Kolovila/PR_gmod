local att = {}
att.name = "md_heavy_muzzle_brake"
att.displayName = "Heavy Muzzle Brake"
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
	att.displayIcon = surface.GetTextureID("entities/heavy_muzzle_brake")
	att.description = {[1] = {t = "Decreases muzzle flash", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.MuzzleEffect = "muzzleflash_ots"
end

function att:detachFunc()
	self:resetSuppressorStatus()
end

CustomizableWeaponry:registerAttachment(att)