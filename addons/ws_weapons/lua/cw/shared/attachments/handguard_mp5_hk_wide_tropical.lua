local att = {}
att.name = "handguard_mp5_hk_wide_tropical"
att.displayName = "MP5 Standard Handguard"
att.displayNameShort = "Tropical"
att.isBG = true
att.description = {[1] = {t = "Standard handguard.", c = CustomizableWeaponry.textColors.COSMETIC},
}
att.statModifiers = {OverallMouseSensMult = -0.05, AimSpreadMult = -0.05, RecoilMult = -0.03}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/tropical")
end

function att:attachFunc()
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.tropical)
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