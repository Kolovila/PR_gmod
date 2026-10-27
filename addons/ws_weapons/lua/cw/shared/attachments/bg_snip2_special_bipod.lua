local att = {}
att.name = "bg_snip2_special_bipod"
att.displayName = "Special Bipod"
att.displayNameShort = "S-Bipod"
att.isBG = true

att.statModifiers = {OverallMouseSensMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/special_bipod")
	att.description = {[1] = {t = "When deployed:", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Decreases recoil by 70%", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Greatly increases hip fire accuracy", c = CustomizableWeaponry.textColors.POSITIVE},
	[4] = {t = "And looks cool", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_ON)
	self.BipodInstalled = true
end

function att:detachFunc()
	self:setBodygroup(self.SB_BipodBGs.main, self.SB_BipodBGs.SB_OFF)
	self.BipodInstalled = false
end

CustomizableWeaponry:registerAttachment(att)