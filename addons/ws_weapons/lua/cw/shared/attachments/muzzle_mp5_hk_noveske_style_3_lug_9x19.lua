local att = {}
att.name = "muzzle_mp5_hk_noveske_style_3_lug_9x19"
att.displayName = "HK Noveske style muzzlebrake & compensator"
att.displayNameShort = "Noveske St"
isBG = true
//att.isSuppressor = true

att.statModifiers = {
	RecoilMult = -0.12,
	--DamageMult = 0.2,
}
att.MuzzleVelocity = 0.05
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_muzz_mp5_noveske_st")
	att.description = {[1] = {t = "An actual muzzlebrake.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MuzzleBGs.main, self.MuzzleBGs.noveske)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(15,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.MuzzleBGs.main, self.MuzzleBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(15,0)
	end
end

CustomizableWeaponry:registerAttachment(att)