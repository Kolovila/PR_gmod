local att = {}
att.name = "sight_all_hk_mp7_std_unfolded"
att.displayName = "HK MP7 Flip Up Sight"
att.displayNameShort = "STD"
att.isBG = true
att.isSight = true
att.aimPos = {"UnFoldSightPos", "UnFoldSightAng"}
att.FOVModifier = 25
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/foldsight")
	att.description = {
		[1] = {t = "Iron sight.", c = CustomizableWeaponry.textColors.POSITIVE}
	}
end	
function att:attachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.unfolded)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(4,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.SightBGs.main, self.SightBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(4,0)
	end
end
	
CustomizableWeaponry:registerAttachment(att)