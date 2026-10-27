local att = {}
att.name = "mp7a1_rails_std"
att.displayName = "A1 Rail"
att.displayNameShort = "A1"
att.isBG = true
att.description = {[1] = {t = "Allows you to add custom stuff.", c = CustomizableWeaponry.textColors.COSMETIC},
}
att.statModifiers = {DrawSpeedMult = -0.03, OverallMouseSensMult = -0.03}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/rails")
end

function att:attachFunc()
	self:setBodygroup(self.RailBGs.main, self.RailBGs.a1)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(3,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.RailBGs.main, self.RailBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(3,0)
	end
end

CustomizableWeaponry:registerAttachment(att)