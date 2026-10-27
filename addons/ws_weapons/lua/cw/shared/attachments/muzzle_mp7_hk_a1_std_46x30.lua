local att = {}
att.name = "muzzle_mp7_hk_a1_std_46x30"
att.displayName = "HK A1 4.6x30 Flash hider for MP7"
att.displayNameShort = "MP7"
isBG = true
att.statModifiers = {
	RecoilMult = -0.05,
	AimSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/muzzle_mp7_hk_a1_std_46x30")
	att.description = {[1] = {t = "Provide mount point of silencers", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MuzzleBGs.main, self.MuzzleBGs.on)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(5,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.MuzzleBGs.main, self.MuzzleBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(5,0)
	end
end

CustomizableWeaponry:registerAttachment(att)