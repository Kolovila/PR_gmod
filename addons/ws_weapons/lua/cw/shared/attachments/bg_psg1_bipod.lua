local att = {}
att.name = "bg_psg1_bipod"
att.displayName = "PSG-1 Bipod"
att.displayNameShort = "Bipod"
att.isBG = true

att.statModifiers = {OverallMouseSensMult = -0.1,
DrawSpeedMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bipod")
	att.description = {[1] = {t = "When deployed:", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Decreases recoil by 70%", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Greatly increases hip fire accuracy", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BipodBGs.main, self.BipodBGs.bipod_on)
	self.BipodInstalled = true
end

function att:detachFunc()
	self:setBodygroup(self.BipodBGs.main, self.BipodBGs.bipod_off)
	self.BipodInstalled = false
end

CustomizableWeaponry:registerAttachment(att)