local att = {}
att.name = "doi_atow_altsightm37"
att.displayName = "Heatshield"
att.displayNameShort = "Htshld"
att.isBG = true

att.statModifiers = {
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/altsight")
	att.description = {}
end

function att:attachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.on)

end

function att:detachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.off)
end

CustomizableWeaponry:registerAttachment(att)
