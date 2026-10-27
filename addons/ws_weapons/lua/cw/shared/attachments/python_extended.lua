local att = {}
att.name = "python_extended"
att.displayName = "Extended Barrel"
att.displayNameShort = "Extended"
att.isBG = true

att.statModifiers = {AimSpreadMult = -0.1,
RecoilMult = 0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/m3barrel")
	att.description = {[1] = {t = "Increases effective range.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
	
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
	
end

CustomizableWeaponry:registerAttachment(att)