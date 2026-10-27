local att = {}
att.name = "bg_rpd_bipod"
att.displayName = "RPD Bipod"
att.displayNameShort = "RPD"
att.isBG = true

att.statModifiers = {DamageMult = 0.1,
RecoilMult = 0.1,
AimSpreadMult = -0.2,
OverallMouseSensMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ak74_rpkbarrel")
	att.description = {[1] = {t = "Allows the use of a bipod.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.ReceiverBGs.main, self.ReceiverBGs.rpd_bipod)
	self.BipodInstalled = true
end

function att:detachFunc()
	self:setBodygroup(self.ReceiverBGs.main, self.ReceiverBGs.regular)
	self.BipodInstalled = false
end

CustomizableWeaponry:registerAttachment(att)