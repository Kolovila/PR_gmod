local att = {}
att.name = "mount_mp5sd_bt_tri_rail_ring"
att.displayName = "B&T MP5 SD Tri Rail Ring Mount"
att.displayNameShort = "SD TRR"
att.isBG = true
att.statModifiers = {
	OverallMouseSensMult = -0.1,
	RecoilMult = -0.05,
}
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/")
	att.description = {[1] = {t = "An extra rail on SD's barrel.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	self:setBodygroup(self.RailBGs.main, self.RailBGs.on)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(10,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.RailBGs.main, self.RailBGs.off)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(10,0)
	end
end

CustomizableWeaponry:registerAttachment(att)