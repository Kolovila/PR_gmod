local att = {}
att.name = "bg_barrelshorty"
att.displayName = "Shortened Barrel"
att.displayNameShort = "S. Barrel"
att.isBG = true
att.SpeedDec = -1

att.statModifiers = {DrawSpeedMult = 0.05,
RecoilMult = -0.05,DamageMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/barrelshorty")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.shorty)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)