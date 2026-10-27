local att = {}
att.name = "python_regular"
att.displayName = "Regular Barrel"
att.displayNameShort = "Regular"
att.isBG = true

att.statModifiers = {AimSpreadMult = -0.1,
RecoilMult = 0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/m3barrel")
	att.description = {[1] = {t = "Increases effective range.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
	--self.MuzzleAttachmentName = 1
end

CustomizableWeaponry:registerAttachment(att)