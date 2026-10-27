local att = {}
att.name = "bg_mp5_sdbarrel_blops"
att.displayName = "SD variant"
att.displayNameShort = "SD"
att.isBG = true

att.statModifiers = {RecoilMult = -0.3,
AimSpreadMult = 0.25,
OverallMouseSensMult = 0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mp5_sdbarrel")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.sd_blops)
	self:updateSoundTo("CW_BLOPS_MP5_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
	self.ForegripOverride = true
	self.ForegripParent = "bg_mp5_sdbarrel_blops"
	self.dt.Suppressed = true
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
	self:revertToOriginalIronsights()
	self.ForegripOverride = false
	self.dt.Suppressed = false
end

CustomizableWeaponry:registerAttachment(att)