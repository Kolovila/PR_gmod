local att = {}
att.name = "ppshstickmag"
att.displayName = "35 Round Magazine"
att.displayNameShort = "Box Magazine"

att.statModifiers = {
	ReloadSpeedMult = 0.2,
	OverallMouseSensMult = 0.1,
	RecoilMult = -0.15
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("nikhud/nikshpaginstick")
	att.description = {[1] = {t = "Recoil is 15 percent more controllable.", c = CustomizableWeaponry.textColors.POSITIVE},
	[2] = {t = "Allows a quicker reloading speed.", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Ammo capacity is decreased to 35 rounds.", c = CustomizableWeaponry.textColors.NEGATIVE}}
end

function att:attachFunc()

	self:unloadWeapon()

	if self.ActiveAttachments.md_m203 then
		self.ForegripOverride = false
	else
		self.ForegripOverride = true
	end
	
	self.ForegripParent = "ppshstickmag"
	
	self.Primary.ClipSize = 35
	self.Primary.ClipSize_Orig = 35
	if self.MagBoneName then
	self.CW_VM:ManipulateBoneScale(self.CW_VM:LookupBone(self.MagBoneName), Vector(0.009, 0.009, 0.009))
	end
end

function att:detachFunc()

	self:unloadWeapon()
	self.ForegripOverride = false
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	if self.MagBoneName then
	self.CW_VM:ManipulateBoneScale(self.CW_VM:LookupBone(self.MagBoneName), Vector(1, 1, 1))
	end
end
CustomizableWeaponry:registerAttachment(att)