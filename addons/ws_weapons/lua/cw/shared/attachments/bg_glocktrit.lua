local att = {}
att.name = "bg_glocktrit"
att.displayName = "Tritium Sights"
att.displayNameShort = "Tritium"
att.isBG = true


if CLIENT then
	att.displayIcon = surface.GetTextureID("vgui/fas2atts/tritiumsights")
	att.description = {
	[1] = {t = "Glows in the dark.", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	self:setBodygroup(self.SightsBGs.main, self.SightsBGs.tritiumsights)
end

function att:detachFunc()
	self:setBodygroup(self.SightsBGs.main, self.SightsBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)