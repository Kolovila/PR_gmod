local att = {}
att.name = "bg_ws_ar15_50_DMRbarrel"
att.displayName = "DMR Barrel"
att.displayNameShort = "D. Barrel"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {DamageMult = 0.10,
HipSpreadMult = -0.1,
AimSpreadMult = -0.1,
OverallMouseSensMult = -0.1,
RecoilMult = -0.15,
DrawSpeedMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bg_ws_ar15_50_DMRbarrel")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.DMR)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)