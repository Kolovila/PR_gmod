local att = {}
att.name = "reciever_mp5_hk_sd"
att.isBG = true
att.displayName = "HK MP5SD Upper receiver"
att.displayNameShort = "SD"

att.description = {[1] = {t = "Receiver of MP5SD", c = CustomizableWeaponry.textColors.COSMETIC},
}
att.statModifiers = {
	OverallMouseSensMult = -0.05,
	RecoilMult = -0.35,
}
att.MuzzleVelocity = -0.15
if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eft_mp5sd")
end

function att:attachFunc()
	self.dt.Suppressed = true
	self.FireSoundSuppressed = "CW_EFT_MP5SD_FIRE"
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.sd)
	self:setBodygroup(self.ReceiverBGs.main, self.ReceiverBGs.sd)
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.sd)
	self:setBodygroup(self.MuzzleBGs.main, self.MuzzleBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(12,1)
		self.WMEnt:SetBodygroup(11,5)
		self.WMEnt:SetBodygroup(7,5)
		self.WMEnt:SetBodygroup(15,0)		
	end
end

function att:detachFunc()
	self.FireSoundSuppressed = "CW_EFT_MP5_FIRE_SUPPRESSED"
	self:restoreSound()
	self.dt.Suppressed = false
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.none)
	self:setBodygroup(self.ReceiverBGs.main, self.ReceiverBGs.std)
	self:setBodygroup(self.HandguardBGs.main, self.HandguardBGs.none)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(12,0)
		self.WMEnt:SetBodygroup(11,0)
		self.WMEnt:SetBodygroup(7,0)
	end
end

CustomizableWeaponry:registerAttachment(att)