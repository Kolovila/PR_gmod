local att = {}
att.name = "muzzle_mp5_hk_navy_style_3_lug_supressor_adapter_9x19"
att.displayName = "3 Lug threaded protector"
att.displayNameShort = "3 Lug thr."
isBG = true
//att.isSuppressor = true

att.statModifiers = {
	RecoilMult = -0.05,
	AimSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/")
	att.description = {[1] = {t = "Provide mount point of silencers", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.navyadap)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(11,2)
	end
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.navyprotect)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(11,3)
	end
end

CustomizableWeaponry:registerAttachment(att)