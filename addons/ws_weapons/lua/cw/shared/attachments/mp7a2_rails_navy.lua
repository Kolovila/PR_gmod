local att = {}
att.name = "mp7a2_rails_navy"
att.displayName = "A2 Rail"
att.displayNameShort = "A2"
att.isBG = true
att.description = {[1] = {t = "Allows you to add custom stuff.", c = CustomizableWeaponry.textColors.COSMETIC},
}
att.statModifiers = {DrawSpeedMult = -0.05, OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/rails")
end

function att:attachFunc()
	self:setBodygroup(self.RailBGs.main, self.RailBGs.a2)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(3,2)
	end
end

function att:detachFunc()
	self:setBodygroup(self.RailBGs.main, self.RailBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(3,0)
	end
end

CustomizableWeaponry:registerAttachment(att)