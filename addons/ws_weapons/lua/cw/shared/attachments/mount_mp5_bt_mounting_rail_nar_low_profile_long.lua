local att = {}
att.name = "mount_mp5_bt_mounting_rail_nar_low_profile_long"
att.displayName = "B&T 3x rail mount for MP5"
att.displayNameShort = "B&T 3x"
att.isBG = true

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/")
	att.description = {[1] = {t = "An extra rail.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	self:setBodygroup(self.MountBGs.main, self.MountBGs.on)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(9,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.MountBGs.main, self.MountBGs.off)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(9,0)
	end
end

CustomizableWeaponry:registerAttachment(att)