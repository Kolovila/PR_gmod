local att = {}
att.name = "handguard_mp5_bt_tl_99_3x_nar"
att.displayName = "TL-99 Aluminum handguard"
att.displayNameShort = "TL-99"
att.isBG = true
att.description = {[1] = {t = "Allows you to add custom stuffs.", c = CustomizableWeaponry.textColors.COSMETIC},
}
att.statModifiers = {DrawSpeedMult = -0.02, OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_hg_tl99")
end

function att:attachFunc()
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.nar)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(7,4)
	end
end

function att:detachFunc()
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(7,0)
	end
end

CustomizableWeaponry:registerAttachment(att)