local att = {}
att.name = "bg_snip_Cheytac_no_stock"
att.displayName = "No stock"
att.displayNameShort = "None"
att.isBG = true
att.SpeedDec = -10

att.statModifiers = {
DrawSpeedMult = 0.1,
OverallMouseSensMult = 0.5,
VelocitySensitivityMult = -0.2,
RecoilMult = 0.45,
AimSpreadMult = 0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/wf_m200_stock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.none)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)