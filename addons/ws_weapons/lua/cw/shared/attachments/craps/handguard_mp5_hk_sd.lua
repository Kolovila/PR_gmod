local att = {}
att.name = "handguard_mp5_hk_sd"
att.displayName = "MP5SD Handguard"
att.displayNameShort = "SD"
att.isBG = true
att.description = {[1] = {t = "MP5SD handguard.", c = CustomizableWeaponry.textColors.COSMETIC},
}
att.statModifiers = {DrawSpeedMult = -0.02, OverallMouseSensMult = 0.02}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_mp5sd")
end

function att:attachFunc()
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.sd)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(7,5)
	end
end

function att:detachFunc()
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(7,0)
	end
end

CustomizableWeaponry:registerAttachment(att)