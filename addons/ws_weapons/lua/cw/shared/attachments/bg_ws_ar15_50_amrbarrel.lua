local att = {}
att.name = "bg_ws_ar15_50_AMRbarrel"
att.displayName = "AMR Barrel"
att.displayNameShort = "A. Barrel"
att.isBG = true
att.SpeedDec = 3

att.statModifiers = {DamageMult = 0.25,
HipSpreadMult = -0.5,
AimSpreadMult = -0.5,
OverallMouseSensMult = -0.1,
RecoilMult = -0.20,
DrawSpeedMult = -0.15,
FireDelayMult = 0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_ar15_50_AMRbarrel")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.AMR)
	self:updateSoundTo("CW_WS_AR15_50_FIRE_AMR", CustomizableWeaponry.sounds.UNSUPPRESSED)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)