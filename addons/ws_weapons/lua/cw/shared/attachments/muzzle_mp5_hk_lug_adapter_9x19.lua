local att = {}
att.name = "muzzle_mp5_hk_lug_adapter_9x19"
att.displayName = "3 Lug thread protector"
att.displayNameShort = "3 Lug"
isBG = true
//att.isSuppressor = true

att.statModifiers = {
	RecoilMult = -0.05,
	AimSpreadMult = -0.05,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/")
	att.description = {[1] = {t = "Regular adapter.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(11,1)
	end
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.navyprotect)
	if self.WMEnt then
		self.WMEnt:SetBodygroup(11,3)
	end
end

CustomizableWeaponry:registerAttachment(att)