local att = {}
att.name = "bg_foldsight_mp7"
att.displayName = "Foldsight"
att.displayNameShort = "Fold"
att.aimPos = {"FoldMP7Pos", "FoldMP7Ang"}
att.FOVModifier = 20
att.isBG = true
att.isSight = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/MP7_foldsight")
	att.description = {[1] = {t = "Provides an alternate aiming position.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.foldsight)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(1,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.troysight)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(1,0)
	end
end

CustomizableWeaponry:registerAttachment(att)