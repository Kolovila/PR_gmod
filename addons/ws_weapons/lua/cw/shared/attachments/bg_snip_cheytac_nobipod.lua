local att = {}
att.name = "bg_Cheytac_Bipod"
att.displayName = "Remove Default Bipod"
att.displayNameShort = "No Bipod"
att.isBG = true

att.statModifiers = {
OverallMouseSensMult = 0.12,
VelocitySensitivityMult = -0.12,
DrawSpeedMult = 0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/wf_m200_bipod")
	att.description = {[1] = {t = "Replaces bipod with rails", c = CustomizableWeaponry.textColors.POSITIVE},
    [2] = {t = "Make you weapon cool", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Cant's deploy bipod :(", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BipodBGs.main, self.BipodBGs.rails)
	self.BipodInstalled = false
end

function att:detachFunc()
	self:setBodygroup(self.BipodBGs.main, self.BipodBGs.regular)
	self.BipodInstalled = true
end

CustomizableWeaponry:registerAttachment(att)