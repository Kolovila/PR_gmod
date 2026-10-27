local att = {}
att.name = "silencer_hk_mp5_sd_std_9x19"
att.displayName = "SD Suppressor"
att.displayNameShort = "SD"
isBG = true
//att.isSuppressor = true

att.statModifiers = {
	OverallMouseSensMult = -0.05,
	RecoilMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/saker")
	att.description = {[1] = {t = "Decreases firing noise.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self.FireSoundSuppressed = "CW_EFT_MP5SD_FIRE"
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.sd)
	self.dt.Suppressed = true	
	if self.WMEnt then
		self.WMEnt:SetBodygroup(11,5)
	end
end

function att:detachFunc()
	//self:resetSuppressorStatus()
	self.FireSoundSuppressed = "CW_EFT_MP5_FIRE_SUPPRESSED"
	self:restoreSound()
	self.dt.Suppressed = false
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(11,0)
	end
end

CustomizableWeaponry:registerAttachment(att)