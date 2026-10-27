local att = {}
att.name = "handguard_mp5_ptr_tri_rail_forearm"
att.displayName = "PTR Tri-Rail MP5 handguard"
att.displayNameShort = "Tri-Rail"
att.isBG = true
att.description = {[1] = {t = "Allows you to add custom stuff.", c = CustomizableWeaponry.textColors.COSMETIC},
}
att.statModifiers = {DrawSpeedMult = -0.03, OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_hg_tr")
end

function att:attachFunc()
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.trirail)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(7,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(7,0)
	end
end

CustomizableWeaponry:registerAttachment(att)