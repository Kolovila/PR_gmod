local att = {}
att.name = "sight_rear_mp5_hk_drum"
att.displayName = "HK MP5 Drum Rearsight"
att.displayNameShort = "Drum"
att.isBG = true
//att.isSight = false
//att.aimPos = {"FoldSightPos", "FoldSightAng"}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/foldsight")
	att.description = {
		[1] = {t = "Iron sight.", c = CustomizableWeaponry.textColors.POSITIVE}
	}
end	
function att:attachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.drum)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(13,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(13,0)
	end
end
	
CustomizableWeaponry:registerAttachment(att)