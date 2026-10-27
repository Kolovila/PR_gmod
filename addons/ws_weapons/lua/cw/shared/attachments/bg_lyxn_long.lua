local att = {}
att.name = "bg_lyxn_longbarrel"
att.displayName = "Lyxn Long Barrel"
att.displayNameShort = "Long"
att.isBG = true
att.SpeedDec = 2

att.statModifiers = {
DamageMult = 0.1,
FireDelayMult = 0.25,
AimSpreadMult = -0.3,
HipSpreadMult = -0.5,
ClumpSpreadMult = -0.2,
RecoilMult = 0.4,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/long")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
	
	self:setupCurrentIronsights(self.LongPos, self.LongAng)
	
	if not self:isAttachmentActive("sights") then
		self:updateIronsights("Long")
	end
	
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
	self:revertToOriginalIronsights()
end

CustomizableWeaponry:registerAttachment(att)