local att = {}
att.name = "handguard_mp5_caa_hx5"
att.displayName = "CAA HX-5 MP5 handguard"
att.displayNameShort = "HX-5"
att.isBG = true
att.description = {[1] = {t = "Allows you to add custom stuffs", c = CustomizableWeaponry.textColors.COSMETIC},
}
att.statModifiers = {DrawSpeedMult = -0.05, OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_hg_hx5")
end

function att:attachFunc()
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.hx5)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(7,3)
	end
end

function att:detachFunc()
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(7,0)
	end
end

CustomizableWeaponry:registerAttachment(att)